import { NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { getCachedCosts } from '@/lib/google-sheets/costs-cache';

export const dynamic = 'force-dynamic';
export const maxDuration = 120;

interface AlertProduct {
  id: string;
  title: string;
  sku: string | null;
  stock: number;
  ventas_30d: number;
  price: number;
  permalink: string;
  thumbnail: string;
  logistic_type: string | null;
  proveedor: string; // NUEVO: proveedor del producto
  status: 'critical' | 'warning' | 'out_of_stock';
  days_of_stock: number;
}

// Helper para obtener ventas por producto
async function getSalesById(ml: ReturnType<typeof getMercadoLibreClient>, daysBack: number) {
  const salesById: Record<string, number> = {};
  const orders = await ml.getAllOrders(daysBack);

  for (const order of orders) {
    if (order.status === 'cancelled') continue;
    for (const item of order.order_items) {
      const itemId = item.item.id;
      salesById[itemId] = (salesById[itemId] || 0) + item.quantity;
    }
  }
  return salesById;
}

// GET /api/alerts - Obtener productos con stock insuficiente
// CRITERIO: Stock < Ventas30D = Alerta (no cubre el próximo mes)
export async function GET() {
  try {
    const ml = getMercadoLibreClient();

    // Obtener TODOS los productos activos con paginación
    const allProductIds: string[] = [];
    let offset = 0;
    const pageSize = 50;

    while (true) {
      const productsResult = await ml.getProductIds('active', pageSize, offset);
      if (productsResult.results.length === 0) break;
      allProductIds.push(...productsResult.results);
      offset += pageSize;
      if (offset >= productsResult.paging.total || offset >= 500) break;
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // Obtener ventas de los últimos 30 días
    const salesById = await getSalesById(ml, 30);

    // Cargar costos desde Google Sheets para obtener proveedores
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
      console.log(`[Alerts] Loaded ${costs.length} costs from Google Sheets cache`);
    } catch (e) {
      console.error('[Alerts] Error loading costs:', e);
    }

    // Procesar productos en batches
    const alertProducts: AlertProduct[] = [];
    const batchSize = 20;

    for (let i = 0; i < allProductIds.length; i += batchSize) {
      const batch = allProductIds.slice(i, i + batchSize);
      const details = await ml.getProductsDetails(batch);

      for (const item of details) {
        if (item.code !== 200) continue;

        const stock = item.body.available_quantity;
        const ventas30d = salesById[item.body.id] || 0;
        const dailySales = ventas30d / 30;
        const daysOfStock = dailySales > 0 ? Math.round(stock / dailySales) : 999;

        // NUEVO CRITERIO: Stock < Ventas30D = necesita alerta
        // Determinar estado
        let status: 'critical' | 'warning' | 'out_of_stock' | null = null;

        if (stock === 0) {
          status = 'out_of_stock';
        } else if (stock < ventas30d * 0.5) {
          // Stock cubre menos de 15 días = CRÍTICO
          status = 'critical';
        } else if (stock < ventas30d) {
          // Stock cubre menos de 30 días = ALERTA
          status = 'warning';
        }
        // Si stock >= ventas30d = saludable, no se incluye en alertas

        if (status) {
          // Buscar proveedor por ID de ML o por SKU
          const costByMl = costsMap.get(item.body.id.toLowerCase());
          const costBySku = item.body.seller_custom_field
            ? costsMap.get(item.body.seller_custom_field.toLowerCase())
            : null;
          const proveedor = (costByMl || costBySku)?.proveedor || 'Sin asignar';

          alertProducts.push({
            id: item.body.id,
            title: item.body.title,
            sku: item.body.seller_custom_field,
            stock,
            ventas_30d: ventas30d,
            price: item.body.price,
            permalink: item.body.permalink,
            thumbnail: item.body.thumbnail,
            logistic_type: item.body.shipping?.logistic_type || null,
            proveedor, // NUEVO: incluir proveedor
            status,
            days_of_stock: daysOfStock,
          });
        }
      }

      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // Ordenar por urgencia (crítico primero, luego por días de stock)
    alertProducts.sort((a, b) => {
      const statusOrder = { 'out_of_stock': 0, 'critical': 1, 'warning': 2 };
      const orderDiff = statusOrder[a.status] - statusOrder[b.status];
      if (orderDiff !== 0) return orderDiff;
      return a.days_of_stock - b.days_of_stock;
    });

    // Categorizar
    const outOfStock = alertProducts.filter(p => p.status === 'out_of_stock');
    const critical = alertProducts.filter(p => p.status === 'critical');
    const warning = alertProducts.filter(p => p.status === 'warning');

    return NextResponse.json({
      summary: {
        total: alertProducts.length,
        urgent: outOfStock.length + critical.length,
        warning: warning.length,
        low: 0, // Deprecated, mantenido por compatibilidad
        // Nuevo desglose
        out_of_stock: outOfStock.length,
        critical: critical.length,
      },
      criteria: {
        description: 'Criterio basado en cobertura de ventas',
        rules: [
          'Sin Stock: Stock = 0',
          'Crítico: Stock < 50% de Ventas 30D (menos de 15 días)',
          'Alerta: Stock < 100% de Ventas 30D (menos de 30 días)',
          'Saludable: Stock >= Ventas 30D (no aparece en alertas)',
        ],
      },
      alerts: {
        out_of_stock: outOfStock,
        critical,
        warning,
        // Deprecated, mantenido por compatibilidad
        urgent: [...outOfStock, ...critical],
        low: [],
      },
      products: alertProducts,
      generated_at: new Date().toISOString(),
    });
  } catch (error) {
    console.error('Error fetching alerts:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching alerts' },
      { status: 500 }
    );
  }
}
