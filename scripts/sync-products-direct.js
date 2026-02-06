/**
 * Script para sincronizar productos de ML directamente a Supabase
 * Usa las credenciales de .env.local
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
          reject(new Error(`Parse error: ${data.substring(0, 200)}`));
        }
      });
    });
    req.on('error', reject);
    req.end();
  });
}

function insertProducts(productsData) {
  return new Promise((resolve, reject) => {
    const postData = JSON.stringify(productsData);
    const urlObj = new URL(config.SUPABASE_URL);

    const options = {
      hostname: urlObj.hostname,
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
  console.log('🚀 Obteniendo productos de ML...');

  // Get total count first
  const first = await fetchJSON(
    `https://api.mercadolibre.com/users/${config.ML_USER_ID}/items/search?limit=1&offset=0`,
    { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
  );

  if (first.error) {
    console.error('❌ Error ML:', first.message);
    return;
  }

  const total = first.paging.total;
  console.log(`📦 Total: ${total} productos`);

  // Fetch all IDs
  const allIds = [];
  let offset = 0;
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

  // Fetch details and insert in batches
  console.log('📋 Obteniendo detalles e insertando...');
  let processed = 0;
  let errors = 0;

  for (let i = 0; i < allIds.length; i += 20) {
    const batch = allIds.slice(i, i + 20);

    try {
      const details = await fetchJSON(
        `https://api.mercadolibre.com/items?ids=${batch.join(',')}`,
        { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
      );

      const products = details
        .filter(d => d.code === 200)
        .map(d => d.body)
        .map(p => ({
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
          ml_updated_at: p.last_updated,
          synced_at: new Date().toISOString()
        }));

      if (products.length > 0) {
        await insertProducts(products);
        processed += products.length;
      }

      errors += details.filter(d => d.code !== 200).length;
      process.stdout.write(`\r   Procesados: ${processed}/${total} (errores ML: ${errors})`);

    } catch (error) {
      console.error(`\n❌ Error batch ${i}:`, error.message);
    }

    await new Promise(r => setTimeout(r, 100));
  }

  console.log(`\n\n🎉 Proceso completado!`);
  console.log(`   - Productos insertados: ${processed}`);
  console.log(`   - Errores ML: ${errors}`);
}

main().catch(console.error);
