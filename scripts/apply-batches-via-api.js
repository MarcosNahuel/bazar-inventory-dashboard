// Script para aplicar batches SQL via Supabase REST API
// Este script lee los archivos batch y los ejecuta secuencialmente

const fs = require('fs');
const path = require('path');

// Configuración desde .env.local
require('dotenv').config({ path: path.join(__dirname, '..', '.env.local') });

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_ROLE = process.env.SUPABASE_SERVICE_ROLE_KEY;

async function executeSql(sql) {
  const response = await fetch(`${SUPABASE_URL}/rest/v1/rpc/exec_sql`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'apikey': SUPABASE_SERVICE_ROLE,
      'Authorization': `Bearer ${SUPABASE_SERVICE_ROLE}`
    },
    body: JSON.stringify({ sql_query: sql })
  });

  if (!response.ok) {
    const text = await response.text();
    throw new Error(`Error ${response.status}: ${text}`);
  }

  return response.json();
}

async function main() {
  const batchDir = path.join(__dirname, 'sql_batches');
  const files = fs.readdirSync(batchDir)
    .filter(f => f.startsWith('batch_') && f.endsWith('.sql'))
    .sort();

  console.log(`Encontrados ${files.length} archivos batch`);

  for (const file of files) {
    const filePath = path.join(batchDir, file);
    const sql = fs.readFileSync(filePath, 'utf8');

    console.log(`\nProcesando ${file}...`);

    try {
      await executeSql(sql);
      console.log(`  ✓ ${file} completado`);
    } catch (error) {
      console.error(`  ✗ ${file} falló:`, error.message);
    }
  }

  console.log('\n¡Proceso completado!');
}

main().catch(console.error);
