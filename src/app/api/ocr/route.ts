/**
 * API Endpoint para OCR de Facturas con Gemini
 * POST: Procesa imagen de factura y extrae datos
 */

import { NextRequest, NextResponse } from 'next/server';
import {
  processInvoiceImage,
  detectPriceChanges,
  extractTextFromImage,
  validateGeminiConnection,
  InvoiceData,
  PriceChange,
} from '@/lib/gemini/client';

interface OCRResponse {
  success: boolean;
  data?: {
    invoice: InvoiceData;
    priceChanges: PriceChange[];
    alertas: string[];
  };
  rawText?: string;
  error?: string;
}

export async function POST(request: NextRequest): Promise<NextResponse<OCRResponse>> {
  try {
    const contentType = request.headers.get('content-type') || '';

    // Verificar conexión con Gemini
    const isConnected = await validateGeminiConnection();
    if (!isConnected) {
      return NextResponse.json({
        success: false,
        error: 'Gemini API no configurado. Agregue GEMINI_API_KEY en .env.local',
      });
    }

    let imageBase64: string;
    let mimeType: string = 'image/jpeg';

    if (contentType.includes('multipart/form-data')) {
      // Procesar archivo subido
      const formData = await request.formData();
      const file = formData.get('file') as File;

      if (!file) {
        return NextResponse.json({
          success: false,
          error: 'No se recibió archivo',
        });
      }

      // Validar tipo de archivo
      const validTypes = ['image/jpeg', 'image/png', 'image/webp', 'application/pdf'];
      if (!validTypes.includes(file.type)) {
        return NextResponse.json({
          success: false,
          error: 'Tipo de archivo no soportado. Use JPG, PNG, WebP o PDF.',
        });
      }

      mimeType = file.type;

      // Convertir a base64
      const arrayBuffer = await file.arrayBuffer();
      imageBase64 = Buffer.from(arrayBuffer).toString('base64');
    } else if (contentType.includes('application/json')) {
      // Recibir base64 directamente
      const body = await request.json();
      imageBase64 = body.image;
      mimeType = body.mimeType || 'image/jpeg';

      if (!imageBase64) {
        return NextResponse.json({
          success: false,
          error: 'Se requiere imagen en base64',
        });
      }
    } else {
      return NextResponse.json({
        success: false,
        error: 'Content-Type no soportado',
      });
    }

    // Procesar imagen con Gemini
    const result = await processInvoiceImage(imageBase64, mimeType);

    if (!result.success || !result.data) {
      return NextResponse.json({
        success: false,
        error: result.error || 'Error procesando imagen',
        rawText: result.rawText,
      });
    }

    // Detectar cambios de precio (comparar con histórico)
    // Por ahora usar un mapa vacío, en producción vendría de la BD
    const historicPrices = new Map<string, number>();
    const priceChanges = await detectPriceChanges(result.data, historicPrices);

    // Generar alertas
    const alertas: string[] = [];

    // Alerta si confianza general es baja
    if (result.data.confianza < 70) {
      alertas.push(`Confianza baja (${result.data.confianza}%). Revisar datos manualmente.`);
    }

    // Alerta por productos con confianza baja
    const productosConfianzaBaja = result.data.productos.filter(p => p.confianza < 70);
    if (productosConfianzaBaja.length > 0) {
      alertas.push(`${productosConfianzaBaja.length} producto(s) con confianza baja.`);
    }

    // Alertas por cambios de precio significativos
    const cambiosSignificativos = priceChanges.filter(c => c.alerta);
    if (cambiosSignificativos.length > 0) {
      alertas.push(`${cambiosSignificativos.length} producto(s) con cambio de precio >10%.`);
    }

    return NextResponse.json({
      success: true,
      data: {
        invoice: result.data,
        priceChanges,
        alertas,
      },
      rawText: result.rawText,
    });
  } catch (error) {
    console.error('Error in OCR endpoint:', error);
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error procesando factura',
    });
  }
}

// GET para verificar estado de Gemini
export async function GET(): Promise<NextResponse> {
  try {
    const isConnected = await validateGeminiConnection();

    return NextResponse.json({
      success: true,
      geminiConfigured: isConnected,
      message: isConnected
        ? 'Gemini API configurado correctamente'
        : 'Gemini API no configurado. Agregue GEMINI_API_KEY en .env.local',
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      geminiConfigured: false,
      error: error instanceof Error ? error.message : 'Error verificando Gemini',
    });
  }
}
