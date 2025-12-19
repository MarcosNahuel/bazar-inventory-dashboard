import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { createClient } from '@supabase/supabase-js';

export const dynamic = 'force-dynamic';
export const maxDuration = 300; // 5 minutes max

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

// GET /api/cron/sync - Ejecutado por Vercel Cron cada 30 minutos
export async function GET(request: NextRequest) {
  const startTime = Date.now();
  let syncLogId: string | null = null;

  try {
    // Verificar que es llamado por Vercel Cron
    const authHeader = request.headers.get('authorization');
    if (authHeader !== `Bearer ${process.env.CRON_SECRET}`) {
      // En desarrollo, permitir sin auth
      if (process.env.NODE_ENV === 'production' && process.env.CRON_SECRET) {
        return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
      }
    }

    if (!supabaseUrl || !supabaseServiceKey) {
      return NextResponse.json(
        { error: 'Supabase credentials not configured' },
        { status: 500 }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);
    const ml = getMercadoLibreClient();

    // Crear registro de sync
    const { data: syncLog, error: logError } = await supabase
      .from('sync_logs')
      .insert({
        sync_type: 'cron_full',
        status: 'started',
        started_at: new Date().toISOString(),
      })
      .select()
      .single();

    if (logError) {
      console.error('Error creating sync log:', logError);
    } else {
      syncLogId = syncLog.id;
    }

    let itemsProcessed = 0;
    let itemsUpdated = 0;
    let itemsFailed = 0;

    // === SYNC PRODUCTOS ===
    console.log('[CRON] Syncing products...');
    const allProductIds: string[] = [];
    let offset = 0;
    const limit = 100;

    while (true) {
      const result = await ml.getProductIds('active', limit, offset);
      allProductIds.push(...result.results);
      if (result.results.length < limit || allProductIds.length >= result.paging.total) {
        break;
      }
      offset += limit;
    }

    console.log(`[CRON] Found ${allProductIds.length} products`);

    // Procesar en lotes
    const batchSize = 20;
    for (let i = 0; i < allProductIds.length; i += batchSize) {
      const batch = allProductIds.slice(i, i + batchSize);
      const details = await ml.getProductsDetails(batch);

      for (const item of details) {
        itemsProcessed++;
        if (item.code === 200) {
          const product = item.body;
          const productData = {
            ml_id: product.id,
            sku: product.seller_custom_field || null,
            title: product.title,
            price: product.price,
            stock_total: product.available_quantity,
            status: product.status,
            logistic_type: product.shipping?.logistic_type || null,
            category_id: product.category_id,
            permalink: product.permalink,
            thumbnail: product.thumbnail,
            ml_created_at: product.date_created,
            ml_updated_at: product.last_updated,
            synced_at: new Date().toISOString(),
          };

          const { error } = await supabase
            .from('products')
            .upsert(productData, { onConflict: 'ml_id' });

          if (error) {
            itemsFailed++;
          } else {
            itemsUpdated++;
          }
        } else {
          itemsFailed++;
        }
      }
      await new Promise((r) => setTimeout(r, 100));
    }

    // === SYNC ORDENES (últimos 7 días) ===
    console.log('[CRON] Syncing orders...');
    const orders = await ml.getAllOrders(7);

    for (const order of orders) {
      itemsProcessed++;
      const orderData = {
        ml_order_id: order.id,
        status: order.status,
        buyer_id: order.buyer?.id,
        buyer_nickname: order.buyer?.nickname,
        total_amount: order.total_amount,
        currency_id: order.currency_id,
        shipping_id: order.shipping?.id,
        shipping_status: order.shipping?.status,
        date_created: order.date_created,
        date_closed: order.date_closed,
        synced_at: new Date().toISOString(),
      };

      const { error } = await supabase
        .from('orders')
        .upsert(orderData, { onConflict: 'ml_order_id' });

      if (error) {
        itemsFailed++;
      } else {
        itemsUpdated++;

        // Insertar items de la orden
        if (order.order_items) {
          const { data: orderRow } = await supabase
            .from('orders')
            .select('id')
            .eq('ml_order_id', order.id)
            .single();

          if (orderRow) {
            for (const orderItem of order.order_items) {
              const { data: productRow } = await supabase
                .from('products')
                .select('id')
                .eq('ml_id', orderItem.item.id)
                .single();

              await supabase.from('order_items').upsert(
                {
                  order_id: orderRow.id,
                  ml_item_id: orderItem.item.id,
                  product_id: productRow?.id || null,
                  title: orderItem.item.title,
                  sku: orderItem.item.seller_sku,
                  quantity: orderItem.quantity,
                  unit_price: orderItem.unit_price,
                },
                { onConflict: 'order_id,ml_item_id' }
              );
            }
          }
        }
      }
    }

    // === CALCULAR VENTAS 30D ===
    console.log('[CRON] Calculating sales metrics...');
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

    const { data: salesData } = await supabase
      .from('order_items')
      .select(`ml_item_id, quantity, orders!inner(date_created, status)`)
      .gte('orders.date_created', thirtyDaysAgo.toISOString())
      .eq('orders.status', 'paid');

    if (salesData) {
      const salesByProduct = new Map<string, number>();
      for (const item of salesData as Array<{ ml_item_id: string; quantity: number }>) {
        const current = salesByProduct.get(item.ml_item_id) || 0;
        salesByProduct.set(item.ml_item_id, current + item.quantity);
      }
      for (const [mlId, sales] of salesByProduct) {
        await supabase.from('products').update({ sales_30d: sales }).eq('ml_id', mlId);
      }
    }

    const duration = Date.now() - startTime;

    // Actualizar log
    if (syncLogId) {
      await supabase
        .from('sync_logs')
        .update({
          status: 'completed',
          items_processed: itemsProcessed,
          items_updated: itemsUpdated,
          items_failed: itemsFailed,
          duration_ms: duration,
          completed_at: new Date().toISOString(),
        })
        .eq('id', syncLogId);
    }

    await supabase
      .from('config')
      .update({ value: JSON.stringify(new Date().toISOString()) })
      .eq('key', 'last_full_sync');

    // === ENVIAR ALERTAS AL WEBHOOK ===
    const webhookUrl = process.env.N8N_WEBHOOK_URL;
    let webhookSent = false;

    if (webhookUrl) {
      try {
        // Obtener alertas pendientes
        const { data: alerts } = await supabase
          .from('v_pending_alerts')
          .select('*')
          .limit(20);

        if (alerts && alerts.length > 0) {
          const payload = {
            timestamp: new Date().toISOString(),
            total_alerts: alerts.length,
            source: 'vercel_cron',
            alerts: alerts.map((a) => ({
              type: a.type,
              severity: a.severity,
              product: a.title,
              stock: a.stock_total,
              link: a.permalink,
            })),
            summary: `⚠️ BAZAR Cron Alert\n${alerts.length} productos con stock bajo`,
          };

          const res = await fetch(webhookUrl, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(payload),
          });

          webhookSent = res.ok;

          if (res.ok) {
            const alertIds = alerts.map((a) => a.id);
            await supabase
              .from('alerts')
              .update({ notified: true, notified_at: new Date().toISOString(), notified_via: 'cron_webhook' })
              .in('id', alertIds);
          }
        }
      } catch (e) {
        console.error('[CRON] Webhook error:', e);
      }
    }

    console.log(`[CRON] Completed in ${duration}ms`);

    return NextResponse.json({
      success: true,
      source: 'vercel_cron',
      items_processed: itemsProcessed,
      items_updated: itemsUpdated,
      items_failed: itemsFailed,
      duration_ms: duration,
      webhook_sent: webhookSent,
    });
  } catch (error) {
    console.error('[CRON] Error:', error);

    if (syncLogId) {
      const supabase = createClient(supabaseUrl, supabaseServiceKey);
      await supabase
        .from('sync_logs')
        .update({
          status: 'failed',
          error_message: error instanceof Error ? error.message : 'Unknown error',
          completed_at: new Date().toISOString(),
        })
        .eq('id', syncLogId);
    }

    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Cron sync failed' },
      { status: 500 }
    );
  }
}
