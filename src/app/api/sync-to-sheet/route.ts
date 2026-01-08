/**
 * API Endpoint: Sincronizar datos de Mercado Libre → Google Sheets
 *
 * POST: Sincronización completa (manual) - Todas las publicaciones
 * PUT: Actualización de stock (automática) - Solo stock por ubicación
 *
 * Escribe a la hoja "Global" del Google Sheet con estructura:
 * - MLC, SKU, Título, Estado
 * - Stock FULL, Stock FLEX, Stock Total
 * - Es Supermarket, Es Catálogo
 * - Ventas 30D FULL, Ventas 30D FLEX, Ventas 30D Total
 * - Precio, Tipo Logístico
 * - Proveedor, Costo (vacíos para llenar manual desde Costos_Proveedores)
 * - Última actualización
 */

import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { google } from 'googleapis';

export const dynamic = 'force-dynamic';
export const maxDuration = 300; // 5 minutos max para sincronización completa

// Tipos
interface MLProductFull {
  id: string;
  title: string;
  seller_custom_field: string | null; // SKU del vendedor
  price: number;
  status: string;
  available_quantity: number;
  logistic_type: string;
  category_id: string;
  catalog_listing: boolean;
  listing_type_id: string;
  channels: string[];
  shipping?: {
    logistic_type: string;
  };
}

interface StockByLocation {
  fulfillment: number;  // FULL - Bodega ML
  self_service: number; // FLEX - Mi bodega
  xd_drop_off: number;  // Correo/Agencia
  total: number;
}

interface ProductData {
  mlc: string;
  sku: string;
  titulo: string;
  estado: string;
  stock_full: number;
  stock_flex: number;
  stock_xd_drop_off: number;
  stock_total: number;
  es_supermarket: boolean;
  es_catalogo: boolean;
  ventas_30d_full: number;
  ventas_30d_flex: number;
  ventas_30d_xd: number;
  ventas_30d_total: number;
  precio: number;
  tipo_logistico: string;
  tags: string; // FULL, FLEX, Correo separados por coma
  proveedor: string; // Se deja vacío o se preserva existente
  costo: number; // Se deja vacío o se preserva existente
  ultima_actualizacion: string;
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

// Obtener stock por ubicación desde la API de ML
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
    // Si falla, devolver stock del item directamente
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

        // Rate limiting
        await new Promise(resolve => setTimeout(resolve, 100));
      } catch (error) {
        console.error(`Error fetching ${status} products at offset ${offset}:`, error);
        hasMore = false;
      }
    }

    console.log(`[SyncToSheet] Found ${allIds.size} products after ${status} status`);
  }

  return Array.from(allIds);
}

// Detectar si es producto Supermarket
function isSupermarket(product: MLProductFull): boolean {
  // Los productos supermarket tienen ciertas características:
  // 1. listing_type_id contiene "supermarket"
  // 2. Categoría de supermercado
  // 3. Channel incluye "supermarket"

  if (product.listing_type_id?.includes('supermarket')) return true;
  if (product.channels?.includes('supermarket')) return true;

  // Categorías de supermercado en Chile (MLC)
  const supermarketCategories = [
    'MLC1403', // Alimentos y Bebidas
    'MLC432801', // Supermercado
    'MLC1246', // Bebidas
  ];

  if (supermarketCategories.some(cat => product.category_id?.startsWith(cat))) {
    return true;
  }

  return false;
}

// Generar tags basados en stock por ubicación
function generateTags(stock: StockByLocation, isSupermarketProduct: boolean): string {
  const tags: string[] = [];

  if (stock.fulfillment > 0) tags.push('FULL');

  // Para Supermarket, no incluir FLEX en tags (stock obsoleto)
  if (stock.self_service > 0 && !isSupermarketProduct) tags.push('FLEX');

  if (stock.xd_drop_off > 0) tags.push('Correo');

  return tags.join(', ');
}

// Leer datos existentes del Sheet para preservar Proveedor y Costo
async function getExistingData(sheets: ReturnType<typeof getGoogleSheetsClient>, spreadsheetId: string): Promise<Map<string, { proveedor: string; costo: number }>> {
  const existing = new Map<string, { proveedor: string; costo: number }>();

  try {
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId,
      range: 'Global!A:S',
    });

    const rows = response.data.values;
    if (!rows || rows.length < 2) return existing;

    // Encontrar índices de columnas
    const headers = rows[0].map((h: string) => h.toString().toLowerCase().replace(/\s+/g, '_'));
    const mlcIdx = headers.indexOf('mlc') !== -1 ? headers.indexOf('mlc') : headers.indexOf('codigo_ml');
    const provIdx = headers.indexOf('proveedor');
    const costoIdx = headers.indexOf('costo');

    if (mlcIdx === -1) return existing;

    for (let i = 1; i < rows.length; i++) {
      const row = rows[i];
      const mlc = row[mlcIdx]?.toString();

      if (mlc) {
        existing.set(mlc, {
          proveedor: provIdx !== -1 ? (row[provIdx]?.toString() || '') : '',
          costo: costoIdx !== -1 ? (parseFloat(row[costoIdx]?.toString().replace(/[$.]/g, '').replace(',', '.')) || 0) : 0,
        });
      }
    }

    console.log(`[SyncToSheet] Found ${existing.size} existing products with cost data`);
  } catch (error) {
    console.error('[SyncToSheet] Error reading existing data:', error);
  }

  return existing;
}

// POST: Sincronización completa (todas las publicaciones)
export async function POST(request: NextRequest): Promise<NextResponse> {
  const startTime = Date.now();

  try {
    const body = await request.json().catch(() => ({}));
    const mode = body.mode || 'full'; // 'full' o 'new_only'

    console.log(`[SyncToSheet] Starting ${mode} sync...`);

    const ml = getMercadoLibreClient();
    const sheets = getGoogleSheetsClient();
    const spreadsheetId = process.env.GOOGLE_SPREADSHEET_ID;

    if (!spreadsheetId) {
      throw new Error('GOOGLE_SPREADSHEET_ID not configured');
    }

    // 1. Obtener datos existentes para preservar proveedor/costo
    const existingData = await getExistingData(sheets, spreadsheetId);

    // 2. Obtener todos los IDs de productos
    console.log('[SyncToSheet] Fetching all product IDs...');
    const productIds = await getAllProductIds(ml);
    console.log(`[SyncToSheet] Found ${productIds.length} total products`);

    // 3. Obtener ventas de los últimos 30 días
    console.log('[SyncToSheet] Fetching sales data...');
    const salesByProduct: Record<string, { quantity: number; logistic_type: string }[]> = {};

    try {
      const orders = await ml.getAllOrders(30);

      for (const order of orders) {
        if (order.status === 'cancelled') continue;

        for (const item of order.order_items) {
          const itemId = item.item.id;
          if (!salesByProduct[itemId]) {
            salesByProduct[itemId] = [];
          }

          // TODO: Obtener tipo logístico del envío para diferenciar ventas FULL/FLEX/XD
          salesByProduct[itemId].push({
            quantity: item.quantity,
            logistic_type: 'unknown', // Se determina por el shipping
          });
        }
      }

      console.log(`[SyncToSheet] Processed ${orders.length} orders`);
    } catch (error) {
      console.error('[SyncToSheet] Error fetching sales:', error);
    }

    // 4. Obtener detalles de cada producto y construir datos
    console.log('[SyncToSheet] Fetching product details and stock...');
    const products: ProductData[] = [];
    const batchSize = 20;

    for (let i = 0; i < productIds.length; i += batchSize) {
      const batch = productIds.slice(i, i + batchSize);

      try {
        const details = await ml.getProductsDetails(batch);

        for (const item of details) {
          if (item.code !== 200) continue;

          const product = item.body as unknown as MLProductFull;

          // Obtener stock por ubicación
          const stock = await getStockByLocation(ml, product.id);

          // Determinar si es supermarket
          const supermarket = isSupermarket(product);

          // Calcular ventas 30D (simplificado - TODO: separar por canal)
          const sales = salesByProduct[product.id] || [];
          const ventas30dTotal = sales.reduce((sum, s) => sum + s.quantity, 0);

          // Obtener datos existentes de proveedor/costo
          const existing = existingData.get(product.id) || { proveedor: '', costo: 0 };

          // Generar tags
          const tags = generateTags(stock, supermarket);

          products.push({
            mlc: product.id,
            sku: product.seller_custom_field || '',
            titulo: product.title.substring(0, 100),
            estado: product.status,
            stock_full: stock.fulfillment,
            stock_flex: supermarket ? 0 : stock.self_service, // Supermarket: ignorar FLEX
            stock_xd_drop_off: stock.xd_drop_off,
            stock_total: supermarket
              ? stock.fulfillment + stock.xd_drop_off // Supermarket: sin FLEX
              : stock.total,
            es_supermarket: supermarket,
            es_catalogo: product.catalog_listing || false,
            ventas_30d_full: 0, // TODO: Separar por canal cuando tengamos datos
            ventas_30d_flex: 0,
            ventas_30d_xd: 0,
            ventas_30d_total: ventas30dTotal,
            precio: product.price,
            tipo_logistico: product.logistic_type || 'unknown',
            tags,
            proveedor: existing.proveedor,
            costo: existing.costo,
            ultima_actualizacion: new Date().toISOString(),
          });
        }

        // Rate limiting
        await new Promise(resolve => setTimeout(resolve, 150));

        // Log progreso
        if ((i + batchSize) % 100 === 0 || i + batchSize >= productIds.length) {
          console.log(`[SyncToSheet] Processed ${Math.min(i + batchSize, productIds.length)}/${productIds.length} products`);
        }
      } catch (error) {
        console.error(`[SyncToSheet] Error processing batch at ${i}:`, error);
      }
    }

    // 5. Escribir al Google Sheet
    console.log(`[SyncToSheet] Writing ${products.length} products to Sheet...`);

    // Headers
    const headers = [
      'MLC', 'SKU', 'Título', 'Estado',
      'Stock FULL', 'Stock FLEX', 'Stock XD', 'Stock Total',
      'Es Supermarket', 'Es Catálogo',
      'Ventas 30D FULL', 'Ventas 30D FLEX', 'Ventas 30D XD', 'Ventas 30D Total',
      'Precio', 'Tipo Logístico', 'Tags',
      'Proveedor', 'Costo',
      'Última Actualización'
    ];

    // Preparar filas
    const rows = products.map(p => [
      p.mlc,
      p.sku,
      p.titulo,
      p.estado,
      p.stock_full,
      p.stock_flex,
      p.stock_xd_drop_off,
      p.stock_total,
      p.es_supermarket ? 'SÍ' : 'NO',
      p.es_catalogo ? 'SÍ' : 'NO',
      p.ventas_30d_full,
      p.ventas_30d_flex,
      p.ventas_30d_xd,
      p.ventas_30d_total,
      p.precio,
      p.tipo_logistico,
      p.tags,
      p.proveedor,
      p.costo || '',
      p.ultima_actualizacion,
    ]);

    // Limpiar hoja y escribir datos
    await sheets.spreadsheets.values.clear({
      spreadsheetId,
      range: 'Global!A:T',
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

    console.log(`[SyncToSheet] Sync completed in ${duration}ms`);

    return NextResponse.json({
      success: true,
      timestamp: new Date().toISOString(),
      stats: {
        total_products: products.length,
        active: products.filter(p => p.estado === 'active').length,
        paused: products.filter(p => p.estado === 'paused').length,
        closed: products.filter(p => p.estado === 'closed').length,
        supermarket: products.filter(p => p.es_supermarket).length,
        catalogo: products.filter(p => p.es_catalogo).length,
        with_cost: products.filter(p => p.costo > 0).length,
        with_provider: products.filter(p => p.proveedor && p.proveedor !== '').length,
      },
      duration_ms: duration,
    });

  } catch (error) {
    console.error('[SyncToSheet] Error:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
      duration_ms: Date.now() - startTime,
    }, { status: 500 });
  }
}

// PUT: Actualización rápida de stock (solo actualiza columnas de stock)
export async function PUT(request: NextRequest): Promise<NextResponse> {
  const startTime = Date.now();

  try {
    console.log('[SyncToSheet] Starting stock update...');

    const ml = getMercadoLibreClient();
    const sheets = getGoogleSheetsClient();
    const spreadsheetId = process.env.GOOGLE_SPREADSHEET_ID;

    if (!spreadsheetId) {
      throw new Error('GOOGLE_SPREADSHEET_ID not configured');
    }

    // 1. Leer datos actuales del Sheet
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId,
      range: 'Global!A:T',
    });

    const rows = response.data.values;
    if (!rows || rows.length < 2) {
      return NextResponse.json({
        success: false,
        error: 'Sheet vacío. Ejecute primero una sincronización completa (POST).',
      }, { status: 400 });
    }

    const headers = rows[0];
    const mlcIdx = headers.indexOf('MLC');
    const stockFullIdx = headers.indexOf('Stock FULL');
    const stockFlexIdx = headers.indexOf('Stock FLEX');
    const stockXdIdx = headers.indexOf('Stock XD');
    const stockTotalIdx = headers.indexOf('Stock Total');
    const supermarketIdx = headers.indexOf('Es Supermarket');
    const tagsIdx = headers.indexOf('Tags');
    const updateIdx = headers.indexOf('Última Actualización');

    if (mlcIdx === -1) {
      return NextResponse.json({
        success: false,
        error: 'Estructura de Sheet inválida. Falta columna MLC.',
      }, { status: 400 });
    }

    // 2. Actualizar stock de cada producto
    let updated = 0;
    const updatedRows: string[][] = [headers];

    for (let i = 1; i < rows.length; i++) {
      const row = [...rows[i]];
      const mlc = row[mlcIdx];

      if (!mlc) {
        updatedRows.push(row);
        continue;
      }

      try {
        // Obtener stock actualizado
        const stock = await getStockByLocation(ml, mlc);
        const isSupermarketProduct = row[supermarketIdx] === 'SÍ';

        // Actualizar valores
        row[stockFullIdx] = String(stock.fulfillment);
        row[stockFlexIdx] = String(isSupermarketProduct ? 0 : stock.self_service);
        row[stockXdIdx] = String(stock.xd_drop_off);
        row[stockTotalIdx] = String(isSupermarketProduct
          ? stock.fulfillment + stock.xd_drop_off
          : stock.total);
        row[tagsIdx] = generateTags(stock, isSupermarketProduct);
        row[updateIdx] = new Date().toISOString();

        updated++;

        // Rate limiting
        if (i % 10 === 0) {
          await new Promise(resolve => setTimeout(resolve, 100));
        }
      } catch (error) {
        console.error(`[SyncToSheet] Error updating stock for ${mlc}:`, error);
      }

      updatedRows.push(row);

      // Log progreso
      if (i % 50 === 0) {
        console.log(`[SyncToSheet] Updated ${i}/${rows.length - 1} products`);
      }
    }

    // 3. Escribir datos actualizados
    await sheets.spreadsheets.values.update({
      spreadsheetId,
      range: 'Global!A1',
      valueInputOption: 'RAW',
      requestBody: {
        values: updatedRows,
      },
    });

    const duration = Date.now() - startTime;

    console.log(`[SyncToSheet] Stock update completed: ${updated} products in ${duration}ms`);

    return NextResponse.json({
      success: true,
      timestamp: new Date().toISOString(),
      updated_products: updated,
      total_products: rows.length - 1,
      duration_ms: duration,
    });

  } catch (error) {
    console.error('[SyncToSheet] Error:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
      duration_ms: Date.now() - startTime,
    }, { status: 500 });
  }
}

// GET: Estado de sincronización
export async function GET(): Promise<NextResponse> {
  try {
    const sheets = getGoogleSheetsClient();
    const spreadsheetId = process.env.GOOGLE_SPREADSHEET_ID;

    if (!spreadsheetId) {
      return NextResponse.json({
        success: false,
        error: 'GOOGLE_SPREADSHEET_ID not configured',
      });
    }

    // Leer última fila para ver última actualización
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId,
      range: 'Global!A:T',
    });

    const rows = response.data.values;
    if (!rows || rows.length < 2) {
      return NextResponse.json({
        success: true,
        status: 'empty',
        message: 'Sheet vacío. Ejecute una sincronización completa.',
        total_products: 0,
      });
    }

    const headers = rows[0];
    const updateIdx = headers.indexOf('Última Actualización');
    const estadoIdx = headers.indexOf('Estado');

    // Encontrar última actualización
    let lastUpdate = '';
    for (let i = rows.length - 1; i > 0; i--) {
      if (rows[i][updateIdx]) {
        lastUpdate = rows[i][updateIdx];
        break;
      }
    }

    // Contar estados
    const stats = {
      total: rows.length - 1,
      active: 0,
      paused: 0,
      closed: 0,
    };

    for (let i = 1; i < rows.length; i++) {
      const estado = rows[i][estadoIdx];
      if (estado === 'active') stats.active++;
      else if (estado === 'paused') stats.paused++;
      else if (estado === 'closed') stats.closed++;
    }

    return NextResponse.json({
      success: true,
      status: 'synced',
      last_update: lastUpdate,
      stats,
    });

  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
    }, { status: 500 });
  }
}
