import { NextRequest, NextResponse } from 'next/server';
import {
  loadInventoryFromExcel,
  paretoAnalysis,
  ticketAnalysis,
  stockHealthAnalysis,
} from '@/lib/inventory/excel-loader';
import path from 'path';

export const dynamic = 'force-dynamic';

// Use path relative to project root
const EXCEL_PATH = process.env.EXCEL_PATH || path.join(process.cwd(), 'data', 'Inventario_ML.xlsx');

// GET /api/inventory - Get complete inventory analysis
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const analysis = searchParams.get('analysis') || 'full';

    const { inventory, costs, suppliers } = loadInventoryFromExcel(EXCEL_PATH);

    // Filter active items for analysis
    const activeItems = inventory.filter(item => item.status === 'active');

    // Base response
    const response: Record<string, unknown> = {
      total_items: inventory.length,
      active_items: activeItems.length,
      total_suppliers: suppliers.length,
    };

    if (analysis === 'full' || analysis === 'summary') {
      // General summary
      const totalStock = activeItems.reduce((sum, item) => sum + item.stock_total, 0);
      const totalValorizacion = activeItems.reduce((sum, item) => sum + item.valorizacion, 0);
      const totalVentas30d = activeItems.reduce((sum, item) => sum + item.ventas_30d, 0);

      response.summary = {
        stock_total: totalStock,
        valorizacion_total: totalValorizacion,
        ventas_30d_total: totalVentas30d,
        ticket_promedio: activeItems.length > 0 ? Math.round(totalValorizacion / totalStock) : 0,
      };
    }

    if (analysis === 'full' || analysis === 'pareto') {
      const pareto = paretoAnalysis(activeItems);
      response.pareto = {
        top_20_percent_contributes: Math.round(pareto.top20Contribution * 10) / 10,
        total_sales: pareto.totalSales,
        top_products: pareto.top20Products.slice(0, 20).map(p => ({
          codigo_ml: p.codigo_ml,
          titulo: p.titulo.substring(0, 50),
          ventas_30d: p.ventas_30d,
          stock: p.stock_total,
          proveedor: p.proveedor,
        })),
      };
    }

    if (analysis === 'full' || analysis === 'tickets') {
      const tickets = ticketAnalysis(costs);
      response.tickets = {
        avg_ticket: tickets.avgTicket,
        min_ticket: tickets.minTicket,
        max_ticket: tickets.maxTicket,
        median_ticket: tickets.medianTicket,
        distribution: tickets.ticketDistribution,
      };
    }

    if (analysis === 'full' || analysis === 'stock_health') {
      const health = stockHealthAnalysis(activeItems);
      response.stock_health = {
        healthy: health.healthy,
        warning: health.warning,
        critical: health.critical,
        out_of_stock: health.outOfStock,
        overstocked: health.overstocked,
        critical_items: health.daysOfStock.filter(d => d.status === 'critical').slice(0, 20),
      };
    }

    if (analysis === 'full' || analysis === 'suppliers') {
      response.suppliers = suppliers.slice(0, 20).map(s => ({
        ...s,
        avg_value_per_product: s.productos > 0 ? Math.round(s.valorizacion / s.productos) : 0,
      }));
    }

    if (analysis === 'full' || analysis === 'profitability') {
      // Products with best/worst profitability
      const withProfit = costs.filter(c => c.rentabilidad !== 0);
      const topProfitable = [...withProfit]
        .sort((a, b) => b.rentabilidad - a.rentabilidad)
        .slice(0, 10);
      const worstProfitable = [...withProfit]
        .filter(c => c.rentabilidad < 0)
        .sort((a, b) => a.rentabilidad - b.rentabilidad)
        .slice(0, 10);

      response.profitability = {
        avg_margin: Math.round(
          withProfit.reduce((sum, c) => sum + c.rentabilidad, 0) / withProfit.length * 100
        ) / 100,
        top_profitable: topProfitable.map(p => ({
          codigo_ml: p.codigo_ml,
          titulo: p.titulo.substring(0, 50),
          precio: p.precio,
          costo: p.costo,
          utilidad: p.utilidad,
          rentabilidad: Math.round(p.rentabilidad * 100 * 10) / 10,
        })),
        negative_margin: worstProfitable.map(p => ({
          codigo_ml: p.codigo_ml,
          titulo: p.titulo.substring(0, 50),
          precio: p.precio,
          costo: p.costo,
          utilidad: p.utilidad,
          rentabilidad: Math.round(p.rentabilidad * 100 * 10) / 10,
        })),
      };
    }

    response.generated_at = new Date().toISOString();

    return NextResponse.json(response);
  } catch (error) {
    console.error('Error loading inventory:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error loading inventory' },
      { status: 500 }
    );
  }
}
