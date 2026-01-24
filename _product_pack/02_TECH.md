# BAZAR Importaciones — Arquitectura Técnica
## Stack, Integraciones y Runbook de Deployment

**Producto:** Dashboard de Inventario
**Versión:** 1.0
**Última actualización:** Enero 2026

---

## Diagrama de Arquitectura

```
┌──────────────────────────────────────────────────────────────────────────┐
│                          BAZAR DASHBOARD (Next.js)                       │
│                                                                          │
│  ┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐     │
│  │   Dashboard UI   │  │   API Routes     │  │   Cron Jobs      │     │
│  │   (React 19)     │◄─┤   (Server-Side)  │◄─┤   (Vercel Cron)  │     │
│  └──────────────────┘  └──────────────────┘  └──────────────────┘     │
│           │                      │                                       │
│           │                      ▼                                       │
│           │           ┌──────────────────┐                             │
│           │           │   Cache Layer    │                             │
│           │           │   (1 hora TTL)   │                             │
│           │           └──────────────────┘                             │
└──────────────────────────┼───────────────────────────────────────────────┘
                           │
           ┌───────────────┼───────────────┐
           │               │               │
           ▼               ▼               ▼
  ┌────────────────┐  ┌──────────┐  ┌────────────┐
  │  Mercado Libre │  │ Supabase │  │    n8n     │
  │      API       │  │ (Postgres│  │ (Webhooks) │
  │  (OAuth2 REST) │  │   + RLS) │  │            │
  └────────────────┘  └──────────┘  └────────────┘
           │               │               │
           │               │               ▼
           │               │        ┌────────────┐
           │               │        │   Gmail    │
           │               │        │   SMTP     │
           │               │        └────────────┘
           │               │
           │               ▼
           │        ┌────────────┐
           │        │   Google   │
           │        │   Sheets   │
           │        └────────────┘
           │
           ▼
  ┌────────────────┐
  │   Gemini AI    │
  │   (OCR + NLP)  │
  └────────────────┘

```

---

## Tech Stack Detectado

### Frontend
| Tecnología | Versión | Uso |
|-----------|---------|-----|
| **Next.js** | 16.1.0 | Framework principal (App Router) |
| **React** | 19.2.3 | UI library |
| **Tailwind CSS** | 4.x | Estilos y diseño |
| **Recharts** | 3.6.0 | Gráficos y visualizaciones |
| **Lucide React** | 0.562.0 | Iconografía |
| **xlsx** | 0.18.5 | Lectura/escritura Excel |
| **react-dropzone** | 14.3.8 | Upload de archivos |
| **date-fns** | 4.1.0 | Manejo de fechas |
| **Zustand** | 5.0.9 | State management |

### Backend / API
| Tecnología | Versión | Uso |
|-----------|---------|-----|
| **Next.js API Routes** | 16.1.0 | Endpoints REST |
| **Supabase JS Client** | 2.89.0 | Cliente de base de datos |
| **Supabase SSR** | 0.8.0 | Autenticación server-side |
| **Puppeteer** | 24.34.0 | Generación de PDFs |

### Integraciones Externas
| Servicio | Uso | Endpoints/Métodos |
|----------|-----|-------------------|
| **Mercado Libre API** | Productos, órdenes, stock | `/users/{id}/items/search`, `/items`, `/orders/search` |
| **Google Sheets API** | Sincronización bidireccional | `googleapis` v169.0.0 |
| **Gemini AI** | OCR de facturas, NLP | `@google/generative-ai` v0.24.1 |
| **n8n** | Workflows de email | Webhooks HTTP |

### Infraestructura
| Componente | Proveedor | Características |
|-----------|-----------|----------------|
| **Hosting** | Vercel | Serverless, Edge Functions, CDN global |
| **Database** | Supabase | PostgreSQL 15, RLS, Real-time |
| **Storage** | Supabase Storage | Archivos, imágenes |
| **Auth** | Supabase Auth | OAuth, JWT |
| **Logs** | Vercel Logs | Centralizado, searchable |
| **Monitoring** | Vercel Analytics | Performance, Web Vitals |

---

## Stack Detallado por Archivo

### Configuración
- `package.json` — Dependencies (12 core, 7 dev)
- `next.config.ts` — Next.js config (Image domains, API routes)
- `tsconfig.json` — TypeScript strict mode
- `tailwind.config.ts` — Tailwind + Custom theme
- `vercel.json` — Deploy config (cron jobs definidos)
- `.env.example` — Variables requeridas (15 vars)

### Estructura de Código
```
src/
├── app/
│   ├── page.tsx               # Dashboard principal (3,365 líneas)
│   ├── layout.tsx             # Root layout + providers
│   ├── globals.css            # Estilos globales
│   └── api/                   # API Routes (23 endpoints)
│       ├── stats/             # KPIs generales
│       ├── inventory/         # Análisis de inventario (814 líneas)
│       ├── alerts/            # Sistema de alertas
│       ├── analytics/         # Analytics avanzados
│       ├── projections/       # Proyecciones ML (623 líneas)
│       ├── costs/             # Gestión de costos
│       ├── webhook/           # Webhooks n8n
│       ├── auth/refresh/      # Refresh token ML
│       ├── sync-to-sheet/     # Sincronización Google Sheets
│       ├── ocr/               # Procesamiento OCR
│       ├── sheets/            # API Google Sheets
│       ├── margins/           # Cálculo de márgenes
│       ├── purchase-orders/   # Órdenes de compra
│       ├── monthly-monitor/   # Monitoreo mensual
│       ├── flex-bonifications/# Cálculo bonificaciones
│       └── sync/              # Sincronización general
├── components/
│   ├── ui/TrafficLight.tsx    # Semáforo de stock
│   ├── charts/SalesChart.tsx  # Gráficos Recharts
│   └── CostUploader.tsx       # Upload Excel/CSV
├── lib/
│   ├── mercadolibre/
│   │   ├── client.ts          # Cliente ML API (534 líneas)
│   │   └── token-store.ts     # Persistencia tokens Supabase
│   ├── google-sheets/         # Cliente Google Sheets
│   ├── gemini/                # Cliente Gemini AI
│   ├── supabase/              # Cliente Supabase
│   ├── cache/                 # Sistema de caché
│   ├── inventory/             # Lógica de inventario
│   ├── margins/               # Cálculo de márgenes
│   └── purchase-orders/       # Lógica órdenes de compra
└── types/                     # TypeScript interfaces
```

---

## Integraciones

### 1. Mercado Libre API

**Autenticación:** OAuth 2.0 con refresh token automático

**Endpoints Utilizados:**
| Endpoint | Método | Uso | Archivo |
|----------|--------|-----|---------|
| `/users/{id}/items/search` | GET | Listar productos activos/pausados | `client.ts:134` |
| `/items?ids={ids}` | GET | Detalles de productos (batch) | `client.ts:178` |
| `/orders/search` | GET | Historial de órdenes | `client.ts:237` |
| `/users/{id}` | GET | Info del vendedor | `client.ts:310` |
| `/oauth/token` | POST | Refresh token | `client.ts:421` |

**Token Management:**
- Tokens se persisten en Supabase (`ml_tokens` table)
- Refresh automático 30 min antes de expirar
- Fallback a env vars si Supabase falla

**Rate Limits:**
- 10,000 requests/hora por cuenta
- Retry automático con exponential backoff
- Cache de 1 hora para reducir llamadas

**Evidencia:** `src/lib/mercadolibre/client.ts:1-534`, `src/lib/mercadolibre/token-store.ts`

---

### 2. Supabase (PostgreSQL + Auth + Storage)

**Esquema de Base de Datos:**

```sql
-- Tabla de productos (opcional, cache local)
CREATE TABLE products (
  id TEXT PRIMARY KEY,
  codigo_ml TEXT UNIQUE NOT NULL,
  sku TEXT,
  titulo TEXT NOT NULL,
  precio DECIMAL(12,2),
  costo DECIMAL(12,2),
  stock_total INTEGER DEFAULT 0,
  proveedor TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de costos (histórico de actualizaciones)
CREATE TABLE costs (
  id SERIAL PRIMARY KEY,
  codigo_ml TEXT REFERENCES products(codigo_ml),
  costo DECIMAL(12,2) NOT NULL,
  fecha_actualizacion TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de alertas enviadas
CREATE TABLE alerts (
  id SERIAL PRIMARY KEY,
  codigo_ml TEXT NOT NULL,
  tipo TEXT NOT NULL,
  mensaje TEXT,
  enviado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de tokens ML (persistencia)
CREATE TABLE ml_tokens (
  id SERIAL PRIMARY KEY,
  access_token TEXT NOT NULL,
  refresh_token TEXT NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

**Row Level Security (RLS):**
- Lectura pública en todas las tablas
- Escritura solo con `service_role_key`
- Políticas definidas en `supabase/migrations/`

**Evidencia:** `README.md:96-157`, `src/lib/supabase/`

---

### 3. n8n (Workflow Automation)

**Workflows Implementados:**
1. **Alertas de Stock Bajo** → Email vía Gmail SMTP
2. **Sincronización Google Sheets** → Actualización bidireccional
3. **Reportes semanales** → PDF + email a stakeholders

**Configuración:**
- Webhook URL configurado en `.env.local`
- Payload JSON con lista de productos críticos
- Template de email con HTML responsive

**Endpoint Dashboard:**
```typescript
// POST /api/webhook/send-alerts
{
  "productos": [
    { "codigo_ml": "MLC123", "titulo": "...", "stock": 2, "precio": 15990 }
  ],
  "threshold": 5,
  "urgentes": 3,
  "alerta": 7
}
```

**Evidencia:** `docs/PLAN_WORKFLOWS_N8N.md`, `src/app/api/webhook/`

---

### 4. Google Sheets API

**Autenticación:** Service Account con credentials JSON

**Operaciones:**
- **Lectura:** Importar datos de inventario/costos desde Sheets
- **Escritura:** Sincronizar productos/ventas al Sheets del contador
- **Formato:** Respeta headers y validación de columnas

**Archivo Config:** `bot-base-datos-4a9888eac573.json` (service account key)

**Evidencia:** `src/lib/google-sheets/`, `src/app/api/sheets/route.ts`

---

### 5. Gemini AI (OCR + NLP)

**Uso:** Procesamiento de facturas de proveedores para extraer costos

**Flujo:**
1. Usuario sube imagen/PDF de factura
2. Gemini extrae: Proveedor, Productos, Costos, Fecha
3. Sistema valida contra catálogo ML
4. Actualiza tabla `costs` en Supabase

**Modelo:** `gemini-1.5-flash` (rápido y económico)

**Evidencia:** `src/lib/gemini/`, `src/app/api/ocr/route.ts`

---

## Seguridad

### Gestión de Secretos
**Variables Sensibles (nunca en repo):**
- `ML_ACCESS_TOKEN`, `ML_REFRESH_TOKEN` → OAuth ML
- `SUPABASE_SERVICE_ROLE_KEY` → Acceso total DB
- `N8N_WEBHOOK_URL` → Endpoint privado
- `GOOGLE_APPLICATION_CREDENTIALS` → Service account

**Almacenamiento:**
- **Local:** `.env.local` (gitignored)
- **Producción:** Vercel Environment Variables (encrypted)
- **CI/CD:** GitHub Secrets (solo para deploy)

### Row Level Security (RLS)
- Políticas de lectura pública (datos no sensibles)
- Escritura solo con `service_role_key` desde backend
- Sin acceso directo desde frontend

### Roles Mínimos
- **Frontend:** Solo `anon_key` (permisos de lectura)
- **Backend:** `service_role_key` (acceso completo)
- **n8n:** Webhook con secret token en query params

### Entornos
| Entorno | URL | Branch | Purpose |
|---------|-----|--------|---------|
| **Desarrollo** | `localhost:3000` | - | Testing local |
| **Staging** | `bazar-dashboard-staging.vercel.app` | `develop` | QA pre-producción |
| **Producción** | `bazar-dashboard.vercel.app` | `main` | Cliente final |

### Backups
- **Supabase:** Backup automático diario (Point-in-Time Recovery 7 días)
- **Tokens ML:** Persistidos en Supabase + env vars como fallback
- **Código:** GitHub (repositorio privado)

---

## Observabilidad

### Logs
**Vercel Logs:**
- Console.log de APIs se captura en Vercel dashboard
- Retención: 30 días (plan Pro) / 1 hora (plan Hobby)
- Searchable por timestamp, función, nivel

**Logs Clave Implementados:**
```typescript
// client.ts:82-110
console.log('[ML Client] Token expiring soon, refreshing...');
console.log('[ML Client] No stored tokens, using env vars');

// stats/route.ts:70
console.error('Error fetching stats:', error);
```

### Métricas
**Vercel Analytics:**
- Web Vitals (LCP, FID, CLS)
- Page load times
- API response times

**ML API Monitoring:**
```typescript
// Custom metrics en client.ts
private async request<T>(endpoint: string) {
  const startTime = Date.now();
  // ... request
  const duration = Date.now() - startTime;
  console.log(`[ML API] ${endpoint} took ${duration}ms`);
}
```

### Alertas
**Configuradas:**
- n8n email cuando stock crítico
- *(Pendiente)* Sentry para errores 5xx
- *(Pendiente)* Vercel Monitoring Alerts para latencia > 5s

### Tracing
**Actualmente:** Basic console.log tracing
**Recomendado (futuro):** OpenTelemetry + Grafana

---

## Runbook Local

### Requisitos Previos
- **Node.js:** 18.0.0 o superior
- **npm:** 9.0.0 o superior (o pnpm/yarn)
- **Git:** Para clonar repositorio
- **Cuenta Mercado Libre:** Con app OAuth registrada
- **Proyecto Supabase:** (Opcional, funciona sin DB)
- **n8n instance:** (Opcional, solo para alertas email)

---

### Instalación Paso a Paso

#### 1. Clonar Repositorio
```bash
git clone https://github.com/MarcosNahuel/bazar-inventory-dashboard.git
cd bazar-inventory-dashboard
```

#### 2. Instalar Dependencias
```bash
# Opción 1: npm (recomendado)
npm install

# Opción 2: pnpm (más rápido)
pnpm install

# Opción 3: yarn
yarn install
```

**Tiempo estimado:** 2-3 minutos

---

#### 3. Configurar Variables de Entorno

```bash
# Copiar template
cp .env.example .env.local

# Editar .env.local
# Usar editor de texto o:
nano .env.local  # Linux/Mac
notepad .env.local  # Windows
```

**Variables OBLIGATORIAS:**
```env
# Supabase (obtener en https://app.supabase.com)
NEXT_PUBLIC_SUPABASE_URL=https://tu-proyecto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOi...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOi...

# Mercado Libre API (registrar app en https://developers.mercadolibre.com.ar)
ML_CLIENT_ID=1234567890123456
ML_CLIENT_SECRET=abcdefghijklmnopqrstuvwxyz123456
ML_ACCESS_TOKEN=APP_USR-1234567890-...
ML_REFRESH_TOKEN=TG-1234567890-...
ML_USER_ID=123456789
```

**Variables OPCIONALES:**
```env
# n8n (solo para alertas email)
N8N_WEBHOOK_URL=https://tu-n8n.com/webhook/alerts

# Umbral de stock bajo (default: 5)
STOCK_ALERT_THRESHOLD=5

# Excel (solo para desarrollo local)
EXCEL_PATH=./data/Inventario_ML.xlsx
```

---

#### 4. Configurar Base de Datos (Opcional)

**Si usas Supabase:**
```bash
# Opción A: Ejecutar migraciones desde archivo
# (Copiar SQL del README.md líneas 98-157)
# Pegar en Supabase SQL Editor

# Opción B: Usar Supabase CLI
npx supabase db push
```

**Tablas necesarias:**
- `products`
- `costs`
- `alerts`
- `ml_tokens`

**Si NO usas Supabase:**
- El dashboard funciona en modo read-only
- Solo muestra datos de ML API (no persiste costos)

---

#### 5. Levantar Servidor de Desarrollo

```bash
npm run dev
```

**Output esperado:**
```
> dashboard@0.1.0 dev
> next dev

   ▲ Next.js 16.1.0
   - Local:        http://localhost:3000
   - Network:      http://192.168.1.X:3000

 ✓ Ready in 3.2s
```

**Abrir navegador:** http://localhost:3000

---

### Troubleshooting

#### Problema 1: "Error: Invalid Supabase URL"
**Causa:** Variables `NEXT_PUBLIC_SUPABASE_URL` o `NEXT_PUBLIC_SUPABASE_ANON_KEY` incorrectas

**Solución:**
```bash
# Verificar variables
cat .env.local | grep SUPABASE

# Obtener credentials correctas:
# 1. Ir a https://app.supabase.com
# 2. Abrir tu proyecto
# 3. Settings > API
# 4. Copiar "Project URL" y "anon/public key"
```

---

#### Problema 2: "Error: ML API returned 401"
**Causa:** Tokens de Mercado Libre expirados o inválidos

**Solución:**
```bash
# Refrescar token manualmente
curl -X POST http://localhost:3000/api/auth/refresh

# Verificar respuesta (debe devolver nuevo access_token)
# Si falla, regenerar tokens en ML:
# https://developers.mercadolibre.com.ar/apps/
```

---

#### Problema 3: Dashboard carga lento (>30s)
**Causa:** Primera carga del día consulta 365 días de órdenes a ML API

**Solución:**
- **Esperar:** La primera carga tarda ~80 segundos
- **Siguientes cargas:** Cache de 1 hora, carga en ~2 segundos
- **Alternativa:** Reducir días históricos en `projections/route.ts:45`

```typescript
// Cambiar de 365 a 90 días
const ordersResult = await ml.getOrders(90, 1, 0); // línea 45
```

---

#### Problema 4: "Module not found: Can't resolve '@/components/...'"
**Causa:** TypeScript paths no configurados correctamente

**Solución:**
```bash
# Limpiar .next y reinstalar
rm -rf .next
rm -rf node_modules
npm install
npm run dev
```

---

#### Problema 5: Puerto 3000 ya está en uso
**Solución:**
```bash
# Opción 1: Usar otro puerto
PORT=3001 npm run dev

# Opción 2: Matar proceso en puerto 3000 (Linux/Mac)
lsof -ti:3000 | xargs kill -9

# Opción 3: Matar proceso en puerto 3000 (Windows)
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

---

### Testing Local

#### Verificar Endpoints API
```bash
# Test KPIs generales
curl http://localhost:3000/api/stats

# Test alertas de stock
curl http://localhost:3000/api/alerts

# Test proyecciones ML
curl http://localhost:3000/api/projections
```

#### Verificar Integración ML
```bash
# Ver si hay productos activos
curl http://localhost:3000/api/products

# Ver órdenes recientes
curl http://localhost:3000/api/orders
```

---

### Build de Producción

```bash
# Compilar para producción
npm run build

# Correr build localmente
npm start
```

**Output esperado:**
```
Route (app)                              Size     First Load JS
┌ ○ /                                    145 kB        189 kB
├ ○ /api/stats                           0 B            0 B
├ ○ /api/alerts                          0 B            0 B
└ ○ /api/projections                     0 B            0 B

✓ Compiled successfully
```

---

## Deploy en Vercel

### Opción 1: Deploy desde GitHub

1. **Conectar repositorio:**
   - Ir a https://vercel.com/new
   - Importar repositorio GitHub
   - Autorizar acceso

2. **Configurar variables:**
   - Settings > Environment Variables
   - Copiar todas las variables de `.env.local`
   - Aplicar a "Production", "Preview", "Development"

3. **Deploy:**
   - Vercel detecta automáticamente Next.js
   - Build command: `npm run build`
   - Output directory: `.next`
   - Install command: `npm install`

4. **Resultado:**
   - URL de producción: `https://tu-proyecto.vercel.app`
   - Preview URLs automáticas por cada push

---

### Opción 2: Deploy desde CLI

```bash
# Instalar Vercel CLI
npm i -g vercel

# Login
vercel login

# Deploy a preview
vercel

# Deploy a producción
vercel --prod
```

---

### Configuración de Cron Jobs (Vercel)

**Archivo:** `vercel.json`
```json
{
  "crons": [
    {
      "path": "/api/cron/sync-inventory",
      "schedule": "0 */6 * * *"
    },
    {
      "path": "/api/cron/check-alerts",
      "schedule": "0 8,14,20 * * *"
    }
  ]
}
```

**Horarios:**
- Sincronización inventario: Cada 6 horas
- Check de alertas: 8 AM, 2 PM, 8 PM (horario Chile)

---

## Comandos Útiles

### Desarrollo
```bash
# Levantar servidor dev
npm run dev

# Build de producción local
npm run build
npm start

# Linter (ESLint)
npm run lint

# Limpiar caché Next.js
rm -rf .next
```

### Base de Datos
```bash
# Conectar a Supabase desde CLI
npx supabase db remote commit

# Ejecutar migración
npx supabase db push

# Ver logs de DB
npx supabase db logs
```

### Testing (futuro)
```bash
# Unit tests (Jest)
npm run test

# E2E tests (Playwright)
npm run test:e2e

# Test coverage
npm run test:coverage
```

---

**Documentado:** Enero 2026
**Próxima revisión:** Febrero 2026 (post-deployment de features 30d)
