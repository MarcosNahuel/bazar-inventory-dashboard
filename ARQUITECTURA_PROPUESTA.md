# Arquitectura Propuesta: Supabase + Vercel + n8n + VPS

**Cliente:** BAZAR Importaciones
**Fecha:** 2025-12-18
**Autor:** Claude Code (Opus 4.5)

---

## Mi Opinion Profesional

Despues de analizar los 11 workflows existentes, el modelo de negocio del cliente (e-commerce ML Chile con ~100-200 SKUs), y las tecnologias disponibles, mi recomendacion es:

### Veredicto: SI, migrar a esta arquitectura

**Pero con matices importantes:**

| Componente | Recomendacion | Razon |
|------------|---------------|-------|
| **Supabase** | SI (core) | Reemplaza Google Sheets, mejor estructura |
| **n8n** | SI (mantener) | Excelente para integracion ML, ya configurado |
| **Vercel** | SI (dashboard) | Rapido de deployar, gratis para bajo trafico |
| **VPS** | OPCIONAL | Solo si necesita workers pesados |

---

## Arquitectura Actual vs Propuesta

### ACTUAL (Google Sheets + n8n)
```
┌─────────────────────────────────────────────────────────┐
│                    ARQUITECTURA ACTUAL                   │
├─────────────────────────────────────────────────────────┤
│                                                          │
│   Mercado Libre API                                      │
│         │                                                │
│         ▼                                                │
│   ┌──────────┐         ┌──────────────────┐             │
│   │   n8n    │ ──────► │  Google Sheets   │             │
│   │ (Easypanel)│        │   (Inventario)   │             │
│   └──────────┘         └────────┬─────────┘             │
│                                 │                        │
│                                 ▼                        │
│                        ┌──────────────────┐             │
│                        │  Looker Studio   │             │
│                        │   (Dashboard)    │             │
│                        └──────────────────┘             │
│                                                          │
│   PROBLEMAS:                                             │
│   - Google Sheets tiene limite de 10M celdas            │
│   - Sin queries complejos                               │
│   - Sin API propia                                      │
│   - Sin historial de cambios automatico                 │
│   - Looker Studio es lento con muchos datos             │
└─────────────────────────────────────────────────────────┘
```

### PROPUESTA (Supabase + Vercel + n8n)
```
┌─────────────────────────────────────────────────────────┐
│                  ARQUITECTURA PROPUESTA                  │
├─────────────────────────────────────────────────────────┤
│                                                          │
│   Mercado Libre API                                      │
│         │                                                │
│         ▼                                                │
│   ┌──────────┐         ┌──────────────────┐             │
│   │   n8n    │ ──────► │    SUPABASE      │             │
│   │(Easypanel)│        │  ┌────────────┐  │             │
│   └──────────┘         │  │ PostgreSQL │  │             │
│         │              │  ├────────────┤  │             │
│         │              │  │  Realtime  │  │             │
│         │              │  ├────────────┤  │             │
│         ▼              │  │Edge Funcs  │  │             │
│   ┌──────────┐         │  └────────────┘  │             │
│   │   VPS    │         └────────┬─────────┘             │
│   │(workers) │                  │                        │
│   └──────────┘                  │ API REST               │
│                                 ▼                        │
│                        ┌──────────────────┐             │
│                        │     VERCEL       │             │
│                        │  ┌────────────┐  │             │
│                        │  │  Next.js   │  │             │
│                        │  │ Dashboard  │  │             │
│                        │  └────────────┘  │             │
│                        └──────────────────┘             │
│                                                          │
│   VENTAJAS:                                              │
│   - DB relacional con queries SQL                       │
│   - API REST automatica                                 │
│   - Realtime updates (stock changes)                    │
│   - Dashboard custom rapido                             │
│   - Escalable                                           │
│   - Historial completo                                  │
└─────────────────────────────────────────────────────────┘
```

---

## Desglose por Componente

### 1. SUPABASE (Base de Datos Central)

**Rol:** Reemplaza Google Sheets como fuente de verdad.

**Tablas Propuestas:**
```sql
-- Productos (core)
CREATE TABLE productos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo_ml VARCHAR(20) UNIQUE NOT NULL,
  sku VARCHAR(50),
  titulo TEXT NOT NULL,
  status VARCHAR(20),
  permalink TEXT,
  supermarket BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Stock (historico)
CREATE TABLE stock (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  producto_id UUID REFERENCES productos(id),
  stock_full INTEGER DEFAULT 0,
  stock_flex INTEGER DEFAULT 0,
  stock_total INTEGER GENERATED ALWAYS AS (stock_full + stock_flex) STORED,
  recorded_at TIMESTAMPTZ DEFAULT now()
);

-- Costos (proveedor)
CREATE TABLE costos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  producto_id UUID REFERENCES productos(id),
  proveedor VARCHAR(100),
  costo_unitario DECIMAL(10,2),
  fecha_actualizacion DATE,
  vigente BOOLEAN DEFAULT true
);

-- Ventas (diarias)
CREATE TABLE ventas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  producto_id UUID REFERENCES productos(id),
  fecha DATE NOT NULL,
  cantidad INTEGER NOT NULL,
  canal VARCHAR(20), -- full, flex, centro
  precio_unitario DECIMAL(10,2),
  comision DECIMAL(10,2),
  costo_envio DECIMAL(10,2)
);

-- Alertas
CREATE TABLE alertas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  producto_id UUID REFERENCES productos(id),
  tipo VARCHAR(50), -- low_stock, sin_venta_30d, margen_bajo
  mensaje TEXT,
  leida BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT now()
);

-- Vista para dashboard
CREATE VIEW dashboard_productos AS
SELECT
  p.codigo_ml,
  p.sku,
  p.titulo,
  p.status,
  s.stock_full,
  s.stock_flex,
  s.stock_total,
  c.costo_unitario,
  c.proveedor,
  COALESCE(v30.cantidad, 0) as ventas_30d,
  COALESCE(v60.cantidad, 0) as ventas_60d,
  (s.stock_total * c.costo_unitario) as valorizacion,
  CASE WHEN s.stock_total < 5 THEN true ELSE false END as alerta_stock
FROM productos p
LEFT JOIN LATERAL (
  SELECT * FROM stock WHERE producto_id = p.id
  ORDER BY recorded_at DESC LIMIT 1
) s ON true
LEFT JOIN costos c ON c.producto_id = p.id AND c.vigente = true
LEFT JOIN LATERAL (
  SELECT SUM(cantidad) as cantidad FROM ventas
  WHERE producto_id = p.id AND fecha > now() - interval '30 days'
) v30 ON true
LEFT JOIN LATERAL (
  SELECT SUM(cantidad) as cantidad FROM ventas
  WHERE producto_id = p.id AND fecha > now() - interval '60 days'
) v60 ON true;
```

**Funciones Edge (Supabase):**
```typescript
// supabase/functions/check-low-stock/index.ts
import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

serve(async (req) => {
  const supabase = createClient(
    Deno.env.get('SUPABASE_URL')!,
    Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  )

  // Obtener productos con stock bajo
  const { data: lowStock } = await supabase
    .from('dashboard_productos')
    .select('*')
    .lt('stock_total', 5)
    .eq('status', 'active')

  if (lowStock && lowStock.length > 0) {
    // Crear alertas
    const alertas = lowStock.map(p => ({
      producto_id: p.id,
      tipo: 'low_stock',
      mensaje: `Stock bajo: ${p.titulo} (${p.stock_total} unidades)`
    }))

    await supabase.from('alertas').insert(alertas)

    // Trigger email via n8n webhook
    await fetch('https://agente-meli-n8n.7skqlp.easypanel.host/webhook/low-stock', {
      method: 'POST',
      body: JSON.stringify({ productos: lowStock })
    })
  }

  return new Response(JSON.stringify({
    checked: true,
    low_stock_count: lowStock?.length || 0
  }))
})
```

**Costo Supabase:**
- Free tier: 500MB DB, 2GB storage, 50K MAU
- Pro: $25/mes (8GB DB, 100GB storage)
- **Para este proyecto: Free tier es suficiente**

---

### 2. VERCEL (Dashboard Frontend)

**Rol:** Dashboard interactivo reemplazando Looker Studio.

**Stack Recomendado:**
```
Next.js 14 + App Router
├── Tailwind CSS (styling)
├── Tremor (graficos/charts)
├── Supabase JS Client
└── NextAuth (si necesita login)
```

**Estructura del Proyecto:**
```
dashboard/
├── app/
│   ├── page.tsx              # Dashboard principal
│   ├── productos/
│   │   └── page.tsx          # Lista de productos
│   ├── alertas/
│   │   └── page.tsx          # Centro de alertas
│   ├── ventas/
│   │   └── page.tsx          # Analisis de ventas
│   └── api/
│       └── sync/route.ts     # Trigger manual sync
├── components/
│   ├── StockCard.tsx
│   ├── SalesChart.tsx
│   ├── AlertBadge.tsx
│   └── ProductTable.tsx
└── lib/
    └── supabase.ts           # Cliente Supabase
```

**Ejemplo de Dashboard:**
```tsx
// app/page.tsx
import { createServerClient } from '@/lib/supabase'
import { Card, Metric, Text, BarChart, DonutChart } from '@tremor/react'

export default async function Dashboard() {
  const supabase = createServerClient()

  // Metricas principales
  const { data: stats } = await supabase
    .from('dashboard_productos')
    .select('stock_total, valorizacion, ventas_30d')

  const totalStock = stats?.reduce((a, b) => a + b.stock_total, 0)
  const totalValor = stats?.reduce((a, b) => a + b.valorizacion, 0)
  const alertas = stats?.filter(p => p.stock_total < 5).length

  return (
    <main className="p-6">
      <h1 className="text-2xl font-bold mb-6">BAZAR Dashboard</h1>

      {/* KPIs */}
      <div className="grid grid-cols-4 gap-4 mb-8">
        <Card>
          <Text>Total SKUs</Text>
          <Metric>{stats?.length}</Metric>
        </Card>
        <Card>
          <Text>Stock Total</Text>
          <Metric>{totalStock?.toLocaleString()}</Metric>
        </Card>
        <Card>
          <Text>Valorizacion</Text>
          <Metric>${totalValor?.toLocaleString()}</Metric>
        </Card>
        <Card decoration="top" decorationColor="red">
          <Text>Alertas Stock</Text>
          <Metric>{alertas}</Metric>
        </Card>
      </div>

      {/* Graficos */}
      <div className="grid grid-cols-2 gap-6">
        <Card>
          <Text>Ventas por Canal (30d)</Text>
          <DonutChart data={ventasPorCanal} category="cantidad" />
        </Card>
        <Card>
          <Text>Stock por Ubicacion</Text>
          <BarChart data={stockPorUbicacion} />
        </Card>
      </div>
    </main>
  )
}
```

**Costo Vercel:**
- Hobby: Gratis (perfecto para este proyecto)
- Pro: $20/mes si necesita mas recursos

---

### 3. N8N (Orquestacion)

**Rol:** Mantener como motor de integracion con ML.

**Cambios Necesarios:**
1. Cambiar destino de Google Sheets a Supabase
2. Agregar webhook para alertas
3. Simplificar workflows eliminando duplicados

**Nuevo Flujo ML Total (simplificado):**
```
Schedule (6h)
    │
    ▼
Refresh ML Token
    │
    ▼
Get All Products from ML
    │
    ├──► Get Stock ──► Insert/Update Supabase (stock)
    │
    ├──► Get Sales 30d ──► Insert Supabase (ventas)
    │
    └──► Get Item Details ──► Upsert Supabase (productos)
    │
    ▼
Call Supabase Edge Function (check-low-stock)
    │
    ▼
[Si hay alertas] ──► Send Email via n8n Gmail node
```

**Nodo Supabase en n8n:**
```javascript
// HTTP Request node configurado para Supabase
{
  "method": "POST",
  "url": "https://xxx.supabase.co/rest/v1/productos",
  "headers": {
    "apikey": "{{ $env.SUPABASE_ANON_KEY }}",
    "Authorization": "Bearer {{ $env.SUPABASE_ANON_KEY }}",
    "Content-Type": "application/json",
    "Prefer": "resolution=merge-duplicates"
  },
  "body": {
    "codigo_ml": "{{ $json.id }}",
    "sku": "{{ $json.seller_sku }}",
    "titulo": "{{ $json.title }}",
    "status": "{{ $json.status }}"
  }
}
```

---

### 4. VPS (Opcional)

**Cuando usarlo:**
- Workers que corren > 10 minutos
- Procesamiento de imagenes
- Scraping pesado
- Backups programados

**Para este proyecto:** NO ES NECESARIO inicialmente.

**Si se necesita en el futuro:**
```
VPS (Ubuntu 22.04)
├── Docker
│   ├── n8n (alternativa a Easypanel)
│   ├── Redis (cache)
│   └── Worker (Python/Node)
├── Cron jobs
│   ├── backup-supabase.sh (diario)
│   └── sync-ml.sh (cada hora)
└── Nginx (reverse proxy)
```

---

## Comparativa de Costos

| Componente | Actual | Propuesto | Diferencia |
|------------|--------|-----------|------------|
| Google Sheets | Gratis | - | - |
| Looker Studio | Gratis | - | - |
| n8n (Easypanel) | ~$10/mes | ~$10/mes | $0 |
| Supabase | - | Gratis (free tier) | $0 |
| Vercel | - | Gratis (hobby) | $0 |
| **TOTAL** | ~$10/mes | ~$10/mes | **$0** |

---

## Ventajas de la Migracion

### Tecnicas
1. **Queries SQL reales** - No mas VLOOKUP en Sheets
2. **Historial completo** - Cada cambio de stock registrado
3. **API REST** - Integraciones futuras faciles
4. **Realtime** - Dashboard actualiza en vivo
5. **Backups automaticos** - Supabase los hace
6. **RLS** - Seguridad a nivel de fila

### De Negocio
1. **Dashboard mas rapido** - Next.js vs Looker
2. **Escalabilidad** - Soporta 10K+ SKUs sin problemas
3. **Personalizacion** - UI exactamente como quiere el cliente
4. **Independencia** - No depende de Google Sheets
5. **Profesionalismo** - URL propia (dashboard.bazarimportaciones.cl)

### Para Desarrollo
1. **TypeScript** - Menos bugs
2. **Versionado** - Todo en Git
3. **CI/CD** - Deploy automatico con Vercel
4. **Testing** - Mas facil de testear

---

## Desventajas / Consideraciones

1. **Curva de aprendizaje** - Cliente debe aprender nueva interfaz
2. **Migracion de datos** - Hay que pasar historico de Sheets
3. **Mantenimiento** - Requiere alguien tecnico si algo falla
4. **Complejidad** - Mas partes moviles que Sheets + Looker

---

## Plan de Migracion

### Fase 1: Preparacion (sin riesgo)
1. Crear proyecto Supabase
2. Crear tablas y vistas
3. Crear proyecto Vercel con dashboard basico
4. **No tocar n8n todavia**

### Fase 2: Sincronizacion Paralela
1. Modificar n8n para escribir a AMBOS destinos
2. Google Sheets (existente)
3. Supabase (nuevo)
4. Validar que datos son identicos

### Fase 3: Cutover
1. Verificar dashboard funciona
2. Desactivar escritura a Sheets
3. Cliente usa nuevo dashboard
4. Sheets queda como backup readonly

### Fase 4: Optimizacion
1. Agregar features al dashboard
2. Implementar Realtime
3. Mejorar alertas

---

## Recomendacion Final

### Para MVP (USD 600)
**Mantener arquitectura actual** con mejoras:
- Activar ML Total
- Agregar alertas email
- Dashboard en Looker Studio

### Para Version Pro (USD 1500-2000)
**Migrar a Supabase + Vercel**:
- DB relacional
- Dashboard custom
- API propia
- Escalable

### Mi Sugerencia
Empezar con el MVP usando la arquitectura actual. Una vez validado que el sistema funciona y el cliente esta satisfecho, proponer la migracion como "Version 2.0" con presupuesto adicional.

**El cliente no necesita Supabase + Vercel para 100-200 SKUs.** Pero si planea escalar a 1000+ productos o quiere funcionalidades avanzadas (app movil, integraciones con otros marketplaces, multi-usuario), entonces si vale la pena.

---

## Recursos Adicionales

### Documentacion
- [Supabase Docs](https://supabase.com/docs)
- [Vercel + Next.js](https://nextjs.org/docs)
- [Tremor Charts](https://tremor.so)
- [n8n Supabase Node](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.supabase/)

### Templates
- [Supabase + Next.js Starter](https://github.com/vercel/next.js/tree/canary/examples/with-supabase)
- [Tremor Dashboard Template](https://github.com/tremorlabs/template-dashboard)

---

**Documento generado por Claude Code (Opus 4.5)**
**Fecha:** 2025-12-18
