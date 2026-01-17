/**
 * API Endpoint: Obtener ventas agrupadas por producto y canal logístico
 *
 * GET /api/sync-sales?days=30
 *
 * Retorna ventas separadas por:
 * - FULL (fulfillment, cross_docking)
 * - FLEX (self_service)
 * - XD/Correo (xd_drop_off, drop_off)
 */

import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';
export const maxDuration = 120;

interface SalesByProduct {
  mlc: string;
  sku: string | null;
  title: string;
  ventas_full: number;
  ventas_flex: number;
  ventas_xd: number;
  ventas_total: number;
  ingresos_full: number;
  ingresos_flex: number;
  ingresos_xd: number;
  ingresos_total: number;
  last_sale_date: string | null;
}

interface OrderItem {
  item: {
    id: string;
    title: string;
    seller_sku: string | null;
  };
  quantity: number;
  unit_price: number;
}

interface Order {
  id: number;
  status: string;
  date_created: string;
  order_items: OrderItem[];
  shipping?: {
    id: number;
    logistic_type?: string;
  };
}

// GET /api/sync-sales - Obtener ventas por producto y canal
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const days = parseInt(searchParams.get('days') || '30');

    console.log(`[SyncSales] Fetching sales for last ${days} days...`);

    const ml = getMercadoLibreClient();
    const orders = await ml.getAllOrders(days) as Order[];

    console.log(`[SyncSales] Processing ${orders.length} orders...`);

    // Agrupar ventas por producto y canal
    const salesByProduct: Record<string, SalesByProduct> = {};

    for (const order of orders) {
      if (order.status === 'cancelled') continue;

      // Determinar tipo logístico del envío
      let logisticType = 'unknown';

      if (order.shipping?.logistic_type) {
        logisticType = order.shipping.logistic_type;
      }

      for (const item of order.order_items) {
        const mlc = item.item.id;
        const qty = item.quantity;
        const revenue = item.unit_price * qty;

        if (!salesByProduct[mlc]) {
          salesByProduct[mlc] = {
            mlc,
            sku: item.item.seller_sku || null,
            title: item.item.title,
            ventas_full: 0,
            ventas_flex: 0,
            ventas_xd: 0,
            ventas_total: 0,
            ingresos_full: 0,
            ingresos_flex: 0,
            ingresos_xd: 0,
            ingresos_total: 0,
            last_sale_date: null,
          };
        }

        // Clasificar por tipo logístico
        if (logisticType === 'fulfillment' || logisticType === 'cross_docking') {
          salesByProduct[mlc].ventas_full += qty;
          salesByProduct[mlc].ingresos_full += revenue;
        } else if (logisticType === 'self_service') {
          salesByProduct[mlc].ventas_flex += qty;
          salesByProduct[mlc].ingresos_flex += revenue;
        } else if (logisticType === 'xd_drop_off' || logisticType === 'drop_off') {
          salesByProduct[mlc].ventas_xd += qty;
          salesByProduct[mlc].ingresos_xd += revenue;
        } else {
          // Si no se puede determinar, contar como FLEX (bodega propia)
          salesByProduct[mlc].ventas_flex += qty;
          salesByProduct[mlc].ingresos_flex += revenue;
        }

        salesByProduct[mlc].ventas_total += qty;
        salesByProduct[mlc].ingresos_total += revenue;

        // Actualizar última fecha de venta
        const orderDate = order.date_created;
        if (!salesByProduct[mlc].last_sale_date || orderDate > salesByProduct[mlc].last_sale_date) {
          salesByProduct[mlc].last_sale_date = orderDate;
        }
      }
    }

    const sales = Object.values(salesByProduct);

    // Estadísticas
    const totalUnits = sales.reduce((sum, s) => sum + s.ventas_total, 0);
    const totalRevenue = sales.reduce((sum, s) => sum + s.ingresos_total, 0);
    const unitsByChannel = {
      full: sales.reduce((sum, s) => sum + s.ventas_full, 0),
      flex: sales.reduce((sum, s) => sum + s.ventas_flex, 0),
      xd: sales.reduce((sum, s) => sum + s.ventas_xd, 0),
    };

    console.log(`[SyncSales] Processed ${sales.length} products with ${totalUnits} units sold`);

    return NextResponse.json({
      success: true,
      sales,
      statistics: {
        products_with_sales: sales.length,
        total_orders: orders.length,
        total_units: totalUnits,
        total_revenue: totalRevenue,
        units_by_channel: unitsByChannel,
        channel_distribution: {
          full: totalUnits > 0 ? Math.round((unitsByChannel.full / totalUnits) * 100) : 0,
          flex: totalUnits > 0 ? Math.round((unitsByChannel.flex / totalUnits) * 100) : 0,
          xd: totalUnits > 0 ? Math.round((unitsByChannel.xd / totalUnits) * 100) : 0,
        },
      },
      period: {
        days,
        start: new Date(Date.now() - days * 24 * 60 * 60 * 1000).toISOString(),
        end: new Date().toISOString(),
      },
      generated_at: new Date().toISOString(),
    });

  } catch (error) {
    console.error('[SyncSales] Error:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Error fetching sales data'
      },
      { status: 500 }
    );
  }
}
