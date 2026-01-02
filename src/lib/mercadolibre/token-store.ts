/**
 * Token Store para Mercado Libre
 * Guarda y recupera tokens de autenticación en Supabase
 * Permite que los tokens se mantengan actualizados automáticamente
 */

import { createClient } from '@supabase/supabase-js';

interface MLTokens {
  access_token: string;
  refresh_token: string;
  updated_at: string;
  expires_at: string;
}

// Cliente Supabase para operaciones de tokens (usa service role para bypasear RLS)
function getSupabaseAdmin() {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!url || !key) {
    return null;
  }

  return createClient(url, key);
}

// Obtener tokens desde Supabase
export async function getStoredTokens(): Promise<MLTokens | null> {
  const supabase = getSupabaseAdmin();
  if (!supabase) {
    console.log('[TokenStore] Supabase not configured, using env vars');
    return null;
  }

  try {
    const { data, error } = await supabase
      .from('ml_tokens')
      .select('*')
      .eq('id', 'primary')
      .single();

    if (error) {
      // Si la tabla no existe, la creamos
      if (error.code === '42P01' || error.message?.includes('does not exist')) {
        console.log('[TokenStore] Table does not exist, creating...');
        await createTokensTable(supabase);
        return null;
      }

      // Si no hay registro, devolvemos null
      if (error.code === 'PGRST116') {
        console.log('[TokenStore] No tokens stored yet');
        return null;
      }

      console.error('[TokenStore] Error fetching tokens:', error);
      return null;
    }

    console.log('[TokenStore] Loaded tokens from Supabase, updated at:', data.updated_at);
    return {
      access_token: data.access_token,
      refresh_token: data.refresh_token,
      updated_at: data.updated_at,
      expires_at: data.expires_at,
    };
  } catch (e) {
    console.error('[TokenStore] Exception fetching tokens:', e);
    return null;
  }
}

// Guardar tokens en Supabase
export async function saveTokens(
  accessToken: string,
  refreshToken: string,
  expiresIn: number
): Promise<boolean> {
  const supabase = getSupabaseAdmin();
  if (!supabase) {
    console.log('[TokenStore] Supabase not configured, cannot save tokens');
    return false;
  }

  try {
    const now = new Date();
    const expiresAt = new Date(now.getTime() + expiresIn * 1000);

    const { error } = await supabase
      .from('ml_tokens')
      .upsert({
        id: 'primary',
        access_token: accessToken,
        refresh_token: refreshToken,
        updated_at: now.toISOString(),
        expires_at: expiresAt.toISOString(),
      }, {
        onConflict: 'id',
      });

    if (error) {
      // Si la tabla no existe, la creamos e intentamos de nuevo
      if (error.code === '42P01' || error.message?.includes('does not exist')) {
        console.log('[TokenStore] Table does not exist, creating...');
        await createTokensTable(supabase);
        return saveTokens(accessToken, refreshToken, expiresIn);
      }

      console.error('[TokenStore] Error saving tokens:', error);
      return false;
    }

    console.log('[TokenStore] Tokens saved successfully, expires at:', expiresAt.toISOString());
    return true;
  } catch (e) {
    console.error('[TokenStore] Exception saving tokens:', e);
    return false;
  }
}

// Crear la tabla de tokens si no existe
// eslint-disable-next-line @typescript-eslint/no-explicit-any
async function createTokensTable(supabase: any): Promise<void> {
  try {
    const { error } = await supabase.rpc('exec_sql', {
      sql: `
        CREATE TABLE IF NOT EXISTS ml_tokens (
          id TEXT PRIMARY KEY DEFAULT 'primary',
          access_token TEXT NOT NULL,
          refresh_token TEXT NOT NULL,
          updated_at TIMESTAMPTZ DEFAULT NOW(),
          expires_at TIMESTAMPTZ,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );
      `
    });

    if (error) {
      // Si exec_sql no existe, mostramos instrucciones
      console.error('[TokenStore] Could not auto-create table. Please run this SQL manually:');
      console.error(`
        CREATE TABLE IF NOT EXISTS ml_tokens (
          id TEXT PRIMARY KEY DEFAULT 'primary',
          access_token TEXT NOT NULL,
          refresh_token TEXT NOT NULL,
          updated_at TIMESTAMPTZ DEFAULT NOW(),
          expires_at TIMESTAMPTZ,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );
      `);
    } else {
      console.log('[TokenStore] Table created successfully');
    }
  } catch (e) {
    console.error('[TokenStore] Exception creating table:', e);
  }
}

// Verificar si los tokens están próximos a expirar
export function isTokenExpiringSoon(expiresAt: string, minutesBefore = 30): boolean {
  const expiry = new Date(expiresAt);
  const threshold = new Date(Date.now() + minutesBefore * 60 * 1000);
  return expiry <= threshold;
}
