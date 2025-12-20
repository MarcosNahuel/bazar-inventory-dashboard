/**
 * API Endpoint para Google Sheets
 * GET: Lee datos de costos desde el Sheet
 * POST: Actualiza costos en el Sheet
 */

import { NextRequest, NextResponse } from 'next/server';
import {
  getCostsFromSheet,
  updateCostInSheet,
  appendCostsToSheet,
  CostData,
} from '@/lib/google-sheets/client';

interface SheetsResponse {
  success: boolean;
  data?: CostData[];
  message?: string;
  error?: string;
}

// GET: Leer costos desde Google Sheets
export async function GET(request: NextRequest): Promise<NextResponse<SheetsResponse>> {
  try {
    const { searchParams } = new URL(request.url);
    const range = searchParams.get('range') || 'Global!A:G';

    const costs = await getCostsFromSheet(undefined, range);

    if (costs.length === 0) {
      return NextResponse.json({
        success: true,
        data: [],
        message: 'No se encontraron datos en el Sheet. Verifique las credenciales de Google.',
      });
    }

    return NextResponse.json({
      success: true,
      data: costs,
    });
  } catch (error) {
    console.error('Error reading from Google Sheets:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error leyendo Google Sheets',
    });
  }
}

// POST: Actualizar o agregar costos
export async function POST(request: NextRequest): Promise<NextResponse<SheetsResponse>> {
  try {
    const body = await request.json();
    const { action, sku, cost, costs } = body;

    if (action === 'update' && sku && cost !== undefined) {
      // Actualizar un costo específico
      const success = await updateCostInSheet(sku, cost);

      return NextResponse.json({
        success,
        message: success
          ? `Costo de ${sku} actualizado a ${cost}`
          : `No se encontró el SKU ${sku}`,
      });
    } else if (action === 'append' && Array.isArray(costs)) {
      // Agregar nuevos costos
      const success = await appendCostsToSheet(costs);

      return NextResponse.json({
        success,
        message: success
          ? `${costs.length} costos agregados`
          : 'Error agregando costos',
      });
    } else {
      return NextResponse.json({
        success: false,
        error: 'Acción no válida. Use action: "update" con sku y cost, o action: "append" con costs array.',
      });
    }
  } catch (error) {
    console.error('Error writing to Google Sheets:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error escribiendo en Google Sheets',
    });
  }
}
