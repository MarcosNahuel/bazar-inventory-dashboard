-- Tabla de caché para APIs lentas
-- Ejecutar en Supabase Dashboard > SQL Editor

CREATE TABLE IF NOT EXISTS api_cache (
  id TEXT PRIMARY KEY,
  data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ NOT NULL
);

-- Índice para limpiar expirados
CREATE INDEX IF NOT EXISTS idx_api_cache_expires_at ON api_cache(expires_at);

-- Función para limpiar caché expirado
CREATE OR REPLACE FUNCTION cleanup_expired_cache()
RETURNS void AS $$
BEGIN
  DELETE FROM api_cache WHERE expires_at < NOW();
END;
$$ LANGUAGE plpgsql;

-- Comentarios
COMMENT ON TABLE api_cache IS 'Caché para APIs lentas (sales-history, projections)';
COMMENT ON COLUMN api_cache.id IS 'Clave única del caché (ej: sales-history:24)';
COMMENT ON COLUMN api_cache.data IS 'Datos cacheados en formato JSON';
COMMENT ON COLUMN api_cache.expires_at IS 'Fecha de expiración del caché';
