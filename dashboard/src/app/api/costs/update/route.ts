import { NextRequest, NextResponse } from 'next/server';

export const dynamic = 'force-dynamic';

interface CostData {
  sku: string;
  codigo_ml: string;
  costo: number;
  proveedor?: string;
}

// In-memory storage for demo (in production, use Supabase)
const costsStore = new Map<string, CostData>();

// POST /api/costs/update - Update costs in batch
export async function POST(request: NextRequest) {
  try {
    const { costs } = await request.json() as { costs: CostData[] };

    if (!Array.isArray(costs) || costs.length === 0) {
      return NextResponse.json({ error: 'No costs provided' }, { status: 400 });
    }

    const updated: string[] = [];
    const failed: { sku: string; error: string }[] = [];

    for (const cost of costs) {
      try {
        // Store in memory (replace with Supabase in production)
        const key = cost.codigo_ml || cost.sku;
        costsStore.set(key, cost);
        updated.push(key);
      } catch (err) {
        failed.push({
          sku: cost.sku,
          error: err instanceof Error ? err.message : 'Unknown error',
        });
      }
    }

    return NextResponse.json({
      success: true,
      updated: updated.length,
      failed: failed.length,
      details: {
        updated_ids: updated.slice(0, 10),
        failed_items: failed.slice(0, 5),
      },
    });
  } catch (error) {
    console.error('Error updating costs:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error updating costs' },
      { status: 500 }
    );
  }
}

// GET /api/costs/update - Get all stored costs
export async function GET() {
  const costs = Array.from(costsStore.values());
  return NextResponse.json({ costs, total: costs.length });
}
