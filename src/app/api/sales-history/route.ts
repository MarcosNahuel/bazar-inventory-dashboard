import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { getCache, setCache } from '@/lib/cache/supabase-cache';

export const dynamic = 'force-dynamic';
export const maxDuration = 120; // Allow up to 120 seconds for this endpoint (increased for data-heavy operations)

// TTL del caché: 24 horas (datos históricos cambian poco, cache más agresivo)
const CACHE_TTL_SECONDS = 24 * 60 * 60;

interface MonthlySale {
  month: string;
  year: number;
  month_num: number;
  orders_count: number;
  units_sold: number;
  revenue: number;
  avg_ticket: number;
}

interface SalesHistoryResponse {
  series: MonthlySale[];
  statistics: {
    total_revenue: number;
    total_orders: number;
    total_units: number;
    avg_monthly_revenue: number;
    avg_monthly_orders: number;
    avg_ticket: number;
    growth_rate_6m: number;
    best_month: { month: string; revenue: number; orders: number } | null;
    worst_month: { month: string; revenue: number; orders: number } | null;
  };
  seasonality: Record<string, number>;
  yearly_comparison: Record<number, { revenue: number; orders: number; units: number }>;
  generated_at: string;
}

// GET /api/sales-history - Get complete sales time series
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const months = parseInt(searchParams.get('months') || '12'); // Default 12 months (1 year) - optimizado para velocidad
    const forceRefresh = searchParams.get('refresh') === 'true';

    // Cache key basado en cantidad de meses
    const cacheKey = `sales-history:${months}`;

    // Intentar obtener del caché (a menos que se fuerce refresh)
    if (!forceRefresh) {
      const cached = await getCache<SalesHistoryResponse>(cacheKey);
      if (cached) {
        return NextResponse.json({
          ...cached,
          from_cache: true
        });
      }
    }

    console.log(`🔄 Obteniendo datos frescos de ML API (${months} meses)...`);
    const startTime = Date.now();
    const ml = getMercadoLibreClient();

    // Get monthly sales series
    const series = await ml.getMonthlySalesSeries(Math.min(months, 24)); // Max 2 years (optimizado)
    const fetchDuration = Date.now() - startTime;
    console.log(`✅ Datos de ML obtenidos en ${(fetchDuration / 1000).toFixed(1)}s`);

    // Calculate statistics
    const totalRevenue = series.reduce((sum, m) => sum + m.revenue, 0);
    const totalOrders = series.reduce((sum, m) => sum + m.orders_count, 0);
    const totalUnits = series.reduce((sum, m) => sum + m.units_sold, 0);

    // Calculate growth metrics
    const recentMonths = series.slice(-6);
    const previousMonths = series.slice(-12, -6);

    const recentRevenue = recentMonths.reduce((sum, m) => sum + m.revenue, 0);
    const previousRevenue = previousMonths.reduce((sum, m) => sum + m.revenue, 0);
    const growthRate = previousRevenue > 0
      ? Math.round(((recentRevenue - previousRevenue) / previousRevenue) * 1000) / 10
      : 0;

    // Calculate monthly averages
    const avgMonthlyRevenue = series.length > 0
      ? Math.round(totalRevenue / series.length)
      : 0;
    const avgMonthlyOrders = series.length > 0
      ? Math.round(totalOrders / series.length)
      : 0;

    // Find best and worst months
    const sortedByRevenue = [...series].sort((a, b) => b.revenue - a.revenue);
    const bestMonth = sortedByRevenue[0] || null;
    const worstMonth = sortedByRevenue[sortedByRevenue.length - 1] || null;

    // Calculate seasonality index (compare each month to average)
    const monthlyAverages: Record<number, number[]> = {};
    for (const s of series) {
      if (!monthlyAverages[s.month_num]) {
        monthlyAverages[s.month_num] = [];
      }
      monthlyAverages[s.month_num].push(s.revenue);
    }

    const seasonalityIndex: Record<string, number> = {};
    const monthNames = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
    for (const [monthNum, revenues] of Object.entries(monthlyAverages)) {
      const monthAvg = revenues.reduce((a, b) => a + b, 0) / revenues.length;
      const index = avgMonthlyRevenue > 0
        ? Math.round((monthAvg / avgMonthlyRevenue) * 100)
        : 100;
      seasonalityIndex[monthNames[parseInt(monthNum) - 1]] = index;
    }

    // Year-over-year comparison
    const currentYear = new Date().getFullYear();
    const yearlyData: Record<number, { revenue: number; orders: number; units: number }> = {};
    for (const s of series) {
      if (!yearlyData[s.year]) {
        yearlyData[s.year] = { revenue: 0, orders: 0, units: 0 };
      }
      yearlyData[s.year].revenue += s.revenue;
      yearlyData[s.year].orders += s.orders_count;
      yearlyData[s.year].units += s.units_sold;
    }

    const response: SalesHistoryResponse = {
      series,
      statistics: {
        total_revenue: totalRevenue,
        total_orders: totalOrders,
        total_units: totalUnits,
        avg_monthly_revenue: avgMonthlyRevenue,
        avg_monthly_orders: avgMonthlyOrders,
        avg_ticket: totalOrders > 0 ? Math.round(totalRevenue / totalOrders) : 0,
        growth_rate_6m: growthRate,
        best_month: bestMonth ? {
          month: bestMonth.month,
          revenue: bestMonth.revenue,
          orders: bestMonth.orders_count
        } : null,
        worst_month: worstMonth ? {
          month: worstMonth.month,
          revenue: worstMonth.revenue,
          orders: worstMonth.orders_count
        } : null
      },
      seasonality: seasonalityIndex,
      yearly_comparison: yearlyData,
      generated_at: new Date().toISOString()
    };

    // Guardar en caché para futuras requests
    await setCache(cacheKey, response, CACHE_TTL_SECONDS);
    console.log(`✅ Datos de sales-history guardados en caché`);

    return NextResponse.json({ ...response, from_cache: false });
  } catch (error) {
    console.error('Error loading sales history:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error loading sales history' },
      { status: 500 }
    );
  }
}
