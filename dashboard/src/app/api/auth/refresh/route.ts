import { NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';

export const dynamic = 'force-dynamic';

// POST /api/auth/refresh - Renovar token de ML
export async function POST() {
  try {
    const ml = getMercadoLibreClient();
    const result = await ml.refreshAccessToken();

    return NextResponse.json({
      success: true,
      expires_in: result.expires_in,
      message: 'Token renovado exitosamente',
      // No exponemos los tokens en la respuesta por seguridad
    });
  } catch (error) {
    console.error('Error refreshing token:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error refreshing token' },
      { status: 500 }
    );
  }
}

// GET /api/auth/refresh - Verificar estado del token
export async function GET() {
  try {
    const ml = getMercadoLibreClient();
    const user = await ml.getUser();

    return NextResponse.json({
      valid: true,
      user: {
        id: user.id,
        nickname: user.nickname,
        site_id: user.site_id,
        status: user.status.site_status,
      },
    });
  } catch (error) {
    console.error('Error checking token:', error);
    return NextResponse.json(
      {
        valid: false,
        error: error instanceof Error ? error.message : 'Token inválido',
      },
      { status: 401 }
    );
  }
}
