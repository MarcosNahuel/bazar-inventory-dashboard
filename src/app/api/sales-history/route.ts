import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';
export const maxDuration = 60; // Allow up to 60 seconds for this endpoint

interface MonthlySale {
  month: string;
  year: number;
  month_num: number;
  orders_count: number;
  units_sold: number;
  revenue: number;
  avg_ticket: number;
}

// GET /api/sales-history - Get complete sales time series
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const months = parseInt(searchParams.get('months') || '24'); // Default 24 months (2 years)

    const ml = getMercadoLibreClient();

    // Get monthly sales series
    const series = await ml.getMonthlySalesSeries(Math.min(months, 36)); // Max 3 years

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

    const response = {
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

    return NextResponse.json(response);
  } catch (error) {
    console.error('Error loading sales history:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error loading sales history' },
      { status: 500 }
    );
  }
}
