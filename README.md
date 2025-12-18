# BAZAR Importaciones - Dashboard de Inventario

Dashboard de gestion de inventario para e-commerce en Mercado Libre Chile.

## Features

- **Dashboard de Resumen**: Vista general con KPIs, graficos de stock y proveedores
- **Analisis Pareto 80/20**: Identifica los productos que generan el 80% de ventas
- **Semaforos de Stock**: Visualizacion por colores (critico, alerta, bajo, normal)
- **Gestion de Costos**: Carga masiva desde Excel/CSV
- **Alertas de Stock Bajo**: Webhook para notificaciones via n8n/email
- **Distribucion de Precios**: Analisis de tickets y rangos de precios

## Tech Stack

- **Frontend**: Next.js 16.1.0 (App Router)
- **Base de Datos**: Supabase (PostgreSQL)
- **Graficos**: Recharts
- **Estilos**: Tailwind CSS
- **Excel**: xlsx library

## Requisitos Previos

- Node.js 18+
- Cuenta de Mercado Libre con API credentials
- Supabase project (opcional para persistencia)
- n8n instance (opcional para alertas email)

## Instalacion Local

```bash
# Clonar repositorio
git clone https://github.com/MarcosNahuel/bazar-inventory-dashboard.git
cd bazar-inventory-dashboard

# Instalar dependencias
npm install

# Copiar variables de entorno
cp .env.example .env.local

# Editar .env.local con tus credenciales

# Ejecutar en desarrollo
npm run dev
```

## Variables de Entorno

| Variable | Descripcion | Requerido |
|----------|-------------|-----------|
| `NEXT_PUBLIC_SUPABASE_URL` | URL de tu proyecto Supabase | Si |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Clave anonima de Supabase | Si |
| `SUPABASE_SERVICE_ROLE_KEY` | Clave de servicio Supabase | Si |
| `ML_CLIENT_ID` | Client ID de Mercado Libre | Si |
| `ML_CLIENT_SECRET` | Client Secret de Mercado Libre | Si |
| `ML_ACCESS_TOKEN` | Token de acceso ML | Si |
| `ML_REFRESH_TOKEN` | Token de refresco ML | Si |
| `ML_USER_ID` | User ID de ML | Si |
| `STOCK_ALERT_THRESHOLD` | Umbral de alerta (default: 5) | No |
| `N8N_WEBHOOK_URL` | URL webhook n8n para alertas | No |
| `EXCEL_PATH` | Ruta al Excel de inventario | No |

## Deploy en Vercel

### Opcion 1: Desde la Web

1. Ve a [vercel.com/new](https://vercel.com/new)
2. Importa el repositorio `bazar-inventory-dashboard`
3. Configura las variables de entorno en Settings > Environment Variables
4. Deploy

### Opcion 2: Con Vercel CLI

```bash
# Instalar Vercel CLI
npm i -g vercel

# Login
vercel login

# Deploy
vercel --prod
```

## Configuracion de Supabase

### 1. Crear Proyecto

1. Ve a [supabase.com](https://supabase.com)
2. Crea un nuevo proyecto
3. Copia las credenciales de Settings > API

### 2. Crear Tablas (Opcional)

Si deseas persistir datos en Supabase, ejecuta estas migraciones:

```sql
-- Tabla de productos
CREATE TABLE products (
  id TEXT PRIMARY KEY,
  codigo_ml TEXT UNIQUE NOT NULL,
  sku TEXT,
  titulo TEXT NOT NULL,
  precio DECIMAL(12,2),
  costo DECIMAL(12,2),
  stock_total INTEGER DEFAULT 0,
  stock_full INTEGER DEFAULT 0,
  stock_flex INTEGER DEFAULT 0,
  proveedor TEXT,
  status TEXT DEFAULT 'active',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de costos
CREATE TABLE costs (
  id SERIAL PRIMARY KEY,
  codigo_ml TEXT REFERENCES products(codigo_ml),
  costo DECIMAL(12,2) NOT NULL,
  fecha_actualizacion TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de alertas
CREATE TABLE alerts (
  id SERIAL PRIMARY KEY,
  codigo_ml TEXT NOT NULL,
  tipo TEXT NOT NULL,
  mensaje TEXT,
  enviado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indices
CREATE INDEX idx_products_codigo_ml ON products(codigo_ml);
CREATE INDEX idx_products_proveedor ON products(proveedor);
CREATE INDEX idx_alerts_codigo_ml ON alerts(codigo_ml);
```

### 3. Configurar RLS (Row Level Security)

```sql
-- Habilitar RLS
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE costs ENABLE ROW LEVEL SECURITY;
ALTER TABLE alerts ENABLE ROW LEVEL SECURITY;

-- Politicas de lectura publica
CREATE POLICY "Allow public read" ON products FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON costs FOR SELECT USING (true);
CREATE POLICY "Allow public read" ON alerts FOR SELECT USING (true);

-- Politicas de escritura con service role
CREATE POLICY "Allow service write" ON products FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Allow service write" ON costs FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Allow service write" ON alerts FOR ALL USING (auth.role() = 'service_role');
```

## Configuracion de n8n (Alertas Email)

### Crear Workflow

1. Crea un nuevo workflow en n8n
2. Agrega un nodo **Webhook** como trigger
3. Copia la URL del webhook
4. Agrega un nodo **Gmail** o **SMTP**
5. Configura el template del email:

```json
{
  "subject": "Alerta de Stock Bajo - BAZAR Importaciones",
  "body": "{{$json.message}}"
}
```

6. Activa el workflow
7. Agrega la URL del webhook a tu `.env.local`:

```
N8N_WEBHOOK_URL=https://tu-n8n.com/webhook/abc123
```

## API Endpoints

| Endpoint | Metodo | Descripcion |
|----------|--------|-------------|
| `/api/stats` | GET | Estadisticas generales |
| `/api/alerts` | GET | Productos con stock bajo |
| `/api/products` | GET | Lista de productos |
| `/api/orders` | GET | Ordenes recientes |
| `/api/inventory` | GET | Analisis completo de inventario |
| `/api/analytics` | GET | Analiticas avanzadas |
| `/api/costs/preview` | POST | Preview de carga de costos |
| `/api/costs/update` | POST | Actualizar costos |
| `/api/webhook/send-alerts` | POST | Disparar alertas email |
| `/api/auth/refresh` | POST | Refrescar token ML |

## Estructura del Excel

El archivo `Inventario_ML.xlsx` debe tener estas hojas:

### Hoja: Global
| Columna | Descripcion |
|---------|-------------|
| Proveedor | Nombre del proveedor |
| Codigo_ML | ID de publicacion ML |
| SKU | SKU interno |
| Titulo | Titulo del producto |
| Status | Estado (active/paused) |
| Stock_FULL | Stock en FULL |
| Stock_FLEX | Stock en FLEX |
| Stock_Total | Stock total |
| Costo | Costo unitario |
| Valorizacion | Stock * Costo |
| V30D | Ventas ultimos 30 dias |

### Hoja: Costos_Proveedores
| Columna | Descripcion |
|---------|-------------|
| Proveedor | Nombre del proveedor |
| Numero de publicacion | ID de publicacion ML |
| SKU | SKU interno |
| Precio | Precio de venta |
| Comision % | Comision ML |
| Costo | Costo unitario |
| Utilidad | Precio - Costo - Comision |
| Rentabilidad | Utilidad / Costo |

## Licencia

MIT License

## Autor

Desarrollado para BAZAR Importaciones - Mercado Libre Chile
