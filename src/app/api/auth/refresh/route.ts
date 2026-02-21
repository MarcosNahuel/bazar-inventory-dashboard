import { NextResponse } from 'next/server';

export const dynamic = 'force-dynamic';

export async function POST() {
  try {
    const clientId = process.env.ML_CLIENT_ID || '';
    const clientSecret = process.env.ML_CLIENT_SECRET || '';
    const refreshToken = process.env.ML_REFRESH_TOKEN || '';

    const params = new URLSearchParams({
      grant_type: 'refresh_token',
      client_id: clientId,
      client_secret: clientSecret,
      refresh_token: refreshToken,
    });

    const response = await fetch('https://api.mercadolibre.com/oauth/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: params.toString(),
    });

    const body = await response.text();
    
    return NextResponse.json({
      status: response.status,
      ok: response.ok,
      ml_response: JSON.parse(body),
      env_refresh_prefix: refreshToken.substring(0, 15) + '...',
      env_client_id: clientId,
    });
  } catch (error) {
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Unknown error' },
      { status: 500 }
    );
  }
}

export async function GET() {
  const { getMercadoLibreClient } = await import('@/lib/mercadolibre/client');
  try {
    const ml = getMercadoLibreClient();
    const user = await ml.getUser();
    return NextResponse.json({ valid: true, user: { id: user.id, nickname: user.nickname } });
  } catch (error) {
    return NextResponse.json({ valid: false }, { status: 401 });
  }
}
