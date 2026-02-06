/**
 * Script para obtener órdenes de ML y generar SQL
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
  ML_USER_ID: env.ML_USER_ID
};

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

function escapeSQL(str) {
  if (str === null || str === undefined) return 'NULL';
  return "'" + String(str).replace(/'/g, "''") + "'";
}

async function fetchOrders(dateFrom, dateTo, offset = 0) {
  const fromStr = dateFrom.toISOString();
  const toStr = dateTo.toISOString();

  const url = `https://api.mercadolibre.com/orders/search?seller=${config.ML_USER_ID}&order.date_created.from=${fromStr}&order.date_created.to=${toStr}&limit=50&offset=${offset}&sort=date_desc`;

  return fetchJSON(url, { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` });
}

async function main() {
  console.log('🚀 Obteniendo órdenes de ML (último año)...\n');

  const dateTo = new Date();
  const dateFrom = new Date();
  dateFrom.setFullYear(dateFrom.getFullYear() - 1);

  console.log(`📅 Rango: ${dateFrom.toISOString().split('T')[0]} a ${dateTo.toISOString().split('T')[0]}`);

  // Obtener total
  const first = await fetchOrders(dateFrom, dateTo);

  if (first.error) {
    console.error('❌ Error ML:', first.message);
    return;
  }

  const total = first.paging?.total || 0;
  console.log(`🛒 Total: ${total} órdenes\n`);

  if (total === 0) {
    console.log('No hay órdenes para sincronizar.');
    return;
  }

  // Recolectar todas las órdenes
  const allOrders = [];
  let offset = 0;

  while (offset < total) {
    const response = await fetchOrders(dateFrom, dateTo, offset);

    if (response.error) {
      console.error(`Error en offset ${offset}:`, response.message);
      offset += 50;
      continue;
    }

    const orders = response.results || [];
    allOrders.push(...orders);
    offset += 50;
    process.stdout.write(`\r   Descargadas: ${allOrders.length}/${total}`);

    await new Promise(r => setTimeout(r, 200));
  }

  console.log(`\n\n📝 Generando SQL...`);

  // Generar SQL batches
  const batchDir = path.join(__dirname, 'sql_orders');
  if (!fs.existsSync(batchDir)) {
    fs.mkdirSync(batchDir, { recursive: true });
  }

  const BATCH_SIZE = 20;
  let batchNum = 1;
  let ordersSql = [];
  let itemsSql = [];

  for (let i = 0; i < allOrders.length; i++) {
    const order = allOrders[i];

    // SQL para orden
    const orderValues = [
      order.id, // ml_order_id
      escapeSQL(order.status),
      escapeSQL(order.buyer?.id?.toString()),
      escapeSQL(order.buyer?.nickname),
      order.total_amount || 0,
      escapeSQL(order.currency_id || 'CLP'),
      escapeSQL(order.shipping?.id?.toString()),
      escapeSQL(order.shipping?.status),
      escapeSQL(order.shipping?.logistic_type),
      escapeSQL(order.date_created),
      escapeSQL(order.date_closed)
    ].join(', ');

    ordersSql.push(`(${orderValues})`);

    // SQL para items
    if (order.order_items?.length > 0) {
      for (const item of order.order_items) {
        const itemValues = [
          order.id, // ml_order_id para vincular después
          escapeSQL(item.item?.id),
          escapeSQL(item.item?.title || 'Sin título'),
          escapeSQL(item.item?.seller_sku || item.item?.seller_custom_field),
          item.quantity || 1,
          item.unit_price || 0
        ].join(', ');
        itemsSql.push(`(${itemValues})`);
      }
    }

    // Escribir batch cada BATCH_SIZE órdenes
    if ((i + 1) % BATCH_SIZE === 0 || i === allOrders.length - 1) {
      const batchFile = path.join(batchDir, `batch_${String(batchNum).padStart(3, '0')}.sql`);

      let sql = `-- Batch ${batchNum}: Órdenes ${i - BATCH_SIZE + 2} a ${i + 1}\n\n`;

      if (ordersSql.length > 0) {
        sql += `INSERT INTO orders (ml_order_id, status, buyer_id, buyer_nickname, total_amount, currency_id, shipping_id, shipping_status, logistic_type, date_created, date_closed)
VALUES
${ordersSql.join(',\n')}
ON CONFLICT (ml_order_id) DO UPDATE SET
  status = EXCLUDED.status,
  shipping_status = EXCLUDED.shipping_status,
  synced_at = NOW();\n\n`;
      }

      fs.writeFileSync(batchFile, sql);
      console.log(`   ✓ ${batchFile}`);

      ordersSql = [];
      batchNum++;
    }
  }

  // Guardar items en archivo separado para vincular después
  const itemsFile = path.join(batchDir, 'all_items.json');
  const itemsData = allOrders.flatMap(order =>
    (order.order_items || []).map(item => ({
      ml_order_id: order.id,
      ml_item_id: item.item?.id,
      title: item.item?.title || 'Sin título',
      sku: item.item?.seller_sku || item.item?.seller_custom_field,
      quantity: item.quantity || 1,
      unit_price: item.unit_price || 0
    }))
  );
  fs.writeFileSync(itemsFile, JSON.stringify(itemsData, null, 2));

  console.log(`\n🎉 Completado!`);
  console.log(`   - ${allOrders.length} órdenes`);
  console.log(`   - ${itemsData.length} items`);
  console.log(`   - ${batchNum - 1} archivos SQL generados en scripts/sql_orders/`);
}

main().catch(console.error);
