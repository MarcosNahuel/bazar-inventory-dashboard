import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { getCachedCosts } from '@/lib/google-sheets/costs-cache';
import { getCache, setCache } from '@/lib/cache/supabase-cache';

export const dynamic = 'force-dynamic';
export const maxDuration = 120;

// Constantes para cálculo de utilidad
const ML_COMMISSION = 0.13; // 13% comisión MercadoLibre

// TTL del caché: 1 hora
const CACHE_TTL_SECONDS = 60 * 60;

// Lock para evitar múltiples llamadas concurrentes a la API de ML
let fetchInProgress: Promise<DailyData[]> | null = null;

interface DailyData {
  date: string;
  dayOfWeek: number;
  dayName: string;
  orders_count: number;
  units_sold: number;
  revenue: number;
  // Nuevos campos financieros
  costo_estimado?: number;
  utilidad_bruta?: number;
  utilidad_neta?: number;
  roi?: number;
}

interface ProjectedDay {
  date: string;
  dayOfWeek: number;
  dayName: string;
  revenue_forecast: number;
  revenue_lower: number;
  revenue_upper: number;
  orders_forecast: number;
  units_forecast: number;
  is_projection: boolean;
  // Nuevos campos financieros
  utilidad_forecast?: number;
  roi_forecast?: number;
}

// Cache key para datos diarios
function getDailyCacheKey(daysBack: number): string {
  return `projections-daily:${daysBack}`;
}

// Get all orders and aggregate by day (with Supabase cache and lock)
async function getDailySeries(ml: ReturnType<typeof getMercadoLibreClient>, daysBack: number, forceRefresh: boolean = false): Promise<{ data: DailyData[]; fromCache: boolean }> {
  const cacheKey = getDailyCacheKey(daysBack);

  // Intentar obtener del caché (a menos que se fuerce refresh)
  if (!forceRefresh) {
    const cached = await getCache<DailyData[]>(cacheKey);
    if (cached) {
      console.log('📦 Usando datos en caché de Supabase para proyecciones');
      return { data: cached, fromCache: true };
    }
  }

  // Si ya hay un fetch en progreso, esperar a que termine
  if (fetchInProgress) {
    console.log('⏳ Esperando fetch en progreso...');
    const data = await fetchInProgress;
    return { data, fromCache: false };
  }

  // Iniciar fetch con lock
  console.log('🔄 Obteniendo datos frescos de ML API...');
  fetchInProgress = (async () => {
    const orders = await ml.getAllOrders(daysBack);
    const processed = processOrders(orders, daysBack);

    // Guardar en Supabase
    await setCache(cacheKey, processed, CACHE_TTL_SECONDS);
    console.log(`✅ Datos de proyecciones guardados en caché Supabase (${processed.length} días)`);

    return processed;
  })();

  try {
    const result = await fetchInProgress;
    return { data: result, fromCache: false };
  } finally {
    fetchInProgress = null;
  }
}

// Procesar órdenes en datos diarios
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function processOrders(orders: any[], daysBack: number): DailyData[] {
  const dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];
  const dailyData: Record<string, DailyData> = {};

  // Initialize all days in range
  const now = new Date();
  for (let i = daysBack - 1; i >= 0; i--) {
    const date = new Date(now);
    date.setDate(date.getDate() - i);
    const dateStr = date.toISOString().split('T')[0];
    const dayOfWeek = date.getDay();
    dailyData[dateStr] = {
      date: dateStr,
      dayOfWeek,
      dayName: dayNames[dayOfWeek],
      orders_count: 0,
      units_sold: 0,
      revenue: 0
    };
  }

  // Aggregate orders by day
  for (const order of orders) {
    if (order.status === 'cancelled') continue;

    const orderDate = new Date(order.date_created);
    const dateStr = orderDate.toISOString().split('T')[0];

    if (dailyData[dateStr]) {
      dailyData[dateStr].orders_count++;
      for (const item of order.order_items) {
        dailyData[dateStr].units_sold += item.quantity;
        dailyData[dateStr].revenue += item.quantity * item.unit_price;
      }
    }
  }

  // Convert to array sorted by date
  return Object.values(dailyData).sort((a, b) => a.date.localeCompare(b.date));
}

// Linear regression
function linearRegression(data: number[]): { slope: number; intercept: number; r2: number } {
  const n = data.length;
  if (n < 2) return { slope: 0, intercept: data[0] || 0, r2: 0 };

  let sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0, sumY2 = 0;
  for (let i = 0; i < n; i++) {
    sumX += i;
    sumY += data[i];
    sumXY += i * data[i];
    sumX2 += i * i;
    sumY2 += data[i] * data[i];
  }

  const denominator = n * sumX2 - sumX * sumX;
  if (denominator === 0) return { slope: 0, intercept: data[0] || 0, r2: 0 };

  const slope = (n * sumXY - sumX * sumY) / denominator;
  const intercept = (sumY - slope * sumX) / n;

  // Calculate R-squared
  const yMean = sumY / n;
  let ssTot = 0, ssRes = 0;
  for (let i = 0; i < n; i++) {
    const predicted = intercept + slope * i;
    ssTot += Math.pow(data[i] - yMean, 2);
    ssRes += Math.pow(data[i] - predicted, 2);
  }
  const r2 = ssTot > 0 ? 1 - (ssRes / ssTot) : 0;

  return { slope, intercept, r2 };
}

// Calculate weekly seasonality (which days perform better)
function calculateWeeklySeasonality(data: DailyData[]): Record<number, number> {
  const dayTotals: Record<number, { sum: number; count: number }> = {};

  for (let i = 0; i < 7; i++) {
    dayTotals[i] = { sum: 0, count: 0 };
  }

  for (const d of data) {
    if (d.revenue > 0) {
      dayTotals[d.dayOfWeek].sum += d.revenue;
      dayTotals[d.dayOfWeek].count++;
    }
  }

  // Calculate average for all days with data
  const overallAvg = data.reduce((sum, d) => sum + d.revenue, 0) / Math.max(data.filter(d => d.revenue > 0).length, 1);

  const seasonality: Record<number, number> = {};
  for (let i = 0; i < 7; i++) {
    if (dayTotals[i].count > 0) {
      const dayAvg = dayTotals[i].sum / dayTotals[i].count;
      seasonality[i] = overallAvg > 0 ? dayAvg / overallAvg : 1;
    } else {
      seasonality[i] = 1;
    }
  }

  return seasonality;
}

// Calculate standard deviation
function stdDev(data: number[]): number {
  if (data.length < 2) return 0;
  const avg = data.reduce((a, b) => a + b, 0) / data.length;
  const squareDiffs = data.map(value => Math.pow(value - avg, 2));
  return Math.sqrt(squareDiffs.reduce((a, b) => a + b, 0) / (data.length - 1));
}

// Calculate MAPE (Mean Absolute Percentage Error)
// Mide el error promedio en porcentaje - más intuitivo que R²
function calculateMAPE(actual: number[], predicted: number[]): number {
  if (actual.length !== predicted.length || actual.length === 0) return 0;

  let sumAPE = 0;
  let validCount = 0;

  for (let i = 0; i < actual.length; i++) {
    if (actual[i] > 0) { // Evitar división por cero
      sumAPE += Math.abs((actual[i] - predicted[i]) / actual[i]);
      validCount++;
    }
  }

  return validCount > 0 ? (sumAPE / validCount) * 100 : 0;
}

// Calculate coefficient of variation (CV) - mide volatilidad
function calculateCV(data: number[]): number {
  const avg = data.reduce((a, b) => a + b, 0) / data.length;
  if (avg === 0) return 0;
  const sd = stdDev(data);
  return (sd / avg) * 100;
}

// Calculate average cost ratio from Google Sheets costs
async function getAverageCostRatio(): Promise<{ avgCostRatio: number; avgMargin: number }> {
  try {
    const costs = await getCachedCosts();
    if (costs.length === 0) {
      return { avgCostRatio: 0.5, avgMargin: 0.2 }; // Default 50% costo, 20% margen
    }

    // Calcular ratio promedio costo/precio estimado (asumiendo markup de 50%)
    let totalCosto = 0;
    let totalPrecioEstimado = 0;
    let count = 0;

    for (const cost of costs) {
      if (cost.costo > 0) {
        totalCosto += cost.costo;
        // Precio estimado = costo + 50% markup
        const precioEstimado = cost.costo * 1.5;
        totalPrecioEstimado += precioEstimado;
        count++;
      }
    }

    if (count === 0) return { avgCostRatio: 0.5, avgMargin: 0.2 };

    const avgCostRatio = totalCosto / totalPrecioEstimado;
    // Margen neto aproximado después de comisiones
    const avgMargin = (1 - avgCostRatio - ML_COMMISSION) * 0.9; // 90% para otros gastos

    return { avgCostRatio, avgMargin: Math.max(avgMargin, 0.05) };
  } catch {
    console.error('[Projections] Error loading costs for margin calculation');
    return { avgCostRatio: 0.5, avgMargin: 0.15 };
  }
}

// Generate projections using regression + seasonality
function generateProjections(
  historical: DailyData[],
  daysAhead: number,
  regression: { slope: number; intercept: number; r2: number },
  seasonality: Record<number, number>,
  avgMargin: number = 0.15
): ProjectedDay[] {
  const projections: ProjectedDay[] = [];
  const dayNames = ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'];

  const lastDate = new Date(historical[historical.length - 1].date);
  const n = historical.length;

  // Calculate average daily sales from days with actual data
  const daysWithSales = historical.filter(d => d.revenue > 0);
  const avgDailySales = daysWithSales.length > 0
    ? daysWithSales.reduce((sum, d) => sum + d.revenue, 0) / daysWithSales.length
    : 0;

  // Calculate prediction error for confidence intervals
  const residuals = daysWithSales.map((d, i) => {
    const predicted = regression.intercept + regression.slope * i;
    return d.revenue - predicted;
  });
  const predictionError = stdDev(residuals);

  for (let i = 1; i <= daysAhead; i++) {
    const projDate = new Date(lastDate);
    projDate.setDate(projDate.getDate() + i);
    const dateStr = projDate.toISOString().split('T')[0];
    const dayOfWeek = projDate.getDay();

    // Use a blend of regression trend and average, weighted by R² (model confidence)
    // When R² is low, rely more on the average; when high, trust the trend
    const r2Weight = Math.min(regression.r2, 0.8); // Cap R² weight at 80%

    // Trend component (extrapolated from regression)
    const trendValue = regression.intercept + regression.slope * (daysWithSales.length + i);

    // Base forecast: blend of trend and average
    const baseValue = r2Weight * trendValue + (1 - r2Weight) * avgDailySales;

    // Apply weekly seasonality factor
    const seasonFactor = seasonality[dayOfWeek] || 1;
    const rawForecast = baseValue * seasonFactor;

    // Cap at reasonable bounds (2x to 4x average depending on seasonality)
    const maxForecast = avgDailySales * Math.max(seasonFactor, 1) * 2;
    const forecast = Math.max(0, Math.min(rawForecast, maxForecast));

    // Confidence intervals (widen over time)
    const confidenceFactor = 1.96 * predictionError * Math.sqrt(1 + i / n);

    // Orders and units based on ratio to revenue
    const revenuePerOrder = historical.filter(d => d.orders_count > 0)
      .reduce((sum, d) => sum + (d.revenue / d.orders_count), 0) /
      Math.max(historical.filter(d => d.orders_count > 0).length, 1);
    const unitsPerOrder = historical.filter(d => d.orders_count > 0)
      .reduce((sum, d) => sum + (d.units_sold / d.orders_count), 0) /
      Math.max(historical.filter(d => d.orders_count > 0).length, 1);

    const ordersForecast = revenuePerOrder > 0 ? forecast / revenuePerOrder : 0;

    // Calcular utilidad proyectada
    const utilidadForecast = Math.round(forecast * avgMargin);
    const roiForecast = avgMargin > 0 ? Math.round((avgMargin / (1 - avgMargin - ML_COMMISSION)) * 1000) / 10 : 0;

    projections.push({
      date: dateStr,
      dayOfWeek,
      dayName: dayNames[dayOfWeek],
      revenue_forecast: Math.round(forecast),
      revenue_lower: Math.round(Math.max(0, forecast - confidenceFactor)),
      revenue_upper: Math.round(forecast + confidenceFactor),
      orders_forecast: Math.round(ordersForecast),
      units_forecast: Math.round(ordersForecast * unitsPerOrder),
      is_projection: true,
      utilidad_forecast: utilidadForecast,
      roi_forecast: roiForecast,
    });
  }

  return projections;
}

// Generate insights with model documentation
function generateInsights(
  historical: DailyData[],
  regression: { slope: number; intercept: number; r2: number },
  seasonality: Record<number, number>,
  projections: ProjectedDay[],
  mape: number = 0,
  cv: number = 0
): string[] {
  const insights: string[] = [];
  const dayNames = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];

  const daysWithData = historical.filter(d => d.revenue > 0);
  const totalRevenue = historical.reduce((sum, d) => sum + d.revenue, 0);
  const totalOrders = historical.reduce((sum, d) => sum + d.orders_count, 0);
  const avgDaily = totalRevenue / Math.max(daysWithData.length, 1);

  // Data summary
  insights.push(`📊 Serie histórica: ${historical.length} días (${daysWithData.length} con ventas)`);
  insights.push(`💰 Ventas totales: $${(totalRevenue / 1000000).toFixed(2)}M CLP en ${totalOrders.toLocaleString()} órdenes`);

  // Model accuracy - MAPE (más intuitivo que R²)
  if (mape > 0) {
    let mapeInterpretation = '';
    if (mape < 10) {
      mapeInterpretation = 'Excelente precisión';
    } else if (mape < 20) {
      mapeInterpretation = 'Buena precisión';
    } else if (mape < 30) {
      mapeInterpretation = 'Precisión aceptable';
    } else {
      mapeInterpretation = 'Alta variabilidad en ventas';
    }
    insights.push(`📐 MAPE: ${mape.toFixed(1)}% (${mapeInterpretation})`);
  }

  // Explain R² in context
  if (cv > 50) {
    insights.push(`⚡ Volatilidad: ${cv.toFixed(0)}% - Las ventas diarias varían mucho, lo que es normal en e-commerce (R² bajo es esperado)`);
  } else if (cv > 30) {
    insights.push(`📈 Volatilidad: ${cv.toFixed(0)}% - Variabilidad moderada en ventas diarias`);
  }

  // Trend analysis
  const dailyGrowth = regression.slope;
  const monthlyGrowthRate = avgDaily > 0 ? (dailyGrowth * 30 / avgDaily) * 100 : 0;

  if (monthlyGrowthRate > 5) {
    insights.push(`📈 Tendencia: Crecimiento de ${monthlyGrowthRate.toFixed(1)}% mensual`);
  } else if (monthlyGrowthRate < -5) {
    insights.push(`📉 Tendencia: Decrecimiento de ${Math.abs(monthlyGrowthRate).toFixed(1)}% mensual`);
  } else {
    insights.push(`➡️ Tendencia: Estable (${monthlyGrowthRate >= 0 ? '+' : ''}${monthlyGrowthRate.toFixed(1)}% mensual)`);
  }

  // Best and worst days
  const sortedSeasonality = Object.entries(seasonality)
    .map(([day, factor]) => ({ day: parseInt(day), factor }))
    .sort((a, b) => b.factor - a.factor);

  const bestDays = sortedSeasonality.filter(d => d.factor > 1.1).map(d => dayNames[d.day]);
  const worstDays = sortedSeasonality.filter(d => d.factor < 0.9).map(d => dayNames[d.day]);

  if (bestDays.length > 0) {
    insights.push(`🔥 Mejores días: ${bestDays.join(', ')} (ventas sobre el promedio)`);
  }
  if (worstDays.length > 0) {
    insights.push(`❄️ Días más bajos: ${worstDays.join(', ')} (considerar promociones)`);
  }

  // Projection summary
  if (projections.length >= 30) {
    const next30Revenue = projections.slice(0, 30).reduce((sum, p) => sum + p.revenue_forecast, 0);
    const next30Orders = projections.slice(0, 30).reduce((sum, p) => sum + p.orders_forecast, 0);
    insights.push(`🔮 Proyección 30 días: $${(next30Revenue / 1000000).toFixed(2)}M CLP (~${next30Orders.toLocaleString()} órdenes)`);
  }

  // Average ticket
  const avgTicket = totalOrders > 0 ? totalRevenue / totalOrders : 0;
  insights.push(`🎫 Ticket promedio: $${Math.round(avgTicket).toLocaleString()} CLP`);

  return insights;
}

// GET /api/projections - Generate ML-based sales projections
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const historicalDays = parseInt(searchParams.get('historical') || '60');
    const forecastDays = parseInt(searchParams.get('forecast') || '30');
    const forceRefresh = searchParams.get('refresh') === 'true';

    const ml = getMercadoLibreClient();

    // Get daily series for the historical period (up to 365 days for full year view)
    const { data: dailySeries, fromCache: usingCache } = await getDailySeries(ml, Math.min(historicalDays, 365), forceRefresh);

    // Filter to only days with data for regression (but keep all for display)
    const daysWithData = dailySeries.filter(d => d.revenue > 0);

    if (daysWithData.length < 2) {
      return NextResponse.json({
        historical: dailySeries,
        projections: [],
        combined_series: dailySeries.map(d => ({
          date: d.date,
          dayName: d.dayName,
          revenue: d.revenue,
          revenue_forecast: null,
          revenue_lower: null,
          revenue_upper: null,
          is_projection: false
        })),
        insights: ['⚠️ Datos insuficientes para regresión. Se requieren al menos 2 días con ventas.'],
        summary: {
          historical_days: dailySeries.length,
          days_with_sales: daysWithData.length,
          forecast_days: 0,
          total_historical_revenue: dailySeries.reduce((sum, d) => sum + d.revenue, 0),
          total_projected_revenue: 0,
          regression: { slope: 0, intercept: 0, r2: 0 },
          model: 'Linear Regression + Weekly Seasonality',
          generated_at: new Date().toISOString()
        }
      });
    }

    // Calculate regression on revenue
    const revenueData = daysWithData.map(d => d.revenue);
    const regression = linearRegression(revenueData);

    // Calculate weekly seasonality
    const seasonality = calculateWeeklySeasonality(daysWithData);

    // Calculate MAPE for model validation (usando los últimos 14 días)
    const last14 = daysWithData.slice(-14);
    const predictedLast14 = last14.map((d, i) => {
      const dayIndex = daysWithData.length - 14 + i;
      const baseValue = regression.intercept + regression.slope * dayIndex;
      return baseValue * (seasonality[d.dayOfWeek] || 1);
    });
    const mape = calculateMAPE(last14.map(d => d.revenue), predictedLast14);

    // Coeficiente de variación (volatilidad)
    const cv = calculateCV(revenueData);

    // Obtener margen promedio desde costos
    const { avgCostRatio, avgMargin } = await getAverageCostRatio();

    // Generate projections with profit calculation
    const projections = generateProjections(
      dailySeries,
      Math.min(forecastDays, 60),
      regression,
      seasonality,
      avgMargin
    );

    // Generate insights with better documentation
    const insights = generateInsights(dailySeries, regression, seasonality, projections, mape, cv);

    // Find the first day with sales to trim empty historical period
    const firstSaleIndex = dailySeries.findIndex(d => d.revenue > 0);
    const trimmedHistorical = firstSaleIndex >= 0 ? dailySeries.slice(firstSaleIndex) : dailySeries;

    // Combine historical and projections for chart (only from first sale date)
    const combinedSeries = [
      ...trimmedHistorical.map(d => ({
        date: d.date,
        dayName: d.dayName,
        revenue: d.revenue,
        orders_count: d.orders_count,
        units_sold: d.units_sold,
        utilidad: Math.round(d.revenue * avgMargin), // Estimación basada en margen promedio
        revenue_forecast: null as number | null,
        revenue_lower: null as number | null,
        revenue_upper: null as number | null,
        utilidad_forecast: null as number | null,
        is_projection: false
      })),
      ...projections.map(p => ({
        date: p.date,
        dayName: p.dayName,
        revenue: null as number | null,
        orders_count: null as number | null,
        units_sold: null as number | null,
        utilidad: null as number | null,
        revenue_forecast: p.revenue_forecast,
        revenue_lower: p.revenue_lower,
        revenue_upper: p.revenue_upper,
        utilidad_forecast: p.utilidad_forecast,
        is_projection: true
      }))
    ];

    // Calculate summary statistics
    const historicalRevenue = dailySeries.reduce((sum, d) => sum + d.revenue, 0);
    const projectedRevenue = projections.reduce((sum, p) => sum + p.revenue_forecast, 0);
    const historicalUtilidad = Math.round(historicalRevenue * avgMargin);
    const projectedUtilidad = projections.reduce((sum, p) => sum + (p.utilidad_forecast || 0), 0);

    const response = {
      historical: dailySeries,
      projections,
      combined_series: combinedSeries,
      insights,
      seasonality,
      regression: {
        slope: regression.slope,
        intercept: regression.intercept,
        r2: regression.r2,
        daily_trend: regression.slope,
        monthly_growth_pct: (regression.slope * 30 / (historicalRevenue / dailySeries.length)) * 100
      },
      // NUEVAS MÉTRICAS DE CALIDAD
      model_quality: {
        mape: Math.round(mape * 10) / 10,
        mape_interpretation: mape < 10 ? 'Excelente' : mape < 20 ? 'Buena' : mape < 30 ? 'Aceptable' : 'Alta variabilidad',
        cv: Math.round(cv * 10) / 10,
        r2: Math.round(regression.r2 * 1000) / 10,
        r2_note: 'R² bajo es normal en e-commerce debido a la alta variabilidad diaria. Use MAPE como métrica principal.',
      },
      methodology: {
        model: 'Regresión Lineal + Estacionalidad Semanal',
        description: 'Modelo híbrido que combina tendencia lineal con factores de estacionalidad por día de la semana.',
        components: [
          'Tendencia: Regresión lineal sobre datos históricos',
          'Estacionalidad: Factores multiplicativos por día de la semana',
          'Intervalos de confianza: ±1.96 desviaciones estándar (95%)',
        ],
        metrics_explained: {
          MAPE: 'Error Porcentual Absoluto Medio - mide qué tan lejos están las predicciones en promedio',
          CV: 'Coeficiente de Variación - mide cuánto varían las ventas día a día',
          R2: 'Coeficiente de Determinación - qué porcentaje de la variación explica el modelo (bajo es normal en ventas diarias)',
        },
      },
      summary: {
        historical_days: dailySeries.length,
        days_with_sales: daysWithData.length,
        forecast_days: projections.length,
        total_historical_revenue: historicalRevenue,
        total_projected_revenue: projectedRevenue,
        avg_daily_revenue: Math.round(historicalRevenue / Math.max(daysWithData.length, 1)),
        model: 'Linear Regression + Weekly Seasonality',
        generated_at: new Date().toISOString(),
        from_cache: usingCache,
        cache_ttl_seconds: CACHE_TTL_SECONDS
      },
      // NUEVAS MÉTRICAS FINANCIERAS
      financial: {
        avg_cost_ratio: Math.round(avgCostRatio * 1000) / 10, // porcentaje
        avg_margin: Math.round(avgMargin * 1000) / 10, // porcentaje
        historical_utilidad: historicalUtilidad,
        projected_utilidad_30d: projectedUtilidad,
        roi_estimado: avgMargin > 0 ? Math.round((avgMargin / (1 - avgMargin - ML_COMMISSION)) * 1000) / 10 : 0,
        nota: 'Utilidad estimada basada en margen promedio de productos con costo asignado en Google Sheets',
      }
    };

    return NextResponse.json(response);
  } catch (error) {
    console.error('Error generating projections:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error generating projections' },
      { status: 500 }
    );
  }
}
