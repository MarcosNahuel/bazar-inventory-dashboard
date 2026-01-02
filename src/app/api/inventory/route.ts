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
  status: string;
  category_id: string;
  logistic_type: string;
  ventas_30d: number;
  revenue_30d: number;
  costo: number;
  proveedor: string;
}

// Helper to get all sales aggregated by product ID
async function getSalesById(ml: ReturnType<typeof getMercadoLibreClient>, daysBack: number) {
  const salesById: Record<string, { quantity: number; amount: number }> = {};

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

  return salesById;
}

// GET /api/inventory - Get complete inventory analysis from ML API
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const analysis = searchParams.get('analysis') || 'full';

    const ml = getMercadoLibreClient();
    const STOCK_THRESHOLD = parseInt(process.env.STOCK_ALERT_THRESHOLD || '5');

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
    let costsMap: Map<string, { costo: number; proveedor: string }> = new Map();
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

          products.push({
            id: item.body.id,
            title: item.body.title,
            sku: item.body.seller_custom_field,
            price: item.body.price,
            stock: item.body.available_quantity,
            status: item.body.status,
            category_id: item.body.category_id,
            logistic_type: item.body.shipping?.logistic_type || 'unknown',
            ventas_30d: 0,
            revenue_30d: 0,
            costo: costData.costo,
            proveedor: costData.proveedor,
          });
        }
      }

      // Rate limiting
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // Get sales data for last 30 days - using optimized method
    let salesById: Record<string, { quantity: number; amount: number }> = {};
    try {
      salesById = await getSalesById(ml, 30);
    } catch (e) {
      console.error('Error fetching sales:', e);
    }

    // Merge sales data with products - check by ID first (most reliable)
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

    // Build response based on analysis type
    const response: Record<string, unknown> = {
      total_items: totalProducts,
      active_items: products.length,
    };

    if (analysis === 'full' || analysis === 'summary') {
      const totalStock = products.reduce((sum, p) => sum + p.stock, 0);
      const totalRevenue = products.reduce((sum, p) => sum + (p.price * p.stock), 0);
      const totalVentas30d = products.reduce((sum, p) => sum + p.ventas_30d, 0);

      response.summary = {
        stock_total: totalStock,
        valorizacion_total: totalRevenue,
        ventas_30d_total: totalVentas30d,
        ticket_promedio: products.length > 0 ? Math.round(totalRevenue / Math.max(totalStock, 1)) : 0,
      };
    }

    if (analysis === 'full' || analysis === 'pareto') {
      // Pareto analysis (80/20 rule)
      const sortedBySales = [...products].sort((a, b) => b.ventas_30d - a.ventas_30d);
      const totalSales = sortedBySales.reduce((sum, p) => sum + p.ventas_30d, 0);
      const top20Count = Math.ceil(products.length * 0.2);
      const top20Products = sortedBySales.slice(0, top20Count);
      const top20Sales = top20Products.reduce((sum, p) => sum + p.ventas_30d, 0);

      response.pareto = {
        top_20_percent_contributes: totalSales > 0 ? Math.round((top20Sales / totalSales) * 1000) / 10 : 0,
        total_sales: totalSales,
        top_products: sortedBySales.slice(0, 20).map(p => {
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

          return {
            codigo_ml: p.id,
            titulo: p.title.substring(0, 50),
            ventas_30d: p.ventas_30d,
            stock: p.stock,
            proveedor: p.logistic_type,
            status, // NUEVO: estado del producto
          };
        }),
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

        return {
          codigo_ml: p.id,
          titulo: p.title.substring(0, 50),
          stock: p.stock,
          ventas_30d: p.ventas_30d,
          days: daysOfStock,
          status,
          price: p.price,
          logistic_type: p.logistic_type,
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
    }

    if (analysis === 'full' || analysis === 'suppliers') {
      // Group by logistic type as "supplier"
      const byLogistic: Record<string, { productos: number; stock_total: number; valorizacion: number; ventas_30d: number }> = {};

      for (const p of products) {
        const key = p.logistic_type || 'unknown';
        if (!byLogistic[key]) {
          byLogistic[key] = { productos: 0, stock_total: 0, valorizacion: 0, ventas_30d: 0 };
        }
        byLogistic[key].productos++;
        byLogistic[key].stock_total += p.stock;
        byLogistic[key].valorizacion += p.price * p.stock;
        byLogistic[key].ventas_30d += p.ventas_30d;
      }

      response.suppliers = Object.entries(byLogistic)
        .map(([proveedor, data]) => ({
          proveedor,
          ...data,
          avg_value_per_product: data.productos > 0 ? Math.round(data.valorizacion / data.productos) : 0,
        }))
        .sort((a, b) => b.ventas_30d - a.ventas_30d);
    }

    if (analysis === 'full' || analysis === 'profitability') {
      // Comisión de MercadoLibre (aproximada)
      const ML_COMMISSION = 0.13; // 13%
      const FLEX_SHIPPING_COST = parseInt(process.env.FLEX_SHIPPING_COST || '3000');

      // Calcular margen para cada producto con ventas
      const productsWithMargin = products
        .filter(p => p.ventas_30d > 0 && p.costo > 0)
        .map(p => {
          const shippingCost = p.logistic_type === 'flex' ? FLEX_SHIPPING_COST : 0;
          const commission = p.price * ML_COMMISSION;
          const costoTotal = p.costo + shippingCost + commission;
          const utilidad = p.price - costoTotal;
          const rentabilidad = p.costo > 0 ? ((utilidad / p.costo) * 100) : 0;
          const utilidad30d = utilidad * p.ventas_30d;

          return {
            codigo_ml: p.id,
            titulo: p.title.substring(0, 50),
            precio: p.price,
            costo: p.costo,
            comision: Math.round(commission),
            envio: shippingCost,
            utilidad: Math.round(utilidad),
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
