/* eslint-disable @typescript-eslint/no-require-imports */
/**
 * Sync historical orders (and their items) from MercadoLibre into Supabase.
 *
 * Requirements (in .env.local):
 * - NEXT_PUBLIC_SUPABASE_URL
 * - SUPABASE_SERVICE_ROLE_KEY  (must be valid; anon key won't bypass RLS for inserts)
 * - ML_ACCESS_TOKEN / ML_REFRESH_TOKEN / ML_CLIENT_ID / ML_CLIENT_SECRET / ML_USER_ID
 *
 * Notes:
 * - Orders are idempotent by `orders.ml_order_id` UNIQUE.
 * - Order items are idempotent by UNIQUE index on (order_id, ml_item_id).
 *   If you haven't applied the migration adding that unique index, upserts will fail.
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

function loadEnv() {
  const envPath = path.join(__dirname, '..', '.env.local');
  const text = fs.readFileSync(envPath, 'utf8');
  const env = {};
  for (const raw of text.split(/\r?\n/)) {
    const line = raw.trim();
    if (!line || line.startsWith('#')) continue;
    const idx = line.indexOf('=');
    if (idx < 0) continue;
    const k = line.slice(0, idx).trim();
    let v = line.slice(idx + 1).trim();
    if ((v.startsWith('"') && v.endsWith('"')) || (v.startsWith("'") && v.endsWith("'"))) {
      v = v.slice(1, -1);
    }
    env[k] = v;
  }
  return env;
}

function fetchJSON(url, headers = {}) {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const req = https.request(
      {
        hostname: urlObj.hostname,
        path: urlObj.pathname + urlObj.search,
        method: 'GET',
        headers,
      },
      (res) => {
        let data = '';
        res.on('data', (chunk) => (data += chunk));
        res.on('end', () => {
          try {
            resolve(JSON.parse(data));
          } catch {
            reject(new Error(`Parse error: ${data.substring(0, 500)}`));
          }
        });
      }
    );
    req.on('error', reject);
    req.end();
  });
}

async function refreshMlAccessToken({ refreshToken, clientId, clientSecret }) {
  const params = new URLSearchParams({
    grant_type: 'refresh_token',
    client_id: clientId,
    client_secret: clientSecret,
    refresh_token: refreshToken,
  });

  const res = await fetch('https://api.mercadolibre.com/oauth/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: params.toString(),
  });

  if (!res.ok) {
    throw new Error(`ML token refresh failed: ${res.status} ${await res.text()}`);
  }

  return res.json();
}

function postJSON(url, headers = {}, payload = null) {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const body = payload ? JSON.stringify(payload) : '';

    const req = https.request(
      {
        hostname: urlObj.hostname,
        path: urlObj.pathname + urlObj.search,
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Content-Length': Buffer.byteLength(body),
          ...headers,
        },
      },
      (res) => {
        let data = '';
        res.on('data', (chunk) => (data += chunk));
        res.on('end', () => {
          if (res.statusCode >= 200 && res.statusCode < 300) {
            if (!data) return resolve(null);
            try {
              return resolve(JSON.parse(data));
            } catch {
              return resolve(data);
            }
          }
          reject(new Error(`HTTP ${res.statusCode}: ${data}`));
        });
      }
    );

    req.on('error', reject);
    req.write(body);
    req.end();
  });
}

async function getProductsMap({ supabaseUrl, serviceKey }) {
  const urlObj = new URL(supabaseUrl);
  const res = await fetch(`https://${urlObj.hostname}/rest/v1/products?select=id,ml_id&limit=10000`, {
    headers: {
      apikey: serviceKey,
      Authorization: `Bearer ${serviceKey}`,
    },
  });

  if (!res.ok) {
    throw new Error(`products map HTTP ${res.status}: ${await res.text()}`);
  }

  const rows = await res.json();
  const map = new Map();
  for (const r of rows || []) {
    if (r.ml_id) map.set(r.ml_id, r.id);
  }
  return map;
}

async function upsertOrdersAndItems({ supabaseUrl, serviceKey, orders, productsMap }) {
  const urlObj = new URL(supabaseUrl);
  const base = `https://${urlObj.hostname}/rest/v1`;

  // Upsert orders in batch (smaller batches to avoid payload limits).
  // We use `return=representation` so we get back `orders.id` and can sync items without extra queries.
  const ORDER_BATCH = 100;
  let itemsTotal = 0;
  let ordersTotal = 0;

  for (let i = 0; i < orders.length; i += ORDER_BATCH) {
    const batch = orders.slice(i, i + ORDER_BATCH).map((order) => ({
      ml_order_id: order.id,
      status: order.status,
      buyer_id: order.buyer?.id ?? null,
      buyer_nickname: order.buyer?.nickname ?? null,
      total_amount: order.total_amount ?? 0,
      currency_id: order.currency_id ?? 'CLP',
      shipping_id: order.shipping?.id ?? null,
      shipping_status: order.shipping?.status ?? null,
      logistic_type: order.shipping?.logistic_type ?? null,
      date_created: order.date_created ?? null,
      date_closed: order.date_closed ?? null,
      synced_at: new Date().toISOString(),
    }));

    const upserted = await postJSON(
      `${base}/orders?on_conflict=ml_order_id`,
      {
        apikey: serviceKey,
        Authorization: `Bearer ${serviceKey}`,
        Prefer: 'resolution=merge-duplicates,return=representation',
      },
      batch
    );

    const done = Math.min(i + ORDER_BATCH, orders.length);
    process.stdout.write(`\r[sync-orders-historical] Orders upserted: ${done}/${orders.length}`);

    // Sync items for this upserted batch.
    const rows = Array.isArray(upserted) ? upserted : [];
    const idByMl = new Map(rows.map(r => [r.ml_order_id, r.id]));

    const orderIds = rows.map(r => r.id).filter(Boolean);
    if (orderIds.length > 0) {
      const inList = orderIds.map(id => `"${id}"`).join(',');
      const del = await fetch(`${base}/order_items?order_id=in.(${encodeURIComponent(inList)})`, {
        method: 'DELETE',
        headers: {
          apikey: serviceKey,
          Authorization: `Bearer ${serviceKey}`,
          Prefer: 'return=minimal',
        },
      });
      if (!del.ok) {
        throw new Error(`delete order_items HTTP ${del.status}: ${await del.text()}`);
      }
    }

    const items = [];
    for (const order of orders.slice(i, i + ORDER_BATCH)) {
      const orderId = idByMl.get(order.id);
      if (!orderId) continue;
      for (const it of order.order_items || []) {
        items.push({
          order_id: orderId,
          ml_item_id: it.item?.id ?? null,
          product_id: productsMap.get(it.item?.id) || null,
          title: it.item?.title ?? null,
          sku: it.item?.seller_sku ?? null,
          quantity: it.quantity ?? 1,
          unit_price: it.unit_price ?? 0,
        });
      }
    }

    if (items.length > 0) {
      await postJSON(
        `${base}/order_items`,
        {
          apikey: serviceKey,
          Authorization: `Bearer ${serviceKey}`,
          Prefer: 'return=minimal',
        },
        items
      );
    }

    ordersTotal += batch.length;
    itemsTotal += items.length;
  }
  process.stdout.write('\n');

  return { orders_upserted: ordersTotal, items_inserted: itemsTotal };
}

async function mlFetchOrdersPage({ token, userId, dateFrom, dateTo, offset, limit }) {
  const fromStr = dateFrom.toISOString();
  const toStr = dateTo.toISOString();
  const url = `https://api.mercadolibre.com/orders/search?seller=${userId}` +
    `&order.date_created.from=${encodeURIComponent(fromStr)}` +
    `&order.date_created.to=${encodeURIComponent(toStr)}` +
    `&limit=${limit}&offset=${offset}&sort=date_asc`;

  let res = await fetchJSON(url, { Authorization: `Bearer ${token.value}` });

  // Token might be expired/invalid. Try one refresh and retry once.
  if (res?.message && (res.status === 401 || res.error === 'invalid_token')) {
    if (!token.refresh) throw new Error(`ML token invalid and no refresh token configured: ${res.message}`);
    const refreshed = await refreshMlAccessToken(token.refresh);
    token.value = refreshed.access_token;
    token.refresh.refreshToken = refreshed.refresh_token || token.refresh.refreshToken;
    res = await fetchJSON(url, { Authorization: `Bearer ${token.value}` });
  }

  return res;
}

async function fetchAllOrdersByDateRangeWithSplit({ token, userId, dateFrom, dateTo, maxRangeSizeMs = 1000 * 60 }) {
  const limit = 50;

  // First page to get total for this range.
  const first = await mlFetchOrdersPage({ token, userId, dateFrom, dateTo, offset: 0, limit });

  if (first?.error) throw new Error(`ML error: ${first.message}`);

  const total = first?.paging?.total ?? 0;
  if (total <= 10000) {
    const allOrders = [...(first.results || [])];
    let offset = limit;
    while (offset < total) {
      const page = await mlFetchOrdersPage({ token, userId, dateFrom, dateTo, offset, limit });
      if (page?.error) throw new Error(`ML error: ${page.message}`);
      allOrders.push(...(page.results || []));
      offset += limit;
      await new Promise((r) => setTimeout(r, 120));
      process.stdout.write(`\r[sync-orders-historical] ML range downloaded: ${Math.min(allOrders.length, total)}/${total}`);
    }
    process.stdout.write('\n');
    return allOrders;
  }

  // ML hard limit: you can't page beyond 10k results for a single query range.
  // Split the range until each sub-range has <= 10k.
  const fromMs = dateFrom.getTime();
  const toMs = dateTo.getTime();
  const span = toMs - fromMs;

  if (span <= maxRangeSizeMs) {
    throw new Error(`ML range too dense (${total} orders) within ${span}ms. Need manual splitting strategy.`);
  }

  const midMs = Math.floor((fromMs + toMs) / 2);
  const leftFrom = new Date(fromMs);
  const leftTo = new Date(midMs - 1);
  const rightFrom = new Date(midMs);
  const rightTo = new Date(toMs);

  console.log(`\n[sync-orders-historical] Range too big (${total}). Splitting:`);
  console.log(`  left:  ${leftFrom.toISOString()} -> ${leftTo.toISOString()}`);
  console.log(`  right: ${rightFrom.toISOString()} -> ${rightTo.toISOString()}`);

  const left = await fetchAllOrdersByDateRangeWithSplit({ token, userId, dateFrom: leftFrom, dateTo: leftTo, maxRangeSizeMs });
  const right = await fetchAllOrdersByDateRangeWithSplit({ token, userId, dateFrom: rightFrom, dateTo: rightTo, maxRangeSizeMs });

  // Deduplicate on ml_order_id in case of boundary overlap.
  const byId = new Map();
  for (const o of [...left, ...right]) byId.set(o.id, o);
  return Array.from(byId.values());
}

async function main() {
  const env = loadEnv();

  const supabaseUrl = env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceKey = env.SUPABASE_SERVICE_ROLE_KEY;
  const accessToken = env.ML_ACCESS_TOKEN;
  const userId = env.ML_USER_ID;
  const refreshToken = env.ML_REFRESH_TOKEN;
  const clientId = env.ML_CLIENT_ID;
  const clientSecret = env.ML_CLIENT_SECRET;

  if (!supabaseUrl || !serviceKey) {
    throw new Error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY in .env.local');
  }
  if (!accessToken || !userId) {
    throw new Error('Missing ML_ACCESS_TOKEN or ML_USER_ID in .env.local');
  }

  const days = Number(process.argv[2] || '365');

  const dateTo = new Date();
  const dateFrom = new Date();
  dateFrom.setDate(dateFrom.getDate() - days);

  console.log(`[sync-orders-historical] Fetching ML orders ${dateFrom.toISOString()} -> ${dateTo.toISOString()} (split ranges if >10k)`);

  const token = {
    value: accessToken,
    refresh: refreshToken && clientId && clientSecret
      ? { refreshToken, clientId, clientSecret }
      : null,
  };

  const orders = await fetchAllOrdersByDateRangeWithSplit({ token, userId, dateFrom, dateTo });
  console.log(`[sync-orders-historical] ML orders fetched: ${orders.length}`);

  console.log('[sync-orders-historical] Loading products map from Supabase...');
  const productsMap = await getProductsMap({ supabaseUrl, serviceKey });
  console.log(`[sync-orders-historical] Products in DB: ${productsMap.size}`);

  console.log('[sync-orders-historical] Upserting into Supabase (orders + items)...');
  const res = await upsertOrdersAndItems({ supabaseUrl, serviceKey, orders, productsMap });
  console.log('[sync-orders-historical] Done:', res);
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
