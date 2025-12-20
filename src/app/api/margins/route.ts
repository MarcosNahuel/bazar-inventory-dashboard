/**
 * API Endpoint para Cálculo de Márgenes
 * GET: Obtiene márgenes de ventas recientes
 * POST: Calcula márgenes para datos específicos
 */

import { NextRequest, NextResponse } from 'next/server';
import {
  calcularMargenes,
  calcularResumenPorProveedor,
  SaleData,
  MarginCalculation,
  ProviderSummary,
} from '@/lib/margins/calculator';
import { getCostsFromSheet } from '@/lib/google-sheets/client';

// Cache simple en memoria
let marginsCache: {
  data: MarginCalculation[];
  summary: ProviderSummary[];
  timestamp: number;
} | null = null;

const CACHE_TTL = 30 * 60 * 1000; // 30 minutos

interface MarginsResponse {
  success: boolean;
  data?: {
    margins: MarginCalculation[];
    summary: ProviderSummary[];
    totales: {
      facturacion: number;
      utilidadBruta: number;
      utilidadNeta: number;
      rentabilidadPromedio: number;
    };
  };
  error?: string;
  cached?: boolean;
}

export async function GET(request: NextRequest): Promise<NextResponse<MarginsResponse>> {
  try {
    const { searchParams } = new URL(request.url);
    const forceRefresh = searchParams.get('refresh') === 'true';
    const limit = parseInt(searchParams.get('limit') || '100');

    // Verificar cache
    if (!forceRefresh && marginsCache && Date.now() - marginsCache.timestamp < CACHE_TTL) {
      const limitedData = marginsCache.data.slice(0, limit);
      return NextResponse.json({
        success: true,
        data: {
          margins: limitedData,
          summary: marginsCache.summary,
          totales: calcularTotales(marginsCache.data),
        },
        cached: true,
      });
    }

    // Obtener costos desde Google Sheets
    const costs = await getCostsFromSheet();

    if (costs.length === 0) {
      return NextResponse.json({
        success: false,
        error: 'No se encontraron datos de costos. Configure Google Sheets o cargue datos manualmente.',
      });
    }

    // Por ahora, generar datos de ejemplo basados en costos
    // En producción, esto se conectaría con las órdenes de ML
    const sampleSales: SaleData[] = costs.slice(0, limit).map((cost, index) => ({
      ventaId: `SAMPLE-${index + 1}`,
      sku: cost.sku,
      titulo: cost.titulo,
      precioUnitario: Math.round(cost.costo * 1.5), // Precio estimado
      cantidad: Math.floor(Math.random() * 5) + 1,
      costo: cost.costo,
      tipoEnvio: Math.random() > 0.5 ? 'full' : 'flex',
      proveedor: cost.proveedor,
    }));

    // Calcular márgenes
    const margins = sampleSales.map(sale => calcularMargenes(sale));
    const summary = calcularResumenPorProveedor(margins);

    // Actualizar cache
    marginsCache = {
      data: margins,
      summary,
      timestamp: Date.now(),
    };

    return NextResponse.json({
      success: true,
      data: {
        margins: margins.slice(0, limit),
        summary,
        totales: calcularTotales(margins),
      },
    });
  } catch (error) {
    console.error('Error calculating margins:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error calculando márgenes',
    });
  }
}

export async function POST(request: NextRequest): Promise<NextResponse<MarginsResponse>> {
  try {
    const body = await request.json();
    const { sales } = body as { sales: SaleData[] };

    if (!sales || !Array.isArray(sales)) {
      return NextResponse.json({
        success: false,
        error: 'Se requiere un array de ventas en el body',
      });
    }

    // Calcular márgenes para cada venta
    const margins = sales.map(sale => calcularMargenes(sale));
    const summary = calcularResumenPorProveedor(margins);

    return NextResponse.json({
      success: true,
      data: {
        margins,
        summary,
        totales: calcularTotales(margins),
      },
    });
  } catch (error) {
    console.error('Error processing margins:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error procesando datos',
    });
  }
}

function calcularTotales(margins: MarginCalculation[]) {
  const facturacion = margins.reduce((sum, m) => sum + m.facturacionBruta, 0);
  const utilidadBruta = margins.reduce((sum, m) => sum + m.utilidadBruta, 0);
  const utilidadNeta = margins.reduce((sum, m) => sum + m.utilidadNeta, 0);
  const costoTotal = margins.reduce((sum, m) => sum + m.costoProducto, 0);

  return {
    facturacion,
    utilidadBruta,
    utilidadNeta,
    rentabilidadPromedio: costoTotal > 0
      ? Math.round((utilidadBruta / costoTotal) * 1000) / 10
      : 0,
  };
}
