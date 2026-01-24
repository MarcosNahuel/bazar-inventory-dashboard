#!/usr/bin/env node
/**
 * Script para refrescar el access token de Mercado Libre
 * y actualizar automáticamente .mcp.json
 *
 * Uso: node scripts/refresh-ml-token.js
 */

const fs = require('fs');
const path = require('path');

// Configuración de la app de ML
const ML_CONFIG = {
  client_id: '3004336950612441',
  client_secret: 'GG5zMDMpovxuKWBeAV6dxNJMnF8uZ7lU',
  redirect_uri: 'https://agente-meli-n8n.7skqlp.easypanel.host/webhook/bazaro'
};

// Archivos
const PROJECT_ROOT = path.resolve(__dirname, '..');
const MCP_FILE = path.join(PROJECT_ROOT, '.mcp.json');
const TOKEN_FILE = path.join(PROJECT_ROOT, '.ml-tokens.json');

async function refreshToken() {
  console.log('🔄 Refrescando token de Mercado Libre...\n');

  // Leer tokens actuales
  let tokens;
  try {
    tokens = JSON.parse(fs.readFileSync(TOKEN_FILE, 'utf8'));
  } catch (e) {
    console.error('❌ No se encontró .ml-tokens.json');
    console.log('\nCreá el archivo con:');
    console.log(JSON.stringify({
      refresh_token: 'TU_REFRESH_TOKEN_AQUI',
      access_token: 'TU_ACCESS_TOKEN_ACTUAL'
    }, null, 2));
    process.exit(1);
  }

  // Llamar a la API de ML
  const params = new URLSearchParams({
    grant_type: 'refresh_token',
    client_id: ML_CONFIG.client_id,
    client_secret: ML_CONFIG.client_secret,
    refresh_token: tokens.refresh_token
  });

  try {
    const response = await fetch('https://api.mercadolibre.com/oauth/token', {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: params
    });

    if (!response.ok) {
      const error = await response.json();
      console.error('❌ Error de ML:', error);
      process.exit(1);
    }

    const newTokens = await response.json();
    console.log('✅ Token refrescado exitosamente');
    console.log(`   User ID: ${newTokens.user_id}`);
    console.log(`   Expira en: ${newTokens.expires_in / 3600} horas`);

    // Guardar nuevos tokens
    fs.writeFileSync(TOKEN_FILE, JSON.stringify({
      access_token: newTokens.access_token,
      refresh_token: newTokens.refresh_token,
      user_id: newTokens.user_id,
      expires_in: newTokens.expires_in,
      updated_at: new Date().toISOString()
    }, null, 2));
    console.log('\n✅ .ml-tokens.json actualizado');

    // Actualizar .mcp.json (Windows usa cmd /c, token está en args[7])
    const mcpConfig = JSON.parse(fs.readFileSync(MCP_FILE, 'utf8'));
    mcpConfig.mcpServers.mercadolibre.args[7] = `Authorization:Bearer ${newTokens.access_token}`;
    fs.writeFileSync(MCP_FILE, JSON.stringify(mcpConfig, null, 2));
    console.log('✅ .mcp.json actualizado');

    console.log('\n🎉 Listo! Reiniciá Claude Code para usar el nuevo token.');

  } catch (e) {
    console.error('❌ Error:', e.message);
    process.exit(1);
  }
}

refreshToken();
