/**
 * API Endpoint para Proyección de Quiebre de Stock
 * GET: Calcula días hasta quiebre para todos los productos
 */

import { NextRequest, NextResponse } from 'next/server';
import { calcularQuiebreStock, StockBreakProjection } from '@/lib/purchase-orders/generator';
import { getCachedCosts } from '@/lib/google-sheets/costs-cache';

interface StockBreakResponse {
  success: boolean;
  data?: {
    proyecciones: Array<StockBreakProjection & {
      sku: string;
      titulo: string;
      proveedor: string;
    }>;
    resumen: {
      totalProductos: number;
      productosUrgentes: number; // < 7 días
      productosAlerta: number; // < 14 días
      productosOK: number;
      sinStock: number;
    };
  };
  error?: string;
}

export async function GET(request: NextRequest): Promise<NextResponse<StockBreakResponse>> {
  try {
    const { searchParams } = new URL(request.url);
    const umbralUrgente = parseInt(searchParams.get('urgente') || '7');
    const umbralAlerta = parseInt(searchParams.get('alerta') || '14');
    const soloUrgentes = searchParams.get('soloUrgentes') === 'true';

    // Obtener costos desde cache centralizado (TTL 15 min)
    const costs = await getCachedCosts();

    if (costs.length === 0) {
      return NextResponse.json({
        success: false,
        error: 'No se encontraron datos de productos.',
      });
    }

    // Simular datos de stock y ventas (en producción vendría de ML API)
    const productosConStock = costs.map(cost => ({
      sku: cost.sku,
      titulo: cost.titulo,
      proveedor: cost.proveedor,
      stockActual: Math.floor(Math.random() * 50), // Simulado
      ventas30d: Math.floor(Math.random() * 30), // Simulado
    }));

    // Calcular proyecciones
    const proyecciones = productosConStock.map(p => {
      const quiebre = calcularQuiebreStock(p.stockActual, p.ventas30d);
      return {
        ...quiebre,
        sku: p.sku,
        titulo: p.titulo,
        proveedor: p.proveedor,
        esUrgente: quiebre.diasHastaQuiebre <= umbralUrgente,
        esAlerta: quiebre.diasHastaQuiebre <= umbralAlerta && quiebre.diasHastaQuiebre > umbralUrgente,
      };
    });

    // Filtrar si solo se piden urgentes
    const proyeccionesFiltradas = soloUrgentes
      ? proyecciones.filter(p => p.esUrgente || p.esAlerta)
      : proyecciones;

    // Ordenar por días hasta quiebre (más urgentes primero)
    proyeccionesFiltradas.sort((a, b) => a.diasHastaQuiebre - b.diasHastaQuiebre);

    // Calcular resumen
    const resumen = {
      totalProductos: proyecciones.length,
      productosUrgentes: proyecciones.filter(p => p.diasHastaQuiebre <= umbralUrgente && p.diasHastaQuiebre > 0).length,
      productosAlerta: proyecciones.filter(p => p.diasHastaQuiebre > umbralUrgente && p.diasHastaQuiebre <= umbralAlerta).length,
      productosOK: proyecciones.filter(p => p.diasHastaQuiebre > umbralAlerta).length,
      sinStock: proyecciones.filter(p => p.stockActual === 0).length,
    };

    return NextResponse.json({
      success: true,
      data: {
        proyecciones: proyeccionesFiltradas,
        resumen,
      },
    });
  } catch (error) {
    console.error('Error calculating stock break:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error calculando proyecciones',
    });
  }
}
