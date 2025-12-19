/**
 * Script para probar la API de Mercado Libre
 * Verifica que las credenciales funcionan correctamente
 */

const https = require('https');

// Credenciales ML (Nueva App)
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

async function testAPI() {
    console.log('='.repeat(80));
    console.log('TEST API MERCADO LIBRE - BAZAR Importaciones');
    console.log('='.repeat(80));
    console.log('');

    // Test 1: Verificar usuario
    console.log('1. Verificando datos del usuario...');
    const userResult = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/users/${ML_CONFIG.user_id}`,
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${ML_CONFIG.access_token}`
        }
    });

    if (userResult.statusCode === 200) {
        console.log(`   ✓ Usuario: ${userResult.data.nickname}`);
        console.log(`   ✓ País: ${userResult.data.site_id}`);
        console.log(`   ✓ Status: ${userResult.data.status?.site_status || 'active'}`);
    } else {
        console.log(`   ✗ Error: ${userResult.statusCode}`);
        console.log(userResult.data);
    }
    console.log('');

    // Test 2: Listar productos
    console.log('2. Listando productos del vendedor...');
    const itemsResult = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/users/${ML_CONFIG.user_id}/items/search?limit=50`,
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${ML_CONFIG.access_token}`
        }
    });

    if (itemsResult.statusCode === 200) {
        const total = itemsResult.data.paging?.total || 0;
        const results = itemsResult.data.results || [];
        console.log(`   ✓ Total productos: ${total}`);
        console.log(`   ✓ Primeros IDs: ${results.slice(0, 5).join(', ')}`);
    } else {
        console.log(`   ✗ Error: ${itemsResult.statusCode}`);
        console.log(itemsResult.data);
    }
    console.log('');

    // Test 3: Obtener detalle de un producto
    if (itemsResult.statusCode === 200 && itemsResult.data.results?.length > 0) {
        const firstItemId = itemsResult.data.results[0];
        console.log(`3. Obteniendo detalle del producto ${firstItemId}...`);

        const itemDetail = await makeRequest({
            hostname: 'api.mercadolibre.com',
            path: `/items/${firstItemId}`,
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${ML_CONFIG.access_token}`
            }
        });

        if (itemDetail.statusCode === 200) {
            console.log(`   ✓ Título: ${itemDetail.data.title?.substring(0, 50)}...`);
            console.log(`   ✓ Precio: $${itemDetail.data.price} ${itemDetail.data.currency_id}`);
            console.log(`   ✓ Stock: ${itemDetail.data.available_quantity}`);
            console.log(`   ✓ Status: ${itemDetail.data.status}`);
            console.log(`   ✓ SKU: ${itemDetail.data.seller_custom_field || 'N/A'}`);
        } else {
            console.log(`   ✗ Error: ${itemDetail.statusCode}`);
        }
        console.log('');

        // Test 4: Obtener stock por ubicación
        console.log(`4. Obteniendo stock por ubicación...`);
        const stockResult = await makeRequest({
            hostname: 'api.mercadolibre.com',
            path: `/user-products/${firstItemId}/stock`,
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${ML_CONFIG.access_token}`
            }
        });

        if (stockResult.statusCode === 200) {
            const locations = stockResult.data.locations || [];
            console.log(`   ✓ Ubicaciones: ${locations.length}`);
            locations.forEach(loc => {
                console.log(`     - ${loc.type || loc.name}: ${loc.quantity || loc.available_quantity} unidades`);
            });
        } else {
            console.log(`   ✗ Error: ${stockResult.statusCode} - ${JSON.stringify(stockResult.data)}`);
        }
        console.log('');
    }

    // Test 5: Obtener órdenes recientes
    console.log('5. Obteniendo órdenes recientes...');
    const ordersResult = await makeRequest({
        hostname: 'api.mercadolibre.com',
        path: `/orders/search?seller=${ML_CONFIG.user_id}&order.date_created.from=2025-01-01T00:00:00.000-00:00&limit=10&sort=date_desc`,
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${ML_CONFIG.access_token}`
        }
    });

    if (ordersResult.statusCode === 200) {
        const orders = ordersResult.data.results || [];
        console.log(`   ✓ Órdenes encontradas: ${ordersResult.data.paging?.total || 0}`);
        if (orders.length > 0) {
            console.log(`   ✓ Última orden: ${orders[0].id} - ${orders[0].status}`);
        }
    } else {
        console.log(`   ✗ Error: ${ordersResult.statusCode}`);
        console.log(ordersResult.data);
    }
    console.log('');

    console.log('='.repeat(80));
    console.log('TEST COMPLETADO');
    console.log('='.repeat(80));
}

testAPI().catch(console.error);
