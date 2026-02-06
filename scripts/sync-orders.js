/**
 * Script para sincronizar órdenes de ML a Supabase
 * Sincroniza el último año de ventas
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

// Leer credenciales de .env.local
const envPath = path.join(__dirname, '..', '.env.local');
const envContent = fs.readFileSync(envPath, 'utf8');
const env = {};
envContent.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=["']?([^"'\n]*)["']?$/);
  if (match) env[match[1]] = match[2];
});

const config = {
  ML_ACCESS_TOKEN: env.ML_ACCESS_TOKEN,
  ML_USER_ID: env.ML_USER_ID,
  SUPABASE_URL: env.NEXT_PUBLIC_SUPABASE_URL,
  SUPABASE_SERVICE_KEY: env.SUPABASE_SERVICE_ROLE_KEY
};

console.log('Config loaded:', {
  ML_USER_ID: config.ML_USER_ID,
  SUPABASE_URL: config.SUPABASE_URL,
  hasToken: !!config.ML_ACCESS_TOKEN,
  hasServiceKey: !!config.SUPABASE_SERVICE_KEY
});

function fetchJSON(url, headers = {}) {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const req = https.request({
      hostname: urlObj.hostname,
      path: urlObj.pathname + urlObj.search,
      headers
    }, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          resolve(JSON.parse(data));
        } catch (e) {
          reject(new Error(`Parse error: ${data.substring(0, 500)}`));
        }
      });
    });
    req.on('error', reject);
    req.end();
  });
}

function postToSupabase(endpoint, data) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify(data);
    const urlObj = new URL(config.SUPABASE_URL);

    const options = {
      hostname: urlObj.hostname,
      path: `/rest/v1/${endpoint}`,
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${config.SUPABASE_SERVICE_KEY}`,
        'apikey': config.SUPABASE_SERVICE_KEY,
        'Content-Type': 'application/json',
        'Prefer': 'resolution=merge-duplicates,return=representation',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        if (res.statusCode >= 200 && res.statusCode < 300) {
          try {
            resolve(JSON.parse(data));
          } catch {
            resolve({ success: true });
          }
        } else {
          reject(new Error(`HTTP ${res.statusCode}: ${data}`));
        }
      });
    });

    req.on('error', reject);
    req.write(postData);
    req.end();
  });
}

function getProductsMap() {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(config.SUPABASE_URL);

    const options = {
      hostname: urlObj.hostname,
      path: '/rest/v1/products?select=id,ml_id',
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${config.SUPABASE_SERVICE_KEY}`,
        'apikey': config.SUPABASE_SERVICE_KEY
      }
    };

    const req = https.request(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const parsed = JSON.parse(data);
          const products = Array.isArray(parsed) ? parsed : [];
          const map = {};
          products.forEach(p => {
            if (p.ml_id) map[p.ml_id] = p.id;
          });
          resolve(map);
        } catch (e) {
          console.error('Response:', data.substring(0, 200));
          reject(new Error(`Parse error: ${e.message}`));
        }
      });
    });

    req.on('error', reject);
    req.end();
  });
}

async function fetchOrders(dateFrom, dateTo, offset = 0) {
  const fromStr = dateFrom.toISOString();
  const toStr = dateTo.toISOString();

  const url = `https://api.mercadolibre.com/orders/search?seller=${config.ML_USER_ID}&order.date_created.from=${fromStr}&order.date_created.to=${toStr}&limit=50&offset=${offset}&sort=date_desc`;

  return fetchJSON(url, { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` });
}

async function main() {
  console.log('🚀 Sincronizando órdenes de ML (último año)...\n');

  // Fecha: último año
  const dateTo = new Date();
  const dateFrom = new Date();
  dateFrom.setFullYear(dateFrom.getFullYear() - 1);

  console.log(`📅 Rango: ${dateFrom.toISOString().split('T')[0]} a ${dateTo.toISOString().split('T')[0]}`);

  // Obtener mapa de productos para vincular items
  console.log('📦 Cargando productos existentes...');
  const productsMap = await getProductsMap();
  console.log(`   ${Object.keys(productsMap).length} productos en DB\n`);

  // Obtener total de órdenes
  const first = await fetchOrders(dateFrom, dateTo);

  if (first.error) {
    console.error('❌ Error ML:', first.message);
    return;
  }

  const total = first.paging.total;
  console.log(`🛒 Total: ${total} órdenes en el período\n`);

  if (total === 0) {
    console.log('No hay órdenes para sincronizar.');
    return;
  }

  // Procesar órdenes
  let offset = 0;
  let ordersProcessed = 0;
  let itemsProcessed = 0;
  let errors = 0;

  while (offset < total) {
    try {
      const response = await fetchOrders(dateFrom, dateTo, offset);

      if (response.error) {
        console.error(`\n❌ Error en offset ${offset}:`, response.message);
        errors++;
        offset += 50;
        continue;
      }

      const orders = response.results || [];

      for (const order of orders) {
        try {
          // Preparar datos de la orden
          const orderData = {
            ml_order_id: order.id,
            status: order.status,
            buyer_id: order.buyer?.id?.toString() || null,
            buyer_nickname: order.buyer?.nickname || null,
            total_amount: order.total_amount || 0,
            currency_id: order.currency_id || 'CLP',
            shipping_id: order.shipping?.id?.toString() || null,
            shipping_status: order.shipping?.status || null,
            logistic_type: order.shipping?.logistic_type || null,
            date_created: order.date_created,
            date_closed: order.date_closed,
            synced_at: new Date().toISOString()
          };

          // Insertar orden
          const insertedOrders = await postToSupabase('orders', [orderData]);
          const orderId = insertedOrders[0]?.id;

          if (orderId && order.order_items?.length > 0) {
            // Preparar items de la orden
            const items = order.order_items.map(item => ({
              order_id: orderId,
              ml_item_id: item.item?.id || null,
              product_id: productsMap[item.item?.id] || null,
              title: item.item?.title || 'Sin título',
              sku: item.item?.seller_sku || item.item?.seller_custom_field || null,
              quantity: item.quantity || 1,
              unit_price: item.unit_price || 0
            }));

            await postToSupabase('order_items', items);
            itemsProcessed += items.length;
          }

          ordersProcessed++;
        } catch (err) {
          console.error(`\n❌ Error orden ${order.id}:`, err.message);
          errors++;
        }
      }

      offset += 50;
      process.stdout.write(`\r   Órdenes: ${ordersProcessed}/${total} | Items: ${itemsProcessed} | Errores: ${errors}`);

      // Rate limiting
      await new Promise(r => setTimeout(r, 200));

    } catch (err) {
      console.error(`\n❌ Error batch offset ${offset}:`, err.message);
      errors++;
      offset += 50;
    }
  }

  console.log(`\n\n🎉 Sincronización completada!`);
  console.log(`   - Órdenes procesadas: ${ordersProcessed}`);
  console.log(`   - Items procesados: ${itemsProcessed}`);
  console.log(`   - Errores: ${errors}`);
}

main().catch(console.error);
