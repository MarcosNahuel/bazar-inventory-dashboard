/**
 * POST /api/auth/init-tokens
 * Inicializa los tokens de ML en Supabase usando los valores de las variables de entorno
 * Solo debe ejecutarse una vez para migrar tokens existentes
 */

import { NextResponse } from 'next/server';
import { createClient } from '@supabase/supabase-js';

export const dynamic = 'force-dynamic';

export async function POST() {
  try {
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    const accessToken = process.env.ML_ACCESS_TOKEN;
    const refreshToken = process.env.ML_REFRESH_TOKEN;

    if (!supabaseUrl || !supabaseKey) {
      return NextResponse.json({ error: 'Supabase not configured' }, { status: 500 });
    }

    if (!accessToken || !refreshToken) {
      return NextResponse.json({ error: 'ML tokens not configured in env vars' }, { status: 500 });
    }

    const supabase = createClient(supabaseUrl, supabaseKey);

    // Crear tabla si no existe (intentamos con rpc, si falla asumimos que se crea manualmente)
    try {
      await supabase.rpc('exec_sql', {
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
    } catch {
      console.log('Note: Could not auto-create table via RPC, assuming it exists or will be created manually');
    }

    // Insertar/actualizar tokens
    const expiresAt = new Date(Date.now() + 6 * 60 * 60 * 1000); // 6 horas desde ahora

    const { error: upsertError } = await supabase
      .from('ml_tokens')
      .upsert({
        id: 'primary',
        access_token: accessToken,
        refresh_token: refreshToken,
        updated_at: new Date().toISOString(),
        expires_at: expiresAt.toISOString(),
      }, {
        onConflict: 'id',
      });

    if (upsertError) {
      console.error('Error upserting tokens:', upsertError);
      return NextResponse.json({
        error: 'Failed to save tokens',
        details: upsertError.message,
        hint: 'Make sure to run the SQL script first: sql/create_ml_tokens_table.sql'
      }, { status: 500 });
    }

    return NextResponse.json({
      success: true,
      message: 'Tokens initialized in Supabase',
      expires_at: expiresAt.toISOString(),
    });

  } catch (error) {
    console.error('Error initializing tokens:', error);
    return NextResponse.json({
      error: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 });
  }
}

// GET para verificar estado de tokens
export async function GET() {
  try {
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!supabaseUrl || !supabaseKey) {
      return NextResponse.json({ error: 'Supabase not configured' }, { status: 500 });
    }

    const supabase = createClient(supabaseUrl, supabaseKey);

    const { data, error } = await supabase
      .from('ml_tokens')
      .select('updated_at, expires_at')
      .eq('id', 'primary')
      .single();

    if (error) {
      return NextResponse.json({
        stored: false,
        error: error.message,
      });
    }

    const expiresAt = new Date(data.expires_at);
    const now = new Date();
    const isExpired = expiresAt < now;
    const expiresInMinutes = Math.round((expiresAt.getTime() - now.getTime()) / 60000);

    return NextResponse.json({
      stored: true,
      updated_at: data.updated_at,
      expires_at: data.expires_at,
      is_expired: isExpired,
      expires_in_minutes: isExpired ? 0 : expiresInMinutes,
    });

  } catch (error) {
    console.error('Error checking tokens:', error);
    return NextResponse.json({
      stored: false,
      error: error instanceof Error ? error.message : 'Unknown error'
    });
  }
}
