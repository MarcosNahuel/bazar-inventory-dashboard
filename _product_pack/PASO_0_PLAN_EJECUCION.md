# PASO 0 — PLAN DE EJECUCIÓN
## Product Pack: BAZAR Importaciones - Dashboard de Inventario

**Fecha de creación:** 2026-01-19
**Producto:** Dashboard de gestión de inventario y analytics para e-commerce en Mercado Libre Chile

---

## 1. TIPO DE PROYECTO

**Categoría:** Web Application
**Subcategoría:** Analytics Dashboard + eCommerce Backend + Business Intelligence

**Descripción:** Sistema integral de gestión de inventario para vendedores de Mercado Libre que combina:
- Dashboard analítico con KPIs en tiempo real
- Alertas automáticas de reposición de stock
- Proyecciones ML para forecasting de ventas
- Gestión de costos y márgenes
- Análisis Pareto 80/20

---

## 2. TECH STACK DETECTADO

### Frontend
- **Framework:** Next.js 16.1.0 (App Router)
- **React:** 19.2.3
- **UI Library:** Tailwind CSS 4.x
- **Gráficos:** Recharts 3.6.0
- **Iconos:** Lucide React 0.562.0
- **Utilidades:** date-fns, xlsx, react-dropzone
- **State:** Zustand 5.0.9

### Backend
- **Runtime:** Next.js API Routes (Node.js)
- **Base de Datos:** Supabase (PostgreSQL con RLS)
- **ORM:** Supabase JS Client 2.89.0

### Integraciones Externas
- **Mercado Libre API:** OAuth2 + REST API
- **n8n:** Webhooks para alertas email
- **Google Sheets API:** Sincronización bidireccional (googleapis 169.0.0)
- **Gemini AI:** Procesamiento de lenguaje natural (@google/generative-ai 0.24.1)

### Infraestructura
- **Deploy:** Vercel (Next.js optimizado)
- **Auth:** Supabase SSR
- **Storage:** Supabase Storage (para imágenes/PDFs)
- **PDF Generation:** Puppeteer 24.34.0

### Observabilidad
- **Logs:** Vercel Logs + Console
- **Monitoring:** Métricas de API ML (rate limits, latencia)
- **Cache:** TTL 1 hora para datos de inventario

---

## 3. COMANDO PROBABLE PARA LEVANTAR LOCAL

### Opción Principal (Preferida)
```bash
npm install
npm run dev
# Abre en http://localhost:3000
```

### Alternativas
```bash
# Si npm falla, probar:
pnpm install && pnpm dev

# Si usa yarn:
yarn && yarn dev
```

### Requisitos Previos
- Node.js 18+
- Variables de entorno en `.env.local`:
  - Supabase URL + Keys
  - Mercado Libre OAuth tokens (CLIENT_ID, SECRET, ACCESS_TOKEN, REFRESH_TOKEN)
  - n8n webhook URL (opcional para alertas)
  - Google Sheets API credentials (opcional)

### Bloqueadores Conocidos
- **Sin tokens de ML:** Las APIs de productos/órdenes fallarán → usar data mock si existe
- **Sin Supabase:** Persistencia deshabilitada, solo modo memoria
- **Sin n8n:** Alertas email no se envían

---

## 4. RUTAS/PANTALLAS CANDIDATAS PARA CAPTURAS (6–12)

| # | Ruta | Descripción | Prioridad |
|---|------|-------------|-----------|
| 01 | `/` | Dashboard principal (KPIs, gráficos ventas, inventario) | ALTA |
| 02 | `/` (sección inventario) | Semáforo de stock (Crítico/Alerta/OK) | ALTA |
| 03 | `/` (sección pareto) | Análisis 80/20 con gráfico combinado | ALTA |
| 04 | `/` (sección costos) | Gestión de costos y márgenes | MEDIA |
| 05 | `/` (sección alertas) | Centro de alertas con tabla priorizada | ALTA |
| 06 | `/` (sección proyecciones) | ML projections con tendencia y estacionalidad | ALTA |
| 07 | `/api/stats` | JSON response de estadísticas generales | BAJA |
| 08 | `/api/inventory` | JSON response de análisis de inventario | BAJA |
| 09 | `/api/alerts` | JSON response de productos con stock bajo | MEDIA |
| 10 | Carga de Excel | Modal/pantalla de carga masiva de costos | MEDIA |
| 11 | Integración n8n | Ejemplo de webhook/email (si disponible) | BAJA |
| 12 | Mobile responsive | Vista adaptativa en móvil | MEDIA |

**Nota:** El dashboard es SPA (Single Page Application) con secciones scrollables. Las capturas serán de diferentes zonas de la misma página principal.

---

## 5. FUENTES DE EVIDENCIA (Archivos Clave a Leer)

### Documentación
- ✅ `README.md` — Overview, features, setup
- ✅ `docs/MANUAL_USUARIO.md` — Guía completa con explicaciones técnicas
- ✅ `docs/PLAN_WORKFLOWS_N8N.md` — Workflows de automatización
- ✅ `docs/MCP_CONFIGURACION.md` — Configuración de MCP servers

### Código Backend (APIs)
- `src/app/api/stats/route.ts` — KPIs generales
- `src/app/api/inventory/route.ts` — Análisis de inventario
- `src/app/api/alerts/route.ts` — Sistema de alertas
- `src/app/api/analytics/route.ts` — Analytics avanzados
- `src/app/api/projections/route.ts` — Proyecciones ML
- `src/app/api/costs/*/route.ts` — Gestión de costos
- `src/app/api/webhook/send-alerts/route.ts` — Envío de alertas
- `src/app/api/auth/refresh/route.ts` — Refresh de token ML
- `src/app/api/sync-to-sheet/route.ts` — Sincronización Google Sheets
- `src/app/api/ocr/route.ts` — Procesamiento OCR
- `src/app/api/sheets/route.ts` — Integración Google Sheets
- `src/app/api/margins/route.ts` — Cálculo de márgenes
- `src/app/api/purchase-orders/route.ts` — Órdenes de compra

### Código Frontend
- `src/app/page.tsx` — Dashboard principal (componente raíz)
- `src/components/` — Componentes UI reutilizables
- `src/lib/` — Utilidades y clientes API

### Configuración
- `package.json` — Dependencias y scripts
- `next.config.ts` — Configuración Next.js
- `tsconfig.json` — TypeScript config
- `.env.example` — Variables requeridas
- `supabase/` — Esquemas de DB y migraciones
- `vercel.json` — Configuración de deploy

### Assets Existentes
- `docs/screenshots/*.png` — Capturas previas (7 imágenes)
- `docs/MANUAL_USUARIO.pdf` — Manual exportado
- `image copy *.png` — Capturas adicionales en raíz

---

## 6. EVIDENCIA DE FEATURES A DOCUMENTAR

### Analytics Core
- KPIs: Productos activos, ingresos 30d, ticket promedio, órdenes
- Gráfico de ventas mensuales (últimos 12 meses)
- Health Score del inventario
- Semáforo de stock (5 niveles)

### Análisis Avanzado
- **Pareto 80/20:** Identificación de top productos
- **Proyecciones ML:** Regresión lineal + estacionalidad semanal
- **Estacionalidad:** Análisis de días de semana
- **Tendencia:** Crecimiento/decrecimiento mensual

### Gestión Operativa
- **Carga masiva de costos:** Excel/CSV upload
- **Cálculo de márgenes:** ROI por producto
- **Alertas automáticas:** Email via n8n
- **Sincronización Google Sheets:** Bidireccional

### Integraciones
- **Mercado Libre API:** Productos, órdenes, stock
- **Supabase:** Persistencia de costos y alertas
- **n8n:** Workflows de email
- **Google Sheets:** Reporting externo
- **Gemini AI:** Procesamiento de texto (OCR)

---

## 7. ESTRATEGIA DE CAPTURAS

### Si el servidor levanta correctamente:
1. Usar `/chrome` para navegar a `http://localhost:3000`
2. Tomar screenshots de cada sección del dashboard
3. Anonimizar datos sensibles (emails, códigos ML, nombres de productos si necesario)
4. Guardar en `_product_pack/assets/screenshots/`

### Si hay bloqueadores:
1. **Reutilizar screenshots existentes** de `docs/screenshots/` (ya están limpios)
2. Documentar en 02_TECH.md el bloqueador exacto
3. Especificar qué variables faltan para levantar local
4. Proveer comando/paso exacto para reproducir

### Anonimización Obligatoria:
- Emails: `usuario@example.com` → `usuario@[REDACTED]`
- Tokens ML: `MLC123456789` → `MLC[REDACTED]`
- URLs privadas: Supabase URLs → `https://[PROJECT].supabase.co`
- Nombres de clientes reales → `Cliente Demo`

---

## 8. CRITERIOS DE COMPLETITUD

### ✅ Producto Completo Cuando:
- [ ] 01_PRODUCT.md con elevator pitch, módulos, casos de uso, métricas
- [ ] 02_TECH.md con arquitectura ASCII, stack, integraciones, runbook
- [ ] 03_FEATURES.md con tabla de features + evidencia (archivo:línea)
- [ ] 04_LIMITACIONES_Y_RIESGOS.md con riesgos reales (sin maquillaje)
- [ ] meta.json con metadata estructurada
- [ ] product.html como one-pager corporativo
- [ ] product.pdf (o comando para generarlo)
- [ ] 6–12 screenshots en `/assets/screenshots/`
- [ ] Sin secretos expuestos en texto ni imágenes
- [ ] Links internos del HTML funcionan

### 🚫 Bloqueadores Documentados:
- Si no se puede levantar local, crear `BLOQUEADO.md` con:
  - Causa exacta
  - Variables/comandos faltantes
  - Alternativas (usar data mock, screenshots existentes, etc.)

---

## 9. PRÓXIMOS PASOS

1. ✅ **Inventariar stack** → Leer archivos clave de código
2. ⏳ **Levantar local** → `npm run dev`
3. ⏳ **Tomar capturas** → Con `/chrome` o reutilizar existentes
4. ⏳ **Escribir docs** → 01_PRODUCT.md, 02_TECH.md, 03_FEATURES.md, 04_LIMITACIONES.md
5. ⏳ **Crear HTML** → product.html con galería
6. ⏳ **Generar PDF** → Con Puppeteer o comando manual
7. ⏳ **QA final** → Verificar secretos, links, completitud

---

## 10. RISKS & ASSUMPTIONS

### Assumptions
- Tokens de Mercado Libre están en `.env.local` (no en repo)
- Supabase project existe y es accesible
- n8n webhook es opcional (alertas no bloquean funcionalidad core)

### Risks
- **Bloqueador crítico:** Sin tokens ML, no hay datos reales → usar mock o screenshots existentes
- **Latencia API ML:** Primera carga de proyecciones puede tardar 60-80s → documentar
- **Secretos en screenshots:** Require anonimización manual → usar blur/redacción

### Mitigations
- Reutilizar `docs/screenshots/` si no se puede levantar local
- Documentar comandos exactos en 02_TECH.md
- Incluir data fixtures/mock en el análisis si están disponibles

---

**Estado:** ✅ PLAN APROBADO
**Próximo paso:** PASO 1 - Inventario y Stack (lectura de archivos clave)
