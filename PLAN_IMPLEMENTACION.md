# Plan de Implementacion - Modulo 1: Stock, Costos y Dashboard

**Cliente:** BAZAR Importaciones (Akshay Mohandas)
**Presupuesto:** USD 600
**Fecha:** 2025-12-18

---

## Resumen Ejecutivo

Tras analizar los 11 workflows existentes en n8n, el cliente ya tiene **80% del trabajo hecho**. La implementacion del Modulo 1 requiere principalmente:
1. Unificar y optimizar workflows existentes
2. Activar el sistema de alertas por email
3. Crear dashboard en Looker Studio
4. Integrar costos de proveedores

---

## Estado Actual del Sistema

### Workflows Existentes Relevantes

| Workflow | Funcion | Estado | Comentario |
|----------|---------|--------|------------|
| **ML Total** | Sync completo inventario + ventas | Funcional | 49 nodos, muy completo |
| **ML STOCK** | Sync stock basico | Funcional | 27 nodos, duplica ML Total |
| **Stock_ML_Automation_v1** | Alertas email | Incompleto | Ya tiene template de email |
| **ML SALES** | Analisis ventas | Funcional | Metricas avanzadas |

### Datos que Ya se Sincronizan

El workflow `ML Total` ya calcula automaticamente:
- Stock por ubicacion (FULL, FLEX, Centro)
- Ventas ultimos 30 y 60 dias
- Ventas por canal logistico
- Elegibilidad Supermarket
- Codigo ML, SKU, Titulo, Status, Permalink

### Lo que Falta Implementar

1. **Alertas de stock bajo** - Template existe, falta conectar
2. **Dashboard visual** - No existe
3. **Costos de proveedores** - Columna existe pero vacia
4. **Calculo de capital para reposicion** - Parcialmente en ML Total

---

## Plan de Implementacion por Fases

### FASE 1: Unificacion de Workflows (Existente)

**Objetivo:** Usar ML Total como workflow principal y eliminar duplicados.

**Acciones:**
1. [x] Backup de todos los workflows (completado 18-12-25)
2. [ ] Activar workflow `ML Total` en produccion
3. [ ] Desactivar/archivar: ML STOCK, Stock_ML_Automation_v1 (ya cubiertos)
4. [ ] Verificar trigger cada 6 horas funciona

**Resultado:** Un solo workflow robusto sincronizando inventario.

---

### FASE 2: Sistema de Alertas Low Stock

**Objetivo:** Notificar por email cuando stock < 5 unidades.

**Arquitectura:**
```
ML Total (existente)
    |
    v
[Nuevo Nodo] Filter Stock < 5
    |
    v
[Nuevo Nodo] Format Email
    |
    v
[Nuevo Nodo] Send via Gmail
```

**Opcion A: Extender ML Total**
- Agregar nodos al final del workflow existente
- Pros: Un solo workflow
- Contras: Mas complejo de mantener

**Opcion B: Webhook Trigger (Recomendado)**
- Crear workflow separado "Low Stock Alerts"
- Se ejecuta despues de ML Total via webhook
- Pros: Modular, facil de debuggear

**Template de Email (ya existe en Stock_ML_Automation_v1):**
```html
<h2>Alerta de Stock Bajo - {fecha}</h2>
<p>Se detectaron {N} producto(s) bajo el umbral minimo:</p>

| Urgencia | SKU | Producto | Stock | Umbral | Deficit |
|----------|-----|----------|-------|--------|---------|
| URGENTE | xxx | yyy      | 2     | 5      | -3      |
```

**Implementacion:**
1. [ ] Crear nodo IF: `Stock_Total < 5`
2. [ ] Agregar nodo Gmail con credenciales del cliente
3. [ ] Configurar email destino: `bazaroimportaciones@gmail.com`
4. [ ] Testear con productos de bajo stock

---

### FASE 3: Dashboard en Looker Studio

**Objetivo:** Visualizacion de metricas en tiempo real.

**Fuente de Datos:**
- Google Sheets: `1z2yPe2-_pf-m86P9gFetlh7lapVANF8um_qsbNZdOEc`
- Hoja: `Global`

**Paneles a Crear:**

#### Panel 1: Resumen General
```
+------------------+------------------+------------------+
|   Total SKUs     |   Stock Total    |   Valor Total    |
|      125         |     1,543        |   $15,430,000    |
+------------------+------------------+------------------+
```

#### Panel 2: Alertas de Stock
```
+--------------------------------------------------+
|  PRODUCTOS CON STOCK CRITICO (< 5 unidades)      |
|--------------------------------------------------|
| [Grafico de barras horizontal]                   |
| SKU-001: ████ 2 unidades                         |
| SKU-002: ██████ 4 unidades                       |
| SKU-003: ██████████ 5 unidades                   |
+--------------------------------------------------+
```

#### Panel 3: Ventas por Periodo
```
+---------------------------+---------------------------+
|    Ventas Ultimos 30d     |    Ventas Ultimos 60d     |
|        342 uds            |        687 uds            |
|      +12% vs anterior     |      +8% vs anterior      |
+---------------------------+---------------------------+
```

#### Panel 4: Distribucion por Canal
```
+--------------------------------------------------+
|            Ventas por Canal Logistico             |
|--------------------------------------------------|
| [Grafico de torta]                                |
|   FULL: 45%                                       |
|   FLEX: 35%                                       |
|   Centro: 20%                                     |
+--------------------------------------------------+
```

#### Panel 5: Rentabilidad por Producto
```
+--------------------------------------------------+
|         Top 10 Productos Mas Rentables           |
|--------------------------------------------------|
| [Tabla con columnas]                              |
| SKU | Producto | Ventas | Costo | Margen | ROI   |
+--------------------------------------------------+
```

#### Panel 6: Proyeccion de Capital
```
+--------------------------------------------------+
|       CAPITAL NECESARIO PARA REPOSICION          |
|--------------------------------------------------|
|   Este mes: $2,500,000 CLP                       |
|   Proximo mes (proyectado): $3,100,000 CLP       |
|--------------------------------------------------|
| [Formula: SUM(Costo * (Ventas_30 / 30 * 45))]    |
| Asume 45 dias de stock de seguridad              |
+--------------------------------------------------+
```

**Pasos de Implementacion:**
1. [ ] Crear nuevo reporte en Looker Studio
2. [ ] Conectar con Google Sheets del cliente
3. [ ] Crear campos calculados:
   - `Stock_Critico`: IF(Stock_Total < 5, "SI", "NO")
   - `Capital_Reposicion`: Costo * (Ventas_30 / 30 * 45)
   - `Margen_Real`: Precio - Costo - (Precio * 0.13)
4. [ ] Disenar cada panel
5. [ ] Configurar filtros por Proveedor, Status
6. [ ] Compartir con cliente (viewer access)

---

### FASE 4: Gestion de Costos

**Objetivo:** Mantener costos actualizados para calculos de rentabilidad.

**Estado Actual:**
- Columna `Costo` existe en el Sheet
- Columna `Valorizacion` existe pero no se calcula
- No hay integracion con proveedores

**Opciones de Implementacion:**

#### Opcion A: Manual via Google Sheets (Recomendado para MVP)
1. Cliente actualiza costos manualmente en columna `Costo`
2. Workflow calcula automaticamente:
   - Valorizacion = Stock_Total * Costo
   - Margen = Precio - Costo - Comisiones
3. Dashboard muestra metricas

**Formula de Comision ML Chile:**
```
Comision = Precio * 0.13 (13% promedio)
Costo_Envio = Variable segun peso
Margen_Neto = Precio - Costo - Comision - Costo_Envio
```

#### Opcion B: Integracion con Proveedores (Fase futura)
1. Crear hoja separada "Lista_Proveedores" con:
   - SKU, Proveedor, Costo, Fecha_Actualizacion
2. Workflow hace VLOOKUP para actualizar costos
3. Alerta cuando costo cambia > 10%

**Implementacion MVP:**
1. [ ] Agregar nodo de calculo en ML Total:
   ```javascript
   Valorizacion = Stock_Total * Costo
   Margen_Estimado = Precio - Costo - (Precio * 0.13)
   ROI = (Margen_Estimado / Costo) * 100
   ```
2. [ ] Crear campo calculado en Looker para proyeccion
3. [ ] Documentar proceso manual para cliente

---

## Cronograma de Entrega

| Fase | Tarea | Prioridad |
|------|-------|-----------|
| 1 | Activar ML Total | Alta |
| 2 | Alertas Email | Alta |
| 3 | Dashboard Looker | Media |
| 4 | Integracion Costos | Media |

---

## Credenciales Necesarias

### Ya Configuradas
- [x] Mercado Libre OAuth (Client ID, Secret, Refresh Token)
- [x] Google Sheets OAuth
- [x] n8n API Key

### Por Configurar
- [ ] Gmail API para envio de alertas
- [ ] Looker Studio (cuenta Google del cliente)

---

## Riesgos y Mitigacion

| Riesgo | Probabilidad | Impacto | Mitigacion |
|--------|--------------|---------|------------|
| Refresh Token ML expira | Media | Alto | Workflow My workflow lo renueva |
| Rate limit ML API | Baja | Medio | Ya tiene batching configurado |
| Sheet muy grande | Baja | Bajo | ML tiene ~100-200 productos |
| Email en spam | Media | Bajo | Configurar SPF/DKIM |

---

## Metricas de Exito

1. **Sincronizacion:** Stock actualizado cada 6 horas
2. **Alertas:** Email enviado en < 5 min cuando stock < 5
3. **Dashboard:** Acceso 24/7 con datos frescos
4. **Costos:** Margen calculado para 100% de productos

---

## Proximos Pasos Inmediatos

1. **Verificar acceso** al Google Sheet del cliente
2. **Testear workflow** ML Total manualmente
3. **Configurar Gmail** en n8n para alertas
4. **Crear dashboard** inicial en Looker Studio
5. **Documentar** proceso para el cliente

---

## Estructura de Archivos Final

```
BAZAR/
├── .claude/
│   └── CLAUDE.md
├── n8n/
│   ├── README.md
│   └── 18-12-25 workflow/
│       ├── VARIABLES.md
│       └── *.json (11 workflows backup)
├── dashboard/
│   └── looker_studio_config.md (por crear)
├── docs/
│   └── manual_usuario.md (por crear)
├── PLAN_IMPLEMENTACION.md (este archivo)
├── Inventario_ML.xlsx
└── MCPTOOLS.md
```

---

## Notas Tecnicas Adicionales

### API Mercado Libre Chile

**Endpoints principales:**
```
Base: https://api.mercadolibre.com
Auth: POST /oauth/token
Items: GET /users/{user_id}/items/search
Details: GET /items/{item_id}
Stock: GET /user-products/{id}/stock
Orders: GET /orders/search
```

**Rate Limits:**
- 10,000 requests/hora por app
- Workflow actual usa ~500-1000 requests por ejecucion

### Google Sheets

**ID del documento:** `1z2yPe2-_pf-m86P9gFetlh7lapVANF8um_qsbNZdOEc`

**Estructura esperada:**
| Columna | Tipo | Fuente |
|---------|------|--------|
| Proveedor | String | Manual |
| Codigo_ML | String | API ML |
| SKU | String | API ML |
| Titulo | String | API ML |
| Status | String | API ML |
| Stock_FULL | Number | API ML |
| Stock_FLEX | Number | API ML |
| Stock_Total | Number | Calculado |
| Costo | Number | Manual |
| Valorizacion | Number | Calculado |
| Ventas_30 | Number | API ML |
| Ventas_60 | Number | API ML |

---

**Documento generado automaticamente por Claude Code**
**Ultima actualizacion:** 2025-12-18 18:15 CLT
