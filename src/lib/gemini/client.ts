/**
 * Gemini AI Client for OCR and Invoice Processing
 * Extrae datos de facturas usando vision AI
 */

import { GoogleGenerativeAI, GenerativeModel, Part } from '@google/generative-ai';

// Tipos para datos extraidos de facturas
export interface InvoiceData {
  proveedor: string;
  fecha: string;
  numeroFactura?: string;
  productos: InvoiceProduct[];
  subtotal?: number;
  iva?: number;
  total: number;
  confianza: number; // 0-100, qué tan seguro está el modelo
}

export interface InvoiceProduct {
  sku?: string;
  descripcion: string;
  cantidad: number;
  precioUnitario: number;
  total: number;
  confianza: number;
}

export interface OCRResult {
  success: boolean;
  data?: InvoiceData;
  rawText?: string;
  error?: string;
}

// Configurar cliente Gemini
function getGeminiClient(): GenerativeModel | null {
  const apiKey = process.env.GEMINI_API_KEY;

  if (!apiKey) {
    console.warn('Gemini API key not configured');
    return null;
  }

  const genAI = new GoogleGenerativeAI(apiKey);
  // Usar el modelo más reciente con capacidades de visión
  return genAI.getGenerativeModel({ model: 'gemini-2.0-flash-exp' });
}

/**
 * Procesa una imagen de factura y extrae datos estructurados
 */
export async function processInvoiceImage(
  imageBase64: string,
  mimeType: string = 'image/jpeg'
): Promise<OCRResult> {
  const model = getGeminiClient();

  if (!model) {
    return {
      success: false,
      error: 'Gemini API not configured. Please add GEMINI_API_KEY to .env',
    };
  }

  const prompt = `Analiza esta factura o comprobante de proveedor y extrae la información en formato JSON.

INSTRUCCIONES:
1. Identifica el nombre del proveedor
2. Extrae la fecha de la factura
3. Lista todos los productos con: descripción, cantidad, precio unitario y total
4. Si hay SKU o códigos de producto, inclúyelos
5. Calcula el subtotal, IVA y total
6. Para cada campo, indica un nivel de confianza (0-100)

RESPONDE ÚNICAMENTE CON JSON VÁLIDO, sin markdown ni texto adicional:
{
  "proveedor": "string",
  "fecha": "YYYY-MM-DD",
  "numeroFactura": "string o null",
  "productos": [
    {
      "sku": "string o null",
      "descripcion": "string",
      "cantidad": number,
      "precioUnitario": number,
      "total": number,
      "confianza": number
    }
  ],
  "subtotal": number o null,
  "iva": number o null,
  "total": number,
  "confianza": number
}`;

  try {
    const imagePart: Part = {
      inlineData: {
        data: imageBase64,
        mimeType: mimeType,
      },
    };

    const result = await model.generateContent([prompt, imagePart]);
    const response = await result.response;
    const text = response.text();

    // Limpiar respuesta (a veces viene con markdown)
    let jsonStr = text.trim();
    if (jsonStr.startsWith('```json')) {
      jsonStr = jsonStr.slice(7);
    }
    if (jsonStr.startsWith('```')) {
      jsonStr = jsonStr.slice(3);
    }
    if (jsonStr.endsWith('```')) {
      jsonStr = jsonStr.slice(0, -3);
    }
    jsonStr = jsonStr.trim();

    const data = JSON.parse(jsonStr) as InvoiceData;

    return {
      success: true,
      data,
      rawText: text,
    };
  } catch (error) {
    console.error('Error processing invoice with Gemini:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error processing image',
    };
  }
}

/**
 * Compara precios de factura con histórico y detecta cambios
 */
export interface PriceChange {
  sku: string;
  descripcion: string;
  precioAnterior: number;
  precioNuevo: number;
  diferencia: number;
  porcentaje: number;
  alerta: boolean; // true si cambio > 10%
}

export async function detectPriceChanges(
  invoiceData: InvoiceData,
  historicPrices: Map<string, number>,
  threshold: number = 10 // % de cambio para alertar
): Promise<PriceChange[]> {
  const changes: PriceChange[] = [];

  for (const product of invoiceData.productos) {
    const key = product.sku || product.descripcion.toLowerCase().trim();
    const previousPrice = historicPrices.get(key);

    if (previousPrice && previousPrice !== product.precioUnitario) {
      const diff = product.precioUnitario - previousPrice;
      const pct = (diff / previousPrice) * 100;

      changes.push({
        sku: product.sku || '',
        descripcion: product.descripcion,
        precioAnterior: previousPrice,
        precioNuevo: product.precioUnitario,
        diferencia: diff,
        porcentaje: pct,
        alerta: Math.abs(pct) >= threshold,
      });
    }
  }

  return changes;
}

/**
 * Extrae texto puro de una imagen (OCR simple)
 */
export async function extractTextFromImage(
  imageBase64: string,
  mimeType: string = 'image/jpeg'
): Promise<{ success: boolean; text?: string; error?: string }> {
  const model = getGeminiClient();

  if (!model) {
    return {
      success: false,
      error: 'Gemini API not configured',
    };
  }

  try {
    const imagePart: Part = {
      inlineData: {
        data: imageBase64,
        mimeType,
      },
    };

    const result = await model.generateContent([
      'Extrae todo el texto visible en esta imagen. Mantén el formato y estructura original lo mejor posible.',
      imagePart,
    ]);

    const response = await result.response;
    const text = response.text();

    return {
      success: true,
      text,
    };
  } catch (error) {
    console.error('Error extracting text with Gemini:', error);
    return {
      success: false,
      error: error instanceof Error ? error.message : 'Unknown error',
    };
  }
}

/**
 * Valida que el API key de Gemini esté configurado y funcione
 */
export async function validateGeminiConnection(): Promise<boolean> {
  const model = getGeminiClient();

  if (!model) {
    return false;
  }

  try {
    const result = await model.generateContent('Responde solo con: OK');
    const response = await result.response;
    return response.text().includes('OK');
  } catch {
    return false;
  }
}
