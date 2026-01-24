import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { getCachedCosts, getCostByML, getCostBySku } from '@/lib/google-sheets/costs-cache';

export const dynamic = 'force-dynamic';
export const maxDuration = 120; // 2 minutes for fetching all products

interface ProductWithSales {
  id: string;
  title: string;
  sku: string | null;
  price: number;
  stock: number;
  stock_full: number;    // Stock en bodega ML (FULL)
  stock_flex: number;    // Stock en bodega propia (FLEX)
  status: string;
  category_id: string;
  logistic_type: string;
  ventas_30d: number;
  revenue_30d: number;
  costo: number;
  proveedor: string;
  is_supermarket: boolean;  // Producto de categoría Supermarket
  is_catalog: boolean;      // Publicación de catálogo
  catalog_product_id: string | null; // Catalog ID for grouping listings
  tags: string[];           // Tags: FULL, FLEX, Correo
  user_product_ids?: string[]; // IDs para consultar stock por ubicación
  thumbnail?: string;       // URL de imagen miniatura para tooltip
}

// Categorías de Supermarket en Chile
const SUPERMARKET_CATEGORIES = [
  'MLC1403',    // Alimentos y Bebidas
  'MLC432801',  // Supermercado
  'MLC1246',    // Bebidas
  'MLC1574',    // Hogar, Muebles y Jardín (algunos productos)
];

// Detectar si un producto es de categoría Supermarket
function isSupermarketProduct(categoryId: string, listingType?: string, channels?: string[], tags?: string[]): boolean {
  // Por tags de ML (más confiable)
  if (tags?.includes('supermarket_eligible')) return true;

  // Por listing_type
  if (listingType?.includes('supermarket')) return true;

  // Por canal
  if (channels?.includes('supermarket')) return true;

  // Por categoría
  if (SUPERMARKET_CATEGORIES.some(cat => categoryId?.startsWith(cat))) {
    return true;
  }

  return false;
}

// Tipos logísticos que corresponden a stock en bodega propia (FLEX / Drop-off / Acordar)
function isFlexLogisticType(logisticType: string | undefined): boolean {
  if (!logisticType) return false;
  return [
    'self_service',
    'drop_off',
    'xd_drop_off',
    'cross_docking',
    'agreement',
    'custom',
    'not_specified',
  ].includes(logisticType);
}

// Generar tags basados en stock y tipo de producto
function generateProductTags(stockFull: number, stockFlex: number, isSupermarket: boolean): string[] {
  const tags: string[] = [];

  if (stockFull > 0) tags.push('FULL');

  // Para Supermarket, no incluir FLEX (stock obsoleto que ML no permite modificar)
  if (stockFlex > 0 && !isSupermarket) tags.push('FLEX');

  return tags;
}

// Helper to get all sales aggregated by product ID
// Also returns product info for items that had sales (for stock-zero products)
async function getSalesById(ml: ReturnType<typeof getMercadoLibreClient>, daysBack: number) {
  const salesById: Record<string, { quantity: number; amount: number }> = {};
  const productInfoFromSales: Record<string, { title: string; price: number; sku: string | null }> = {};

  // Get orders using pagination - up to 2000 orders for accuracy
  const orders = await ml.getAllOrders(daysBack);

  for (const order of orders) {
    if (order.status === 'cancelled') continue;

    for (const item of order.order_items) {
      // Use item ID (MLC...) as primary key
      const itemId = item.item.id;
      const sku = item.item.seller_sku;

      // Store by item ID
      if (!salesById[itemId]) {
        salesById[itemId] = { quantity: 0, amount: 0 };
      }
      salesById[itemId].quantity += item.quantity;
      salesById[itemId].amount += item.quantity * item.unit_price;

      // Store product info for items with sales (used for stock-zero products)
      if (!productInfoFromSales[itemId]) {
        productInfoFromSales[itemId] = {
          title: item.item.title,
          price: item.unit_price,
          sku: sku || null,
        };
      }

      // Also store by SKU if available
      if (sku) {
        if (!salesById[sku]) {
          salesById[sku] = { quantity: 0, amount: 0 };
        }
        salesById[sku].quantity += item.quantity;
        salesById[sku].amount += item.quantity * item.unit_price;
      }
    }
  }

  return { salesById, productInfoFromSales };
}

// GET /api/inventory - Get complete inventory analysis from ML API
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const analysis = searchParams.get('analysis') || 'full';

    const ml = getMercadoLibreClient();
    const STOCK_THRESHOLD = parseInt(process.env.STOCK_ALERT_THRESHOLD || '5');

    // Constantes globales de cálculo (evitar redefiniciones)
    const ML_COMMISSION = 0.13; // 13% comisión ML
    const FLEX_SHIPPING_COST = parseInt(process.env.FLEX_SHIPPING_COST || '2990'); // $2,990 por envío FLEX

    // Get ALL active products using pagination
    const allProductIds: string[] = [];
    let offset = 0;
    const pageSize = 50;
    let totalProducts = 0;

    // Paginate through all products
    while (true) {
      const productsResult = await ml.getProductIds('active', pageSize, offset);
      totalProducts = productsResult.paging.total;

      if (productsResult.results.length === 0) break;

      allProductIds.push(...productsResult.results);
      offset += pageSize;

      // Safety limit to prevent infinite loops (max 500 products)
      if (offset >= totalProducts || offset >= 500) break;

      // Rate limiting between pages
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    console.log(`[Inventory] Fetched ${allProductIds.length} of ${totalProducts} total products`);

    // Cargar costos desde Google Sheets (cache de 15 min)
    const costsMap: Map<string, { costo: number; proveedor: string }> = new Map();
    try {
      const costs = await getCachedCosts();
      for (const cost of costs) {
        if (cost.codigoML) {
          costsMap.set(cost.codigoML.toLowerCase(), { costo: cost.costo, proveedor: cost.proveedor });
        }
        if (cost.sku) {
          costsMap.set(cost.sku.toLowerCase(), { costo: cost.costo, proveedor: cost.proveedor });
        }
      }
      console.log(`[Inventory] Loaded ${costs.length} costs from Google Sheets cache`);
    } catch (e) {
      console.error('[Inventory] Error loading costs:', e);
    }

    // Get product details in batches
    const products: ProductWithSales[] = [];
    const batchSize = 20;

    for (let i = 0; i < allProductIds.length; i += batchSize) {
      const batch = allProductIds.slice(i, i + batchSize);
      const details = await ml.getProductsDetails(batch);

      for (const item of details) {
        if (item.code === 200) {
          // Buscar costo por ID de ML o por SKU
          const costByMl = costsMap.get(item.body.id.toLowerCase());
          const costBySku = item.body.seller_custom_field
            ? costsMap.get(item.body.seller_custom_field.toLowerCase())
            : null;
          const costData = costByMl || costBySku || { costo: 0, proveedor: 'Sin asignar' };

          const logisticType = item.body.shipping?.logistic_type || 'unknown';
          const isSupermarket = isSupermarketProduct(
            item.body.category_id,
            (item.body as { listing_type_id?: string }).listing_type_id,
            (item.body as { channels?: string[] }).channels,
            (item.body as { tags?: string[] }).tags
          );

          // Stock inicial basado en logistic_type (será actualizado después con datos reales)
          // fulfillment = FULL (Bodega ML), TODO lo demás = FLEX (Mi Bodega)
          // Tipos FLEX: self_service, drop_off, xd_drop_off, cross_docking, agreement, custom, default, etc.
          const stockTotal = item.body.available_quantity;
          let stockFull = 0;
          let stockFlex = 0;

          if (logisticType === 'fulfillment') {
            // Solo fulfillment va a Bodega ML
            stockFull = stockTotal;
          } else {
            // Todo lo demás (drop_off, self_service, cross_docking, agreement, default, etc.)
            // es stock en Mi Bodega (FLEX)
            stockFlex = isSupermarket ? 0 : stockTotal;
            // Para supermarket, poner en stock_full ya que FLEX no aplica
            if (isSupermarket) stockFull = stockTotal;
          }

          // Extraer user_product_id(s) si existe (para consultar stock por ubicación)
          const userProductIds = new Set<string>();
          const userProductId = (item.body as { user_product_id?: string }).user_product_id;
          if (userProductId) userProductIds.add(userProductId);
          if (item.body.variations) {
            for (const variation of item.body.variations) {
              if (variation.user_product_id) userProductIds.add(variation.user_product_id);
            }
          }
          const userProductIdsArray = userProductIds.size > 0 ? Array.from(userProductIds) : undefined;

          // Generar tags (serán actualizados después si hay datos de stock por ubicación)
          const tags = generateProductTags(stockFull, stockFlex, isSupermarket);

          products.push({
            id: item.body.id,
            title: item.body.title,
            sku: item.body.seller_custom_field,
            price: item.body.price,
            stock: isSupermarket ? stockFull : stockTotal, // Supermarket: solo contar FULL
            stock_full: stockFull,
            stock_flex: stockFlex,
            status: item.body.status,
            category_id: item.body.category_id,
            logistic_type: logisticType,
            ventas_30d: 0,
            revenue_30d: 0,
            costo: costData.costo,
            proveedor: costData.proveedor,
            is_supermarket: isSupermarket,
            is_catalog: (item.body as { catalog_listing?: boolean }).catalog_listing || false,
            catalog_product_id: item.body.catalog_product_id || null,
            tags,
            user_product_ids: userProductIdsArray,
            thumbnail: item.body.thumbnail || undefined,
          });
        }
      }

      // Rate limiting
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // NUEVO: Obtener stock real por ubicación para productos con user_product_ids
    // Esto da el desglose correcto FULL vs FLEX
    const productsWithUserProductId = products.filter(p => p.user_product_ids && p.user_product_ids.length > 0);
    if (productsWithUserProductId.length > 0) {
      console.log(`[Inventory] Fetching stock by location for ${productsWithUserProductId.length} products...`);

      // Procesar en batches de 10 para evitar rate limiting
      const stockBatchSize = 10;
      for (let i = 0; i < productsWithUserProductId.length; i += stockBatchSize) {
        const batch = productsWithUserProductId.slice(i, i + stockBatchSize);

        // Llamadas paralelas dentro del batch
        const stockPromises = batch.map(async (product) => {
          const userProductIds = product.user_product_ids || [];
          if (userProductIds.length === 0) return null;

          try {
            const stockResults = await Promise.all(
              userProductIds.map(async (userProductId) => {
                try {
                  return await ml.getUserProductStock(userProductId);
                } catch {
                  return null;
                }
              })
            );

            let stockFull = 0;
            let stockFlex = 0;
            let hasData = false;

            for (const stockData of stockResults) {
              if (!stockData) continue;
              hasData = true;
              stockFull += stockData.meli_facility;
              stockFlex += stockData.selling_address;
            }

            if (hasData) {
              return {
                id: product.id,
                stockFull,
                stockFlex,
              };
            }
          } catch {
            // Silently ignore errors - keep the original values
          }

          return null;
        });

        const stockResults = await Promise.all(stockPromises);

        // Actualizar productos con datos reales de stock
        for (const result of stockResults) {
          if (result) {
            const product = products.find(p => p.id === result.id);
            if (product) {
              product.stock_full = result.stockFull;
              product.stock_flex = product.is_supermarket ? 0 : result.stockFlex;
              product.stock = product.is_supermarket
                ? result.stockFull
                : result.stockFull + result.stockFlex;
              // Regenerar tags con los nuevos valores
              product.tags = generateProductTags(product.stock_full, product.stock_flex, product.is_supermarket);
            }
          }
        }

        // Rate limiting entre batches
        if (i + stockBatchSize < productsWithUserProductId.length) {
          await new Promise(resolve => setTimeout(resolve, 200));
        }
      }
      console.log(`[Inventory] Stock by location fetched successfully`);
    }

    // Fallback: Para productos sin user_product_ids, intentar obtener stock con getItemStockByLocation
    const productsNeedingStockUpdate = products.filter(p =>
      (!p.user_product_ids || p.user_product_ids.length === 0) &&
      p.stock > 0 &&
      (p.stock_flex === 0 || p.stock_full === 0) // Solo si no tiene desglose
    );

    if (productsNeedingStockUpdate.length > 0) {
      console.log(`[Inventory] Fetching stock by location for ${productsNeedingStockUpdate.length} products without user_product_ids...`);

      const fallbackBatchSize = 10;
      for (let i = 0; i < productsNeedingStockUpdate.length; i += fallbackBatchSize) {
        const batch = productsNeedingStockUpdate.slice(i, i + fallbackBatchSize);

        const stockPromises = batch.map(async (product) => {
          try {
            const stockData = await ml.getItemStockByLocation(product.id);
            if (stockData && (stockData.meli_facility > 0 || stockData.selling_address > 0)) {
              return {
                id: product.id,
                stockFull: stockData.meli_facility,
                stockFlex: stockData.selling_address,
              };
            }
          } catch {
            // Silently ignore
          }
          return null;
        });

        const results = await Promise.all(stockPromises);

        for (const result of results) {
          if (result) {
            const product = products.find(p => p.id === result.id);
            if (product) {
              product.stock_full = result.stockFull;
              product.stock_flex = product.is_supermarket ? 0 : result.stockFlex;
              product.stock = product.is_supermarket
                ? result.stockFull
                : result.stockFull + result.stockFlex;
              product.tags = generateProductTags(product.stock_full, product.stock_flex, product.is_supermarket);
            }
          }
        }

        // Rate limiting
        if (i + fallbackBatchSize < productsNeedingStockUpdate.length) {
          await new Promise(resolve => setTimeout(resolve, 200));
        }
      }
      console.log(`[Inventory] Fallback stock fetch completed`);
    }

    // Get sales data for last 30 days - using optimized method
    let salesById: Record<string, { quantity: number; amount: number }> = {};
    let productInfoFromSales: Record<string, { title: string; price: number; sku: string | null }> = {};
    try {
      const salesData = await getSalesById(ml, 30);
      salesById = salesData.salesById;
      productInfoFromSales = salesData.productInfoFromSales;
    } catch (e) {
      console.error('Error fetching sales:', e);
    }

    // Merge sales data with products - check by ID first (most reliable)
    const productIds = new Set(products.map(p => p.id));
    for (const product of products) {
      // Check by product ID (MLC...)
      if (salesById[product.id]) {
        product.ventas_30d = salesById[product.id].quantity;
        product.revenue_30d = salesById[product.id].amount;
      }
      // If no match by ID, try by SKU
      else if (product.sku && salesById[product.sku]) {
        product.ventas_30d = salesById[product.sku].quantity;
        product.revenue_30d = salesById[product.sku].amount;
      }
    }

    // NUEVO: Agregar productos con ventas que no están en la lista de productos activos
    // Esto incluye productos con stock cero o pausados que tuvieron ventas en los últimos 30 días
    for (const [itemId, salesData] of Object.entries(salesById)) {
      // Solo procesar IDs de ML (MLC...), no SKUs
      if (!itemId.startsWith('MLC')) continue;
      // Si ya está en la lista de productos, saltar
      if (productIds.has(itemId)) continue;
      // Si no tiene ventas, saltar
      if (salesData.quantity === 0) continue;

      // Obtener info del producto desde las ventas
      const productInfo = productInfoFromSales[itemId];
      if (!productInfo) continue;

      // Buscar costo del producto
      const costByMl = costsMap.get(itemId.toLowerCase());
      const costBySku = productInfo.sku ? costsMap.get(productInfo.sku.toLowerCase()) : null;
      const costData = costByMl || costBySku || { costo: 0, proveedor: 'Sin asignar' };

      // Agregar producto con stock cero
      products.push({
        id: itemId,
        title: productInfo.title || 'Producto sin stock',
        sku: productInfo.sku,
        price: productInfo.price,
        stock: 0,
        stock_full: 0,
        stock_flex: 0,
        status: 'paused',
        category_id: '',
        logistic_type: 'unknown',
        ventas_30d: salesData.quantity,
        revenue_30d: salesData.amount,
        costo: costData.costo,
        proveedor: costData.proveedor,
        is_supermarket: false,
        is_catalog: false,
        catalog_product_id: null,
        tags: [],
      });

      console.log(`[Inventory] Added stock-zero product: ${itemId} with ${salesData.quantity} sales in 30D`);
    }

    // Build response based on analysis type
    const response: Record<string, unknown> = {
      total_items: totalProducts,
      active_items: products.length,
    };

    if (analysis === 'full' || analysis === 'summary') {
      const activeProducts = products.filter(p => p.status === 'active');
      const catalogGroups = new Set(
        activeProducts
          .map(p => p.catalog_product_id)
          .filter((id): id is string => Boolean(id))
      );
      const activeWithoutCatalog = activeProducts.filter(p => !p.catalog_product_id).length;
      const productosUnicos = catalogGroups.size + activeWithoutCatalog;
      const totalStock = products.reduce((sum, p) => sum + p.stock, 0);
      const totalStockFull = products.reduce((sum, p) => sum + p.stock_full, 0);
      const totalStockFlex = products.reduce((sum, p) => sum + p.stock_flex, 0);
      const totalVentas30d = products.reduce((sum, p) => sum + p.ventas_30d, 0);
      const totalRevenue30d = products.reduce((sum, p) => sum + p.revenue_30d, 0);

      const totalUtilidad30d = products.reduce((sum, p) => {
        if (p.ventas_30d <= 0 || p.costo <= 0) return sum;
        const shippingCost = p.logistic_type === 'self_service' && !p.is_supermarket ? FLEX_SHIPPING_COST : 0;
        const commission = p.price * ML_COMMISSION;
        const utilidadUnitaria = p.price - p.costo - shippingCost - commission;
        return sum + (utilidadUnitaria * p.ventas_30d);
      }, 0);

      // Valorización por PRECIO DE VENTA (actual)
      const valorizacionPorPrecio = products.reduce((sum, p) => sum + (p.price * p.stock), 0);

      // Valorización por COSTO (para efectos contables)
      const valorizacionPorCosto = products.reduce((sum, p) => {
        if (p.costo > 0) {
          return sum + (p.costo * p.stock);
        }
        return sum;
      }, 0);

      // Valorización por UTILIDAD PROYECTADA

      const valorizacionPorUtilidad = products.reduce((sum, p) => {
        if (p.costo > 0 && p.stock > 0) {
          const shippingCost = p.logistic_type === 'self_service' && !p.is_supermarket ? FLEX_SHIPPING_COST : 0;
          const commission = p.price * ML_COMMISSION;
          const utilidadUnitaria = p.price - p.costo - shippingCost - commission;
          return sum + (utilidadUnitaria * p.stock);
        }
        return sum;
      }, 0);

      // Contar productos por tipo
      const productosConCosto = products.filter(p => p.costo > 0).length;
      const productosSinCosto = products.filter(p => p.costo === 0).length;
      const productosSupermarket = products.filter(p => p.is_supermarket).length;
      const productosCatalogo = products.filter(p => p.is_catalog).length;

      response.summary = {
        publicaciones_activas: totalProducts,
        productos_unicos: productosUnicos,
        stock_total: totalStock,
        stock_full: totalStockFull,
        stock_flex: totalStockFlex,

        // Las 3 valorizaciones requeridas
        valorizacion_por_precio: Math.round(valorizacionPorPrecio),
        valorizacion_por_costo: Math.round(valorizacionPorCosto),
        valorizacion_por_utilidad: Math.round(valorizacionPorUtilidad),

        // Retrocompatibilidad
        valorizacion_total: Math.round(valorizacionPorPrecio),

        ventas_30d_total: totalVentas30d,
        revenue_30d_total: Math.round(totalRevenue30d),
        utilidad_30d_total: Math.round(totalUtilidad30d),
        ticket_promedio: products.length > 0 ? Math.round(valorizacionPorPrecio / Math.max(totalStock, 1)) : 0,

        // Conteos adicionales
        productos_total: products.length,
        productos_con_costo: productosConCosto,
        productos_sin_costo: productosSinCosto,
        productos_supermarket: productosSupermarket,
        productos_catalogo: productosCatalogo,
      };
    }

    if (analysis === 'full' || analysis === 'pareto') {
      // Pareto analysis (80/20 rule) - MEJORADO con 3 análisis: Ventas, Utilidad, ROI

      // Función helper para calcular datos de un producto
      const calcProductData = (p: ProductWithSales) => {
        const shippingCost = p.logistic_type === 'self_service' ? FLEX_SHIPPING_COST : 0;
        const commission = Math.round(p.price * ML_COMMISSION);
        const utilidad = p.costo > 0 ? Math.round(p.price - p.costo - shippingCost - commission) : 0;
        const utilidad_30d = utilidad * p.ventas_30d;
        const roi = p.costo > 0 ? Math.round((utilidad / p.costo) * 1000) / 10 : 0;
        const margen = p.price > 0 && p.costo > 0 ? Math.round((utilidad / p.price) * 1000) / 10 : 0;

        // Determinar estado
        let status: 'healthy' | 'warning' | 'critical' | 'out_of_stock' | 'overstocked';
        if (p.stock === 0) {
          status = 'out_of_stock';
        } else if (p.stock > p.ventas_30d * 3 && p.ventas_30d > 0) {
          status = 'overstocked';
        } else if (p.stock >= p.ventas_30d) {
          status = 'healthy';
        } else if (p.stock >= p.ventas_30d * 0.5) {
          status = 'warning';
        } else {
          status = 'critical';
        }

        return {
          codigo_ml: p.id,
          titulo: p.title.substring(0, 50),
          titulo_completo: p.title, // Título completo para tooltip
          thumbnail: p.thumbnail,   // Imagen para tooltip
          ventas_30d: p.ventas_30d,
          stock: p.stock,
          proveedor: p.proveedor,
          logistic_type: p.logistic_type,
          status,
          precio: p.price,
          costo: p.costo,
          comision: commission,
          utilidad,
          utilidad_30d: Math.round(utilidad_30d),
          roi,
          margen,
        };
      };

      // Calcular datos para todos los productos con ventas
      const productsWithData = products
        .filter(p => p.ventas_30d > 0)
        .map(p => ({ ...p, ...calcProductData(p) }));

      // === PARETO POR VENTAS ===
      const sortedBySales = [...productsWithData].sort((a, b) => b.ventas_30d - a.ventas_30d);
      const totalSales = sortedBySales.reduce((sum, p) => sum + p.ventas_30d, 0);

      // Encontrar productos que representan 80% de las ventas
      let cumSales = 0;
      const top80SalesProducts = sortedBySales.filter(p => {
        if (cumSales >= totalSales * 0.8) return false;
        cumSales += p.ventas_30d;
        return true;
      });
      const top80SalesContrib = Math.round((cumSales / totalSales) * 1000) / 10;

      // === PARETO POR UTILIDAD ===
      const productsWithUtilidad = productsWithData.filter(p => p.utilidad_30d > 0);
      const sortedByUtilidad = [...productsWithUtilidad].sort((a, b) => b.utilidad_30d - a.utilidad_30d);
      const totalUtilidad = sortedByUtilidad.reduce((sum, p) => sum + p.utilidad_30d, 0);

      let cumUtilidad = 0;
      const top80UtilidadProducts = sortedByUtilidad.filter(p => {
        if (cumUtilidad >= totalUtilidad * 0.8) return false;
        cumUtilidad += p.utilidad_30d;
        return true;
      });
      const top80UtilidadContrib = totalUtilidad > 0 ? Math.round((cumUtilidad / totalUtilidad) * 1000) / 10 : 0;

      // === PARETO POR ROI ===
      const productsWithROI = productsWithData.filter(p => p.roi > 0 && p.costo > 0);
      const sortedByROI = [...productsWithROI].sort((a, b) => b.roi - a.roi);
      // Para ROI, tomamos los que tienen ROI > promedio (los más eficientes)
      const avgROI = productsWithROI.length > 0
        ? productsWithROI.reduce((sum, p) => sum + p.roi, 0) / productsWithROI.length
        : 0;
      const topROIProducts = sortedByROI.filter(p => p.roi >= avgROI).slice(0, 20);

      response.pareto = {
        // Resumen general
        total_products_with_sales: productsWithData.length,
        total_sales: totalSales,
        total_utilidad: Math.round(totalUtilidad),

        // === PESTAÑA VENTAS ===
        by_sales: {
          title: 'Top 80% Ventas',
          description: 'Productos que representan el 80% de las ventas totales',
          contribution_percent: top80SalesContrib,
          products_count: top80SalesProducts.length,
          total_sales: totalSales,
          top_products: sortedBySales.slice(0, 20).map(calcProductData),
        },

        // === PESTAÑA UTILIDAD ===
        by_utilidad: {
          title: 'Top 80% Utilidad',
          description: 'Productos que representan el 80% de la utilidad total',
          contribution_percent: top80UtilidadContrib,
          products_count: top80UtilidadProducts.length,
          total_utilidad: Math.round(totalUtilidad),
          top_products: sortedByUtilidad.slice(0, 20).map(calcProductData),
        },

        // === PESTAÑA ROI ===
        by_roi: {
          title: 'Top ROI',
          description: 'Productos con mayor retorno sobre inversión',
          avg_roi: Math.round(avgROI * 10) / 10,
          products_count: topROIProducts.length,
          top_products: sortedByROI.slice(0, 20).map(calcProductData),
        },

        // Retrocompatibilidad: top_products por ventas
        top_20_percent_contributes: top80SalesContrib,
        total_utilidad_top20: Math.round(sortedByUtilidad.slice(0, 20).reduce((sum, p) => sum + p.utilidad_30d, 0)),
        top_products: sortedBySales.slice(0, 20).map(calcProductData),
      };
    }

    if (analysis === 'full' || analysis === 'tickets') {
      // Price distribution analysis
      const prices = products.map(p => p.price).sort((a, b) => a - b);
      const avgPrice = prices.length > 0 ? prices.reduce((a, b) => a + b, 0) / prices.length : 0;

      const ranges = [
        { range: '$0-10K', min: 0, max: 10000 },
        { range: '$10K-25K', min: 10000, max: 25000 },
        { range: '$25K-50K', min: 25000, max: 50000 },
        { range: '$50K-100K', min: 50000, max: 100000 },
        { range: '$100K+', min: 100000, max: Infinity },
      ];

      const distribution = ranges.map(r => ({
        range: r.range,
        count: products.filter(p => p.price >= r.min && p.price < r.max).length,
        percentage: products.length > 0
          ? Math.round((products.filter(p => p.price >= r.min && p.price < r.max).length / products.length) * 100)
          : 0,
      }));

      response.tickets = {
        avg_ticket: Math.round(avgPrice),
        min_ticket: prices[0] || 0,
        max_ticket: prices[prices.length - 1] || 0,
        median_ticket: prices[Math.floor(prices.length / 2)] || 0,
        distribution,
      };
    }

    if (analysis === 'full' || analysis === 'stock_health') {

      // NUEVO CRITERIO: Stock >= Ventas30D = Saludable
      // Stock suficiente para cubrir las ventas del próximo mes
      const healthy = products.filter(p => p.stock >= p.ventas_30d && p.stock > 0).length;
      const warning = products.filter(p => p.stock > 0 && p.stock < p.ventas_30d && p.stock >= p.ventas_30d * 0.5).length;
      const critical = products.filter(p => p.stock > 0 && p.stock < p.ventas_30d * 0.5).length;
      const outOfStock = products.filter(p => p.stock === 0).length;
      const overstocked = products.filter(p => p.stock > p.ventas_30d * 3 && p.ventas_30d > 0).length;

      // Determinar estado de TODOS los productos, no solo críticos
      const allProductsWithStatus = products.map(p => {
        const dailySales = p.ventas_30d / 30;
        const daysOfStock = dailySales > 0 ? Math.round(p.stock / dailySales) : 999;

        // Determinar estado basado en: Stock >= Ventas30D = Saludable
        let status: 'healthy' | 'warning' | 'critical' | 'out_of_stock' | 'overstocked';
        if (p.stock === 0) {
          status = 'out_of_stock';
        } else if (p.stock > p.ventas_30d * 3 && p.ventas_30d > 0) {
          status = 'overstocked';
        } else if (p.stock >= p.ventas_30d) {
          status = 'healthy';
        } else if (p.stock >= p.ventas_30d * 0.5) {
          status = 'warning';
        } else {
          status = 'critical';
        }

        // Calcular valorización a costo y ACOS máximo
        const valorizacion = p.costo > 0 ? (p.costo * p.stock) : 0;
        const shippingCost = p.logistic_type === 'self_service' && !p.is_supermarket ? FLEX_SHIPPING_COST : 0;
        const utilidadUnitaria = p.price - p.costo - shippingCost;
        const acosMax = p.price > 0 && p.costo > 0 ? (utilidadUnitaria / p.price) * 100 : null;

        return {
          codigo_ml: p.id,
          titulo: p.title.substring(0, 50),
          titulo_completo: p.title, // Título completo para tooltip
          thumbnail: p.thumbnail, // Imagen para tooltip
          stock: p.stock,
          stock_full: p.stock_full,
          stock_flex: p.stock_flex,
          ventas_30d: p.ventas_30d,
          days: daysOfStock,
          status,
          price: p.price,
          valorizacion, // NUEVO: valorización por publicación (costo)
          proveedor: p.proveedor, // NUEVO: proveedor real
          logistic_type: p.logistic_type, // FLEX/FULL para distribución
          costo: p.costo, // NUEVO: costo del producto
          acos_max: acosMax !== null ? Math.round(acosMax * 10) / 10 : null,
        };
      }).sort((a, b) => {
        // Ordenar: critical primero, luego warning, luego out_of_stock, luego healthy, luego overstocked
        const statusOrder = { 'critical': 0, 'warning': 1, 'out_of_stock': 2, 'healthy': 3, 'overstocked': 4 };
        return statusOrder[a.status] - statusOrder[b.status] || a.days - b.days;
      });

      // Items críticos (para retrocompatibilidad)
      const criticalItems = allProductsWithStatus
        .filter(p => p.status === 'critical' || p.status === 'warning')
        .slice(0, 20);

      response.stock_health = {
        healthy,
        warning,
        critical,
        out_of_stock: outOfStock,
        overstocked,
        critical_items: criticalItems,
        all_products: allProductsWithStatus, // NUEVO: todos los productos con estado
      };

      // NUEVO: Distribución logística FLEX vs FULL (solo activos)
      // fulfillment = FULL (bodega ML), self_service = FLEX (mi bodega), xd_drop_off = Paquete en correo
      const activeProducts = products.filter(p => p.status === 'active');
      const mainLogisticsProducts = activeProducts.filter(
        p => isFlexLogisticType(p.logistic_type) || p.logistic_type === 'fulfillment'
      );
      const otherProducts = activeProducts.filter(
        p => !isFlexLogisticType(p.logistic_type) && p.logistic_type !== 'fulfillment'
      );

      const flexProducts = mainLogisticsProducts.filter(p => p.stock_flex > 0 && isFlexLogisticType(p.logistic_type));
      const fullProducts = mainLogisticsProducts.filter(p => p.stock_full > 0);

      let flexStockTotal = 0;
      let flexVentasTotal = 0;
      let flexValorizacionTotal = 0;
      const flexNeedRestock: Array<{ product: ProductWithSales; ventas: number }> = [];

      let fullStockTotal = 0;
      let fullVentasTotal = 0;
      let fullValorizacionTotal = 0;
      const fullNeedRestock: Array<{ product: ProductWithSales; ventas: number }> = [];

      for (const product of mainLogisticsProducts) {
        const totalStock = product.stock_full + product.stock_flex;
        const flexShare = totalStock > 0 ? (product.stock_flex / totalStock) : 0;
        const fullShare = totalStock > 0 ? (product.stock_full / totalStock) : 0;
        const ventasFlex = product.stock_flex > 0 ? product.ventas_30d * flexShare : 0;
        const ventasFull = product.stock_full > 0 ? product.ventas_30d * fullShare : 0;

        if (product.stock_flex > 0) {
          flexStockTotal += product.stock_flex;
          flexVentasTotal += ventasFlex;
          if (product.costo > 0) {
            flexValorizacionTotal += product.costo * product.stock_flex;
          }
          if (ventasFlex >= product.stock_flex && ventasFlex > 0) {
            flexNeedRestock.push({ product, ventas: ventasFlex });
          }
        }

        if (product.stock_full > 0) {
          fullStockTotal += product.stock_full;
          fullVentasTotal += ventasFull;
          if (product.costo > 0) {
            fullValorizacionTotal += product.costo * product.stock_full;
          }
          if (ventasFull >= product.stock_full && ventasFull > 0) {
            fullNeedRestock.push({ product, ventas: ventasFull });
          }
        }
      }

      response.logistics_distribution = {
        flex: {
          name: 'FLEX (Mi Bodega)',
          productos: flexProducts.length,
          stock_total: flexStockTotal,
          ventas_30d: Math.round(flexVentasTotal),
          valorizacion: Math.round(flexValorizacionTotal),
          necesita_reposicion: flexNeedRestock.length,
        },
        full: {
          name: 'FULL (Bodega ML)',
          productos: fullProducts.length,
          stock_total: fullStockTotal,
          ventas_30d: Math.round(fullVentasTotal),
          valorizacion: Math.round(fullValorizacionTotal),
          necesita_reposicion: fullNeedRestock.length,
        },
        other: {
          name: 'Otros (Drop-off/Acordar)',
          productos: otherProducts.length,
          stock_total: otherProducts.reduce((sum, p) => sum + p.stock, 0),
          ventas_30d: otherProducts.reduce((sum, p) => sum + p.ventas_30d, 0),
          valorizacion: otherProducts.reduce((sum, p) => sum + (p.costo > 0 ? p.costo * p.stock : 0), 0),
        },
        // Productos a reponer con detalle
        products_to_restock: {
          flex: flexNeedRestock.map(({ product, ventas }) => ({
            codigo_ml: product.id,
            titulo: product.title.substring(0, 40),
            titulo_completo: product.title,
            thumbnail: product.thumbnail,
            stock: product.stock_flex,
            ventas_30d: Math.round(ventas),
            sugerido_reponer: Math.max(Math.round(ventas) - product.stock_flex, 0),
            proveedor: product.proveedor,
          })),
          full: fullNeedRestock.map(({ product, ventas }) => ({
            codigo_ml: product.id,
            titulo: product.title.substring(0, 40),
            titulo_completo: product.title,
            thumbnail: product.thumbnail,
            stock: product.stock_full,
            ventas_30d: Math.round(ventas),
            sugerido_reponer: Math.max(Math.round(ventas) - product.stock_full, 0),
            proveedor: product.proveedor,
          })),
        },
      };
    }

    if (analysis === 'full' || analysis === 'suppliers') {
      // Group by PROVEEDOR REAL (desde Google Sheets), no por logistic_type

      const byProveedor: Record<string, {
        productos: number;
        stock_total: number;
        valorizacion: number;
        ventas_30d: number;
        facturacion: number;     // Precio de venta × ventas_30d
        ingreso_neto: number;    // Facturación - comisiones
        utilidad: number;        // Ingreso neto - costos - envíos
      }> = {};

      for (const p of products) {
        const key = p.proveedor || 'Sin asignar';
        if (!byProveedor[key]) {
          byProveedor[key] = {
            productos: 0,
            stock_total: 0,
            valorizacion: 0,
            ventas_30d: 0,
            facturacion: 0,
            ingreso_neto: 0,
            utilidad: 0,
          };
        }
        byProveedor[key].productos++;
        byProveedor[key].stock_total += p.stock;

        // Valorización por costo
        if (p.costo > 0) {
          byProveedor[key].valorizacion += p.costo * p.stock;
        }

        byProveedor[key].ventas_30d += p.ventas_30d;

        // Facturación (precio de venta × unidades vendidas)
        const facturacion = p.price * p.ventas_30d;
        byProveedor[key].facturacion += facturacion;

        // Comisión ML
        const comision = facturacion * ML_COMMISSION;

        // Ingreso neto (facturación - comisión)
        const ingresoNeto = facturacion - comision;
        byProveedor[key].ingreso_neto += ingresoNeto;

        // Costo de envío (solo para FLEX)
        const costoEnvio = (p.logistic_type === 'self_service' && !p.is_supermarket)
          ? FLEX_SHIPPING_COST * p.ventas_30d
          : 0;

        // Costo total del producto
        const costoTotal = p.costo * p.ventas_30d;

        // Utilidad (ingreso neto - costo - envío)
        const utilidad = ingresoNeto - costoTotal - costoEnvio;
        byProveedor[key].utilidad += utilidad;
      }

      response.suppliers = Object.entries(byProveedor)
        .map(([proveedor, data]) => ({
          proveedor,
          ...data,
          facturacion: Math.round(data.facturacion),
          ingreso_neto: Math.round(data.ingreso_neto),
          utilidad: Math.round(data.utilidad),
          rentabilidad: data.facturacion > 0
            ? Math.round((data.utilidad / data.facturacion) * 1000) / 10
            : 0,
          avg_value_per_product: data.productos > 0 ? Math.round(data.valorizacion / data.productos) : 0,
        }))
        .sort((a, b) => b.facturacion - a.facturacion);
    }

    if (analysis === 'full' || analysis === 'profitability') {
      // Comisión de MercadoLibre (aproximada)

      // Calcular margen para cada producto con ventas
      const productsWithMargin = products
        .filter(p => p.ventas_30d > 0 && p.costo > 0)
        .map(p => {
          const shippingCost = (p.logistic_type === 'self_service' && !p.is_supermarket) ? FLEX_SHIPPING_COST : 0;
          const commission = p.price * ML_COMMISSION;
          const costoTotal = p.costo + shippingCost + commission;
          const utilidad = p.price - costoTotal;
          const utilidadSinEnvio = p.price - p.costo - commission; // Utilidad sin considerar envío
          const rentabilidad = p.costo > 0 ? ((utilidad / p.costo) * 100) : 0;
          const utilidad30d = utilidad * p.ventas_30d;

          return {
            codigo_ml: p.id,
            titulo: p.title.substring(0, 50),
            titulo_completo: p.title, // Título completo para tooltip
            thumbnail: p.thumbnail,   // Imagen para tooltip
            precio: p.price,
            costo: p.costo,
            comision: Math.round(commission),
            envio: shippingCost,
            utilidad: Math.round(utilidad), // Utilidad CON envío
            utilidad_sin_envio: Math.round(utilidadSinEnvio), // Utilidad SIN envío
            rentabilidad: Math.round(rentabilidad * 10) / 10,
            utilidad_30d: Math.round(utilidad30d),
            ventas_30d: p.ventas_30d,
          };
        })
        .sort((a, b) => b.utilidad_30d - a.utilidad_30d);

      // Productos con margen positivo
      const topProfitable = productsWithMargin.filter(p => p.rentabilidad > 0).slice(0, 10);

      // Productos con margen negativo
      const negativeMargin = productsWithMargin
        .filter(p => p.rentabilidad < 0)
        .sort((a, b) => a.rentabilidad - b.rentabilidad)
        .slice(0, 10);

      // Calcular margen promedio ponderado por ventas
      const totalRevenue30d = productsWithMargin.reduce((sum, p) => sum + (p.precio * p.ventas_30d), 0);
      const totalUtilidad30d = productsWithMargin.reduce((sum, p) => sum + p.utilidad_30d, 0);
      const avgMargin = totalRevenue30d > 0 ? (totalUtilidad30d / totalRevenue30d * 100) : 0;

      // Productos sin costo asignado
      const sinCosto = products.filter(p => p.ventas_30d > 0 && p.costo === 0).length;

      response.profitability = {
        avg_margin: Math.round(avgMargin * 10) / 10,
        total_utilidad_30d: Math.round(totalUtilidad30d),
        productos_con_costo: productsWithMargin.length,
        productos_sin_costo: sinCosto,
        top_profitable: topProfitable,
        negative_margin: negativeMargin,
      };
    }

    response.generated_at = new Date().toISOString();

    return NextResponse.json(response);
  } catch (error) {
    console.error('Error loading inventory:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error loading inventory' },
      { status: 500 }
    );
  }
}
