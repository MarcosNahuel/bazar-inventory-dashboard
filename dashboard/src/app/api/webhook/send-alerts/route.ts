import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

// N8N webhook URL (configurable via env)
const N8N_WEBHOOK_URL = process.env.N8N_WEBHOOK_URL || 'https://agente-meli-n8n.7skqlp.easypanel.host/webhook/low-stock-alerts';

interface AlertProduct {
  id: string;
  title: string;
  sku: string | null;
  stock: number;
  price: number;
  permalink: string;
  urgency: 'URGENTE' | 'ALERTA' | 'BAJO';
}

// POST /api/webhook/send-alerts - Trigger alert email via n8n
export async function POST(request: NextRequest) {
  try {
    const body = await request.json().catch(() => ({}));
    const threshold = body.threshold || parseInt(process.env.STOCK_ALERT_THRESHOLD || '5');
    const forceEmail = body.force_email === true;

    // Get products with low stock
    const ml = getMercadoLibreClient();
    const productsResult = await ml.getProductIds('active', 100, 0);

    const lowStockProducts: AlertProduct[] = [];

    // Process in batches
    const batchSize = 20;
    for (let i = 0; i < productsResult.results.length; i += batchSize) {
      const batch = productsResult.results.slice(i, i + batchSize);
      const details = await ml.getProductsDetails(batch);

      for (const item of details) {
        if (item.code === 200 && item.body.available_quantity <= threshold) {
          let urgency: 'URGENTE' | 'ALERTA' | 'BAJO';
          if (item.body.available_quantity <= 1) {
            urgency = 'URGENTE';
          } else if (item.body.available_quantity <= 3) {
            urgency = 'ALERTA';
          } else {
            urgency = 'BAJO';
          }

          lowStockProducts.push({
            id: item.body.id,
            title: item.body.title,
            sku: item.body.seller_custom_field,
            stock: item.body.available_quantity,
            price: item.body.price,
            permalink: item.body.permalink,
            urgency,
          });
        }
      }

      // Rate limiting
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    // Sort by urgency
    lowStockProducts.sort((a, b) => {
      const order = { 'URGENTE': 0, 'ALERTA': 1, 'BAJO': 2 };
      return order[a.urgency] - order[b.urgency];
    });

    const summary = {
      total: lowStockProducts.length,
      urgent: lowStockProducts.filter(p => p.urgency === 'URGENTE').length,
      warning: lowStockProducts.filter(p => p.urgency === 'ALERTA').length,
      low: lowStockProducts.filter(p => p.urgency === 'BAJO').length,
    };

    // Only send to n8n if there are alerts or force_email is true
    let webhookResult = null;
    if (lowStockProducts.length > 0 || forceEmail) {
      try {
        const webhookPayload = {
          timestamp: new Date().toISOString(),
          threshold,
          summary,
          products: lowStockProducts,
          email_to: 'bazaroimportaciones@gmail.com',
          subject: `🚨 Alerta Stock Bajo - ${summary.urgent} URGENTES, ${summary.total} total`,
        };

        const webhookResponse = await fetch(N8N_WEBHOOK_URL, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(webhookPayload),
        });

        webhookResult = {
          sent: true,
          status: webhookResponse.status,
          ok: webhookResponse.ok,
        };
      } catch (err) {
        webhookResult = {
          sent: false,
          error: err instanceof Error ? err.message : 'Webhook error',
        };
      }
    }

    return NextResponse.json({
      success: true,
      summary,
      products: lowStockProducts,
      webhook: webhookResult,
      generated_at: new Date().toISOString(),
    });
  } catch (error) {
    console.error('Error sending alerts:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error sending alerts' },
      { status: 500 }
    );
  }
}

// GET /api/webhook/send-alerts - Check webhook configuration
export async function GET() {
  return NextResponse.json({
    configured: true,
    webhook_url: N8N_WEBHOOK_URL.replace(/\/webhook\/.*/, '/webhook/***'),
    threshold: parseInt(process.env.STOCK_ALERT_THRESHOLD || '5'),
    email_to: 'bazaroimportaciones@gmail.com',
  });
}
