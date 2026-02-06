/**
 * Script para generar batches de SQL para inserción via MCP
 * Genera archivos de SQL de ~30 productos cada uno
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

// Leer credenciales
const envPath = path.join(__dirname, '..', '.env.local');
const envContent = fs.readFileSync(envPath, 'utf8');
const env = {};
envContent.split('\n').forEach(line => {
  const match = line.match(/^([^=]+)=["']?([^"'\n]*)["']?$/);
  if (match) env[match[1]] = match[2];
});

const token = env.ML_ACCESS_TOKEN;
const userId = env.ML_USER_ID;

function fetchJSON(url) {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const req = https.request({
      hostname: urlObj.hostname,
      path: urlObj.pathname + urlObj.search,
      headers: { 'Authorization': 'Bearer ' + token }
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

function productToSQL(p) {
  return `INSERT INTO products (ml_id, sku, title, price, stock_total, status, logistic_type, permalink, thumbnail, category_id, ml_created_at, ml_updated_at, synced_at)
VALUES (${escapeSQL(p.ml_id)}, ${escapeSQL(p.sku)}, ${escapeSQL(p.title)}, ${p.price}, ${p.stock_total}, ${escapeSQL(p.status)}, ${escapeSQL(p.logistic_type)}, ${escapeSQL(p.permalink)}, ${escapeSQL(p.thumbnail)}, ${escapeSQL(p.category_id)}, ${escapeSQL(p.ml_created_at)}::timestamptz, ${escapeSQL(p.ml_updated_at)}::timestamptz, NOW())
ON CONFLICT (ml_id) DO UPDATE SET
  sku = EXCLUDED.sku, title = EXCLUDED.title, price = EXCLUDED.price, stock_total = EXCLUDED.stock_total,
  status = EXCLUDED.status, logistic_type = EXCLUDED.logistic_type, permalink = EXCLUDED.permalink,
  thumbnail = EXCLUDED.thumbnail, ml_updated_at = EXCLUDED.ml_updated_at, synced_at = NOW();`;
}

async function main() {
  console.log('🚀 Obteniendo productos...');

  // Get all IDs
  const first = await fetchJSON(`https://api.mercadolibre.com/users/${userId}/items/search?limit=1&offset=0`);
  const total = first.paging.total;
  console.log(`📦 Total: ${total}`);

  const allIds = [];
  let offset = 0;
  while (offset < total) {
    const page = await fetchJSON(`https://api.mercadolibre.com/users/${userId}/items/search?limit=50&offset=${offset}`);
    allIds.push(...page.results);
    offset += 50;
    process.stdout.write(`\r   IDs: ${allIds.length}/${total}`);
    await new Promise(r => setTimeout(r, 50));
  }
  console.log('\n📋 Obteniendo detalles...');

  // Get all products
  const allProducts = [];
  for (let i = 0; i < allIds.length; i += 20) {
    const batch = allIds.slice(i, i + 20);
    const details = await fetchJSON(`https://api.mercadolibre.com/items?ids=${batch.join(',')}`);

    for (const d of details) {
      if (d.code === 200) {
        const p = d.body;
        allProducts.push({
          ml_id: p.id,
          sku: p.seller_custom_field || p.inventory_id || null,
          title: p.title,
          price: p.price || 0,
          stock_total: p.available_quantity || 0,
          status: p.status || 'active',
          logistic_type: p.shipping?.logistic_type || null,
          permalink: p.permalink,
          thumbnail: p.thumbnail,
          category_id: p.category_id,
          ml_created_at: p.start_time,
          ml_updated_at: p.last_updated
        });
      }
    }
    process.stdout.write(`\r   Productos: ${allProducts.length}/${total}`);
    await new Promise(r => setTimeout(r, 100));
  }

  console.log(`\n\n📝 Generando SQL batches...`);

  // Generate SQL batches of 30 products each
  const BATCH_SIZE = 30;
  const batchDir = path.join(__dirname, 'sql_batches');

  if (!fs.existsSync(batchDir)) {
    fs.mkdirSync(batchDir);
  }

  let batchNum = 0;
  for (let i = 0; i < allProducts.length; i += BATCH_SIZE) {
    const batch = allProducts.slice(i, i + BATCH_SIZE);
    const sql = batch.map(p => productToSQL(p)).join('\n\n');

    fs.writeFileSync(path.join(batchDir, `batch_${String(batchNum).padStart(3, '0')}.sql`), sql);
    batchNum++;
  }

  console.log(`✅ Generados ${batchNum} archivos en scripts/sql_batches/`);
  console.log(`   Cada archivo tiene ~${BATCH_SIZE} productos`);
  console.log(`   Total productos: ${allProducts.length}`);
}

main().catch(console.error);
