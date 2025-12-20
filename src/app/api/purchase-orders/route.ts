/**
 * API Endpoint para Órdenes de Compra
 * GET: Genera órdenes de compra basadas en stock actual y proyecciones
 */

import { NextRequest, NextResponse } from 'next/server';
import {
  generarOrdenCompra,
  generarHTMLOrdenCompra,
  detectarCapitalInmovilizado,
  calcularQuiebreStock,
  PurchaseOrder,
  ImmobilizedProduct,
} from '@/lib/purchase-orders/generator';
import { getCostsFromSheet } from '@/lib/google-sheets/client';

interface OrdersResponse {
  success: boolean;
  data?: {
    ordenes: PurchaseOrder[];
    productosInmovilizados: ImmobilizedProduct[];
    resumen: {
      totalProveedores: number;
      totalUnidades: number;
      totalCajas: number;
      inversionTotal: number;
      productosUrgentes: number;
      capitalInmovilizado: number;
    };
  };
  html?: string;
  error?: string;
}

export async function GET(request: NextRequest): Promise<NextResponse<OrdersResponse>> {
  try {
    const { searchParams } = new URL(request.url);
    const diasObjetivo = parseInt(searchParams.get('dias') || '45');
    const proveedor = searchParams.get('proveedor');
    const format = searchParams.get('format'); // 'html' para exportar

    // Obtener costos desde Google Sheets
    const costs = await getCostsFromSheet();

    if (costs.length === 0) {
      return NextResponse.json({
        success: false,
        error: 'No se encontraron datos de costos. Configure Google Sheets.',
      });
    }

    // Simular datos de stock y ventas (en producción vendría de ML API)
    const productosConStock = costs.map(cost => ({
      sku: cost.sku,
      codigoML: cost.codigoML,
      titulo: cost.titulo,
      stockActual: Math.floor(Math.random() * 50), // Simulado
      ventas30d: Math.floor(Math.random() * 30), // Simulado
      ventas60d: Math.floor(Math.random() * 60), // Simulado
      ventas90d: Math.floor(Math.random() * 90), // Simulado
      costoUnitario: cost.costo,
      cajaMaestra: cost.cajaMaestra || 1,
      proveedor: cost.proveedor,
    }));

    // Generar órdenes de compra
    let ordenes = generarOrdenCompra(productosConStock, diasObjetivo);

    // Filtrar por proveedor si se especifica
    if (proveedor) {
      ordenes = ordenes.filter(o =>
        o.proveedor.toLowerCase().includes(proveedor.toLowerCase())
      );
    }

    // Detectar capital inmovilizado
    const inmovilizados = detectarCapitalInmovilizado(productosConStock);

    // Si se pide formato HTML, generar para la primera orden
    if (format === 'html' && ordenes.length > 0) {
      const html = generarHTMLOrdenCompra(ordenes[0]);
      return NextResponse.json({
        success: true,
        html,
        data: {
          ordenes,
          productosInmovilizados: inmovilizados,
          resumen: calcularResumen(ordenes, inmovilizados),
        },
      });
    }

    return NextResponse.json({
      success: true,
      data: {
        ordenes,
        productosInmovilizados: inmovilizados,
        resumen: calcularResumen(ordenes, inmovilizados),
      },
    });
  } catch (error) {
    console.error('Error generating purchase orders:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error generando órdenes',
    });
  }
}

function calcularResumen(ordenes: PurchaseOrder[], inmovilizados: ImmobilizedProduct[]) {
  const totalUnidades = ordenes.reduce((sum, o) => sum + o.totalUnidades, 0);
  const totalCajas = ordenes.reduce((sum, o) => sum + o.totalCajas, 0);
  const inversionTotal = ordenes.reduce((sum, o) => sum + o.total, 0);

  // Contar productos urgentes (< 7 días hasta quiebre)
  const productosUrgentes = ordenes.reduce((sum, o) =>
    sum + o.productos.filter(p => p.diasHastaQuiebre <= 7).length, 0
  );

  const capitalInmovilizado = inmovilizados.reduce(
    (sum, p) => sum + p.capitalInmovilizado, 0
  );

  return {
    totalProveedores: ordenes.length,
    totalUnidades,
    totalCajas,
    inversionTotal,
    productosUrgentes,
    capitalInmovilizado,
  };
}
