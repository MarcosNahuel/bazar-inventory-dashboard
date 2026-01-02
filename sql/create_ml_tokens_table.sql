-- Tabla para almacenar tokens de Mercado Libre
-- Ejecutar en Supabase SQL Editor

CREATE TABLE IF NOT EXISTS ml_tokens (
  id TEXT PRIMARY KEY DEFAULT 'primary',
  access_token TEXT NOT NULL,
  refresh_token TEXT NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insertar tokens iniciales desde variables de entorno
-- (Reemplazar los valores si es necesario)
-- INSERT INTO ml_tokens (id, access_token, refresh_token, expires_at)
-- VALUES ('primary', 'tu_access_token', 'tu_refresh_token', NOW() + INTERVAL '6 hours')
-- ON CONFLICT (id) DO UPDATE SET
--   access_token = EXCLUDED.access_token,
--   refresh_token = EXCLUDED.refresh_token,
--   updated_at = NOW(),
--   expires_at = EXCLUDED.expires_at;

-- Dar permisos (opcional, si usas RLS)
-- ALTER TABLE ml_tokens ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "Service role can manage tokens" ON ml_tokens
--   FOR ALL USING (auth.role() = 'service_role');
