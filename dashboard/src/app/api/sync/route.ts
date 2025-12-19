import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { createClient } from '@supabase/supabase-js';

export const dynamic = 'force-dynamic';
export const maxDuration = 300; // 5 minutes max for sync

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;

// POST /api/sync - Sincronizar datos de Mercado Libre a Supabase
export async function POST(request: NextRequest) {
  const startTime = Date.now();
  let syncLogId: string | null = null;

  try {
    const body = await request.json().catch(() => ({}));
    const syncType = body.type || 'full'; // 'products', 'orders', 'stock', 'full'

    // Verificar credenciales
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
        sync_type: syncType,
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
    let itemsCreated = 0;
    let itemsUpdated = 0;
    let itemsFailed = 0;

    // Sincronizar productos
    if (syncType === 'full' || syncType === 'products') {
      console.log('Syncing products...');

      // Obtener todos los IDs de productos
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

      console.log(`Found ${allProductIds.length} products to sync`);

      // Procesar en lotes de 20
      const batchSize = 20;
      for (let i = 0; i < allProductIds.length; i += batchSize) {
        const batch = allProductIds.slice(i, i + batchSize);
        const details = await ml.getProductsDetails(batch);

        for (const item of details) {
          itemsProcessed++;

          if (item.code === 200) {
            const product = item.body;

            // Preparar datos del producto
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

            // Upsert producto
            const { error: upsertError } = await supabase
              .from('products')
              .upsert(productData, { onConflict: 'ml_id' });

            if (upsertError) {
              console.error(`Error upserting product ${product.id}:`, upsertError);
              itemsFailed++;
            } else {
              // Verificar si fue insert o update
              const { count } = await supabase
                .from('products')
                .select('*', { count: 'exact', head: true })
                .eq('ml_id', product.id);

              if (count === 1) {
                itemsUpdated++;
              } else {
                itemsCreated++;
              }
            }
          } else {
            itemsFailed++;
          }
        }

        // Pequeña pausa entre lotes
        await new Promise((resolve) => setTimeout(resolve, 100));
      }
    }

    // Sincronizar ordenes
    if (syncType === 'full' || syncType === 'orders') {
      console.log('Syncing orders...');

      const orders = await ml.getAllOrders(30);

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

        const { error: orderError } = await supabase
          .from('orders')
          .upsert(orderData, { onConflict: 'ml_order_id' });

        if (orderError) {
          console.error(`Error upserting order ${order.id}:`, orderError);
          itemsFailed++;
        } else {
          itemsUpdated++;

          // Insertar items de la orden
          if (order.order_items) {
            for (const orderItem of order.order_items) {
              // Obtener el order_id interno
              const { data: orderRow } = await supabase
                .from('orders')
                .select('id')
                .eq('ml_order_id', order.id)
                .single();

              if (orderRow) {
                // Buscar producto relacionado
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
    }

    // Actualizar ventas 30d en productos
    if (syncType === 'full' || syncType === 'orders') {
      console.log('Calculating sales metrics...');

      // Calcular ventas por producto en los ultimos 30 dias
      const thirtyDaysAgo = new Date();
      thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);

      const { data: salesData, error: salesError } = await supabase
        .from('order_items')
        .select(
          `
          ml_item_id,
          quantity,
          orders!inner(date_created, status)
        `
        )
        .gte('orders.date_created', thirtyDaysAgo.toISOString())
        .eq('orders.status', 'paid');

      if (!salesError && salesData) {
        // Agrupar ventas por producto
        const salesByProduct = new Map<string, number>();
        for (const item of salesData as Array<{ ml_item_id: string; quantity: number }>) {
          const current = salesByProduct.get(item.ml_item_id) || 0;
          salesByProduct.set(item.ml_item_id, current + item.quantity);
        }

        // Actualizar productos con ventas
        for (const [mlId, sales] of salesByProduct) {
          await supabase.from('products').update({ sales_30d: sales }).eq('ml_id', mlId);
        }
      }
    }

    const duration = Date.now() - startTime;

    // Actualizar log de sync
    if (syncLogId) {
      await supabase
        .from('sync_logs')
        .update({
          status: 'completed',
          items_processed: itemsProcessed,
          items_created: itemsCreated,
          items_updated: itemsUpdated,
          items_failed: itemsFailed,
          duration_ms: duration,
          completed_at: new Date().toISOString(),
        })
        .eq('id', syncLogId);
    }

    // Actualizar config con timestamp de ultima sync
    await supabase
      .from('config')
      .update({ value: JSON.stringify(new Date().toISOString()) })
      .eq('key', 'last_full_sync');

    // Enviar alertas al webhook de n8n si está configurado
    const webhookUrl = process.env.N8N_WEBHOOK_URL;
    let webhookSent = false;
    if (webhookUrl) {
      try {
        const baseUrl = request.nextUrl.origin;
        const notifyResponse = await fetch(`${baseUrl}/api/webhook/notify`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ webhook_url: webhookUrl }),
        });
        webhookSent = notifyResponse.ok;
      } catch (webhookError) {
        console.error('Error sending webhook:', webhookError);
      }
    }

    return NextResponse.json({
      success: true,
      sync_type: syncType,
      items_processed: itemsProcessed,
      items_created: itemsCreated,
      items_updated: itemsUpdated,
      items_failed: itemsFailed,
      duration_ms: duration,
      completed_at: new Date().toISOString(),
      webhook_sent: webhookSent,
    });
  } catch (error) {
    console.error('Sync error:', error);

    // Actualizar log con error
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
      { error: error instanceof Error ? error.message : 'Sync failed' },
      { status: 500 }
    );
  }
}

// GET /api/sync - Obtener estado de sincronizaciones
export async function GET() {
  try {
    if (!supabaseUrl || !supabaseServiceKey) {
      return NextResponse.json(
        { error: 'Supabase credentials not configured' },
        { status: 500 }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Obtener ultimas sincronizaciones
    const { data: logs, error } = await supabase
      .from('sync_logs')
      .select('*')
      .order('started_at', { ascending: false })
      .limit(10);

    if (error) {
      throw error;
    }

    // Obtener ultima sync exitosa
    const { data: lastSync } = await supabase
      .from('config')
      .select('value')
      .eq('key', 'last_full_sync')
      .single();

    return NextResponse.json({
      last_sync: lastSync?.value ? JSON.parse(lastSync.value) : null,
      recent_logs: logs || [],
    });
  } catch (error) {
    console.error('Error fetching sync status:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching sync status' },
      { status: 500 }
    );
  }
}
