/**
 * Script para ejecutar SQL en batches via API de Supabase
 * Lee el archivo products_sync.sql y lo ejecuta en partes
 */

const https = require('https');
const fs = require('fs');

const config = {
  SUPABASE_URL: 'https://ahqaiqxdauzniiswrhcs.supabase.co',
  SUPABASE_SERVICE_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFocWFpcXhkYXV6bmlpc3dyaGNzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2ODU1OTYwMCwiZXhwIjoyMDg0MTM1NjAwfQ.l-3oRbSjy5Q88k1JY4eKl5eIZPqGhJYoGw83ww7fO2E'
};

function executeSQL(sql) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify({ query: sql });

    const options = {
      hostname: 'ahqaiqxdauzniiswrhcs.supabase.co',
      path: '/rest/v1/rpc/exec_sql',
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${config.SUPABASE_SERVICE_KEY}`,
        'apikey': config.SUPABASE_SERVICE_KEY,
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        if (res.statusCode >= 200 && res.statusCode < 300) {
          resolve(data);
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

// Usar la REST API directamente para inserts
function insertProducts(productsData) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify(productsData);

    const options = {
      hostname: 'ahqaiqxdauzniiswrhcs.supabase.co',
      path: '/rest/v1/products',
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${config.SUPABASE_SERVICE_KEY}`,
        'apikey': config.SUPABASE_SERVICE_KEY,
        'Content-Type': 'application/json',
        'Prefer': 'resolution=merge-duplicates',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    const req = https.request(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        if (res.statusCode >= 200 && res.statusCode < 300) {
          resolve({ success: true, count: productsData.length });
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

async function main() {
  console.log('📖 Leyendo archivo SQL...');

  const sqlContent = fs.readFileSync('scripts/products_sync.sql', 'utf8');

  // Extraer cada INSERT statement
  const insertStatements = sqlContent.split(/;\s*\n\s*INSERT/).map((s, i) =>
    i === 0 ? s : 'INSERT' + s
  ).filter(s => s.includes('INSERT INTO products'));

  console.log(`📦 Total de statements: ${insertStatements.length}`);

  // Parsear cada INSERT para extraer los datos
  const products = [];
  const regex = /VALUES\s*\('([^']*)',\s*('([^']*)'|NULL),\s*'([^']*)',\s*(\d+),\s*(\d+),\s*'([^']*)',\s*'([^']*)',\s*'([^']*)',\s*'([^']*)',\s*'([^']*)',\s*'([^']*)'::timestamptz,\s*'([^']*)'::timestamptz/;

  for (const stmt of insertStatements) {
    const match = stmt.match(regex);
    if (match) {
      products.push({
        ml_id: match[1],
        sku: match[3] || null,
        title: match[4],
        price: parseInt(match[5]),
        stock_total: parseInt(match[6]),
        status: match[7],
        logistic_type: match[8],
        permalink: match[9],
        thumbnail: match[10],
        category_id: match[11],
        ml_created_at: match[12],
        ml_updated_at: match[13],
        synced_at: new Date().toISOString()
      });
    }
  }

  console.log(`✅ Productos parseados: ${products.length}`);

  // Insertar en batches de 100
  const BATCH_SIZE = 100;
  let processed = 0;

  for (let i = 0; i < products.length; i += BATCH_SIZE) {
    const batch = products.slice(i, i + BATCH_SIZE);

    try {
      await insertProducts(batch);
      processed += batch.length;
      console.log(`✅ Insertados: ${processed}/${products.length}`);
    } catch (error) {
      console.error(`❌ Error en batch ${i}:`, error.message);
    }

    // Rate limiting
    await new Promise(r => setTimeout(r, 200));
  }

  console.log(`\n🎉 Proceso completado! Productos insertados: ${processed}`);
}

main().catch(console.error);
