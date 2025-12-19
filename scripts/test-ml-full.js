/**
 * Test completo de API Mercado Libre
 * Incluye: productos activos, stock por ubicación, ventas
 */

const https = require('https');

const ML_CONFIG = {
    client_id: '3004336950612441',
    client_secret: 'GG5zMDMpovxuKWBeAV6dxNJMnF8uZ7lU',
    access_token: 'APP_USR-3004336950612441-121817-c48717a0d43eee5e89319d8da896360b-2303729344',
    refresh_token: 'TG-694473ebadde630001e08ea4-2303729344',
    user_id: '2303729344'
};

function makeRequest(options, postData = null) {
    return new Promise((resolve, reject) => {
        const req = https.request(options, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => {
                try {
                    resolve({ statusCode: res.statusCode, data: JSON.parse(data) });
                } catch (e) {
                    resolve({ statusCode: res.statusCode, data: data });
                }
            });
        });
        req.on('error', reject);
        if (postData) req.write(postData);
        req.end();
    });
}

async function getActiveProducts() {
    const result = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/users/${ML_CONFIG.user_id}/items/search?status=active&limit=50`,
        method: 'GET',
        headers: { 'Authorization': `Bearer ${ML_CONFIG.access_token}` }
    });
    return result.data.results || [];
}

async function getItemDetails(itemIds) {
    const ids = itemIds.slice(0, 20).join(',');
    const result = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/items?ids=${ids}`,
        method: 'GET',
        headers: { 'Authorization': `Bearer ${ML_CONFIG.access_token}` }
    });
    return result.data;
}

async function getStock(itemId) {
    const result = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/user-products/${itemId}/stock`,
        method: 'GET',
        headers: { 'Authorization': `Bearer ${ML_CONFIG.access_token}` }
    });
    return result;
}

async function getSales30Days() {
    const now = new Date();
    const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000);
    const dateFrom = thirtyDaysAgo.toISOString().split('.')[0] + '.000-00:00';

    const result = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/orders/search?seller=${ML_CONFIG.user_id}&order.date_created.from=${dateFrom}&limit=50&sort=date_desc`,
        method: 'GET',
        headers: { 'Authorization': `Bearer ${ML_CONFIG.access_token}` }
    });
    return result;
}

async function refreshToken() {
    const postData = `grant_type=refresh_token&client_id=${ML_CONFIG.client_id}&client_secret=${ML_CONFIG.client_secret}&refresh_token=${ML_CONFIG.refresh_token}`;

    const result = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: '/oauth/token',
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json'
        }
    }, postData);
    return result;
}

async function main() {
    console.log('='.repeat(80));
    console.log('TEST COMPLETO API MERCADO LIBRE');
    console.log('='.repeat(80));
    console.log('');

    // 1. Obtener productos activos
    console.log('1. Obteniendo productos ACTIVOS...');
    const activeIds = await getActiveProducts();
    console.log(`   ✓ Productos activos encontrados: ${activeIds.length}`);
    console.log('');

    // 2. Obtener detalles de productos
    if (activeIds.length > 0) {
        console.log('2. Obteniendo detalles de productos...');
        const details = await getItemDetails(activeIds);

        const products = details.filter(d => d.code === 200).map(d => ({
            id: d.body.id,
            sku: d.body.seller_custom_field || 'Sin SKU',
            title: d.body.title?.substring(0, 40),
            price: d.body.price,
            stock: d.body.available_quantity,
            status: d.body.status,
            permalink: d.body.permalink
        }));

        console.log('   Productos con stock bajo (<= 5):');
        const lowStock = products.filter(p => p.stock <= 5);
        lowStock.forEach(p => {
            console.log(`   ⚠️  ${p.id} | Stock: ${p.stock} | ${p.title}`);
        });

        if (lowStock.length === 0) {
            console.log('   ✓ Ningún producto con stock crítico');
        }

        console.log('');
        console.log(`   Resumen: ${products.length} productos analizados`);
        console.log(`   - Stock crítico (<=5): ${lowStock.length}`);
        console.log(`   - Stock normal (>5): ${products.length - lowStock.length}`);
        console.log('');

        // 3. Probar stock por ubicación con un producto activo
        console.log('3. Probando stock por ubicación...');
        const testItem = activeIds[0];
        const stockResult = await getStock(testItem);

        if (stockResult.statusCode === 200) {
            console.log(`   ✓ Stock de ${testItem}:`);
            const locations = stockResult.data.locations || [];
            locations.forEach(loc => {
                console.log(`     - ${loc.type}: ${loc.available_quantity} unidades`);
            });
        } else {
            // Intentar con el endpoint alternativo
            console.log(`   → Probando endpoint alternativo para FULL/FLEX...`);
            const altResult = await makeRequest({
                hostname: 'api.mercadolibre.com',
                path: `/items/${testItem}?include_attributes=all`,
                method: 'GET',
                headers: { 'Authorization': `Bearer ${ML_CONFIG.access_token}` }
            });

            if (altResult.statusCode === 200) {
                const item = altResult.data;
                console.log(`   ✓ ${item.id}: ${item.available_quantity} unidades totales`);
                if (item.shipping?.logistic_type) {
                    console.log(`     - Logística: ${item.shipping.logistic_type}`);
                }
            }
        }
        console.log('');
    }

    // 4. Ventas últimos 30 días
    console.log('4. Obteniendo ventas últimos 30 días...');
    const salesResult = await getSales30Days();

    if (salesResult.statusCode === 200) {
        const orders = salesResult.data.results || [];
        const total = salesResult.data.paging?.total || 0;
        console.log(`   ✓ Total órdenes (30 días): ${total}`);

        // Calcular estadísticas
        const completed = orders.filter(o => o.status === 'paid').length;
        const totalAmount = orders.reduce((sum, o) => sum + (o.total_amount || 0), 0);

        console.log(`   ✓ Monto total (primeras 50): $${totalAmount.toLocaleString()} CLP`);
        console.log(`   ✓ Órdenes pagadas: ${completed}/${orders.length}`);
    }
    console.log('');

    // 5. Test refresh token
    console.log('5. Probando refresh token...');
    const refreshResult = await refreshToken();

    if (refreshResult.statusCode === 200) {
        console.log('   ✓ Refresh token VÁLIDO');
        console.log(`   ✓ Nuevo access_token: ${refreshResult.data.access_token?.substring(0, 50)}...`);
        console.log(`   ✓ Nuevo refresh_token: ${refreshResult.data.refresh_token}`);
        console.log(`   ✓ Expira en: ${refreshResult.data.expires_in} segundos`);

        // Guardar nuevos tokens
        console.log('');
        console.log('   NUEVOS TOKENS (actualizar en config):');
        console.log(`   access_token: ${refreshResult.data.access_token}`);
        console.log(`   refresh_token: ${refreshResult.data.refresh_token}`);
    } else {
        console.log(`   ✗ Error refresh: ${refreshResult.statusCode}`);
        console.log(refreshResult.data);
    }
    console.log('');

    console.log('='.repeat(80));
    console.log('TEST COMPLETADO EXITOSAMENTE');
    console.log('='.repeat(80));
}

main().catch(console.error);
