/**
 * API Endpoint: Obtener bonificaciones FLEX de Mercado Libre
 *
 * GET /api/flex-bonifications?days=30
 *
 * Las bonificaciones FLEX de ML ayudan a cubrir el costo de envío FLEX:
 * - Envío paga comprador: ~$2,890 - $3,090 (según distancia)
 * - Envío gratis (seller paga): ~$289 - $309 (según distancia)
 *
 * Este endpoint analiza las órdenes FLEX y extrae las bonificaciones
 * para calcular correctamente la utilidad real.
 */

import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';
export const maxDuration = 120;

// Costos fijos de FLEX (según el PDF de Observaciones 3)
const FLEX_BASE_COST = 2990; // Costo base aproximado del seller

interface FlexBonificationData {
  order_id: number;
  mlc: string;
  shipment_id: number;
  logistic_type: string;
  shipping_paid_by: 'buyer' | 'seller';
  bonification_amount: number;
  shipping_cost: number;
  net_shipping_cost: number; // shipping_cost - bonification
  date: string;
}

interface BonificationSummary {
  mlc: string;
  total_orders: number;
  total_bonification: number;
  avg_bonification: number;
  total_shipping_cost: number;
  net_shipping_cost: number;
}

// GET /api/flex-bonifications
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const days = parseInt(searchParams.get('days') || '30');
    const sampleSize = parseInt(searchParams.get('sample') || '100'); // Limitar para evitar timeout

    console.log(`[FlexBonifications] Analyzing FLEX bonifications for last ${days} days...`);

    const ml = getMercadoLibreClient();
    const orders = await ml.getAllOrders(days, sampleSize * 2); // Obtener más para filtrar

    // Filtrar órdenes con envío
    const ordersWithShipping = orders.filter(o =>
      o.status !== 'cancelled' && o.shipping?.id
    );

    console.log(`[FlexBonifications] Found ${ordersWithShipping.length} orders with shipping`);

    const bonifications: FlexBonificationData[] = [];
    const bonificationsByProduct: Record<string, BonificationSummary> = {};

    // Analizar envíos (limitado para evitar timeout)
    const toAnalyze = ordersWithShipping.slice(0, sampleSize);

    for (const order of toAnalyze) {
      try {
        // Obtener detalles del envío
        const shipmentDetails = await ml.getShipmentDetails(order.shipping.id);

        if (!shipmentDetails) continue;

        // Solo procesar envíos FLEX (self_service) o xd_drop_off
        if (!['self_service', 'xd_drop_off'].includes(shipmentDetails.logistic_type)) {
          continue;
        }

        // Intentar obtener costos con bonificación
        const costs = await ml.getShipmentCosts(order.shipping.id);

        // Determinar si el envío es gratis para el comprador
        const shippingPaidBy: 'buyer' | 'seller' = (costs?.receiver?.cost ?? 0) > 0 ? 'buyer' : 'seller';

        // Calcular bonificación
        // Si no hay datos de bonificación, estimar basado en el tipo
        let bonificationAmount = costs?.bonification?.cost ?? 0;

        // Si no hay bonificación explícita, usar valores conocidos según PDF
        if (bonificationAmount === 0) {
          if (shippingPaidBy === 'buyer') {
            bonificationAmount = 2990; // Promedio cuando comprador paga
          } else {
            bonificationAmount = 299; // Promedio cuando seller da envío gratis
          }
        }

        const shippingCost = shipmentDetails.cost || FLEX_BASE_COST;
        const netCost = Math.max(0, shippingCost - bonificationAmount);

        // Registrar bonificación por cada item de la orden
        for (const item of order.order_items) {
          const mlc = item.item.id;

          bonifications.push({
            order_id: order.id,
            mlc,
            shipment_id: order.shipping.id,
            logistic_type: shipmentDetails.logistic_type,
            shipping_paid_by: shippingPaidBy,
            bonification_amount: bonificationAmount,
            shipping_cost: shippingCost,
            net_shipping_cost: netCost,
            date: order.date_created,
          });

          // Acumular por producto
          if (!bonificationsByProduct[mlc]) {
            bonificationsByProduct[mlc] = {
              mlc,
              total_orders: 0,
              total_bonification: 0,
              avg_bonification: 0,
              total_shipping_cost: 0,
              net_shipping_cost: 0,
            };
          }

          bonificationsByProduct[mlc].total_orders++;
          bonificationsByProduct[mlc].total_bonification += bonificationAmount;
          bonificationsByProduct[mlc].total_shipping_cost += shippingCost;
          bonificationsByProduct[mlc].net_shipping_cost += netCost;
        }

        // Rate limiting
        await new Promise(resolve => setTimeout(resolve, 100));

      } catch (error) {
        console.error(`[FlexBonifications] Error processing order ${order.id}:`, error);
      }
    }

    // Calcular promedios
    for (const mlc of Object.keys(bonificationsByProduct)) {
      const summary = bonificationsByProduct[mlc];
      summary.avg_bonification = summary.total_orders > 0
        ? Math.round(summary.total_bonification / summary.total_orders)
        : 0;
    }

    // Estadísticas generales
    const totalBonification = bonifications.reduce((sum, b) => sum + b.bonification_amount, 0);
    const totalShippingCost = bonifications.reduce((sum, b) => sum + b.shipping_cost, 0);
    const avgBonification = bonifications.length > 0
      ? Math.round(totalBonification / bonifications.length)
      : 0;

    const byPaymentType = {
      buyer_pays: bonifications.filter(b => b.shipping_paid_by === 'buyer'),
      seller_pays: bonifications.filter(b => b.shipping_paid_by === 'seller'),
    };

    console.log(`[FlexBonifications] Processed ${bonifications.length} FLEX shipments`);

    return NextResponse.json({
      success: true,
      bonifications,
      by_product: Object.values(bonificationsByProduct),
      statistics: {
        total_flex_orders: bonifications.length,
        total_bonification: totalBonification,
        total_shipping_cost: totalShippingCost,
        net_shipping_cost: totalShippingCost - totalBonification,
        avg_bonification: avgBonification,
        by_payment_type: {
          buyer_pays: {
            count: byPaymentType.buyer_pays.length,
            avg_bonification: byPaymentType.buyer_pays.length > 0
              ? Math.round(byPaymentType.buyer_pays.reduce((s, b) => s + b.bonification_amount, 0) / byPaymentType.buyer_pays.length)
              : 0,
          },
          seller_pays: {
            count: byPaymentType.seller_pays.length,
            avg_bonification: byPaymentType.seller_pays.length > 0
              ? Math.round(byPaymentType.seller_pays.reduce((s, b) => s + b.bonification_amount, 0) / byPaymentType.seller_pays.length)
              : 0,
          },
        },
      },
      reference_values: {
        description: 'Valores de referencia de bonificaciones FLEX según ML',
        buyer_pays_shipping: {
          short_distance: 2890,
          medium_distance: 2990,
          long_distance: 3090,
        },
        seller_pays_shipping: {
          short_distance: 289,
          medium_distance: 299,
          long_distance: 309,
        },
        flex_base_cost: FLEX_BASE_COST,
      },
      period: {
        days,
        analyzed_orders: toAnalyze.length,
        flex_orders: bonifications.length,
      },
      generated_at: new Date().toISOString(),
    });

  } catch (error) {
    console.error('[FlexBonifications] Error:', error);
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Error fetching bonifications'
      },
      { status: 500 }
    );
  }
}
