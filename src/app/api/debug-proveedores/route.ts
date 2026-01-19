import { NextRequest, NextResponse } from 'next/server';
import { getCachedCosts, refreshCostsCache, getCacheStatus } from '@/lib/google-sheets/costs-cache';

export const dynamic = 'force-dynamic';

// GET /api/debug-proveedores?refresh=true&mlc=MLC2884237924
export async function GET(request: NextRequest) {
  const refresh = request.nextUrl.searchParams.get('refresh') === 'true';
  const mlcToFind = request.nextUrl.searchParams.get('mlc');

  try {
    // Forzar refresh si se pide
    if (refresh) {
      await refreshCostsCache();
    }

    // Obtener datos del caché
    const costs = await getCachedCosts();
    const cacheStatus = getCacheStatus();

    // Estadísticas de proveedores
    const proveedores: Record<string, number> = {};
    const conMLC: { mlc: string; proveedor: string; sku: string }[] = [];

    for (const cost of costs) {
      const prov = cost.proveedor || 'Sin Proveedor';
      proveedores[prov] = (proveedores[prov] || 0) + 1;

      if (cost.codigoML) {
        conMLC.push({
          mlc: cost.codigoML,
          proveedor: cost.proveedor,
          sku: cost.sku || '',
        });
      }
    }

    // Buscar un MLC específico si se proporciona
    let matchResult = null;
    if (mlcToFind) {
      const found = costs.find(c =>
        c.codigoML?.toLowerCase() === mlcToFind.toLowerCase()
      );
      matchResult = {
        searched: mlcToFind,
        searchedLower: mlcToFind.toLowerCase(),
        found: found || null,
        allMLCs: conMLC.slice(0, 10).map(c => ({
          original: c.mlc,
          lower: c.mlc?.toLowerCase(),
        })),
      };
    }

    return NextResponse.json({
      cache: cacheStatus,
      totalCosts: costs.length,
      conCodigoML: conMLC.length,
      proveedores: Object.entries(proveedores)
        .sort((a, b) => b[1] - a[1])
        .map(([nombre, count]) => ({ nombre, count })),
      primeros10: conMLC.slice(0, 10),
      matchResult,
    });
  } catch (error) {
    return NextResponse.json({ error: String(error) }, { status: 500 });
  }
}
