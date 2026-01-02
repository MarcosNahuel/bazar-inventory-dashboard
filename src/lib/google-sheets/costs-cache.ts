/**
 * Cache Centralizado de Costos desde Google Sheets
 * TTL: 15 minutos
 * Patrón de lock anti race-condition
 */

import { getCostsFromSheet, appendCostsToSheet, CostData } from './client';

// Re-exportar CostData para uso en otros módulos
export type { CostData };

// Cache structure
interface CostsCache {
  data: CostData[];
  bySku: Map<string, CostData>;
  byML: Map<string, CostData>;
  timestamp: number;
}

let costsCache: CostsCache | null = null;
let fetchInProgress: Promise<CostData[]> | null = null;
const CACHE_TTL = 15 * 60 * 1000; // 15 minutos en ms

/**
 * Verifica si el cache es válido
 */
function isCacheValid(): boolean {
  if (!costsCache) return false;
  const now = Date.now();
  return now - costsCache.timestamp < CACHE_TTL;
}

/**
 * Construye los índices del cache para búsquedas O(1)
 */
function buildCacheIndexes(data: CostData[]): CostsCache {
  const bySku = new Map<string, CostData>();
  const byML = new Map<string, CostData>();

  for (const cost of data) {
    if (cost.sku) {
      bySku.set(cost.sku.toLowerCase(), cost);
    }
    if (cost.codigoML) {
      byML.set(cost.codigoML.toLowerCase(), cost);
    }
  }

  return {
    data,
    bySku,
    byML,
    timestamp: Date.now(),
  };
}

/**
 * Obtiene todos los costos del cache (refresca si expiró)
 */
export async function getCachedCosts(): Promise<CostData[]> {
  // Si el cache es válido, retornar datos
  if (isCacheValid() && costsCache) {
    return costsCache.data;
  }

  // Si hay una petición en progreso, esperar
  if (fetchInProgress) {
    return fetchInProgress;
  }

  // Iniciar nueva petición con lock
  fetchInProgress = (async () => {
    try {
      console.log('[CostsCache] Refreshing from Google Sheets...');
      const data = await getCostsFromSheet();
      costsCache = buildCacheIndexes(data);
      console.log(`[CostsCache] Loaded ${data.length} costs`);
      return data;
    } finally {
      fetchInProgress = null;
    }
  })();

  return fetchInProgress;
}

/**
 * Busca un costo por SKU (O(1))
 */
export async function getCostBySku(sku: string): Promise<CostData | null> {
  await getCachedCosts(); // Asegurar que el cache esté cargado
  if (!costsCache) return null;
  return costsCache.bySku.get(sku.toLowerCase()) || null;
}

/**
 * Busca un costo por código de MercadoLibre (O(1))
 */
export async function getCostByML(mlCode: string): Promise<CostData | null> {
  await getCachedCosts(); // Asegurar que el cache esté cargado
  if (!costsCache) return null;
  return costsCache.byML.get(mlCode.toLowerCase()) || null;
}

/**
 * Fuerza el refresh del cache
 */
export async function refreshCostsCache(): Promise<{ count: number; timestamp: Date }> {
  // Invalidar cache actual
  costsCache = null;

  // Forzar nueva carga
  const data = await getCachedCosts();

  return {
    count: data.length,
    timestamp: new Date(),
  };
}

/**
 * Invalida el cache (próxima llamada lo recargará)
 */
export function invalidateCache(): void {
  costsCache = null;
  console.log('[CostsCache] Cache invalidated');
}

/**
 * Obtiene estado del cache
 */
export function getCacheStatus(): {
  valid: boolean;
  age: number;
  count: number;
  expiresIn: number;
} {
  if (!costsCache) {
    return { valid: false, age: 0, count: 0, expiresIn: 0 };
  }

  const now = Date.now();
  const age = now - costsCache.timestamp;
  const expiresIn = Math.max(0, CACHE_TTL - age);

  return {
    valid: isCacheValid(),
    age: Math.round(age / 1000), // segundos
    count: costsCache.data.length,
    expiresIn: Math.round(expiresIn / 1000), // segundos
  };
}

/**
 * Detecta productos que no tienen costo en el Sheet
 * y los agrega con costo=0 para que el usuario complete
 */
export async function syncMissingProducts(
  products: Array<{ sku: string; mlId: string; title: string }>
): Promise<{ added: number; skipped: number }> {
  // Cargar costos actuales
  await getCachedCosts();

  if (!costsCache) {
    return { added: 0, skipped: products.length };
  }

  // Filtrar productos sin costo
  const missing: CostData[] = [];
  let skipped = 0;

  for (const product of products) {
    const hasCostBySku = product.sku && costsCache.bySku.has(product.sku.toLowerCase());
    const hasCostByML = product.mlId && costsCache.byML.has(product.mlId.toLowerCase());

    if (!hasCostBySku && !hasCostByML) {
      missing.push({
        sku: product.sku || '',
        codigoML: product.mlId,
        titulo: product.title.substring(0, 100), // Limitar longitud
        costo: 0, // El usuario debe completar
        proveedor: 'SIN ASIGNAR',
        cajaMaestra: undefined,
        ultimaActualizacion: new Date().toISOString(),
      });
    } else {
      skipped++;
    }
  }

  // Si hay productos faltantes, agregarlos al Sheet
  if (missing.length > 0) {
    console.log(`[CostsCache] Adding ${missing.length} new products to Sheet...`);
    const success = await appendCostsToSheet(missing);

    if (success) {
      // Invalidar cache para que se recargue con los nuevos
      invalidateCache();
      return { added: missing.length, skipped };
    } else {
      console.error('[CostsCache] Failed to append products to Sheet');
      return { added: 0, skipped: products.length };
    }
  }

  return { added: 0, skipped };
}
