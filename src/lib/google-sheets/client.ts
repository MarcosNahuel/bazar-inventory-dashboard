/**
 * Google Sheets Client for BAZAR Dashboard
 * Lee y escribe datos de costos desde Google Sheets
 */

import { google } from 'googleapis';

// Tipos para datos de costos
export interface CostData {
  sku: string;
  codigoML: string;
  titulo: string;
  costo: number;
  proveedor: string;
  cajaMaestra?: number; // Unidades por caja
  ultimaActualizacion?: string;
}

export interface SheetRow {
  [key: string]: string | number | undefined;
}

// Configurar cliente de Google Sheets
function getGoogleSheetsClient() {
  const email = process.env.GOOGLE_SERVICE_ACCOUNT_EMAIL;
  const privateKey = process.env.GOOGLE_PRIVATE_KEY?.replace(/\\n/g, '\n');

  if (!email || !privateKey) {
    console.warn('Google Sheets credentials not configured');
    return null;
  }

  const auth = new google.auth.JWT({
    email,
    key: privateKey,
    scopes: ['https://www.googleapis.com/auth/spreadsheets'],
  });

  return google.sheets({ version: 'v4', auth });
}

// Datos de ejemplo para desarrollo/testing
const MOCK_COSTS: CostData[] = [
  { sku: 'SKU-001', codigoML: 'MLC-12345', titulo: 'Set de Vasos de Vidrio x6', costo: 8500, proveedor: 'Proveedor A', cajaMaestra: 12 },
  { sku: 'SKU-002', codigoML: 'MLC-12346', titulo: 'Juego de Cubiertos 24 piezas', costo: 15000, proveedor: 'Proveedor A', cajaMaestra: 6 },
  { sku: 'SKU-003', codigoML: 'MLC-12347', titulo: 'Olla a Presión 6L', costo: 25000, proveedor: 'Proveedor B', cajaMaestra: 4 },
  { sku: 'SKU-004', codigoML: 'MLC-12348', titulo: 'Sartén Antiadherente 28cm', costo: 12000, proveedor: 'Proveedor B', cajaMaestra: 10 },
  { sku: 'SKU-005', codigoML: 'MLC-12349', titulo: 'Tabla de Cortar Bambú', costo: 5500, proveedor: 'Proveedor C', cajaMaestra: 20 },
  { sku: 'SKU-006', codigoML: 'MLC-12350', titulo: 'Batidora de Mano 300W', costo: 18000, proveedor: 'Proveedor C', cajaMaestra: 8 },
  { sku: 'SKU-007', codigoML: 'MLC-12351', titulo: 'Set de Contenedores x5', costo: 9000, proveedor: 'Proveedor A', cajaMaestra: 15 },
  { sku: 'SKU-008', codigoML: 'MLC-12352', titulo: 'Hervidor Eléctrico 1.7L', costo: 14000, proveedor: 'Proveedor D', cajaMaestra: 6 },
  { sku: 'SKU-009', codigoML: 'MLC-12353', titulo: 'Licuadora 500W', costo: 22000, proveedor: 'Proveedor D', cajaMaestra: 4 },
  { sku: 'SKU-010', codigoML: 'MLC-12354', titulo: 'Tostadora 2 Panes', costo: 11000, proveedor: 'Proveedor D', cajaMaestra: 8 },
];

/**
 * Lee datos de costos desde Google Sheets
 */
export async function getCostsFromSheet(
  spreadsheetId?: string,
  range: string = 'Global!A:S'
): Promise<CostData[]> {
  const sheets = getGoogleSheetsClient();
  const sheetId = spreadsheetId || process.env.GOOGLE_SPREADSHEET_ID;

  if (!sheets || !sheetId) {
    console.warn('Google Sheets not configured, using mock data for development');
    return MOCK_COSTS;
  }

  try {
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId: sheetId,
      range,
    });

    const rows = response.data.values;
    if (!rows || rows.length === 0) {
      return [];
    }

    // Primera fila son headers
    const headers = rows[0].map((h: string) =>
      h.toString().toLowerCase().replace(/\s+/g, '_')
    );

    // Mapear filas a objetos
    const data: CostData[] = [];
    for (let i = 1; i < rows.length; i++) {
      const row = rows[i];
      const obj: SheetRow = {};

      headers.forEach((header: string, index: number) => {
        obj[header] = row[index];
      });

      // Mapear a CostData
      // Soportar múltiples nombres de columnas: mlc, codigo_ml, numero_de_publicacion
      const codigoML = obj.mlc || obj.codigo_ml || obj.numero_de_publicacion || '';

      if (obj.sku || codigoML) {
        // Parsear costo con formato chileno ($4.550 -> 4550)
        const rawCosto = String(obj.costo || '0');
        const cleanCosto = rawCosto
          .replace(/[$\s]/g, '')  // Remover $ y espacios
          .replace(/\./g, '')     // Remover puntos (separador de miles)
          .replace(/,/g, '.');    // Cambiar coma a punto (decimales)
        const parsedCosto = parseFloat(cleanCosto) || 0;

        // Soportar múltiples nombres de columna para proveedor
        const proveedor = obj.proveedor || obj.marca || obj.supplier || obj.vendedor || obj.fabricante || '';

        data.push({
          sku: String(obj.sku || ''),
          codigoML: String(codigoML),
          titulo: String(obj.titulo || obj.título || obj.titulo_de_publicacion || ''),
          costo: parsedCosto,
          proveedor: proveedor ? String(proveedor) : 'Sin Proveedor',
          cajaMaestra: obj.caja_maestra ? parseInt(String(obj.caja_maestra)) : undefined,
          ultimaActualizacion: obj.fecha_actualizacion || obj.ultima_actualizacion ? String(obj.fecha_actualizacion || obj.ultima_actualizacion) : undefined,
        });
      }
    }

    return data;
  } catch (error) {
    console.error('Error reading from Google Sheets:', error);
    throw error;
  }
}

/**
 * Actualiza un costo específico en Google Sheets
 */
export async function updateCostInSheet(
  sku: string,
  newCost: number,
  spreadsheetId?: string,
  sheetName: string = 'Global'
): Promise<boolean> {
  const sheets = getGoogleSheetsClient();
  const sheetId = spreadsheetId || process.env.GOOGLE_SPREADSHEET_ID;

  if (!sheets || !sheetId) {
    console.warn('Google Sheets not configured');
    return false;
  }

  try {
    // Primero, buscar la fila del SKU
    const response = await sheets.spreadsheets.values.get({
      spreadsheetId: sheetId,
      range: `${sheetName}!A:A`, // Columna de SKU
    });

    const rows = response.data.values || [];
    let rowIndex = -1;

    for (let i = 0; i < rows.length; i++) {
      if (rows[i][0] === sku) {
        rowIndex = i + 1; // Sheets usa 1-indexed
        break;
      }
    }

    if (rowIndex === -1) {
      console.warn(`SKU ${sku} not found in sheet`);
      return false;
    }

    // Actualizar el costo (asumiendo columna D para costo)
    await sheets.spreadsheets.values.update({
      spreadsheetId: sheetId,
      range: `${sheetName}!D${rowIndex}`,
      valueInputOption: 'RAW',
      requestBody: {
        values: [[newCost]],
      },
    });

    return true;
  } catch (error) {
    console.error('Error updating Google Sheets:', error);
    return false;
  }
}

/**
 * Agrega nuevos costos al Sheet
 */
export async function appendCostsToSheet(
  costs: CostData[],
  spreadsheetId?: string,
  sheetName: string = 'Global'
): Promise<boolean> {
  const sheets = getGoogleSheetsClient();
  const sheetId = spreadsheetId || process.env.GOOGLE_SPREADSHEET_ID;

  if (!sheets || !sheetId) {
    console.warn('Google Sheets not configured');
    return false;
  }

  try {
    const values = costs.map(cost => [
      cost.sku,
      cost.codigoML,
      cost.titulo,
      cost.costo,
      cost.proveedor,
      cost.cajaMaestra || '',
      new Date().toISOString(),
    ]);

    await sheets.spreadsheets.values.append({
      spreadsheetId: sheetId,
      range: `${sheetName}!A:G`,
      valueInputOption: 'RAW',
      requestBody: {
        values,
      },
    });

    return true;
  } catch (error) {
    console.error('Error appending to Google Sheets:', error);
    return false;
  }
}

/**
 * Sincroniza costos desde Sheet con datos de ML
 */
export async function syncCostsWithProducts(
  products: Array<{ sku: string; mlId: string; title: string }>
): Promise<{ matched: number; missing: string[] }> {
  const costs = await getCostsFromSheet();

  const costMap = new Map(costs.map(c => [c.sku, c]));
  const missing: string[] = [];
  let matched = 0;

  for (const product of products) {
    if (costMap.has(product.sku)) {
      matched++;
    } else {
      missing.push(product.sku);
    }
  }

  return { matched, missing };
}
