# Plan de Implementación: Workflows n8n para BAZAR

**Fecha:** 17 de enero de 2026
**Prioridad:** CRÍTICA
**Basado en:** Observaciones 3.pdf (08/01/2026)

---

## Resumen Ejecutivo

Este plan detalla la implementación de workflows n8n necesarios para mantener los datos del dashboard actualizados en tiempo real. Sin estos workflows, la validación del sistema es IMPOSIBLE.

---

## Estado Actual

### Ya Implementado

| Componente | Estado | Descripción |
|------------|--------|-------------|
| `POST /api/sync-to-sheet` | ✅ Listo | Sincronización completa de todas las publicaciones |
| `PUT /api/sync-to-sheet` | ✅ Listo | Actualización de stock por ubicación |
| `GET /api/sync-to-sheet` | ✅ Listo | Estado de la sincronización |
| `sync-stock-automatic.json` | ✅ Listo | Workflow automático cada 30 min |
| `sync-full-manual.json` | ✅ Listo | Workflow manual para sync completo |
| `GET /api/sales-history` | ✅ Listo | Ventas históricas mensuales |

### Pendiente de Implementar

| Componente | Prioridad | Descripción |
|------------|-----------|-------------|
| Workflow sync ventas continuo | CRÍTICA | Recuperar ventas de forma continua |
| Endpoint bonificaciones FLEX | ALTA | Obtener montos bonificados de ML |
| UI ventas históricas por mes | MEDIA | Selector de mes en dashboard |
| Valorización por Costo | ALTA | Nueva columna en valorización |
| Valorización por Utilidad | ALTA | Nueva columna en valorización |
| Pestañas VALORIZACIÓN/REPOSICIÓN | MEDIA | Reorganización de UI |

---

## Workflows a Implementar

### Workflow 1: Sincronización de Stock Automática

**Archivo:** `n8n/sync-stock-automatic.json`
**Estado:** ✅ YA IMPLEMENTADO
**Frecuencia:** Cada 30 minutos

```
[Schedule Trigger] → [HTTP PUT /api/sync-to-sheet] → [IF Success?] → [Telegram Notification]
```

**Notas:**
- El workflow ya existe y funciona correctamente
- Solo requiere configurar credenciales de Telegram para notificaciones
- Variable de entorno necesaria: `BAZAR_API_URL`

---

### Workflow 2: Sincronización Completa Manual

**Archivo:** `n8n/sync-full-manual.json`
**Estado:** ✅ YA IMPLEMENTADO
**Trigger:** Webhook POST a `/webhook/bazar-sync-full`

```
[Webhook] → [Respond 202] → [HTTP POST /api/sync-to-sheet] → [IF Success?] → [Telegram]
```

**Uso:** Ejecutar cuando se agreguen nuevas publicaciones en ML.

---

### Workflow 3: Sincronización de Ventas Continua (NUEVO)

**Archivo a crear:** `n8n/sync-sales-continuous.json`
**Prioridad:** CRÍTICA
**Frecuencia:** Cada 4 horas

#### Estructura del Workflow:

```
[Schedule Trigger 4h]
    ↓
[HTTP GET /api/orders?days=1] → Obtener órdenes del día
    ↓
[Split In Batches] → Procesar órdenes por lotes
    ↓
[Code Node] → Agregar ventas por producto y canal
    ↓
[Google Sheets Node] → Actualizar columnas de ventas en hoja Global
    ↓
[IF Success?]
    ↓                    ↓
[Format Success]    [Format Error]
    ↓                    ↓
[Telegram]          [Telegram]
```

#### Datos a sincronizar:

| Columna | Fuente | Descripción |
|---------|--------|-------------|
| Ventas 30D FULL | Orders API + shipping.logistic_type | Ventas via bodega ML |
| Ventas 30D FLEX | Orders API + shipping.logistic_type | Ventas via bodega propia |
| Ventas 30D XD | Orders API + shipping.logistic_type | Ventas via correo/agencia |
| Ventas 30D Total | Suma de los anteriores | Total consolidado |

#### Endpoint API necesario:

```typescript
// GET /api/sync-sales
// Retorna ventas agrupadas por producto y canal logístico

interface SalesByProduct {
  mlc: string;
  ventas_full: number;
  ventas_flex: number;
  ventas_xd: number;
  ventas_total: number;
  last_sale_date: string;
}
```

---

### Workflow 4: Detección de Nuevas Publicaciones (NUEVO)

**Archivo a crear:** `n8n/detect-new-publications.json`
**Prioridad:** MEDIA
**Frecuencia:** Diario a las 08:00

#### Estructura:

```
[Schedule Trigger 08:00]
    ↓
[HTTP GET /api/products?status=active] → Obtener IDs actuales de ML
    ↓
[Google Sheets Node] → Leer IDs existentes en hoja Global
    ↓
[Code Node] → Comparar y detectar nuevos MLCs
    ↓
[IF Hay nuevos?]
    ↓                           ↓
[HTTP POST /api/sync-to-sheet]  [Log "No hay nuevos"]
(mode: new_only)
    ↓
[Telegram] → Notificar nuevos productos encontrados
```

---

## APIs a Crear/Modificar

### 1. GET /api/sync-sales (NUEVO)

**Propósito:** Retornar ventas separadas por canal logístico

```typescript
// src/app/api/sync-sales/route.ts

interface SyncSalesResponse {
  success: boolean;
  sales: Array<{
    mlc: string;
    ventas_full: number;
    ventas_flex: number;
    ventas_xd: number;
    ventas_total: number;
  }>;
  period: {
    start: string;
    end: string;
    days: number;
  };
}
```

**Lógica:**
1. Obtener órdenes de los últimos N días
2. Para cada orden, obtener `shipping.logistic_type`
3. Clasificar venta según:
   - `fulfillment` / `cross_docking` → FULL
   - `self_service` / `xd_drop_off` → FLEX/XD
4. Retornar ventas agrupadas por MLC

---

### 2. GET /api/flex-bonifications (NUEVO)

**Propósito:** Obtener bonificaciones FLEX de Mercado Libre

```typescript
// src/app/api/flex-bonifications/route.ts

interface FlexBonification {
  order_id: string;
  mlc: string;
  buyer_distance: 'short' | 'medium' | 'long';
  shipping_paid_by: 'buyer' | 'seller';
  bonification_amount: number; // $2890-$3090 o $289-$309
}
```

**Endpoints ML a investigar:**
- `/shipments/{shipment_id}/costs`
- `/orders/{order_id}/shipping`
- `/billing/items` (cobros y bonificaciones)

**Montos conocidos según PDF:**
| Escenario | Distancia | Bonificación |
|-----------|-----------|--------------|
| Envío paga comprador | Corta | $2,890 |
| Envío paga comprador | Media | $2,990 |
| Envío paga comprador | Larga | $3,090 |
| Envío gratis (seller paga) | Corta | $289 |
| Envío gratis (seller paga) | Media | $299 |
| Envío gratis (seller paga) | Larga | $309 |

---

### 3. Modificar PUT /api/sync-to-sheet

**Cambio:** Agregar actualización de ventas por canal

Actualmente solo actualiza stock. Modificar para:
1. Llamar a `/api/sync-sales` internamente
2. Actualizar columnas de ventas además de stock
3. Mantener retrocompatibilidad

---

## Configuración de n8n

### Variables de Entorno Requeridas

```env
# En n8n
BAZAR_API_URL=https://bazar-inventory-dashboard.vercel.app

# Credenciales
# - Telegram Bot Token (para notificaciones)
# - Google Sheets Service Account (opcional si se usa via API)
```

### Credenciales a Configurar

1. **HTTP Header Auth** (para APIs de BAZAR)
   - Header: `Authorization`
   - Value: Bearer token si se requiere

2. **Telegram** (para notificaciones)
   - Bot Token: Crear bot con @BotFather
   - Chat ID: ID del grupo/chat para alertas

3. **Google Sheets** (opcional)
   - Service Account Email
   - Private Key
   - Spreadsheet ID

---

## Plan de Ejecución

### Fase 1: Inmediato (CRÍTICO)

| # | Tarea | Tiempo Est. | Responsable |
|---|-------|-------------|-------------|
| 1 | Activar workflow `sync-stock-automatic` en n8n | 15 min | Ops |
| 2 | Configurar credenciales Telegram en n8n | 30 min | Ops |
| 3 | Verificar que stock se actualiza correctamente | 1 hora | QA |
| 4 | Activar workflow `sync-full-manual` | 15 min | Ops |

### Fase 2: Esta Semana (ALTA)

| # | Tarea | Tiempo Est. | Responsable |
|---|-------|-------------|-------------|
| 5 | Crear endpoint `/api/sync-sales` | 2-3 horas | Dev |
| 6 | Modificar PUT `/api/sync-to-sheet` para incluir ventas | 1-2 horas | Dev |
| 7 | Crear workflow `sync-sales-continuous.json` | 1 hora | Dev |
| 8 | Probar sincronización de ventas end-to-end | 1 hora | QA |

### Fase 3: Próxima Semana (MEDIA)

| # | Tarea | Tiempo Est. | Responsable |
|---|-------|-------------|-------------|
| 9 | Investigar API de bonificaciones FLEX | 2-3 horas | Dev |
| 10 | Implementar `/api/flex-bonifications` | 3-4 horas | Dev |
| 11 | Crear workflow `detect-new-publications` | 1 hora | Dev |
| 12 | Agregar selector de mes en UI de ventas | 2 horas | Dev |

### Fase 4: Mejoras UI (BAJA)

| # | Tarea | Tiempo Est. | Responsable |
|---|-------|-------------|-------------|
| 13 | Agregar columna Valorización por Costo | 1 hora | Dev |
| 14 | Agregar columna Valorización por Utilidad | 1 hora | Dev |
| 15 | Crear pestaña VALORIZACIÓN separada | 2-3 horas | Dev |
| 16 | Crear pestaña REPOSICIÓN con orden FULL/FLEX | 3-4 horas | Dev |

---

## Verificación

### Checklist Post-Implementación

- [ ] Stock se actualiza cada 30 minutos en Google Sheet
- [ ] Ventas 30D separadas por canal (FULL/FLEX/XD)
- [ ] Tags correctos (FULL, FLEX, Correo) para cada producto
- [ ] Productos Supermarket no incluyen stock FLEX
- [ ] Notificaciones Telegram funcionando
- [ ] Webhook manual responde correctamente
- [ ] Nuevos productos se detectan y agregan

### Métricas de Éxito

| Métrica | Objetivo |
|---------|----------|
| Latencia de actualización de stock | < 35 min |
| Precisión de ventas por canal | > 95% |
| Uptime de workflows | > 99% |
| Errores de sincronización | < 1/día |

---

## Anexo: Estructura de Hoja "Global"

| Columna | Tipo | Fuente | Actualización |
|---------|------|--------|---------------|
| A: MLC | String | ML API | Manual |
| B: SKU | String | ML API | Manual |
| C: Título | String | ML API | Manual |
| D: Estado | String | ML API | Automática |
| E: Stock FULL | Number | ML API | Automática (30 min) |
| F: Stock FLEX | Number | ML API | Automática (30 min) |
| G: Stock XD | Number | ML API | Automática (30 min) |
| H: Stock Total | Number | Calculado | Automática (30 min) |
| I: Es Supermarket | Boolean | ML API | Manual |
| J: Es Catálogo | Boolean | ML API | Manual |
| K: Ventas 30D FULL | Number | Orders API | Automática (4 hrs) |
| L: Ventas 30D FLEX | Number | Orders API | Automática (4 hrs) |
| M: Ventas 30D XD | Number | Orders API | Automática (4 hrs) |
| N: Ventas 30D Total | Number | Calculado | Automática (4 hrs) |
| O: Precio | Number | ML API | Manual |
| P: Tipo Logístico | String | ML API | Manual |
| Q: Tags | String | Calculado | Automática (30 min) |
| R: Proveedor | String | Manual | NUNCA (manual) |
| S: Costo | Number | Manual | NUNCA (manual) |
| T: Última Act. | DateTime | Sistema | Automática |

---

## Contacto

Para dudas sobre este plan:
- **Repositorio:** github.com/[org]/BAZAR
- **Dashboard:** bazar-inventory-dashboard.vercel.app
