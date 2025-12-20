/**
 * OAuth2 Flow para Google Sheets
 * GET: Genera URL de autorización
 * POST: Intercambia código por tokens
 */

import { NextRequest, NextResponse } from 'next/server';

const CLIENT_ID = process.env.GOOGLE_CLIENT_ID || '';
const CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET || '';
const REDIRECT_URI = process.env.GOOGLE_REDIRECT_URI || 'http://localhost:3000/api/auth/google/callback';
const SCOPES = [
  'https://www.googleapis.com/auth/spreadsheets',
  'https://www.googleapis.com/auth/drive.readonly',
];

// GET: Genera URL de autorización
export async function GET(): Promise<NextResponse> {
  const authUrl = new URL('https://accounts.google.com/o/oauth2/v2/auth');

  authUrl.searchParams.set('client_id', CLIENT_ID);
  authUrl.searchParams.set('redirect_uri', REDIRECT_URI);
  authUrl.searchParams.set('response_type', 'code');
  authUrl.searchParams.set('scope', SCOPES.join(' '));
  authUrl.searchParams.set('access_type', 'offline');
  authUrl.searchParams.set('prompt', 'consent');

  return NextResponse.json({
    success: true,
    authUrl: authUrl.toString(),
    message: 'Abre esta URL en tu navegador para autorizar',
  });
}

// POST: Intercambia código por tokens
export async function POST(request: NextRequest): Promise<NextResponse> {
  try {
    const { code } = await request.json();

    if (!code) {
      return NextResponse.json({
        success: false,
        error: 'Se requiere el código de autorización',
      });
    }

    // Intercambiar código por tokens
    const tokenResponse = await fetch('https://oauth2.googleapis.com/token', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams({
        client_id: CLIENT_ID,
        client_secret: CLIENT_SECRET,
        code,
        grant_type: 'authorization_code',
        redirect_uri: REDIRECT_URI,
      }),
    });

    const tokens = await tokenResponse.json();

    if (tokens.error) {
      return NextResponse.json({
        success: false,
        error: tokens.error_description || tokens.error,
      });
    }

    return NextResponse.json({
      success: true,
      tokens: {
        access_token: tokens.access_token,
        refresh_token: tokens.refresh_token,
        expires_in: tokens.expires_in,
      },
      message: 'Guarda el refresh_token en .env.local como GOOGLE_REFRESH_TOKEN',
    });
  } catch (error) {
    return NextResponse.json({
      success: false,
      error: error instanceof Error ? error.message : 'Error procesando tokens',
    });
  }
}
