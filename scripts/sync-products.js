/**
 * Script para sincronizar productos de Mercado Libre a Supabase
 * Ejecutar: node scripts/sync-products.js
 */

const https = require('https');

// Configuración desde .env.local
const config = {
  ML_ACCESS_TOKEN: 'APP_USR-3004336950612441-020521-d95f5b083cf2aca3eabf5130055a3814-2303729344',
  ML_USER_ID: '2303729344',
  SUPABASE_URL: 'https://ahqaiqxdauzniiswrhcs.supabase.co',
  SUPABASE_SERVICE_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFocWFpcXhkYXV6bmlpc3dyaGNzIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2ODU1OTYwMCwiZXhwIjoyMDg0MTM1NjAwfQ.l-3oRbSjy5Q88k1JY4eKl5eIZPqGhJYoGw83ww7fO2E'
};

// Helper para hacer requests
function fetchJSON(url, options = {}) {
  return new Promise((resolve, reject) => {
    const urlObj = new URL(url);
    const reqOptions = {
      hostname: urlObj.hostname,
      path: urlObj.pathname + urlObj.search,
      method: options.method || 'GET',
      headers: options.headers || {}
    };

    const req = https.request(reqOptions, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          resolve(JSON.parse(data));
        } catch (e) {
          resolve(data);
        }
      });
    });

    req.on('error', reject);

    if (options.body) {
      req.write(options.body);
    }
    req.end();
  });
}

// Obtener IDs de productos de ML
async function getProductIds(offset = 0) {
  const url = `https://api.mercadolibre.com/users/${config.ML_USER_ID}/items/search?limit=50&offset=${offset}`;
  const data = await fetchJSON(url, {
    headers: { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
  });
  return data;
}

// Obtener detalles de productos
async function getProductDetails(ids) {
  const url = `https://api.mercadolibre.com/items?ids=${ids.join(',')}`;
  const data = await fetchJSON(url, {
    headers: { 'Authorization': `Bearer ${config.ML_ACCESS_TOKEN}` }
  });
  return data;
}

// Guardar productos en Supabase
async function saveProducts(products) {
  const url = `${config.SUPABASE_URL}/rest/v1/products`;

  const productsData = products.map(p => ({
    ml_id: p.body.id,
    sku: p.body.seller_custom_field || p.body.inventory_id || null,
    title: p.body.title,
    price: p.body.price || 0,
    cost: 0, // Se actualizará después
    stock_total: p.body.available_quantity || 0,
    status: p.body.status || 'active',
    logistic_type: p.body.shipping?.logistic_type || null,
    permalink: p.body.permalink,
    thumbnail: p.body.thumbnail,
    category_id: p.body.category_id,
    ml_created_at: p.body.start_time,
    ml_updated_at: p.body.last_updated,
    synced_at: new Date().toISOString()
  }));

  const response = await fetchJSON(url, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${config.SUPABASE_SERVICE_KEY}`,
      'apikey': config.SUPABASE_SERVICE_KEY,
      'Content-Type': 'application/json',
      'Prefer': 'resolution=merge-duplicates'
    },
    body: JSON.stringify(productsData)
  });

  return response;
}

// Main sync function
async function syncProducts() {
  console.log('🚀 Iniciando sincronización de productos...');

  let offset = 0;
  let total = 0;
  let processed = 0;
  let errors = 0;

  // Obtener total de productos
  const firstPage = await getProductIds(0);
  total = firstPage.paging.total;
  console.log(`📦 Total de productos a sincronizar: ${total}`);

  while (offset < total) {
    try {
      // Obtener IDs
      const page = await getProductIds(offset);
      const ids = page.results;

      if (ids.length === 0) break;

      // Obtener detalles en batches de 20
      for (let i = 0; i < ids.length; i += 20) {
        const batch = ids.slice(i, i + 20);
        const details = await getProductDetails(batch);

        // Filtrar solo los exitosos
        const validProducts = details.filter(d => d.code === 200);

        if (validProducts.length > 0) {
          await saveProducts(validProducts);
          processed += validProducts.length;
        }

        errors += details.filter(d => d.code !== 200).length;

        // Rate limiting
        await new Promise(r => setTimeout(r, 100));
      }

      console.log(`✅ Procesados: ${processed}/${total} (errores: ${errors})`);
      offset += 50;

      // Rate limiting entre páginas
      await new Promise(r => setTimeout(r, 200));

    } catch (error) {
      console.error(`❌ Error en offset ${offset}:`, error.message);
      offset += 50; // Continuar con siguiente página
    }
  }

  console.log(`\n🎉 Sincronización completada!`);
  console.log(`   - Productos procesados: ${processed}`);
  console.log(`   - Errores: ${errors}`);
}

// Ejecutar
syncProducts().catch(console.error);
