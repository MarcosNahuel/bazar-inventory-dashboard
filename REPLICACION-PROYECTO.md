# CRM Postventa Multi-Canal - Guia de Replicacion Completa

**Proyecto:** TiendaLubbi CRM Postventa
**Version:** 1.0.0
**Fecha:** Diciembre 2024
**Stack:** Next.js 14 + Supabase + n8n + MercadoLibre API

---

## Indice

1. [Vision General](#1-vision-general)
2. [Stack Tecnologico](#2-stack-tecnologico)
3. [Estructura del Proyecto](#3-estructura-del-proyecto)
4. [Configuracion de Entorno](#4-configuracion-de-entorno)
5. [Modulos del Sistema](#5-modulos-del-sistema)
6. [API Routes (Backend)](#6-api-routes-backend)
7. [Endpoints MercadoLibre](#7-endpoints-mercadolibre)
8. [Integracion n8n](#8-integracion-n8n)
9. [Base de Datos Supabase](#9-base-de-datos-supabase)
10. [Componentes React](#10-componentes-react)
11. [Tipos TypeScript](#11-tipos-typescript)
12. [Hooks Personalizados](#12-hooks-personalizados)
13. [Datos Estaticos](#13-datos-estaticos)
14. [Paso a Paso: Replicar en Nuevo Repo](#14-paso-a-paso-replicar-en-nuevo-repo)
15. [Checklist de Verificacion](#15-checklist-de-verificacion)

---

## 1. Vision General

### Que es este proyecto?

CRM de atencion al cliente para vendedores de MercadoLibre con:

- **Preventa:** Respuestas automaticas a preguntas de productos (antes de la compra)
- **Postventa:** Soporte post-compra (tracking, facturacion, garantia, devoluciones)
- **Dashboard:** Analytics de ventas, proyecciones, segmentacion de clientes
- **Soporte:** Panel de escalaciones para atencion humana
- **Stock:** Dashboard de inventario con alertas de reorden

### Arquitectura

```
+-------------------+     +------------------+     +--------------------+
|   Next.js 14      |     |      n8n         |     |   MercadoLibre     |
|   (Frontend)      |<--->|   (Automation)   |<--->|      API           |
+-------------------+     +------------------+     +--------------------+
         |                        |
         |                        |
         v                        v
+-------------------+     +------------------+
|    Supabase       |     |     Redis        |
|   (PostgreSQL)    |     |   (Tokens ML)    |
+-------------------+     +------------------+
```

---

## 2. Stack Tecnologico

### Frontend

| Tecnologia | Version | Uso |
|------------|---------|-----|
| Next.js | 14.1.0 | Framework React con SSR |
| React | 18.2.0 | UI Components |
| TypeScript | 5.x | Type Safety |
| Tailwind CSS | 3.3.0 | Estilos |
| Recharts | 3.5.1 | Graficos |
| Lucide React | 0.378.0 | Iconografia |
| React Query | 5.90.12 | Data Fetching |
| Papa Parse | 5.4.1 | Parseo CSV |

### Backend

| Tecnologia | Version | Uso |
|------------|---------|-----|
| Next.js API Routes | 14.1.0 | Serverless Functions |
| Supabase | 2.87.1 | PostgreSQL + Auth |
| ioredis | 5.8.2 | Redis Client |
| n8n | - | Workflows de automatizacion |

### Servicios Externos

| Servicio | Proposito |
|----------|-----------|
| MercadoLibre API | OAuth, Orders, Items, Messages, Shipping |
| Google Gemini | AI para mejora de respuestas |
| Vercel | Hosting (produccion) |
| EasyPanel | Supabase Self-Hosted + n8n |

---

## 3. Estructura del Proyecto

```
tienda-frontend-meli-github/
├── app/                              # Next.js App Router
│   ├── (auth)/                       # Grupo rutas autenticadas
│   │   ├── layout.tsx
│   │   └── login/page.tsx
│   ├── api/                          # API Routes
│   │   ├── classify/route.ts         # Clasificacion con Gemini
│   │   ├── dashboard/stock/route.ts  # Datos stock dashboard
│   │   ├── estrategia/route.ts       # Config estrategia IA
│   │   ├── postventa/route.ts        # Webhook postventa
│   │   ├── preventa/route.ts         # Webhook preventa
│   │   ├── support/
│   │   │   ├── get-conversation/route.ts
│   │   │   ├── improve-response/route.ts
│   │   │   └── send-reply/route.ts
│   │   ├── sync/orders/route.ts      # Cron sync ordenes
│   │   └── system-prompt/route.ts    # Config prompts IA
│   ├── auth/callback/route.ts        # OAuth callback
│   ├── components/                   # Componentes React
│   │   ├── AIPromptConfigModal.tsx
│   │   ├── ChatPanel.tsx
│   │   ├── ConversationList.tsx
│   │   ├── ConversationPanel.tsx
│   │   ├── CreateSimulatedOrderModal.tsx
│   │   ├── EscalationDetail.tsx
│   │   ├── EscalationList.tsx
│   │   ├── Footer.tsx
│   │   ├── InteractionPanel.tsx
│   │   ├── MyPurchases.tsx
│   │   ├── PostSaleChat.tsx
│   │   ├── ProductCard.tsx
│   │   ├── ProductDetail.tsx
│   │   ├── RealOrderChat.tsx
│   │   ├── SearchBar.tsx
│   │   ├── SimulatePurchaseModal.tsx
│   │   ├── StatsBar.tsx
│   │   ├── StockDashboard.tsx
│   │   ├── StrategyCanvas.tsx
│   │   └── SupportPanel.tsx
│   ├── conversaciones/page.tsx       # Panel CRM
│   ├── dashboard/page.tsx            # Analytics
│   ├── estrategia/page.tsx           # Config IA
│   ├── historial/page.tsx            # Historial interacciones
│   ├── soporte/page.tsx              # Escalaciones
│   ├── globals.css
│   ├── layout.tsx
│   └── page.tsx                      # Home/Selector
├── lib/
│   ├── supabase/
│   │   ├── client.ts                 # Cliente browser
│   │   ├── server.ts                 # Cliente server
│   │   └── middleware.ts
│   └── utils.ts                      # Helpers (cn, formatRelativeTime)
├── types/
│   ├── index.ts                      # Tipos principales
│   └── stock.ts                      # Tipos stock
├── hooks/
│   ├── useSimulatedOrders.ts         # Ordenes simuladas
│   └── useRealOrders.ts              # Ordenes reales
├── public/data/                      # Datos estaticos
│   ├── agent-strategies-v2.json
│   ├── association_rules.csv
│   ├── categories.csv
│   ├── insights.json
│   ├── monthly_sales_full.csv
│   ├── orders.csv
│   ├── preloaded-orders.json
│   ├── products.csv
│   ├── projections.json
│   ├── real-orders.json
│   ├── stats_full.json
│   ├── test-scenarios.json
│   ├── top_customers.csv
│   └── weekly_sales_full.csv
├── n8n-workflows/                    # Workflows n8n
│   ├── get-ml-token-webhook.json
│   ├── herramienta-soporte-postventa-UPDATED.json
│   ├── postventa-enrich-escalation.json
│   ├── sync-orders-daily.json
│   ├── sync-orders-full.json
│   ├── sync-stock-ml-v2.json
│   ├── sync-stock-ml.json
│   └── README.md
├── supabase/migrations/              # Migraciones SQL
│   ├── 001_create_tables.sql
│   ├── 002_complete_stock_system.sql
│   ├── 004_add_escalation_enrichment_fields.sql
│   ├── 005_create_ai_strategies_table.sql
│   ├── 006_add_conversation_source.sql
│   ├── 007_create_ml_orders_table.sql
│   └── 008_metrics_functions.sql
├── .env.local                        # Variables de entorno
├── .env.example
├── next.config.js
├── tailwind.config.ts
├── tsconfig.json
└── package.json
```

---

## 4. Configuracion de Entorno

### Variables de Entorno (.env.local)

```env
# ========================================
# SUPABASE (Self-Hosted o Cloud)
# ========================================
NEXT_PUBLIC_SUPABASE_URL=https://tu-supabase-url.com
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# ========================================
# n8n WEBHOOKS
# ========================================
# Webhook para chat preventa
NEXT_PUBLIC_WEBHOOK_URL=https://tu-n8n-url.com/webhook/PREVENTA_WEBHOOK_ID/chat

# ========================================
# GOOGLE GEMINI (AI)
# ========================================
GEMINI_API_KEY=AIzaSy...tu-api-key

# ========================================
# MERCADOLIBRE API
# ========================================
ML_CLIENT_ID=tu-client-id
ML_CLIENT_SECRET=tu-client-secret
ML_SELLER_ID=tu-seller-id
ML_REDIRECT_URI=https://tu-n8n-url.com/webhook/oauth-callback
ML_REFRESH_TOKEN=TG-...tu-refresh-token

# ========================================
# REDIS (para tokens ML)
# ========================================
REDIS_HOST=tu-redis-host.com
REDIS_PORT=6379
REDIS_PASSWORD=tu-password

# ========================================
# CRON (Vercel)
# ========================================
CRON_SECRET=tu-cron-secret
```

### next.config.js

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    domains: ['http2.mlstatic.com'],
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**.mlstatic.com',
      },
    ],
  },
}

module.exports = nextConfig
```

### tailwind.config.ts

```typescript
import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        'ml-yellow': '#FFE600',  // MercadoLibre Yellow
        'ml-blue': '#3483FA',    // MercadoLibre Blue
        'ml-green': '#00A650',   // MercadoLibre Green
      },
    },
  },
  plugins: [],
}
export default config
```

---

## 5. Modulos del Sistema

### 5.1 Modulo Preventa

**Proposito:** Responder preguntas de compradores ANTES de la compra.

**Flujo:**
1. Usuario navega catalogo de productos (cargado desde CSV)
2. Selecciona producto y ve detalle
3. Hace pregunta en chat
4. Sistema envia a `/api/preventa` -> n8n webhook
5. IA responde sobre compatibilidad, stock, envio, garantia, precio

**Componentes:**
- `ProductCard.tsx` - Tarjeta de producto
- `ProductDetail.tsx` - Detalle con chat
- `SearchBar.tsx` - Busqueda de productos

**API Route:**
- `POST /api/preventa`
  - Body: `{ chatInput: "MLA123 - pregunta", sessionId: "uuid" }`
  - Response: `{ text: "respuesta IA" }`

**Webhook n8n:**
- URL: `https://n8n-url/webhook/{ID}/chat`
- Fallback: Mock responses si n8n no disponible

### 5.2 Modulo Postventa

**Proposito:** Soporte post-compra (tracking, factura, devolucion, garantia).

**Flujo:**
1. Usuario selecciona orden (simulada o real)
2. Envia mensaje sobre su problema
3. Sistema envia a `/api/postventa` -> n8n webhook
4. IA responde segun escenario (delivered, in_transit, pending, etc.)
5. Si no puede resolver, escala a humano

**Componentes:**
- `MyPurchases.tsx` - Lista de ordenes
- `PostSaleChat.tsx` - Chat ordenes simuladas
- `RealOrderChat.tsx` - Chat ordenes reales
- `CreateSimulatedOrderModal.tsx` - Crear ordenes test

**API Route:**
- `POST /api/postventa`
  - Body: Payload formato webhook MercadoLibre
  - Response: `{ output: "respuesta", toolUsed: "tracking|facturacion|garantia" }`

**Escenarios de Test:**
```json
[
  { "id": "normal_delivered", "name": "Entregado Normal", "shipping_status": "delivered" },
  { "id": "pending_shipping", "name": "Pendiente Envio", "shipping_status": "pending" },
  { "id": "in_transit", "name": "En Transito", "shipping_status": "in_transit" },
  { "id": "flex_delivery", "name": "Flex (mismo dia)", "logistic_type": "fulfillment" },
  { "id": "return_request", "name": "Solicita Devolucion", "days_since_delivery": 5 },
  { "id": "factura_a_eligible", "name": "Factura A (CUIT)", "can_receive_factura_a": true },
  { "id": "factura_a_ineligible", "name": "Factura A (DNI)", "can_receive_factura_a": false }
]
```

### 5.3 Modulo Dashboard Analytics

**Proposito:** Visualizacion de metricas de negocio.

**Tabs:**
1. **Overview** - KPIs generales (revenue, orders, customers)
2. **Products** - Productos estrella, Pareto, categorias
3. **Customers** - Top clientes, segmentacion RFM
4. **Insights** - Insights de negocio
5. **Proyecciones 2026** - Forecast con ML
6. **Stock** - Dashboard inventario

**Datos:**
- Carga desde archivos JSON/CSV en `/public/data/`
- 13 meses de datos historicos
- 71,983 ordenes
- 40,000+ clientes

**Componentes:**
- `dashboard/page.tsx` - Panel principal (1546 lineas)
- `StockDashboard.tsx` - Inventario

### 5.4 Modulo Soporte (Escalaciones)

**Proposito:** Panel para atencion humana de casos escalados.

**Flujo:**
1. IA detecta caso que no puede resolver
2. Crea escalacion en Supabase
3. Agente humano ve caso en panel
4. Puede mejorar respuesta con Gemini
5. Envia respuesta a MercadoLibre

**Componentes:**
- `SupportPanel.tsx` - Panel principal
- `EscalationList.tsx` - Lista con filtros
- `EscalationDetail.tsx` - Detalle y respuesta

**API Routes:**
- `GET /api/support/get-conversation` - Obtener conversacion
- `POST /api/support/improve-response` - Mejorar con Gemini
- `POST /api/support/send-reply` - Enviar a ML

### 5.5 Modulo Estrategia IA

**Proposito:** Configurar prompts del agente IA.

**Componentes:**
- `estrategia/page.tsx` - Pagina config
- `StrategyCanvas.tsx` - Editor visual de prompts

**API Routes:**
- `GET/POST /api/system-prompt` - CRUD de prompts

### 5.6 Modulo Conversaciones CRM

**Proposito:** Historial de conversaciones desde Supabase.

**Componentes:**
- `conversaciones/page.tsx` - Panel CRM
- `ConversationList.tsx` - Lista
- `ConversationPanel.tsx` - Detalle
- `ChatPanel.tsx` - Chat bidireccional

---

## 6. API Routes (Backend)

### 6.1 /api/postventa/route.ts

```typescript
// Webhook para consultas postventa
// Intenta n8n, fallback a mock responses

const POSTVENTA_WEBHOOK_URL = 'https://n8n-url/webhook/postventa-simulacion'

interface SimulationData {
  is_test: boolean
  is_real_order: boolean
  order_id: string
  message: string
  buyer: { id, first_name, last_name, nickname }
  product: { id, title, price, sku, quantity }
  shipping: { id, status, carrier, logistic_type, tracking_number, dates... }
  billing: { doc_type, doc_number, taxpayer_type, can_receive_factura_a }
  days_since_delivery: number | null
  has_mediation: boolean
  scenario: { id, name, icon }
}

// Logica de mock responses:
// - Tracking: detecta "donde", "pedido", "envio"
// - Factura: detecta "factura", "comprobante", "cuit"
// - Devolucion: detecta "devol", "cambio", "reembolso"
// - Garantia: detecta "garantia", "falla", "defecto"
// - Compatibilidad: detecta "compatible", "sirve"
// - Instalacion: detecta "instala", "colocar"
```

### 6.2 /api/preventa/route.ts

```typescript
// Webhook para consultas preventa
// Intenta n8n, fallback a mock responses

const PREVENTA_WEBHOOK_URL = 'https://n8n-url/webhook/{ID}/chat'

// Input: { chatInput: "MLA123 - pregunta", sessionId: "uuid" }
// Output: { text: "respuesta" }

// Mock responses para:
// - Compatibilidad, Stock, Envio, Garantia, Precio, Instalacion, Factura
```

### 6.3 /api/support/send-reply/route.ts

```typescript
// Enviar respuesta de soporte a MercadoLibre

// 1. Obtiene token ML desde n8n webhook o Redis directo
// 2. Obtiene buyer_id del pack si no viene
// 3. Envia mensaje via ML Messages API
// 4. Actualiza escalacion en Supabase

async function getMLToken(): Promise<string | null> {
  // Primary: n8n webhook /get-ml-token
  // Fallback: Redis directo (key: 'melipablo')
}

async function sendMessageToML(packId, message, token, buyerId?) {
  // POST https://api.mercadolibre.com/messages/packs/{packId}/sellers/{sellerId}?tag=post_sale
  // Headers: Authorization: Bearer {token}, x-format-new: true
  // Body: { from: { user_id: sellerId }, to: { user_id: buyerId }, text: message }
}
```

### 6.4 /api/support/improve-response/route.ts

```typescript
// Mejora respuesta con Google Gemini

// POST /api/support/improve-response
// Body: { response: "respuesta original", context: "contexto del caso" }
// Output: { improved: "respuesta mejorada" }

// Usa: gemini-2.0-flash
```

### 6.5 /api/dashboard/stock/route.ts

```typescript
// Retorna datos de stock dashboard desde Supabase view
// GET /api/dashboard/stock
// Output: Array de items con metricas
```

### 6.6 /api/sync/orders/route.ts

```typescript
// Cron job para sincronizar ordenes desde ML
// Ejecuta diariamente
// Verifica CRON_SECRET en header Authorization
```

---

## 7. Endpoints MercadoLibre

### 7.1 OAuth2 Authentication

```
POST https://api.mercadolibre.com/oauth/token

Body:
{
  "grant_type": "refresh_token",
  "client_id": ML_CLIENT_ID,
  "client_secret": ML_CLIENT_SECRET,
  "refresh_token": ML_REFRESH_TOKEN
}

Response:
{
  "access_token": "APP_USR-...",
  "token_type": "Bearer",
  "expires_in": 21600,
  "scope": "...",
  "user_id": 1234567,
  "refresh_token": "TG-..."
}
```

### 7.2 Orders API

```
GET https://api.mercadolibre.com/orders/search?seller={sellerId}&order.status=paid

Headers:
  Authorization: Bearer {access_token}

Response:
{
  "results": [
    {
      "id": 2000001234567890,
      "status": "paid",
      "total_amount": 85000,
      "buyer": { "id": 123456, "nickname": "COMPRADOR" },
      "order_items": [{ "item": { "id": "MLA123" }, "quantity": 1 }],
      "shipping": { "id": 44172088895 }
    }
  ]
}
```

### 7.3 Items API

```
GET https://api.mercadolibre.com/items/{itemId}

Response:
{
  "id": "MLA123456789",
  "title": "Kit Inyectores Chevrolet Corsa x4",
  "price": 85000,
  "available_quantity": 12,
  "thumbnail": "https://http2.mlstatic.com/...",
  "attributes": [{ "id": "SELLER_SKU", "value_name": "INY-CORSA-X4" }]
}
```

### 7.4 Messages API

```
# Obtener mensajes de un pack
GET https://api.mercadolibre.com/messages/packs/{packId}/sellers/{sellerId}?tag=post_sale

# Enviar mensaje
POST https://api.mercadolibre.com/messages/packs/{packId}/sellers/{sellerId}?tag=post_sale

Headers:
  Authorization: Bearer {access_token}
  Content-Type: application/json
  x-format-new: true

Body:
{
  "from": { "user_id": {sellerId} },
  "to": { "user_id": {buyerId} },
  "text": "Tu mensaje aqui"
}
```

### 7.5 Shipping API

```
GET https://api.mercadolibre.com/shipments/{shipmentId}

Response:
{
  "id": 44172088895,
  "status": "delivered",
  "logistic_type": "cross_docking",
  "tracking_number": "MEL123456",
  "date_delivered": "2024-12-05T14:30:00.000Z"
}
```

### 7.6 Inventory API

```
GET https://api.mercadolibre.com/users/{sellerId}/items/search?status=active

Response:
{
  "results": ["MLA123", "MLA456", ...],
  "paging": { "total": 1500, "offset": 0, "limit": 50 }
}
```

---

## 8. Integracion n8n

### 8.1 Workflows Incluidos

| Archivo | Endpoint | Descripcion |
|---------|----------|-------------|
| `get-ml-token-webhook.json` | GET /webhook/get-ml-token | Retorna token ML desde Redis |
| `postventa-enrich-escalation.json` | POST /webhook/enrich-escalation | Enriquece escalacion con datos ML |
| `sync-orders-daily.json` | Cron (6h) | Sync ordenes ultimos 30 dias |
| `sync-orders-full.json` | Manual | Sync ordenes 365 dias (inicial) |
| `sync-stock-ml-v2.json` | Cron (6h) | Sync items y stock |
| `herramienta-soporte-postventa-UPDATED.json` | - | Workflow principal postventa |

### 8.2 URLs de Webhooks (Produccion TiendaLubbi)

```
Base URL: https://horsepower-n8n.e5l6dk.easypanel.host

Webhooks:
- /webhook/get-ml-token              # Token ML
- /webhook/postventa-simulacion      # Chat postventa
- /webhook/22c34ea9-.../chat         # Chat preventa
- /webhook/enrich-escalation         # Enriquecer escalacion
- /webhook/meliprowallpostventahp    # OAuth callback
```

### 8.3 Como Importar Workflows

1. Ir a tu instancia n8n
2. Click "Add Workflow" > "Import from File"
3. Seleccionar archivo JSON de `/n8n-workflows/`
4. Configurar credenciales:
   - **Redis account**: Conexion a Redis
   - **Supabase account**: API de Supabase
   - **MercadoLibre OAuth**: Client ID/Secret
5. Activar workflow (toggle Active)
6. Copiar URL del webhook generado

### 8.4 Credenciales Necesarias en n8n

```yaml
Redis:
  Host: tu-redis-host.com
  Port: 6379
  Password: tu-password
  Key para token: "melipablo"

Supabase:
  URL: https://tu-supabase-url.com
  API Key: service_role_key

MercadoLibre:
  Client ID: tu-client-id
  Client Secret: tu-client-secret
  Seller ID: tu-seller-id
```

---

## 9. Base de Datos Supabase

### 9.1 Tablas Principales

```sql
-- Conversaciones
conversations (
  id UUID PRIMARY KEY,
  pack_id BIGINT,
  buyer_id BIGINT NOT NULL,
  buyer_nickname VARCHAR(100),
  status VARCHAR(20),  -- pending, in_progress, resolved, escalated
  case_type VARCHAR(50),
  assigned_to UUID,
  first_message_at TIMESTAMPTZ,
  last_message_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ
)

-- Mensajes
messages (
  id UUID PRIMARY KEY,
  conversation_id UUID REFERENCES conversations,
  direction VARCHAR(10),  -- inbound, outbound
  sender_type VARCHAR(20), -- buyer, seller, ai, system
  content TEXT,
  responder_type VARCHAR(20),
  tool_used VARCHAR(50),
  ml_message_id VARCHAR(100),
  sent_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ
)

-- Escalaciones
escalations / support_escalations (
  id UUID PRIMARY KEY,
  buyer_id VARCHAR(50),
  buyer_nickname VARCHAR(100),
  pack_id VARCHAR(50),
  order_id VARCHAR(50),
  buyer_message TEXT,
  reason TEXT,
  case_type VARCHAR(50),
  source VARCHAR(20),  -- postventa, preventa, manual
  status VARCHAR(20),  -- pending, in_progress, resolved, dismissed
  priority INT,
  human_response TEXT,
  -- Campos enriquecidos
  product_title TEXT,
  product_sku TEXT,
  product_price NUMERIC,
  envio_status TEXT,
  envio_fecha_entrega TIMESTAMPTZ,
  envio_dias_desde_entrega INT,
  ml_response_sent BOOLEAN,
  ml_response_sent_at TIMESTAMPTZ,
  resumen_caso TEXT,
  ...
)

-- Items MercadoLibre
ml_items (
  item_id TEXT PRIMARY KEY,
  title TEXT,
  permalink TEXT,
  thumbnail TEXT,
  price NUMERIC,
  available_quantity INT,
  status TEXT,
  sku TEXT,
  category_id TEXT,
  seller_id TEXT,
  created_at TIMESTAMPTZ,
  updated_at TIMESTAMPTZ
)

-- Ordenes Items
ml_orders_items (
  id SERIAL PRIMARY KEY,
  order_id TEXT,
  item_id TEXT REFERENCES ml_items,
  quantity INT,
  unit_price NUMERIC,
  order_date TIMESTAMPTZ,
  created_at TIMESTAMPTZ
)

-- Metricas de Items
ml_item_metrics (
  item_id TEXT PRIMARY KEY REFERENCES ml_items,
  units_sold_30d INT,
  units_sold_90d INT,
  avg_daily_30d NUMERIC,
  days_cover NUMERIC,
  lead_time_days INT,
  safety_stock_units NUMERIC,
  reorder_point_units NUMERIC,
  reorder_in_days NUMERIC,
  reorder_date TIMESTAMPTZ,
  severity TEXT,  -- critical, warning, ok
  calculated_at TIMESTAMPTZ
)
```

### 9.2 Ejecutar Migraciones

```bash
# En orden, ejecutar cada archivo en Supabase SQL Editor:

1. supabase/migrations/001_create_tables.sql
2. supabase/migrations/002_complete_stock_system.sql
3. supabase/migrations/004_add_escalation_enrichment_fields.sql
4. supabase/migrations/005_create_ai_strategies_table.sql
5. supabase/migrations/006_add_conversation_source.sql
6. supabase/migrations/007_create_ml_orders_table.sql
7. supabase/migrations/008_metrics_functions.sql
```

### 9.3 View de Stock Dashboard

```sql
CREATE OR REPLACE VIEW v_stock_dashboard AS
SELECT
  i.item_id, i.title, i.price, i.available_quantity, i.status, i.sku,
  COALESCE(m.units_sold_30d, 0) as units_sold_30d,
  COALESCE(m.avg_daily_30d, 0) as avg_daily_30d,
  m.days_cover, m.reorder_in_days, m.reorder_date,
  COALESCE(m.severity, 'ok') as severity
FROM ml_items i
LEFT JOIN ml_item_metrics m ON i.item_id = m.item_id
WHERE i.status = 'active';
```

### 9.4 Funcion Recalculo Metricas

```sql
-- Recalcular metricas de un item
SELECT recalculate_item_metrics('MLA1234567890');

-- Recalcular TODAS las metricas
SELECT * FROM recalculate_all_metrics();

-- RPC desde API/n8n
SELECT refresh_stock_metrics();
```

---

## 10. Componentes React

### 10.1 Componentes Principales

| Componente | Lineas | Proposito |
|------------|--------|-----------|
| `page.tsx` (Home) | 616 | Selector Preventa/Postventa/Dashboard |
| `dashboard/page.tsx` | 1546 | Analytics completo |
| `EscalationDetail.tsx` | 871 | Detalle escalacion |
| `StrategyCanvas.tsx` | 953 | Config prompts IA |
| `CreateSimulatedOrderModal.tsx` | 597 | Crear ordenes test |
| `MyPurchases.tsx` | 562 | Panel ordenes |
| `StockDashboard.tsx` | 517 | Dashboard inventario |
| `ProductDetail.tsx` | 390 | Detalle producto |
| `RealOrderChat.tsx` | 380 | Chat ordenes reales |
| `PostSaleChat.tsx` | 365 | Chat ordenes simuladas |
| `InteractionPanel.tsx` | 353 | Panel interacciones |
| `EscalationList.tsx` | 336 | Lista escalaciones |

### 10.2 Patron de Componente Chat

```tsx
// Ejemplo: PostSaleChat.tsx

interface Props {
  order: SimulatedOrder
  onMessageSent: (message: SimulatedMessage) => void
}

export default function PostSaleChat({ order, onMessageSent }: Props) {
  const [input, setInput] = useState('')
  const [isLoading, setIsLoading] = useState(false)

  const handleSend = async () => {
    // 1. Crear mensaje del usuario
    const userMessage = { role: 'user', content: input, timestamp: new Date() }
    onMessageSent(userMessage)

    // 2. Construir payload formato ML
    const payload = {
      _id: `test-${Date.now()}`,
      topic: 'messages',
      resource: `pack-${order.id}`,
      user_id: SELLER_ID,
      _simulation: {
        is_test: true,
        order_id: order.id,
        message: input,
        buyer: order.buyer,
        product: order.product,
        shipping: order.shipping,
        billing: order.billing,
        days_since_delivery: order.daysSinceDelivery,
        scenario: order.scenario
      }
    }

    // 3. Llamar API
    const response = await fetch('/api/postventa', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    })

    // 4. Agregar respuesta IA
    const data = await response.json()
    const aiMessage = { role: 'assistant', content: data.output, timestamp: new Date() }
    onMessageSent(aiMessage)
  }

  return (
    <div className="flex flex-col h-full">
      {/* Messages */}
      <div className="flex-1 overflow-y-auto">
        {order.messages.map((msg, i) => (
          <MessageBubble key={i} message={msg} />
        ))}
      </div>

      {/* Input */}
      <div className="border-t p-4">
        <input value={input} onChange={(e) => setInput(e.target.value)} />
        <button onClick={handleSend} disabled={isLoading}>Enviar</button>
      </div>
    </div>
  )
}
```

---

## 11. Tipos TypeScript

### types/index.ts

```typescript
export interface Buyer {
  id: number
  nickname: string
  first_name: string | null
  last_name: string | null
  email: string | null
  phone: string | null
  created_at: string
  updated_at: string
}

export interface Order {
  id: number
  buyer_id: number
  status: string
  total_amount: number
  shipping_status: string | null
  shipping_id: string | null
  created_at: string
  updated_at: string
}

export interface Message {
  id: string
  conversation_id: string
  meli_message_id: string | null
  direction: 'inbound' | 'outbound'
  sender_type: 'buyer' | 'seller' | 'ai'
  content: string
  responder_type: 'ai' | 'human' | null
  sent_at: string
  created_at: string
}

export interface Conversation {
  id: string
  pack_id: number
  buyer_id: number
  status: 'pending' | 'in_progress' | 'resolved'
  case_type: string | null
  assigned_to: string | null
  first_message_at: string
  last_message_at: string
  created_at: string
  updated_at: string
  buyer?: Buyer
  messages?: Message[]
}

export interface Escalation {
  id: string
  buyer_id: string | null
  buyer_nickname: string | null
  buyer_name: string | null
  pack_id: string | null
  order_id: string | null
  message_original: string | null
  original_message: string | null
  reason: string
  case_type: string | null
  source: 'postventa' | 'preventa'
  status: 'pending' | 'in_progress' | 'resolved' | 'dismissed'
  priority: number
  is_urgent: boolean
  assigned_to: string | null
  human_response: string | null
  ai_response: string | null
  resolved_at: string | null
  resolution_notes: string | null
  n8n_execution_id: string | null
  workflow_id: string | null
  created_at: string
  updated_at: string
  // Product info
  product_title: string | null
  product_sku: string | null
  product_price: number | null
  // Shipping info
  envio_status: string | null
  envio_fecha_entrega: string | null
  envio_dias_desde_entrega: number | null
  envio_metodo_nombre: string | null
  envio_logistic_type: string | null
  envio_mode: string | null
  envio_tracking_method: string | null
  // ML response tracking
  ml_response_sent: boolean
  ml_response_sent_at: string | null
  resumen_caso: string | null
}

export interface AgentInteraction {
  id: string
  buyer_id: string | null
  buyer_nickname: string | null
  buyer_name: string | null
  pack_id: string | null
  order_id: string | null
  message_original: string
  ai_response: string | null
  case_type: string | null
  was_escalated: boolean
  escalation_reason: string | null
  source: 'postventa' | 'preventa'
  was_sent_to_ml: boolean
  ml_response_status: string | null
  n8n_execution_id: string | null
  workflow_id: string | null
  created_at: string
}

export interface PreventaQuery {
  id: string
  question_id: string | null
  item_id: string | null
  buyer_id: string | null
  buyer_nickname: string | null
  question_text: string
  ai_response: string | null
  status: 'respondida_por_ia' | 'no_encontrada' | 'escalada' | 'pending'
  was_answered: boolean
  product_title: string | null
  product_sku: string | null
  product_price: number | null
  n8n_execution_id: string | null
  workflow_id: string | null
  question_date: string | null
  answered_at: string | null
  created_at: string
}
```

### types/stock.ts

```typescript
export interface StockItem {
  item_id: string
  title: string
  permalink: string
  thumbnail: string
  price: number
  available_quantity: number
  status: string
  sku: string
  updated_at: string
  units_sold_30d: number
  units_sold_90d: number
  avg_daily_30d: number
  days_cover: number | null
  lead_time_days: number
  safety_stock_units: number
  reorder_point_units: number
  reorder_in_days: number | null
  reorder_date: string | null
  severity: 'critical' | 'warning' | 'ok'
  calculated_at: string
}
```

---

## 12. Hooks Personalizados

### hooks/useSimulatedOrders.ts

```typescript
// Gestiona ordenes simuladas en localStorage

interface SimulatedOrder {
  id: string
  buyer: { id, first_name, last_name, nickname }
  product: { id, title, price, sku, quantity }
  shipping: { id, status, carrier, logistic_type, ... }
  billing: { doc_type, doc_number, taxpayer_type, can_receive_factura_a }
  scenario: { id, name, icon }
  daysSinceDelivery: number | null
  messages: SimulatedMessage[]
  createdAt: string
}

export function useSimulatedOrders() {
  const [orders, setOrders] = useState<SimulatedOrder[]>([])
  const [scenarios, setScenarios] = useState<TestScenario[]>([])
  const [isLoading, setIsLoading] = useState(true)

  // Cargar ordenes de localStorage
  useEffect(() => {
    const saved = localStorage.getItem('simulatedOrders')
    if (saved) setOrders(JSON.parse(saved))

    // Cargar escenarios desde JSON
    fetch('/data/test-scenarios.json')
      .then(r => r.json())
      .then(setScenarios)
  }, [])

  // Persistir cambios
  useEffect(() => {
    localStorage.setItem('simulatedOrders', JSON.stringify(orders))
  }, [orders])

  return {
    orders,
    scenarios,
    isLoading,
    createOrder: (product, scenario, customBuyer?) => { ... },
    addMessage: (orderId, message) => { ... },
    deleteOrder: (orderId) => { ... },
    clearAllOrders: () => { ... },
    getOrder: (orderId) => orders.find(o => o.id === orderId)
  }
}
```

### hooks/useRealOrders.ts

```typescript
// Gestiona ordenes reales desde JSON

interface RealOrder {
  id: string
  order_id: string
  buyer: { ... }
  product: { ... }
  shipping: { ... }
  billing: { ... }
  date_created: string
  date_delivered: string | null
}

export function useRealOrders() {
  const [orders, setOrders] = useState<RealOrderWithMessages[]>([])
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    // Cargar ordenes desde JSON estatico
    fetch('/data/real-orders.json')
      .then(r => r.json())
      .then(data => {
        // Merge con mensajes guardados en localStorage
        const savedMessages = JSON.parse(localStorage.getItem('realOrderMessages') || '{}')
        const ordersWithMessages = data.map(order => ({
          ...order,
          messages: savedMessages[order.id] || []
        }))
        setOrders(ordersWithMessages)
      })
  }, [])

  return {
    orders,
    isLoading,
    addMessage: (orderId, message) => { ... },
    getOrder: (orderId) => orders.find(o => o.id === orderId),
    clearMessages: (orderId) => { ... },
    getDaysSinceDelivery: (order) => { ... }
  }
}
```

---

## 13. Datos Estaticos

### Archivos en /public/data/

| Archivo | Contenido | Uso |
|---------|-----------|-----|
| `products.csv` | Catalogo 10,000+ productos | Preventa |
| `orders.csv` | 71,983 ordenes historicas | Dashboard |
| `preloaded-orders.json` | Ordenes simuladas precargadas | Postventa |
| `real-orders.json` | Ordenes reales para test | Postventa |
| `test-scenarios.json` | 10+ escenarios de test | Postventa |
| `stats_full.json` | KPIs generales | Dashboard |
| `insights.json` | Insights de negocio | Dashboard |
| `projections.json` | Proyecciones 2026 | Dashboard |
| `monthly_sales_full.csv` | 13 meses ventas | Dashboard |
| `weekly_sales_full.csv` | Ventas semanales | Dashboard |
| `top_customers.csv` | Top 20 clientes | Dashboard |
| `categories.csv` | Ventas por categoria | Dashboard |
| `agent-strategies-v2.json` | Config estrategias IA | Estrategia |
| `association_rules.csv` | Reglas cross-sell | Analytics |

### Formato test-scenarios.json

```json
[
  {
    "id": "normal_delivered",
    "name": "Entregado Normal",
    "icon": "Package",
    "description": "Orden entregada hace 5 dias",
    "shipping": {
      "status": "delivered",
      "carrier": "mercadoenvios",
      "logistic_type": "cross_docking"
    },
    "billing": {
      "doc_type": "DNI",
      "can_receive_factura_a": false
    },
    "days_since_delivery": 5
  },
  {
    "id": "in_transit",
    "name": "En Transito",
    "icon": "Truck",
    "description": "Pedido en camino",
    "shipping": {
      "status": "in_transit",
      "carrier": "mercadoenvios"
    },
    "days_since_delivery": null
  }
]
```

---

## 14. Paso a Paso: Replicar en Nuevo Repo

### Paso 1: Clonar Estructura

```bash
# Crear nuevo proyecto Next.js
npx create-next-app@14.1.0 nuevo-crm --typescript --tailwind --app

# Copiar estructura de carpetas
mkdir -p app/api/support app/components lib/supabase types hooks public/data n8n-workflows supabase/migrations
```

### Paso 2: Instalar Dependencias

```bash
cd nuevo-crm

npm install @supabase/ssr @supabase/supabase-js @tanstack/react-query \
  clsx date-fns ioredis lucide-react papaparse recharts tailwind-merge

npm install -D @types/papaparse
```

### Paso 3: Configurar Variables de Entorno

```bash
# Copiar .env.example a .env.local
cp .env.example .env.local

# Editar con tus credenciales:
# - Supabase URL y Key
# - n8n webhook URLs
# - MercadoLibre Client ID/Secret/Seller ID
# - Gemini API Key
# - Redis connection
```

### Paso 4: Crear Base de Datos

1. Crear proyecto Supabase (Cloud o Self-Hosted)
2. Ejecutar migraciones en orden:

```sql
-- 1. Tablas base
-- Ejecutar: supabase/migrations/001_create_tables.sql

-- 2. Sistema de stock
-- Ejecutar: supabase/migrations/002_complete_stock_system.sql

-- 3-8. Resto de migraciones
-- Ejecutar cada archivo en orden
```

### Paso 5: Configurar n8n

1. Instalar n8n (Docker o Cloud)
2. Importar workflows desde `/n8n-workflows/`
3. Configurar credenciales:
   - Redis account
   - Supabase account
   - MercadoLibre OAuth
4. Activar webhooks
5. Copiar URLs generadas

### Paso 6: Copiar Archivos del Proyecto

```bash
# Copiar todos los archivos fuente
cp -r app/* nuevo-crm/app/
cp -r lib/* nuevo-crm/lib/
cp -r types/* nuevo-crm/types/
cp -r hooks/* nuevo-crm/hooks/
cp -r public/data/* nuevo-crm/public/data/

# Copiar configuraciones
cp next.config.js tailwind.config.ts tsconfig.json nuevo-crm/
```

### Paso 7: Actualizar Configuraciones

```javascript
// next.config.js - Actualizar dominios de imagenes si es necesario

// app/api/* - Actualizar URLs de webhooks n8n

// lib/supabase/* - Verificar configuracion cliente
```

### Paso 8: Personalizar para Nuevo Cliente

1. **Branding:**
   - Cambiar nombre "TiendaLubbi" -> "NuevoCliente"
   - Actualizar colores en tailwind.config.ts
   - Cambiar logos/iconos

2. **Datos:**
   - Reemplazar products.csv con catalogo del cliente
   - Actualizar test-scenarios.json si aplica
   - Generar nuevo stats_full.json

3. **MercadoLibre:**
   - Crear app en developers.mercadolibre.com
   - Obtener Client ID/Secret
   - Configurar OAuth y obtener tokens

### Paso 9: Testing

```bash
# Ejecutar en desarrollo
npm run dev

# Verificar:
# 1. Carga de catalogo (Preventa)
# 2. Ordenes simuladas (Postventa)
# 3. Chat con IA (n8n o mock)
# 4. Dashboard analytics
# 5. Panel de escalaciones
```

### Paso 10: Deploy

```bash
# Vercel (recomendado)
vercel --prod

# O build local
npm run build
npm run start
```

---

## 15. Checklist de Verificacion

### Pre-Deploy

- [ ] Variables de entorno configuradas
- [ ] Supabase corriendo y migraciones aplicadas
- [ ] n8n corriendo con workflows importados
- [ ] Webhooks activos y URLs actualizadas en .env
- [ ] MercadoLibre app creada y tokens validos
- [ ] Redis accesible y token ML almacenado
- [ ] Catalogo CSV cargado
- [ ] Escenarios de test configurados

### Funcionalidades

- [ ] **Preventa:**
  - [ ] Carga catalogo desde CSV
  - [ ] Busqueda de productos funciona
  - [ ] Detalle de producto muestra imagen ML
  - [ ] Chat responde (n8n o mock)

- [ ] **Postventa:**
  - [ ] Crear orden simulada funciona
  - [ ] Escenarios se aplican correctamente
  - [ ] Chat responde segun escenario
  - [ ] Ordenes reales cargan desde JSON

- [ ] **Dashboard:**
  - [ ] KPIs muestran datos
  - [ ] Graficos renderizan
  - [ ] Tabs funcionan
  - [ ] Stock dashboard carga

- [ ] **Soporte:**
  - [ ] Lista escalaciones carga
  - [ ] Filtros funcionan
  - [ ] Detalle muestra info completa
  - [ ] Mejora con Gemini funciona
  - [ ] Envio a ML funciona (si hay token)

- [ ] **Conversaciones:**
  - [ ] Lista carga desde Supabase
  - [ ] Chat bidireccional funciona
  - [ ] Marca como resuelto funciona

### Performance

- [ ] Build sin errores
- [ ] Lighthouse score > 80
- [ ] Imagenes optimizadas
- [ ] Sin memory leaks

---

## Contacto y Soporte

**Desarrollado por:** Equipo Horsepower
**Cliente Original:** TiendaLubbi (Autopartes)
**Fecha:** Diciembre 2024

---

*Documento generado automaticamente para replicacion del proyecto.*
