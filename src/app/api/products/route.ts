import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

// GET /api/products - Obtener productos de ML
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const status = searchParams.get('status') as 'active' | 'paused' | 'closed' | null;
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = parseInt(searchParams.get('offset') || '0');

    const ml = getMercadoLibreClient();

    // Obtener IDs de productos
    const result = await ml.getProductIds(status || undefined, limit, offset);

    // Obtener detalles de los productos
    if (result.results.length > 0) {
      const details = await ml.getProductsDetails(result.results);
      const products = details
        .filter(d => d.code === 200)
        .map(d => ({
          id: d.body.id,
          title: d.body.title,
          sku: d.body.seller_custom_field,
          price: d.body.price,
          currency_id: d.body.currency_id,
          stock: d.body.available_quantity,
          status: d.body.status,
          permalink: d.body.permalink,
          thumbnail: d.body.thumbnail,
          logistic_type: d.body.shipping?.logistic_type,
          last_updated: d.body.last_updated,
        }));

      return NextResponse.json({
        products,
        paging: result.paging,
      });
    }

    return NextResponse.json({ products: [], paging: result.paging });
  } catch (error) {
    console.error('Error fetching products:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching products' },
      { status: 500 }
    );
  }
}
