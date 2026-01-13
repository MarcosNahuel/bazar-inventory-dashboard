import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

// Funciones de detección (copiadas del sync para testing)
function isSupermarket(tags: string[], channels: string[], listingType: string, categoryId: string): boolean {
  if (tags?.includes('supermarket_eligible')) return true;
  if (tags?.includes('supermarket')) return true;
  if (channels?.includes('supermarket')) return true;
  if (listingType?.includes('supermarket')) return true;
  const supermarketCategories = ['MLC1403', 'MLC432801', 'MLC1246', 'MLC436379', 'MLC1574'];
  if (supermarketCategories.some(cat => categoryId?.startsWith(cat))) return true;
  return false;
}

function isConvivencia(logisticType: string, tags: string[]): boolean {
  return logisticType === 'fulfillment' && tags?.includes('self_service_in');
}

function generateTags(tags: string[], logisticType: string, catalogListing: boolean, status: string): string {
  const result: string[] = [];
  if (tags?.includes('supermarket_eligible')) result.push('Supermercado');
  if (tags?.includes('self_service_in')) result.push('Flex Activo');
  if (logisticType === 'fulfillment') result.push('Full');
  if (logisticType === 'fulfillment' && tags?.includes('self_service_in')) result.push('Convivencia');
  if (catalogListing) result.push('Catálogo');
  if (tags?.includes('good_quality_thumbnail')) result.push('Thumb OK');
  if (status === 'paused') result.push('Pausado');
  return result.join(', ');
}

// GET /api/debug-item?id=MLC2888575494
export async function GET(request: NextRequest) {
  const itemId = request.nextUrl.searchParams.get('id') || 'MLC2888575494';

  try {
    const ml = getMercadoLibreClient();

    // Forzar refresh del token
    await ml.refreshAccessToken();

    // Obtener item con todos los campos
    const response = await fetch(`https://api.mercadolibre.com/items/${itemId}`, {
      headers: {
        'Authorization': `Bearer ${ml.getTokens().access_token}`,
      },
    });

    const data = await response.json();

    // Analizar detecciones
    const logisticType = data.shipping?.logistic_type || 'unknown';
    const esSupermercado = isSupermarket(data.tags, data.channels, data.listing_type_id, data.category_id);
    const esConvivencia = isConvivencia(logisticType, data.tags);
    const tagsGenerados = generateTags(data.tags, logisticType, data.catalog_listing, data.status);

    // Intentar obtener stock separado si hay user_product_id
    let stockSeparado = null;
    if (data.user_product_id) {
      stockSeparado = await ml.getUserProductStock(data.user_product_id);
    }

    return NextResponse.json({
      // Datos crudos
      raw: {
        id: data.id,
        title: data.title,
        seller_custom_field: data.seller_custom_field,
        category_id: data.category_id,
        listing_type_id: data.listing_type_id,
        channels: data.channels,
        tags: data.tags,
        shipping: data.shipping,
        catalog_listing: data.catalog_listing,
        catalog_product_id: data.catalog_product_id,
        available_quantity: data.available_quantity,
        user_product_id: data.user_product_id,
        status: data.status,
      },
      // Análisis
      analysis: {
        es_supermercado: esSupermercado,
        es_convivencia: esConvivencia,
        logistic_type: logisticType,
        tags_generados: tagsGenerados,
        stock_separado: stockSeparado,
        filas_esperadas: esConvivencia ? 2 : 1,
      },
    });
  } catch (error) {
    return NextResponse.json({ error: String(error) }, { status: 500 });
  }
}
