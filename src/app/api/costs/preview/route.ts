import { NextRequest, NextResponse } from 'next/server';
import * as XLSX from 'xlsx';

export const dynamic = 'force-dynamic';

interface CostRow {
  sku: string;
  codigo_ml: string;
  costo: number;
  proveedor?: string;
}

// POST /api/costs/preview - Parse Excel/CSV and return preview
export async function POST(request: NextRequest) {
  try {
    const formData = await request.formData();
    const file = formData.get('file') as File;

    if (!file) {
      return NextResponse.json({ error: 'No file provided' }, { status: 400 });
    }

    const buffer = await file.arrayBuffer();
    const workbook = XLSX.read(buffer, { type: 'buffer' });

    // Get first sheet
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];

    // Convert to JSON
    const rawData = XLSX.utils.sheet_to_json(sheet, { defval: '' });

    // Normalize column names and parse data
    const costs: CostRow[] = [];
    const errors: string[] = [];

    for (let i = 0; i < rawData.length; i++) {
      const row = rawData[i] as Record<string, unknown>;
      const rowNum = i + 2; // Excel rows start at 1, plus header

      // Find columns (case-insensitive)
      const findColumn = (names: string[]): unknown => {
        for (const name of names) {
          const key = Object.keys(row).find(k => k.toLowerCase().trim() === name.toLowerCase());
          if (key) return row[key];
        }
        return undefined;
      };

      const sku = String(findColumn(['sku', 'codigo', 'code']) || '').trim();
      const codigo_ml = String(findColumn(['codigo_ml', 'ml', 'mercadolibre', 'item_id', 'id']) || '').trim();
      const costoRaw = findColumn(['costo', 'cost', 'precio_costo', 'unit_cost']);
      const proveedor = String(findColumn(['proveedor', 'supplier', 'vendor']) || '').trim();

      // Validate required fields
      if (!sku && !codigo_ml) {
        errors.push(`Fila ${rowNum}: SKU o Código ML requerido`);
        continue;
      }

      // Parse cost
      let costo = 0;
      if (costoRaw !== undefined && costoRaw !== '') {
        const costoStr = String(costoRaw).replace(/[^0-9.,]/g, '').replace(',', '.');
        costo = parseFloat(costoStr);
        if (isNaN(costo) || costo < 0) {
          errors.push(`Fila ${rowNum}: Costo inválido "${costoRaw}"`);
          continue;
        }
      }

      costs.push({
        sku: sku || codigo_ml,
        codigo_ml: codigo_ml || sku,
        costo,
        proveedor: proveedor || undefined,
      });
    }

    return NextResponse.json({
      costs,
      errors: errors.slice(0, 10), // Limit errors shown
      total_rows: rawData.length,
      valid_rows: costs.length,
    });
  } catch (error) {
    console.error('Error parsing file:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error parsing file' },
      { status: 500 }
    );
  }
}
