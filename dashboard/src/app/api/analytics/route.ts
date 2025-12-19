import { NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

const ML_COMMISSION_RATE = 0.13; // 13% comisión ML Chile

interface ProductAnalytics {
  id: string;
  title: string;
  sku: string | null;
  stock: number;
  price: number;
  costo: number;
  comision: number;
  margen: number;
  roi: number;
  ventas_estimadas: number;
  capital_reposicion: number;
  status: 'critical' | 'warning' | 'low' | 'normal';
}

// GET /api/analytics - Get advanced analytics with profitability
export async function GET() {
  try {
    const ml = getMercadoLibreClient();
    const STOCK_THRESHOLD = parseInt(process.env.STOCK_ALERT_THRESHOLD || '5');

    // Get active products
    const productsResult = await ml.getProductIds('active', 100, 0);
    const products: ProductAnalytics[] = [];

    // Process in batches
    const batchSize = 20;
    for (let i = 0; i < Math.min(productsResult.results.length, 100); i += batchSize) {
      const batch = productsResult.results.slice(i, i + batchSize);
      const details = await ml.getProductsDetails(batch);

      for (const item of details) {
        if (item.code === 200) {
          const price = item.body.price;
          const stock = item.body.available_quantity;

          // Estimate cost as 60% of price (default, should be replaced with actual cost)
          const costo = Math.round(price * 0.6);
          const comision = Math.round(price * ML_COMMISSION_RATE);
          const margen = price - costo - comision;
          const roi = costo > 0 ? ((margen / costo) * 100) : 0;

          // Estimate sales (random for demo, should use real data)
          const ventas_estimadas = Math.floor(Math.random() * 20) + 1;

          // Capital needed for 45 days of stock
          const capital_reposicion = costo * Math.max(0, (ventas_estimadas * 1.5) - stock);

          let status: 'critical' | 'warning' | 'low' | 'normal';
          if (stock <= 1) status = 'critical';
          else if (stock <= 3) status = 'warning';
          else if (stock <= STOCK_THRESHOLD) status = 'low';
          else status = 'normal';

          products.push({
            id: item.body.id,
            title: item.body.title,
            sku: item.body.seller_custom_field,
            stock,
            price,
            costo,
            comision,
            margen,
            roi: Math.round(roi * 10) / 10,
            ventas_estimadas,
            capital_reposicion,
            status,
          });
        }
      }

      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // Calculate aggregates
    const totals = products.reduce(
      (acc, p) => ({
        stock_total: acc.stock_total + p.stock,
        valorizacion: acc.valorizacion + (p.stock * p.costo),
        capital_reposicion: acc.capital_reposicion + p.capital_reposicion,
        margen_total: acc.margen_total + (p.margen * p.ventas_estimadas),
      }),
      { stock_total: 0, valorizacion: 0, capital_reposicion: 0, margen_total: 0 }
    );

    // Stock distribution
    const stockDistribution = {
      critical: products.filter(p => p.status === 'critical').length,
      warning: products.filter(p => p.status === 'warning').length,
      low: products.filter(p => p.status === 'low').length,
      normal: products.filter(p => p.status === 'normal').length,
    };

    // Top profitable products
    const topProfitable = [...products]
      .sort((a, b) => b.roi - a.roi)
      .slice(0, 10)
      .map(p => ({
        producto: p.title,
        costo: p.costo,
        precio: p.price,
        margen: p.margen,
        roi: p.roi,
      }));

    // Products with negative margin
    const negativeMargin = products.filter(p => p.margen < 0);

    return NextResponse.json({
      summary: {
        total_productos: productsResult.paging.total,
        analizados: products.length,
        stock_total: totals.stock_total,
        valorizacion_inventario: totals.valorizacion,
        capital_reposicion_estimado: totals.capital_reposicion,
        margen_mensual_estimado: totals.margen_total,
      },
      stock_distribution: stockDistribution,
      profitability: {
        top_profitable: topProfitable,
        negative_margin_count: negativeMargin.length,
        average_roi: products.length > 0
          ? Math.round(products.reduce((sum, p) => sum + p.roi, 0) / products.length * 10) / 10
          : 0,
      },
      products: products.slice(0, 50),
      generated_at: new Date().toISOString(),
    });
  } catch (error) {
    console.error('Error fetching analytics:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching analytics' },
      { status: 500 }
    );
  }
}
