/**
 * Callback de OAuth2 Google
 * Recibe el código de autorización y lo intercambia por tokens
 */

import { NextRequest, NextResponse } from 'next/server';

const CLIENT_ID = process.env.GOOGLE_CLIENT_ID || '';
const CLIENT_SECRET = process.env.GOOGLE_CLIENT_SECRET || '';
const REDIRECT_URI = process.env.GOOGLE_REDIRECT_URI || 'http://localhost:3000/api/auth/google/callback';

export async function GET(request: NextRequest): Promise<NextResponse> {
  const { searchParams } = new URL(request.url);
  const code = searchParams.get('code');
  const error = searchParams.get('error');

  if (error) {
    return new NextResponse(`
      <html>
        <body style="font-family: Arial; padding: 40px; text-align: center;">
          <h1 style="color: red;">Error de autorización</h1>
          <p>${error}</p>
        </body>
      </html>
    `, {
      headers: { 'Content-Type': 'text/html' },
    });
  }

  if (!code) {
    return new NextResponse(`
      <html>
        <body style="font-family: Arial; padding: 40px; text-align: center;">
          <h1 style="color: red;">No se recibió código</h1>
        </body>
      </html>
    `, {
      headers: { 'Content-Type': 'text/html' },
    });
  }

  try {
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
      return new NextResponse(`
        <html>
          <body style="font-family: Arial; padding: 40px; text-align: center;">
            <h1 style="color: red;">Error obteniendo tokens</h1>
            <p>${tokens.error_description || tokens.error}</p>
          </body>
        </html>
      `, {
        headers: { 'Content-Type': 'text/html' },
      });
    }

    // Mostrar tokens para copiar
    return new NextResponse(`
      <html>
        <head>
          <title>Autorización Exitosa</title>
          <style>
            body { font-family: Arial; padding: 40px; max-width: 800px; margin: 0 auto; }
            h1 { color: green; }
            .token-box {
              background: #f5f5f5;
              padding: 15px;
              border-radius: 8px;
              margin: 15px 0;
              word-break: break-all;
              font-family: monospace;
              font-size: 12px;
            }
            .label { font-weight: bold; margin-bottom: 5px; }
            .env-box {
              background: #1a1a2e;
              color: #0f0;
              padding: 20px;
              border-radius: 8px;
              margin-top: 20px;
              font-family: monospace;
              white-space: pre-wrap;
              word-break: break-all;
            }
          </style>
        </head>
        <body>
          <h1>✅ Autorización Exitosa!</h1>
          <p>Copia estos valores a tu archivo <code>.env.local</code>:</p>

          <div class="env-box"># Google OAuth2 Tokens
GOOGLE_ACCESS_TOKEN="${tokens.access_token}"
GOOGLE_REFRESH_TOKEN="${tokens.refresh_token || 'NO_REFRESH_TOKEN'}"</div>

          <h3>Detalles:</h3>
          <div class="label">Access Token (expira en ${tokens.expires_in}s):</div>
          <div class="token-box">${tokens.access_token}</div>

          <div class="label">Refresh Token (guardar este!):</div>
          <div class="token-box">${tokens.refresh_token || 'No se generó refresh token'}</div>

          <p style="margin-top: 30px; color: #666;">
            Puedes cerrar esta ventana después de copiar los tokens.
          </p>
        </body>
      </html>
    `, {
      headers: { 'Content-Type': 'text/html' },
    });
  } catch (error) {
    return new NextResponse(`
      <html>
        <body style="font-family: Arial; padding: 40px; text-align: center;">
          <h1 style="color: red;">Error</h1>
          <p>${error instanceof Error ? error.message : 'Error desconocido'}</p>
        </body>
      </html>
    `, {
      headers: { 'Content-Type': 'text/html' },
    });
  }
}
