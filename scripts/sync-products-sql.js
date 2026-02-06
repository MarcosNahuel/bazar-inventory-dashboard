/**
 * Script para sincronizar productos de ML y generar SQL
 * Genera un archivo SQL que se puede ejecutar en Supabase
 */

const https = require('https');
const fs = require('fs');

const config = {
  ML_ACCESS_TOKEN: 'APP_USR-3004336950612441-020521-d95f5b083cf2aca3eabf5130055a3814-2303729344',
  ML_USER_ID: '2303729344'
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
      res.on('end', () => resolve(JSON.parse(data)));
    });
    req.on('error', reject);
    req.end();
  });
}

function escapeSQL(str) {
  if (str === null || str === undefined) return 'NULL';
  return "'" + String(str).replace(/'/g, "''") + "'";
}

async function main() {
  console.log('🚀 Obteniendo productos de ML...');

  const allProducts = [];
  let offset = 0;

  // Get first page to know total
  const first = await fetchJSON(
    `https://api.mercadolibre.com/users/${config.ML_USER_ID}/items/search?limit=50&offset=0`,
    { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
  );

  const total = first.paging.total;
  console.log(`📦 Total: ${total} productos`);

  // Fetch all IDs
  const allIds = [];
  while (offset < total) {
    const page = await fetchJSON(
      `https://api.mercadolibre.com/users/${config.ML_USER_ID}/items/search?limit=50&offset=${offset}`,
      { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
    );
    allIds.push(...page.results);
    offset += 50;
    process.stdout.write(`\r   IDs: ${allIds.length}/${total}`);
    await new Promise(r => setTimeout(r, 50));
  }
  console.log('\n');

  // Fetch details in batches of 20
  console.log('📋 Obteniendo detalles...');
  for (let i = 0; i < allIds.length; i += 20) {
    const batch = allIds.slice(i, i + 20);
    const details = await fetchJSON(
      `https://api.mercadolibre.com/items?ids=${batch.join(',')}`,
      { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
    );

    for (const item of details) {
      if (item.code === 200) {
        allProducts.push(item.body);
      }
    }

    process.stdout.write(`\r   Detalles: ${allProducts.length}/${total}`);
    await new Promise(r => setTimeout(r, 100));
  }
  console.log('\n');

  // Generate SQL
  console.log('📝 Generando SQL...');

  let sql = '-- Productos sincronizados desde ML\n';
  sql += '-- Generado: ' + new Date().toISOString() + '\n\n';

  for (const p of allProducts) {
    const mlId = escapeSQL(p.id);
    const sku = escapeSQL(p.seller_custom_field || p.inventory_id);
    const title = escapeSQL(p.title);
    const price = p.price || 0;
    const stock = p.available_quantity || 0;
    const status = escapeSQL(p.status);
    const logisticType = escapeSQL(p.shipping?.logistic_type);
    const permalink = escapeSQL(p.permalink);
    const thumbnail = escapeSQL(p.thumbnail);
    const categoryId = escapeSQL(p.category_id);
    const mlCreatedAt = escapeSQL(p.start_time);
    const mlUpdatedAt = escapeSQL(p.last_updated);

    sql += `INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES (${mlId}, ${sku}, ${title}, ${price}, ${stock}, ${status}, ${logisticType}, ${permalink}, ${thumbnail}, ${categoryId}, ${mlCreatedAt}::timestamptz, ${mlUpdatedAt}::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku,
  title = EXCLUDED.title,
  price = EXCLUDED.price,
  stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status,
  logistic_type = EXCLUDED.logistic_type,
  permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail,
  ml_updated_at = EXCLUDED.ml_updated_at,
  synced_at = NOW();\n\n`;
  }

  // Write to file
  fs.writeFileSync('scripts/products_sync.sql', sql);
  console.log(`✅ SQL generado: scripts/products_sync.sql (${allProducts.length} productos)`);

  // Also output first 10 for quick testing
  console.log('\n📊 Primeros 10 productos:');
  allProducts.slice(0, 10).forEach(p => {
    console.log(`   - ${p.id}: ${p.title.substring(0, 50)}... (stock: ${p.available_quantity})`);
  });
}

main().catch(console.error);
