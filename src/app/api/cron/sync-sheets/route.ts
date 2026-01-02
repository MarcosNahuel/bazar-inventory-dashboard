/**
 * Cron Job: Sincronización de Google Sheets
 * Ejecutado cada 15 minutos por Vercel Cron
 *
 * Funciones:
 * 1. Refrescar cache de costos desde Google Sheets
 * 2. Detectar productos de ML sin costo y agregarlos al Sheet
 */

import { NextRequest, NextResponse } from 'next/server';
import { refreshCostsCache, syncMissingProducts, getCacheStatus } from '@/lib/google-sheets/costs-cache';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';
export const maxDuration = 60; // 1 minuto max

interface SyncResult {
  success: boolean;
  timestamp: string;
  costs: {
    count: number;
    refreshed: boolean;
  };
  newProducts: {
    added: number;
    skipped: number;
  };
  cacheStatus: {
    valid: boolean;
    age: number;
    count: number;
    expiresIn: number;
  };
  duration: number;
  error?: string;
}

// GET /api/cron/sync-sheets - Ejecutado por Vercel Cron cada 15 minutos
export async function GET(request: NextRequest): Promise<NextResponse<SyncResult>> {
  const startTime = Date.now();

  try {
    // Verificar auth (Vercel Cron o desarrollo)
    const authHeader = request.headers.get('authorization');
    const cronSecret = process.env.CRON_SECRET;

    if (process.env.NODE_ENV === 'production' && cronSecret) {
      if (authHeader !== `Bearer ${cronSecret}`) {
        return NextResponse.json({
          success: false,
          timestamp: new Date().toISOString(),
          costs: { count: 0, refreshed: false },
          newProducts: { added: 0, skipped: 0 },
          cacheStatus: getCacheStatus(),
          duration: Date.now() - startTime,
          error: 'Unauthorized',
        }, { status: 401 });
      }
    }

    console.log('[CRON-SHEETS] Starting sync...');

    // 1. Refrescar cache de costos
    console.log('[CRON-SHEETS] Refreshing costs cache...');
    const costsResult = await refreshCostsCache();
    console.log(`[CRON-SHEETS] Loaded ${costsResult.count} costs from Sheet`);

    // 2. Obtener productos de MercadoLibre y detectar los que no tienen costo
    let newProductsResult = { added: 0, skipped: 0 };

    try {
      console.log('[CRON-SHEETS] Checking for products without cost...');
      const ml = getMercadoLibreClient();

      // Obtener IDs de productos activos
      const productIdsResult = await ml.getProductIds('active');
      const productIds = productIdsResult.results;
      console.log(`[CRON-SHEETS] Found ${productIds.length} active products in ML`);

      if (productIds.length > 0) {
        // Obtener detalles de los productos (en lotes para evitar rate limit)
        const batchSize = 20;
        const allProducts: Array<{ sku: string; mlId: string; title: string }> = [];

        for (let i = 0; i < Math.min(productIds.length, 100); i += batchSize) {
          const batchIds = productIds.slice(i, i + batchSize);
          const details = await ml.getProductsDetails(batchIds);

          for (const item of details) {
            if (item.code === 200) {
              allProducts.push({
                sku: item.body.seller_custom_field || '',
                mlId: item.body.id,
                title: item.body.title,
              });
            }
          }

          // Rate limit: esperar 100ms entre batches
          if (i + batchSize < productIds.length) {
            await new Promise(resolve => setTimeout(resolve, 100));
          }
        }

        // Sincronizar productos faltantes al Sheet
        newProductsResult = await syncMissingProducts(allProducts);
        console.log(`[CRON-SHEETS] New products: ${newProductsResult.added} added, ${newProductsResult.skipped} skipped`);
      }
    } catch (mlError) {
      console.error('[CRON-SHEETS] Error checking ML products:', mlError);
      // No fallar el cron completo si falla ML
    }

    const duration = Date.now() - startTime;
    console.log(`[CRON-SHEETS] Sync completed in ${duration}ms`);

    return NextResponse.json({
      success: true,
      timestamp: new Date().toISOString(),
      costs: {
        count: costsResult.count,
        refreshed: true,
      },
      newProducts: newProductsResult,
      cacheStatus: getCacheStatus(),
      duration,
    });

  } catch (error) {
    console.error('[CRON-SHEETS] Sync failed:', error);

    return NextResponse.json({
      success: false,
      timestamp: new Date().toISOString(),
      costs: { count: 0, refreshed: false },
      newProducts: { added: 0, skipped: 0 },
      cacheStatus: getCacheStatus(),
      duration: Date.now() - startTime,
      error: error instanceof Error ? error.message : 'Unknown error',
    }, { status: 500 });
  }
}
