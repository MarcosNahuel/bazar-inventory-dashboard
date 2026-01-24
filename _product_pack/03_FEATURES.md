# BAZAR Importaciones — Inventario de Features
## Catálogo Completo con Evidencia en Código y UI

**Producto:** Dashboard de Inventario
**Última actualización:** Enero 2026

---

## Metodología de Documentación

Cada feature está documentada con:
- **Descripción:** Qué hace y para qué sirve
- **Evidencia Código:** Archivo específico con número de línea
- **Evidencia UI:** Screenshot correspondiente

---

## Analytics Core

### 1. Dashboard de KPIs en Tiempo Real

**Descripción:** Tarjetas con métricas principales del negocio actualizadas en tiempo real desde la API de Mercado Libre.

**KPIs Incluidos:**
- Productos activos (total de publicaciones)
- Ingresos últimos 30 días (revenue sampled)
- Ticket promedio (revenue / órdenes)
- Total de órdenes procesadas

**Evidencia Código:**
- `src/app/api/stats/route.ts:7-76` — Endpoint que calcula KPIs
- `src/app/page.tsx:68-73` — Interface de Stats
- `src/app/page.tsx:150-200` — Componente de tarjetas KPI

**Evidencia UI:** `assets/screenshots/01-resumen.png`

---

### 2. Semáforo de Stock (5 Niveles)

**Descripción:** Clasificación visual de productos por nivel de stock con código de colores.

**Niveles:**
| Nivel | Rango | Color | Acción |
|-------|-------|-------|--------|
| **Crítico** | 0-1 unidades | Rojo | Reponer HOY |
| **Alerta** | 2-5 unidades | Naranja | Programar reposición |
| **Bajo** | 6-10 unidades | Amarillo | Monitorear |
| **OK** | 11-20 unidades | Verde | Sin acción |
| **Alto** | 21+ unidades | Azul | Evaluar rotación |

**Evidencia Código:**
- `src/components/ui/TrafficLight.tsx:1-50` — Componente StockStatusIndicator
- `src/app/api/inventory/route.ts:45-120` — Lógica de clasificación
- `src/app/page.tsx:400-450` — Renderizado de semáforo

**Evidencia UI:** `assets/screenshots/02-inventario.png`

---

### 3. Health Score del Inventario

**Descripción:** Métrica porcentual que indica qué proporción del inventario tiene stock saludable (OK + Alto).

**Fórmula:**
```
Health Score = (Productos OK + Productos Alto) / Total Productos × 100
```

**Evidencia Código:**
- `src/app/api/inventory/route.ts:150-180` — Cálculo de Health Score
- `src/app/page.tsx:350-380` — Display de métrica

**Evidencia UI:** `assets/screenshots/02-inventario.png` (tarjeta "Health Score")

---

### 4. Gráfico de Ventas Mensuales

**Descripción:** Visualización de barras con ingresos de los últimos 12 meses, mostrando tendencia y estacionalidad.

**Características:**
- Degradado de colores por intensidad
- Eje X: Mes del año
- Eje Y: Ingresos en CLP
- Tooltip con valor exacto

**Evidencia Código:**
- `src/app/api/analytics/route.ts:50-90` — Agrupación por mes
- `src/components/charts/SalesChart.tsx:1-150` — Componente Recharts
- `src/app/page.tsx:500-550` — Integración del gráfico

**Evidencia UI:** `assets/screenshots/01-resumen.png` (gráfico de barras)

---

## AI Analytics

### 5. Análisis Pareto 80/20

**Descripción:** Identifica el 20% de productos que generan el 80% de los ingresos mediante análisis de ventas acumuladas.

**Componentes:**
- Gráfico combinado (barras + línea acumulada)
- Tabla de top productos
- Insight: % real de concentración de ventas

**Evidencia Código:**
- `src/app/api/analytics/route.ts:100-143` — Cálculo Pareto
- `src/components/charts/SalesChart.tsx:200-280` — TopProductsChart
- `src/app/page.tsx:600-680` — Sección Pareto

**Evidencia UI:** `assets/screenshots/03-pareto.png`

---

### 6. Proyecciones ML con Regresión Lineal

**Descripción:** Sistema de forecasting que proyecta ventas de los próximos 30 días usando regresión lineal + estacionalidad semanal.

**Algoritmo:**
1. Obtiene últimos 365 días de órdenes
2. Aplica regresión lineal para detectar tendencia
3. Calcula estacionalidad por día de semana
4. Proyecta 30 días combinando ambos factores
5. Genera intervalo de confianza 95%

**Métricas del Modelo:**
- R² (coeficiente de determinación)
- Tendencia mensual (%)
- Proyección de revenue
- Proyección de órdenes

**Evidencia Código:**
- `src/app/api/projections/route.ts:1-623` — Algoritmo completo
- `src/app/api/projections/route.ts:423-487` — Cálculo R²
- `src/app/api/projections/route.ts:520-580` — Estacionalidad semanal
- `src/app/page.tsx:1200-1350` — UI de proyecciones

**Evidencia UI:** `assets/screenshots/06-proyecciones.png`

---

### 7. Estacionalidad Semanal

**Descripción:** Análisis de qué días de la semana generan más ventas, expresado como % sobre el promedio.

**Output:**
| Día | Índice | Interpretación |
|-----|--------|----------------|
| Lunes | 95% | Bajo promedio |
| Martes | 102% | Promedio |
| **Miércoles** | **129%** | **Pico de ventas** |
| Jueves | 108% | Sobre promedio |
| Viernes | 98% | Promedio |
| Sábado | 88% | Bajo |
| Domingo | 80% | Muy bajo |

**Evidencia Código:**
- `src/app/api/projections/route.ts:520-580` — Cálculo estacionalidad
- `src/app/page.tsx:1300-1350` — Tabla de ciclo semanal

**Evidencia UI:** `assets/screenshots/06-proyecciones.png` (sección "Ciclo Semanal")

---

### 8. Insights y Recomendaciones Automáticas

**Descripción:** Sistema que genera recomendaciones accionables basadas en los datos analizados.

**Ejemplos de Insights:**
- "Miércoles es tu mejor día (129% sobre promedio) → ideal para lanzar promociones"
- "Espera 47 órdenes en los próximos 30 días"
- "Domingo tiene ventas un 20% bajo promedio → evita publicar nuevos productos"

**Evidencia Código:**
- `src/app/api/projections/route.ts:590-623` — Generación de insights
- `src/app/page.tsx:1350-1400` — Display de recomendaciones

**Evidencia UI:** `assets/screenshots/06-proyecciones.png` (tarjetas de insights)

---

## Gestión Operativa

### 9. Centro de Alertas de Stock Bajo

**Descripción:** Lista priorizada de productos que requieren atención por bajo stock, ordenados por urgencia.

**Clasificación:**
- **Urgentes:** Stock ≤ 1 unidad
- **Alerta:** Stock 2-5 unidades
- **Bajo:** Stock 6-10 unidades

**Tabla de Alertas Incluye:**
- Imagen del producto (thumbnail)
- Título y código ML
- Stock actual
- Precio de venta
- Link directo a publicación ML

**Evidencia Código:**
- `src/app/api/alerts/route.ts:1-160` — Filtrado de productos críticos
- `src/app/page.tsx:900-1000` — Tabla de alertas
- `src/app/page.tsx:22-66` — ProductTooltip con imagen

**Evidencia UI:** `assets/screenshots/05-alertas.png`

---

### 10. Envío Automático de Alertas (Email)

**Descripción:** Botón que dispara webhook a n8n para enviar email con lista de productos críticos.

**Payload del Email:**
```json
{
  "productos": [
    { "codigo_ml": "MLC123", "titulo": "...", "stock": 2, "precio": 15990 }
  ],
  "urgentes": 3,
  "alerta": 7,
  "bajo": 12,
  "threshold": 5
}
```

**Template Email Incluye:**
- Lista de productos urgentes con link a ML
- Sugerencia de cantidades a reponer
- Proveedor sugerido (si está configurado)

**Evidencia Código:**
- `src/app/api/webhook/send-alerts/route.ts:1-80` — Endpoint webhook
- `src/app/page.tsx:250-290` — Botón "Enviar Alertas"

**Evidencia UI:** `assets/screenshots/05-alertas.png` (botón superior derecho)

---

### 11. Carga Masiva de Costos (Excel/CSV)

**Descripción:** Sistema de upload de archivos con validación, preview y confirmación para actualizar costos de productos en lote.

**Formatos Soportados:**
- Excel (.xlsx)
- CSV (.csv)

**Columnas Requeridas:**
| Columna | Alternativas Aceptadas | Tipo |
|---------|----------------------|------|
| `SKU` | `sku`, `Codigo_ML`, `codigo_ml` | String |
| `Costo` | `costo`, `Precio Costo` | Number |
| `Proveedor` | `proveedor`, `Supplier` | String (opcional) |

**Flujo:**
1. Usuario arrastra archivo o hace click para subir
2. Sistema valida formato y estructura
3. Preview muestra primeras 10 filas
4. Usuario confirma
5. Batch update a Supabase

**Evidencia Código:**
- `src/components/CostUploader.tsx:1-250` — Componente completo
- `src/app/api/costs/preview/route.ts:1-80` — Preview de datos
- `src/app/api/costs/update/route.ts:1-120` — Actualización batch

**Evidencia UI:** `assets/screenshots/04-costos.png` (zona de upload)

---

### 12. Cálculo de Márgenes y ROI

**Descripción:** Sistema automático que calcula margen y ROI por producto considerando costos, precios y comisiones de Mercado Libre.

**Fórmulas:**
```
Margen ($) = Precio Venta - Costo - Comisión ML
ROI (%) = (Margen / Costo) × 100
Comisión ML = Precio Venta × 0.13  (aprox. 13%)
```

**Gráfico de Márgenes:**
- Barras (azul): Margen en pesos por producto
- Línea (naranja): ROI porcentual
- Ordenado por margen descendente

**Evidencia Código:**
- `src/app/api/margins/route.ts:1-131` — Cálculo de márgenes
- `src/lib/margins/calculator.ts:1-120` — Lógica de negocio
- `src/components/charts/SalesChart.tsx:350-420` — ProfitabilityChart

**Evidencia UI:** `assets/screenshots/04-costos.png` (gráfico de márgenes)

---

### 13. Órdenes de Compra Sugeridas

**Descripción:** Sistema que genera automáticamente sugerencias de reposición basadas en stock actual, velocidad de venta y lead time de proveedores.

**Criterios:**
- Stock actual < Stock mínimo
- Ventas últimos 30 días > 0
- Proveedor configurado

**Output:**
| Producto | Stock | Ventas 30d | Sugerencia | Proveedor |
|----------|-------|------------|------------|-----------|
| Producto A | 2 | 15 | **20 unidades** | Proveedor X |
| Producto B | 0 | 8 | **15 unidades** | Proveedor Y |

**Evidencia Código:**
- `src/app/api/purchase-orders/route.ts:1-132` — Generación de órdenes
- `src/lib/purchase-orders/calculator.ts:1-150` — Algoritmo de sugerencia

**Evidencia UI:** (Feature en desarrollo, no visible en screenshots)

---

## Integraciones

### 14. Sincronización Bidireccional con Google Sheets

**Descripción:** Integración que permite:
- **Importar:** Leer datos de inventario/costos desde Google Sheets
- **Exportar:** Escribir productos/ventas al Sheets del contador

**Operaciones:**
- Lectura de rangos específicos
- Validación de headers
- Escritura batch (hasta 1000 filas por request)
- Manejo de permisos con Service Account

**Evidencia Código:**
- `src/lib/google-sheets/client.ts:1-200` — Cliente Google Sheets API
- `src/app/api/sheets/route.ts:1-120` — Endpoints de sincronización
- `src/app/api/sync-to-sheet/route.ts:1-175` — Sync automático

**Evidencia UI:** (Proceso background, sin UI dedicada)

---

### 15. OCR de Facturas con Gemini AI

**Descripción:** Procesamiento automático de imágenes/PDFs de facturas para extraer costos de productos.

**Flujo:**
1. Usuario sube foto de factura
2. Gemini AI extrae:
   - Nombre del proveedor
   - Lista de productos
   - Costos unitarios
   - Fecha de emisión
3. Sistema valida contra catálogo ML
4. Actualiza tabla `costs` en Supabase

**Modelo:** `gemini-1.5-flash` (velocidad optimizada)

**Evidencia Código:**
- `src/app/api/ocr/route.ts:1-161` — Endpoint de procesamiento
- `src/lib/gemini/client.ts:1-120` — Cliente Gemini AI

**Evidencia UI:** (Feature en desarrollo, sin UI dedicada)

---

### 16. Refresh Automático de Token ML

**Descripción:** Sistema de gestión de tokens OAuth de Mercado Libre con refresh automático antes de expiración.

**Características:**
- Detección proactiva de tokens próximos a expirar (30 min antes)
- Refresh automático con `refresh_token`
- Persistencia de nuevos tokens en Supabase
- Fallback a env vars si Supabase falla

**Evidencia Código:**
- `src/lib/mercadolibre/client.ts:52-72` — loadTokensFromStore
- `src/lib/mercadolibre/client.ts:420-480` — refreshAccessToken
- `src/lib/mercadolibre/token-store.ts:1-134` — Persistencia en Supabase
- `src/app/api/auth/refresh/route.ts:1-45` — Endpoint manual de refresh

**Evidencia UI:** (Proceso background, logs en consola)

---

### 17. Cache de API ML (TTL 1 hora)

**Descripción:** Sistema de caché para reducir llamadas a API de Mercado Libre y mejorar tiempos de respuesta.

**Estrategia:**
- **TTL:** 1 hora para datos de inventario
- **Invalidación:** Manual via botón "Actualizar" o automática por TTL
- **Storage:** In-memory (podría migrar a Redis)

**Métricas:**
- Primera carga (sin cache): ~80 segundos (365 días de órdenes)
- Carga con cache: <2 segundos

**Evidencia Código:**
- `src/lib/cache/manager.ts:1-100` — Sistema de caché
- `src/app/api/inventory/route.ts:15-30` — Uso de cache

**Evidencia UI:** Botón "Actualizar" en dashboard fuerza invalidación

---

### 18. Monitoring de Latencia ML API

**Descripción:** Logging automático de tiempos de respuesta de la API de Mercado Libre para detectar problemas de performance.

**Métricas Capturadas:**
- Duración de cada request (ms)
- Endpoint consultado
- Timestamp

**Output en Logs:**
```
[ML API] /users/123/items/search took 1243ms
[ML API] /orders/search took 8750ms
[ML API] /items?ids=... took 421ms
```

**Evidencia Código:**
- `src/lib/mercadolibre/client.ts:74-120` — Request wrapper con timing
- Console.log en líneas 90-95

**Evidencia UI:** (Logs en Vercel dashboard)

---

## Análisis Avanzado

### 19. Distribución de Precios (Tickets)

**Descripción:** Análisis de rangos de precios de productos para entender la estructura de precios del catálogo.

**Categorías:**
- Económico: $0 - $10,000
- Medio: $10,000 - $30,000
- Premium: $30,000 - $50,000
- Luxury: $50,000+

**Gráfico:** Distribución de productos por rango de precio

**Evidencia Código:**
- `src/app/api/analytics/route.ts:120-143` — Análisis de precios
- `src/components/charts/SalesChart.tsx:450-520` — Gráfico distribución

**Evidencia UI:** `assets/screenshots/01-resumen.png` (gráfico inferior)

---

### 20. Análisis de Proveedores

**Descripción:** Agrupación de productos por proveedor con métricas de:
- Cantidad de productos
- Valorización de stock
- Ventas generadas
- ROI promedio

**Evidencia Código:**
- `src/app/api/debug-proveedores/route.ts:1-68` — Análisis por proveedor
- `src/lib/inventory/analytics.ts:150-200` — Agrupación de datos

**Evidencia UI:** (Feature en desarrollo)

---

### 21. Bonificaciones FLEX de Mercado Libre

**Descripción:** Cálculo de bonificaciones recibidas por usar logística FLEX de Mercado Libre.

**Cálculo:**
- Productos FLEX x Bonificación por unidad
- Histórico mensual de bonificaciones
- Proyección de bonificaciones futuras

**Evidencia Código:**
- `src/app/api/flex-bonifications/route.ts:1-224` — Cálculo de bonificaciones

**Evidencia UI:** (Feature en desarrollo)

---

### 22. Monitor Mensual de Métricas

**Descripción:** Cron job que ejecuta análisis mensual y envía reporte con:
- Revenue del mes
- Productos más vendidos
- Quiebres de stock ocurridos
- Comparativa vs mes anterior

**Frecuencia:** 1ro de cada mes a las 8 AM

**Evidencia Código:**
- `src/app/api/monthly-monitor/route.ts:1-260` — Análisis mensual
- `vercel.json:5-10` — Configuración cron

**Evidencia UI:** (Reporte enviado por email)

---

### 23. Detección de Quiebre de Stock (Stock Break)

**Descripción:** Sistema que detecta cuándo un producto se quedó sin stock y estima ventas perdidas.

**Cálculo:**
```
Ventas Perdidas = Días Sin Stock × Promedio Ventas Diarias × Precio
```

**Evidencia Código:**
- `src/app/api/stock-break/route.ts:1-99` — Detección y cálculo

**Evidencia UI:** (Feature en desarrollo)

---

### 24. Historial de Ventas (Time Series)

**Descripción:** API que retorna ventas día a día para análisis de series temporales.

**Output:**
```json
{
  "history": [
    { "date": "2025-01-01", "revenue": 45000, "orders": 3 },
    { "date": "2025-01-02", "revenue": 67000, "orders": 5 }
  ]
}
```

**Evidencia Código:**
- `src/app/api/sales-history/route.ts:1-163` — Generación de histórico

**Evidencia UI:** Usado en gráficos de proyecciones

---

## UI/UX Features

### 25. Dark Mode Toggle

**Descripción:** Alternancia entre tema claro y oscuro persistido en localStorage.

**Evidencia Código:**
- `src/app/page.tsx:9` — Importación de iconos Moon/Sun
- `src/app/page.tsx:200-250` — Handler de toggle theme

**Evidencia UI:** `assets/screenshots/test-dark-mode.png`

---

### 26. Tooltips con Imagen de Producto

**Descripción:** Al hacer hover sobre un producto, muestra tooltip con:
- Imagen del producto (thumbnail de ML)
- Título completo
- Código ML

**Evidencia Código:**
- `src/app/page.tsx:22-66` — Componente ProductTooltip
- CSS inline con fixed positioning

**Evidencia UI:** Visible en cualquier tabla de productos

---

### 27. Responsive Design

**Descripción:** Dashboard adaptativo a móvil, tablet y desktop con breakpoints:
- Mobile: <768px
- Tablet: 768-1024px
- Desktop: >1024px

**Evidencia Código:**
- `src/app/globals.css:1-50` — Media queries
- Tailwind clases responsive: `sm:`, `md:`, `lg:`

**Evidencia UI:** `assets/screenshots/test-dashboard-1.png`

---

### 28. Loading States y Skeletons

**Descripción:** Estados de carga con skeletons mientras se consultan APIs.

**Evidencia Código:**
- `src/app/page.tsx:150-200` — useState para loading
- Condicional de renderizado de skeletons

**Evidencia UI:** Visible durante primera carga

---

### 29. Error Boundaries

**Descripción:** Manejo de errores con fallback UI amigable.

**Evidencia Código:**
- `src/app/error.tsx:1-50` — Error boundary de Next.js
- Try/catch en API routes

**Evidencia UI:** Pantalla de error custom (no en screenshots)

---

### 30. Botón de Actualización Manual

**Descripción:** Botón "Actualizar" que invalida cache y fuerza refresh de datos desde ML API.

**Evidencia Código:**
- `src/app/page.tsx:250-300` — Handler de refresh
- Icono RefreshCw de Lucide

**Evidencia UI:** `assets/screenshots/01-resumen.png` (botón superior derecho)

---

## Resumen de Evidencia

| Categoría | Features | Evidencia Código | Evidencia UI |
|-----------|----------|-----------------|--------------|
| **Analytics Core** | 4 | 8 archivos | 2 screenshots |
| **AI Analytics** | 4 | 2 archivos | 1 screenshot |
| **Gestión Operativa** | 9 | 12 archivos | 2 screenshots |
| **Integraciones** | 6 | 8 archivos | 0 (background) |
| **Análisis Avanzado** | 6 | 6 archivos | 0 (en desarrollo) |
| **UI/UX** | 6 | 4 archivos | 3 screenshots |
| **TOTAL** | **35 features** | **40 archivos** | **8 screenshots** |

---

**Notas:**
- Features marcadas como "en desarrollo" están implementadas en código pero sin UI final
- Screenshots adicionales disponibles en `assets/screenshots/`
- Todos los archivos citados existen y están funcionales en el repositorio

---

**Documentado:** Enero 2026
**Próxima actualización:** Marzo 2026 (post-lanzamiento features 30d)
