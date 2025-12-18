import { NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

interface LowStockProduct {
  id: string;
  title: string;
  sku: string | null;
  stock: number;
  price: number;
  permalink: string;
  thumbnail: string;
  logistic_type: string | null;
  deficit: number;
}

// GET /api/alerts - Obtener productos con stock bajo
export async function GET() {
  try {
    const ml = getMercadoLibreClient();
    const STOCK_THRESHOLD = parseInt(process.env.STOCK_ALERT_THRESHOLD || '5');

    // Obtener todos los productos activos
    const productsResult = await ml.getProductIds('active', 100, 0);
    const lowStockProducts: LowStockProduct[] = [];

    // Procesar en batches
    const batchSize = 20;
    for (let i = 0; i < productsResult.results.length; i += batchSize) {
      const batch = productsResult.results.slice(i, i + batchSize);
      const details = await ml.getProductsDetails(batch);

      for (const item of details) {
        if (item.code === 200 && item.body.available_quantity <= STOCK_THRESHOLD) {
          lowStockProducts.push({
            id: item.body.id,
            title: item.body.title,
            sku: item.body.seller_custom_field,
            stock: item.body.available_quantity,
            price: item.body.price,
            permalink: item.body.permalink,
            thumbnail: item.body.thumbnail,
            logistic_type: item.body.shipping?.logistic_type || null,
            deficit: STOCK_THRESHOLD - item.body.available_quantity,
          });
        }
      }

      // Rate limiting
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // Ordenar por stock (más crítico primero)
    lowStockProducts.sort((a, b) => a.stock - b.stock);

    // Categorizar por urgencia
    const urgent = lowStockProducts.filter(p => p.stock <= 1);
    const warning = lowStockProducts.filter(p => p.stock > 1 && p.stock <= 3);
    const low = lowStockProducts.filter(p => p.stock > 3 && p.stock <= STOCK_THRESHOLD);

    return NextResponse.json({
      summary: {
        total: lowStockProducts.length,
        urgent: urgent.length,
        warning: warning.length,
        low: low.length,
        threshold: STOCK_THRESHOLD,
      },
      alerts: {
        urgent,
        warning,
        low,
      },
      products: lowStockProducts,
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
