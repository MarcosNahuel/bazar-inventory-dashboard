/**
 * Cron Job: Sincronización diaria ML → Google Sheets
 * Ejecutado por Vercel Cron 1 vez al día (plan Hobby)
 *
 * Mejoras v2:
 * - Detecta Supermercado usando tags (supermarket_eligible)
 * - Separa ventas por logística (FULL vs FLEX)
 * - Muestra unidades vendidas (no cantidad de órdenes)
 * - Tags del producto de ML
 */

import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { google } from 'googleapis';

export const dynamic = 'force-dynamic';
export const maxDuration = 300; // 5 minutos max

// Tipos
interface MLProductFull {
  id: string;
  title: string;
  seller_custom_field: string | null;
  price: number;
  status: string;
  available_quantity: number;
  category_id: string;
  tags: string[];
  channels: string[];
  listing_type_id: string;
  catalog_listing: boolean;
  catalog_product_id: string | null;
  shipping?: {
    logistic_type: string;
  };
  // Para convivencia FULL/FLEX
  user_product_id?: string;
  variations?: Array<{
    id: number;
    user_product_id?: string;
    available_quantity: number;
    seller_custom_field: string | null;
  }>;
}

interface StockByLocation {
  fulfillment: number;
  self_service: number;
  xd_drop_off: number;
  total: number;
}

// Ventas por producto y logística
interface SalesByLogistic {
  full: number;    // Unidades vendidas FULL
  flex: number;    // Unidades vendidas FLEX
  other: number;   // Otros tipos de envío
  total: number;   // Total unidades
}

// Cliente de Google Sheets
function getGoogleSheetsClient() {
  const email = process.env.GOOGLE_SERVICE_ACCOUNT_EMAIL;
  const privateKey = process.env.GOOGLE_PRIVATE_KEY?.replace(/\\n/g, '\n');

  if (!email || !privateKey) {
    throw new Error('Google Sheets credentials not configured');
  }

  const auth = new google.auth.JWT({
    email,
    key: privateKey,
    scopes: ['https://www.googleapis.com/auth/spreadsheets'],
  });

  return google.sheets({ version: 'v4', auth });
}

// Obtener stock por ubicación
async function getStockByLocation(ml: ReturnType<typeof getMercadoLibreClient>, itemId: string): Promise<StockByLocation> {
  try {
    const stockData = await ml.getStock(itemId);

    if (!stockData || !stockData.locations) {
      return { fulfillment: 0, self_service: 0, xd_drop_off: 0, total: 0 };
    }

    const result: StockByLocation = {
      fulfillment: 0,
      self_service: 0,
      xd_drop_off: 0,
      total: 0,
    };

    for (const loc of stockData.locations) {
      const qty = loc.available_quantity || 0;

      if (loc.type === 'fulfillment' || loc.type === 'meli_facility') {
        result.fulfillment += qty;
      } else if (loc.type === 'self_service' || loc.type === 'seller_facility') {
        result.self_service += qty;
      } else if (loc.type === 'xd_drop_off' || loc.type === 'drop_off') {
        result.xd_drop_off += qty;
      }

      result.total += qty;
    }

    return result;
  } catch {
    return { fulfillment: 0, self_service: 0, xd_drop_off: 0, total: 0 };
  }
}

// Obtener IDs de productos por múltiples estados
async function getAllProductIds(ml: ReturnType<typeof getMercadoLibreClient>): Promise<string[]> {
  const allIds: Set<string> = new Set();
  const statuses: Array<'active' | 'paused' | 'closed'> = ['active', 'paused', 'closed'];

  for (const status of statuses) {
    let offset = 0;
    const limit = 50;
    let hasMore = true;

    while (hasMore) {
      try {
        const result = await ml.getProductIds(status, limit, offset);
        for (const id of result.results) {
          allIds.add(id);
        }
        offset += limit;
        hasMore = offset < result.paging.total;
        await new Promise(resolve => setTimeout(resolve, 100));
      } catch (error) {
        console.error(`[CRON-SHEET] Error fetching ${status} products:`, error);
        hasMore = false;
      }
    }
  }

  return Array.from(allIds);
}

// MEJORADO: Detectar si es producto Supermarket usando tags
function isSupermarket(product: MLProductFull): boolean {
  // Método 1: Tag de supermarket (más confiable)
  if (product.tags?.includes('supermarket_eligible')) return true;
  if (product.tags?.includes('supermarket')) return true;

  // Método 2: Canal de supermarket
  if (product.channels?.includes('supermarket')) return true;

  // Método 3: Listing type
  if (product.listing_type_id?.includes('supermarket')) return true;

  // Método 4: Categorías de supermercado en Chile
  const supermarketCategories = [
    'MLC1403',    // Almacén
    'MLC432801',  // Bebidas
    'MLC1246',    // Limpieza
    'MLC436379',  // Cuidado Personal
    'MLC1574',    // Hogar y Muebles (subcategorías)
  ];
  if (supermarketCategories.some(cat => product.category_id?.startsWith(cat))) {
    return true;
  }

  return false;
}

// NUEVO: Detectar si producto tiene convivencia FULL + FLEX
// Según doc ML: logistic_type === "fulfillment" && tags.includes("self_service_in")
function isConvivencia(product: MLProductFull): boolean {
  const isFullfillment = product.shipping?.logistic_type === 'fulfillment';
  const hasSelfServiceTag = product.tags?.includes('self_service_in');

  return isFullfillment && hasSelfServiceTag;
}

// Generar tags útiles del producto (CORREGIDO)
function generateProductTags(product: MLProductFull): string {
  const tags: string[] = [];

  // Tags de logística desde los tags del producto (más confiable)
  if (product.tags?.includes('supermarket_eligible')) tags.push('Supermercado');
  if (product.tags?.includes('self_service_in')) tags.push('Flex Activo');
  if (product.shipping?.logistic_type === 'fulfillment') tags.push('Full');

  // Convivencia
  if (isConvivencia(product)) tags.push('Convivencia');

  // Tags de catálogo
  if (product.catalog_listing) tags.push('Catálogo');

  // Tags de calidad
  if (product.tags?.includes('good_quality_picture')) tags.push('Foto OK');
  if (product.tags?.includes('good_quality_thumbnail')) tags.push('Thumb OK');
  if (product.tags?.includes('poor_quality_picture')) tags.push('Foto Mala');

  // Tags de destacados
  if (product.tags?.includes('dragged_bids_and_visits')) tags.push('Destacado');

  // Estado
  if (product.status === 'paused') tags.push('Pausado');

  return tags.join(', ');
}

// Clasificar logística del envío
function classifyLogistic(logisticType: string | undefined): 'full' | 'flex' | 'other' {
  if (!logisticType) return 'other';

  const lowerType = logisticType.toLowerCase();

  // FULL: fulfillment, cross_docking
  if (lowerType.includes('fulfillment') || lowerType.includes('cross_docking')) {
    return 'full';
  }

  // FLEX: drop_off, self_service, xd
  if (lowerType.includes('drop_off') || lowerType.includes('self_service') || lowerType.includes('xd')) {
    return 'flex';
  }

  return 'other';
}

// Leer datos existentes para preservar Proveedor y Costo
// Ahora busca por MLC+Logística como clave única (para convivencia)
async function getExistingData(sheets: ReturnType<typeof getGoogleSheetsClient>, spreadsheetId: string): Promise<Map<string, { proveedor: string; costo: number }>> {
  const existing = new Map<string, { proveedor: string; costo: number }>();

  try {
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId,
      range: 'Global!A:O',
    });

    const rows = response.data.values;
    if (!rows || rows.length < 2) return existing;

    const headers = rows[0].map((h: string) => h.toString().toLowerCase().replace(/\s+/g, '_'));
    const mlcIdx = headers.indexOf('mlc') !== -1 ? headers.indexOf('mlc') : headers.indexOf('codigo_ml');
    const provIdx = headers.indexOf('proveedor');
    const costoIdx = headers.indexOf('costo');

    if (mlcIdx === -1) return existing;

    for (let i = 1; i < rows.length; i++) {
      const row = rows[i];
      const mlc = row[mlcIdx]?.toString();

      if (mlc) {
        // Usar solo MLC como clave (el proveedor y costo son los mismos para FULL y FLEX)
        if (!existing.has(mlc)) {
          existing.set(mlc, {
            proveedor: provIdx !== -1 ? (row[provIdx]?.toString() || '') : '',
            costo: costoIdx !== -1 ? (parseFloat(row[costoIdx]?.toString().replace(/[$.]/g, '').replace(',', '.')) || 0) : 0,
          });
        }
      }
    }

    console.log(`[CRON-SHEET] Found ${existing.size} existing products with cost data`);
  } catch (error) {
    console.error('[CRON-SHEET] Error reading existing data:', error);
  }

  return existing;
}

// GET /api/cron/sync-to-sheet - Ejecutado por Vercel Cron diariamente
export async function GET(request: NextRequest): Promise<NextResponse> {
  const startTime = Date.now();

  try {
    // Verificar autenticación del cron
    const authHeader = request.headers.get('authorization');
    const cronSecret = process.env.CRON_SECRET;

    if (process.env.NODE_ENV === 'production' && cronSecret) {
      if (authHeader !== `Bearer ${cronSecret}`) {
        console.error('[CRON-SHEET] Unauthorized request');
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
      }
    }

    console.log('[CRON-SHEET] Starting daily sync ML → Google Sheets v2...');

    const ml = getMercadoLibreClient();
    const sheets = getGoogleSheetsClient();
    const spreadsheetId = process.env.GOOGLE_SPREADSHEET_ID;

    if (!spreadsheetId) {
      throw new Error('GOOGLE_SPREADSHEET_ID not configured');
    }

    // 1. Obtener datos existentes para preservar proveedor/costo
    const existingData = await getExistingData(sheets, spreadsheetId);

    // 2. Obtener todos los IDs de productos
    console.log('[CRON-SHEET] Fetching all product IDs...');
    const productIds = await getAllProductIds(ml);
    console.log(`[CRON-SHEET] Found ${productIds.length} total products`);

    // 3. Obtener ventas de los últimos 30 días CON LOGÍSTICA
    // OPTIMIZADO: Procesa shipments en paralelo con caché
    console.log('[CRON-SHEET] Fetching sales data with logistics...');
    const salesByProduct: Record<string, SalesByLogistic> = {};

    try {
      const orders = await ml.getAllOrders(30);
      console.log(`[CRON-SHEET] Processing ${orders.length} orders...`);

      // Caché de shipments para evitar consultas repetidas
      const shipmentCache = new Map<number, 'full' | 'flex' | 'other'>();

      // Función para obtener logística con caché
      async function getLogisticType(shippingId: number): Promise<'full' | 'flex' | 'other'> {
        if (shipmentCache.has(shippingId)) {
          return shipmentCache.get(shippingId)!;
        }
        try {
          const shipment = await ml.getShipment(shippingId);
          const type = shipment?.logistic?.type
            ? classifyLogistic(shipment.logistic.type)
            : 'other';
          shipmentCache.set(shippingId, type);
          return type;
        } catch {
          shipmentCache.set(shippingId, 'other');
          return 'other';
        }
      }

      // Procesar órdenes en batches paralelos
      const BATCH_SIZE = 20;  // Órdenes procesadas en paralelo
      const validOrders = orders.filter(o => o.status !== 'cancelled');

      for (let i = 0; i < validOrders.length; i += BATCH_SIZE) {
        const batch = validOrders.slice(i, i + BATCH_SIZE);

        // Obtener logística en paralelo para el batch
        const logisticPromises = batch.map(order =>
          order.shipping?.id ? getLogisticType(order.shipping.id) : Promise.resolve('other' as const)
        );
        const logisticTypes = await Promise.all(logisticPromises);

        // Procesar resultados
        batch.forEach((order, idx) => {
          const logisticType = logisticTypes[idx];

          for (const item of order.order_items) {
            const itemId = item.item.id;

            if (!salesByProduct[itemId]) {
              salesByProduct[itemId] = { full: 0, flex: 0, other: 0, total: 0 };
            }

            const qty = item.quantity;
            salesByProduct[itemId][logisticType] += qty;
            salesByProduct[itemId].total += qty;
          }
        });

        // Log progreso cada 200 órdenes
        if ((i + BATCH_SIZE) % 200 === 0 || i + BATCH_SIZE >= validOrders.length) {
          console.log(`[CRON-SHEET] Processed ${Math.min(i + BATCH_SIZE, validOrders.length)}/${validOrders.length} orders (cache hits: ${shipmentCache.size})`);
        }
      }

      console.log(`[CRON-SHEET] Completed processing ${validOrders.length} orders`);
    } catch (error) {
      console.error('[CRON-SHEET] Error fetching sales:', error);
    }

    // 4. Obtener detalles y construir datos
    // IMPORTANTE: Productos en convivencia generan 2 filas (FULL y FLEX)
    console.log('[CRON-SHEET] Fetching product details and stock...');
    interface ProductRow {
      mlc: string;
      sku: string;
      titulo: string;
      estado: string;
      stock: number;          // Stock de esta logística específica
      ventas_30d: number;     // Ventas de esta logística específica
      logistica: string;      // FULL, FLEX, o tipo específico
      es_supermarket: string;
      es_catalogo: string;
      catalog_product_id: string;
      precio: number;
      tags: string;
      proveedor: string;
      costo: number | string;
      ultima_actualizacion: string;
    }

    const products: ProductRow[] = [];
    let convivenciaCount = 0;

    const batchSize = 20;
    for (let i = 0; i < productIds.length; i += batchSize) {
      const batch = productIds.slice(i, i + batchSize);

      try {
        const details = await ml.getProductsDetails(batch);

        for (const item of details) {
          if (item.code !== 200) continue;

          const product = item.body as unknown as MLProductFull;
          const supermarket = isSupermarket(product);
          const convivencia = isConvivencia(product);
          const sales = salesByProduct[product.id] || { full: 0, flex: 0, other: 0, total: 0 };
          const existing = existingData.get(product.id) || { proveedor: '', costo: 0 };
          const tags = generateProductTags(product);

          // Datos comunes
          const commonData = {
            mlc: product.id,
            sku: product.seller_custom_field || '',
            titulo: product.title.substring(0, 100),
            estado: product.status,
            es_supermarket: supermarket ? 'SÍ' : 'NO',
            es_catalogo: product.catalog_listing ? 'SÍ' : 'NO',
            catalog_product_id: product.catalog_product_id || '',
            precio: product.price,
            tags,
            proveedor: existing.proveedor,
            costo: existing.costo || '',
            ultima_actualizacion: new Date().toISOString(),
          };

          if (convivencia) {
            // CONVIVENCIA: Generar 2 filas (FULL y FLEX)
            convivenciaCount++;

            // Obtener stock separado usando user_product_id
            let stockFull = 0;
            let stockFlex = 0;

            // Intentar obtener user_product_id
            const userProductId = product.user_product_id ||
              (product.variations && product.variations[0]?.user_product_id);

            if (userProductId) {
              const separatedStock = await ml.getUserProductStock(userProductId);
              if (separatedStock) {
                stockFull = separatedStock.meli_facility;
                stockFlex = separatedStock.selling_address;
              }
            } else {
              // Fallback: usar getStock si no hay user_product_id
              const stock = await getStockByLocation(ml, product.id);
              stockFull = stock.fulfillment;
              stockFlex = stock.self_service;
            }

            // Fila FULL
            products.push({
              ...commonData,
              stock: stockFull,
              ventas_30d: sales.full,
              logistica: 'FULL',
            });

            // Fila FLEX
            products.push({
              ...commonData,
              stock: stockFlex,
              ventas_30d: sales.flex + sales.other,
              logistica: 'FLEX',
            });

          } else {
            // SIN CONVIVENCIA: 1 sola fila
            const stock = await getStockByLocation(ml, product.id);
            const totalStock = supermarket
              ? stock.fulfillment + stock.xd_drop_off
              : stock.total;

            // Normalizar logística a FULL/FLEX/OTHER para consistencia
            const rawLogistic = product.shipping?.logistic_type || '';
            const normalizedLogistic = classifyLogistic(rawLogistic);
            const logisticLabel = normalizedLogistic === 'full' ? 'FULL'
              : normalizedLogistic === 'flex' ? 'FLEX'
              : rawLogistic || 'N/A';

            products.push({
              ...commonData,
              stock: totalStock,
              ventas_30d: sales.total,
              logistica: logisticLabel,
            });
          }
        }

        await new Promise(resolve => setTimeout(resolve, 150));

        if ((i + batchSize) % 100 === 0) {
          console.log(`[CRON-SHEET] Processed ${Math.min(i + batchSize, productIds.length)}/${productIds.length}`);
        }
      } catch (error) {
        console.error(`[CRON-SHEET] Error processing batch at ${i}:`, error);
      }
    }

    console.log(`[CRON-SHEET] Found ${convivenciaCount} products with FULL+FLEX convivencia`);

    // 5. Escribir al Google Sheet
    console.log(`[CRON-SHEET] Writing ${products.length} products to Sheet...`);

    // Headers simplificados: Stock y Ventas son por fila (según logística)
    const headers = [
      'MLC', 'SKU', 'Título', 'Estado',
      'Stock', 'Ventas 30D', 'Logística',
      'Es Supermarket', 'Es Catálogo', 'Catalog ID',
      'Precio', 'Tags',
      'Proveedor', 'Costo',
      'Última Actualización'
    ];

    const rows = products.map(p => [
      p.mlc, p.sku, p.titulo, p.estado,
      p.stock, p.ventas_30d, p.logistica,
      p.es_supermarket, p.es_catalogo, p.catalog_product_id,
      p.precio, p.tags,
      p.proveedor, p.costo,
      p.ultima_actualizacion,
    ]);

    // Limpiar y escribir (15 columnas: A-O)
    await sheets.spreadsheets.values.clear({
      spreadsheetId,
      range: 'Global!A:O',
    });

    await sheets.spreadsheets.values.update({
      spreadsheetId,
      range: 'Global!A1',
      valueInputOption: 'RAW',
      requestBody: {
        values: [headers, ...rows],
      },
    });

    const duration = Date.now() - startTime;
    console.log(`[CRON-SHEET] ✅ Sync completed in ${Math.round(duration / 1000)}s`);

    // Estadísticas actualizadas
    const uniqueMLCs = new Set(products.map(p => p.mlc)).size;
    const fullRows = products.filter(p => p.logistica === 'FULL');
    const flexRows = products.filter(p => p.logistica === 'FLEX');

    const stats = {
      total_rows: products.length,
      unique_products: uniqueMLCs,
      convivencia_products: convivenciaCount,
      active: products.filter(p => p.estado === 'active').length,
      paused: products.filter(p => p.estado === 'paused').length,
      closed: products.filter(p => p.estado === 'closed').length,
      supermarket: products.filter(p => p.es_supermarket === 'SÍ').length,
      catalogo: products.filter(p => p.es_catalogo === 'SÍ').length,
      with_cost: products.filter(p => p.costo && p.costo !== '').length,
      with_provider: products.filter(p => p.proveedor && p.proveedor !== '').length,
      full_rows: fullRows.length,
      flex_rows: flexRows.length,
      total_sales_full: fullRows.reduce((sum, p) => sum + p.ventas_30d, 0),
      total_sales_flex: flexRows.reduce((sum, p) => sum + p.ventas_30d, 0),
    };

    return NextResponse.json({
      success: true,
      source: 'vercel_cron_daily_v2',
      timestamp: new Date().toISOString(),
      stats,
      duration_ms: duration,
    });

  } catch (error) {
    console.error('[CRON-SHEET] ❌ Error:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
      duration_ms: Date.now() - startTime,
    }, { status: 500 });
  }
}
