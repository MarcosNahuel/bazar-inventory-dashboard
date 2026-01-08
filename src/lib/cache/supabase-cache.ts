import { createAdminClient } from '@/lib/supabase/server';

interface CacheEntry<T> {
  id: string;
  data: T;
  created_at: string;
  expires_at: string;
}

// TTL por defecto: 1 hora
const DEFAULT_TTL_SECONDS = 60 * 60;

/**
 * Obtiene datos del caché de Supabase
 */
export async function getCache<T>(key: string): Promise<T | null> {
  try {
    const supabase = createAdminClient();

    const { data, error } = await supabase
      .from('api_cache')
      .select('data, expires_at')
      .eq('id', key)
      .single();

    if (error || !data) {
      return null;
    }

    // Verificar si expiró
    if (new Date(data.expires_at) < new Date()) {
      // Limpiar caché expirado en background
      supabase.from('api_cache').delete().eq('id', key).then(() => {
        console.log(`🗑️ Cache expirado eliminado: ${key}`);
      });
      return null;
    }

    console.log(`✅ Cache hit: ${key}`);
    return data.data as T;
  } catch (error) {
    console.error(`❌ Error leyendo cache ${key}:`, error);
    return null;
  }
}

/**
 * Guarda datos en el caché de Supabase
 */
export async function setCache<T>(
  key: string,
  data: T,
  ttlSeconds: number = DEFAULT_TTL_SECONDS
): Promise<boolean> {
  try {
    const supabase = createAdminClient();

    const expiresAt = new Date(Date.now() + ttlSeconds * 1000).toISOString();

    const { error } = await supabase
      .from('api_cache')
      .upsert({
        id: key,
        data: data,
        created_at: new Date().toISOString(),
        expires_at: expiresAt
      }, {
        onConflict: 'id'
      });

    if (error) {
      console.error(`❌ Error guardando cache ${key}:`, error);
      return false;
    }

    console.log(`💾 Cache guardado: ${key} (expira en ${ttlSeconds}s)`);
    return true;
  } catch (error) {
    console.error(`❌ Error guardando cache ${key}:`, error);
    return false;
  }
}

/**
 * Elimina una entrada del caché
 */
export async function deleteCache(key: string): Promise<boolean> {
  try {
    const supabase = createAdminClient();

    const { error } = await supabase
      .from('api_cache')
      .delete()
      .eq('id', key);

    if (error) {
      console.error(`❌ Error eliminando cache ${key}:`, error);
      return false;
    }

    console.log(`🗑️ Cache eliminado: ${key}`);
    return true;
  } catch (error) {
    console.error(`❌ Error eliminando cache ${key}:`, error);
    return false;
  }
}

/**
 * Limpia todo el caché expirado
 */
export async function cleanupExpiredCache(): Promise<number> {
  try {
    const supabase = createAdminClient();

    const { data, error } = await supabase
      .from('api_cache')
      .delete()
      .lt('expires_at', new Date().toISOString())
      .select('id');

    if (error) {
      console.error('❌ Error limpiando cache:', error);
      return 0;
    }

    const count = data?.length || 0;
    if (count > 0) {
      console.log(`🧹 ${count} entradas de cache expiradas eliminadas`);
    }
    return count;
  } catch (error) {
    console.error('❌ Error limpiando cache:', error);
    return 0;
  }
}

/**
 * Wrapper para cachear el resultado de una función async
 * Útil para APIs lentas
 */
export async function withCache<T>(
  key: string,
  fetchFn: () => Promise<T>,
  ttlSeconds: number = DEFAULT_TTL_SECONDS
): Promise<{ data: T; fromCache: boolean }> {
  // Intentar obtener del caché
  const cached = await getCache<T>(key);
  if (cached !== null) {
    return { data: cached, fromCache: true };
  }

  // Ejecutar función y cachear resultado
  const data = await fetchFn();
  await setCache(key, data, ttlSeconds);

  return { data, fromCache: false };
}
