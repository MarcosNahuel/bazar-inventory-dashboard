/**
 * Script para generar claves JWT seguras para Supabase Self-Hosted
 *
 * Genera:
 * - ANON_KEY: Para acceso público con RLS
 * - SERVICE_ROLE_KEY: Para bypass de RLS (solo backend)
 */

const jwt = require('jsonwebtoken');

// Nuevo JWT Secret seguro (32+ caracteres)
const JWT_SECRET = 'wcxrHXReql6/D8u6PZA83c0BXd/qv2zx46C0VL8bgQw=';

// Timestamps
const now = Math.floor(Date.now() / 1000);
const exp = now + (10 * 365 * 24 * 60 * 60); // 10 años de expiración

// Payload para ANON_KEY
const anonPayload = {
    role: 'anon',
    iss: 'supabase',
    iat: now,
    exp: exp
};

// Payload para SERVICE_ROLE_KEY
const serviceRolePayload = {
    role: 'service_role',
    iss: 'supabase',
    iat: now,
    exp: exp
};

// Generar tokens
const anonKey = jwt.sign(anonPayload, JWT_SECRET, { algorithm: 'HS256' });
const serviceRoleKey = jwt.sign(serviceRolePayload, JWT_SECRET, { algorithm: 'HS256' });

console.log('='.repeat(80));
console.log('SUPABASE JWT KEYS - GENERADAS CON NUEVO SECRET SEGURO');
console.log('='.repeat(80));
console.log('');
console.log('JWT_SECRET:');
console.log(JWT_SECRET);
console.log('');
console.log('-'.repeat(80));
console.log('ANON_KEY (para clientes/frontend):');
console.log(anonKey);
console.log('');
console.log('-'.repeat(80));
console.log('SERVICE_ROLE_KEY (solo backend, bypass RLS):');
console.log(serviceRoleKey);
console.log('');
console.log('='.repeat(80));
console.log('');
console.log('INSTRUCCIONES:');
console.log('1. Ir a Easypanel -> Supabase -> Environment');
console.log('2. Actualizar las siguientes variables:');
console.log('   - JWT_SECRET');
console.log('   - ANON_KEY');
console.log('   - SERVICE_ROLE_KEY');
console.log('3. Reiniciar TODOS los servicios de Supabase');
console.log('4. Actualizar las credenciales en tu aplicación');
console.log('');

// Verificar los tokens
console.log('VERIFICACIÓN:');
const decodedAnon = jwt.verify(anonKey, JWT_SECRET);
const decodedService = jwt.verify(serviceRoleKey, JWT_SECRET);
console.log('ANON decoded:', JSON.stringify(decodedAnon, null, 2));
console.log('SERVICE_ROLE decoded:', JSON.stringify(decodedService, null, 2));
