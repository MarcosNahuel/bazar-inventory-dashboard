import { NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

// GET /api/stats - Obtener estadísticas del dashboard
export async function GET() {
  try {
    const ml = getMercadoLibreClient();
    const STOCK_THRESHOLD = parseInt(process.env.STOCK_ALERT_THRESHOLD || '5');

    // Obtener productos activos (primeros 100 para stats rápidas)
    const productsResult = await ml.getProductIds('active', 100, 0);
    const totalActiveProducts = productsResult.paging.total;

    // Obtener detalles de los primeros 100
    const products: Array<{ stock: number; price: number }> = [];
    if (productsResult.results.length > 0) {
      const batchSize = 20;
      for (let i = 0; i < Math.min(productsResult.results.length, 100); i += batchSize) {
        const batch = productsResult.results.slice(i, i + batchSize);
        const details = await ml.getProductsDetails(batch);
        products.push(
          ...details
            .filter(d => d.code === 200)
            .map(d => ({
              stock: d.body.available_quantity,
              price: d.body.price,
            }))
        );
      }
    }

    // Calcular estadísticas de stock
    const totalStock = products.reduce((sum, p) => sum + p.stock, 0);
    const criticalProducts = products.filter(p => p.stock <= STOCK_THRESHOLD).length;
    const averagePrice = products.length > 0
      ? products.reduce((sum, p) => sum + p.price, 0) / products.length
      : 0;

    // Obtener órdenes de los últimos 30 días
    const ordersResult = await ml.getOrders(30, 1, 0);
    const totalOrders30 = ordersResult.paging.total;

    // Calcular ingresos de las primeras 50 órdenes
    const orders = ordersResult.results;
    const totalRevenue = orders.reduce((sum, o) => sum + o.total_amount, 0);
    const paidOrders = orders.filter(o => o.status === 'paid').length;

    return NextResponse.json({
      products: {
        total: totalActiveProducts,
        sampled: products.length,
        stock_total: totalStock,
        critical_count: criticalProducts,
        average_price: Math.round(averagePrice),
      },
      orders: {
        total_30d: totalOrders30,
        sampled: orders.length,
        revenue_sampled: totalRevenue,
        paid_rate: orders.length > 0 ? Math.round((paidOrders / orders.length) * 100) : 0,
      },
      thresholds: {
        stock_alert: STOCK_THRESHOLD,
      },
      generated_at: new Date().toISOString(),
    });
  } catch (error) {
    console.error('Error fetching stats:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching stats' },
      { status: 500 }
    );
  }
}
