import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

// GET /api/orders - Obtener órdenes recientes
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const days = parseInt(searchParams.get('days') || '30');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = parseInt(searchParams.get('offset') || '0');

    const ml = getMercadoLibreClient();
    const result = await ml.getOrders(days, limit, offset);

    // Transformar datos
    const orders = result.results.map(order => ({
      id: order.id,
      status: order.status,
      date_created: order.date_created,
      date_closed: order.date_closed,
      total_amount: order.total_amount,
      currency_id: order.currency_id,
      buyer_nickname: order.buyer.nickname,
      items: order.order_items.map(item => ({
        id: item.item.id,
        title: item.item.title,
        sku: item.item.seller_sku,
        quantity: item.quantity,
        unit_price: item.unit_price,
      })),
      shipping_status: order.shipping?.status,
    }));

    // Estadísticas rápidas
    const stats = {
      total: result.paging.total,
      paid: orders.filter(o => o.status === 'paid').length,
      cancelled: orders.filter(o => o.status === 'cancelled').length,
      total_revenue: orders
        .filter(o => o.status !== 'cancelled')
        .reduce((sum, o) => sum + o.total_amount, 0),
    };

    return NextResponse.json({
      orders,
      paging: result.paging,
      stats,
    });
  } catch (error) {
    console.error('Error fetching orders:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching orders' },
      { status: 500 }
    );
  }
}
