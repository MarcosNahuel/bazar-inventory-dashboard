import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

export const dynamic = 'force-dynamic';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY!;
const webhookUrl = process.env.N8N_WEBHOOK_URL;

interface Alert {
  id: string;
  type: string;
  severity: string;
  message: string;
  ml_id: string;
  title: string;
  stock_total: number;
  price: number;
  permalink: string;
  created_at: string;
}

// POST /api/webhook/notify - Enviar alertas pendientes al webhook de n8n
export async function POST(request: NextRequest) {
  try {
    if (!supabaseUrl || !supabaseServiceKey) {
      return NextResponse.json(
        { error: 'Supabase credentials not configured' },
        { status: 500 }
      );
    }

    const body = await request.json().catch(() => ({}));
    const targetWebhook = body.webhook_url || webhookUrl;

    if (!targetWebhook) {
      return NextResponse.json(
        { error: 'No webhook URL configured. Set N8N_WEBHOOK_URL or pass webhook_url in body' },
        { status: 400 }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    // Obtener alertas pendientes (no notificadas y no resueltas)
    const { data: alerts, error } = await supabase
      .from('v_pending_alerts')
      .select('*')
      .order('severity', { ascending: true })
      .limit(20);

    if (error) {
      throw error;
    }

    if (!alerts || alerts.length === 0) {
      return NextResponse.json({
        success: true,
        message: 'No pending alerts to notify',
        alerts_sent: 0,
      });
    }

    // Preparar payload para n8n
    const criticalAlerts = alerts.filter((a: Alert) => a.severity === 'critical');
    const warningAlerts = alerts.filter((a: Alert) => a.severity === 'warning');

    const payload = {
      timestamp: new Date().toISOString(),
      total_alerts: alerts.length,
      critical_count: criticalAlerts.length,
      warning_count: warningAlerts.length,
      alerts: alerts.map((a: Alert) => ({
        id: a.id,
        type: a.type,
        severity: a.severity,
        product: a.title,
        ml_id: a.ml_id,
        stock: a.stock_total,
        price: a.price,
        link: a.permalink,
        message: a.message,
      })),
      summary: generateSummary(alerts as Alert[]),
    };

    // Enviar al webhook de n8n
    const webhookResponse = await fetch(targetWebhook, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(payload),
    });

    if (!webhookResponse.ok) {
      throw new Error(`Webhook failed: ${webhookResponse.status} ${webhookResponse.statusText}`);
    }

    // Marcar alertas como notificadas
    const alertIds = alerts.map((a: Alert) => a.id);
    await supabase
      .from('alerts')
      .update({
        notified: true,
        notified_at: new Date().toISOString(),
        notified_via: 'webhook',
      })
      .in('id', alertIds);

    return NextResponse.json({
      success: true,
      alerts_sent: alerts.length,
      critical: criticalAlerts.length,
      warning: warningAlerts.length,
      webhook_status: webhookResponse.status,
    });
  } catch (error) {
    console.error('Webhook notify error:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Webhook notification failed' },
      { status: 500 }
    );
  }
}

function generateSummary(alerts: Alert[]): string {
  const critical = alerts.filter(a => a.severity === 'critical');
  const outOfStock = alerts.filter(a => a.type === 'out_of_stock');

  let summary = `⚠️ BAZAR - Alerta de Stock\n\n`;

  if (outOfStock.length > 0) {
    summary += `🔴 SIN STOCK (${outOfStock.length}):\n`;
    outOfStock.slice(0, 5).forEach(a => {
      summary += `• ${a.title.substring(0, 40)}...\n`;
    });
    summary += '\n';
  }

  if (critical.length > outOfStock.length) {
    const lowStock = critical.filter(a => a.type === 'low_stock');
    summary += `🟠 STOCK CRÍTICO (${lowStock.length}):\n`;
    lowStock.slice(0, 5).forEach(a => {
      summary += `• ${a.title.substring(0, 35)}... (${a.stock_total} uds)\n`;
    });
  }

  summary += `\n📊 Total alertas: ${alerts.length}`;

  return summary;
}

// GET /api/webhook/notify - Ver alertas pendientes sin enviar
export async function GET() {
  try {
    if (!supabaseUrl || !supabaseServiceKey) {
      return NextResponse.json(
        { error: 'Supabase credentials not configured' },
        { status: 500 }
      );
    }

    const supabase = createClient(supabaseUrl, supabaseServiceKey);

    const { data: alerts, error } = await supabase
      .from('v_pending_alerts')
      .select('*')
      .order('severity', { ascending: true });

    if (error) {
      throw error;
    }

    return NextResponse.json({
      pending_alerts: alerts?.length || 0,
      webhook_configured: !!webhookUrl,
      alerts: alerts || [],
    });
  } catch (error) {
    console.error('Error fetching pending alerts:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error fetching alerts' },
      { status: 500 }
    );
  }
}
