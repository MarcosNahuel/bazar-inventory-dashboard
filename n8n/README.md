# Documentacion Instancia n8n - BAZAR Importaciones

**Instancia:** https://agente-meli-n8n.7skqlp.easypanel.host
**Cliente:** Akshay Mohandas (bazaroimportaciones@gmail.com)
**Negocio:** E-commerce en Mercado Libre Chile
**Ultima actualizacion:** 2025-12-18

---

## Resumen de la Instancia

La instancia n8n de BAZAR contiene **11 workflows** enfocados en:
- Sincronizacion de inventario con Mercado Libre
- Calculo de ventas y metricas
- Agente de postventa con IA
- Gestion de stock

### Estado de Workflows

| # | Workflow | Estado | Descripcion |
|---|----------|--------|-------------|
| 1 | My workflow | Inactivo | Autenticacion OAuth con ML |
| 2 | ML Total | Inactivo | Sincronizacion completa de inventario |
| 3 | Test Import | Inactivo | Pruebas de importacion |
| 4 | Eliminar | Inactivo | Workflow de limpieza |
| 5 | ML SALES | Inactivo | Analisis de ventas |
| 6 | MarIA - Agente Postventa | Inactivo | Chatbot IA para postventa |
| 7 | Update_Inventory_From_Purchases | Inactivo | Actualizacion desde compras |
| 8 | AI Inventory Assistant | Inactivo | Asistente IA de inventario |
| 9 | ML STOCK | Inactivo | Gestion de stock |
| 10 | Stock_ML_Automation_v1 | Inactivo | Automatizacion de stock v1 |
| 11 | ML Optimizar | Inactivo | Optimizacion de publicaciones |

---

## Workflows Principales

### 1. ML Total (Workflow Principal)

**Proposito:** Sincronizacion completa del inventario de Mercado Libre a Google Sheets.

**Flujo:**
```
Schedule (6h) -> Refresh Token -> Get Products ->
├── Get Item Details -> Extract SKU/Status -> Get Stock
├── Get Sales 30d -> Summarize by SKU
├── Get Sales 60d -> Summarize by SKU
└── Merge All -> Update Google Sheet
```

**Funcionalidades:**
- Obtiene todos los productos del seller
- Calcula stock por ubicacion (FULL, FLEX, Centro)
- Calcula ventas de 30 y 60 dias
- Identifica productos elegibles para Supermarket
- Calcula rentabilidad y utilidad por producto
- Actualiza Google Sheet automaticamente

**Metricas Calculadas:**
- Ventas por canal (FULL, FLEX, Centro)
- Margen de ganancia por producto
- ROI por venta
- Frecuencia de rotacion
- Alertas de productos con perdida

---

### 2. MarIA - Agente Postventa (Supabase)

**Proposito:** Chatbot automatizado para atencion postventa.

**Tipos de Consulta:**
| Tipo | Deteccion | Herramienta |
|------|-----------|-------------|
| Tracking | "donde", "pedido", "envio" | tracking_lookup |
| Facturacion | "factura" | billing_check |
| Devolucion | "devol", "reembolso" | return_policy_check |
| Garantia | "garantia", "falla", "defecto" | warranty_check |
| Instalacion | "instala", "armar", "config" | knowledge_base |
| General | otros | respuesta_generica |

**Reglas de Negocio:**
- Devolucion: 30 dias desde entrega
- Garantia: 6 meses (180 dias)
- Escalacion automatica para garantias y devoluciones

**Integracion Supabase:**
- Tabla `escalations`: Casos escalados a humanos
- Tabla `ai_interactions`: Log de conversaciones

---

### 3. My workflow (Autenticacion)

**Proposito:** Flujo OAuth2 para obtener tokens de Mercado Libre.

**Endpoints utilizados:**
- `POST /oauth/token` (authorization_code)
- `POST /oauth/token` (refresh_token)

**Webhooks:**
- `/webhook/prueba` - Recibe codigo de autorizacion

---

## Integraciones

### Mercado Libre API

**Endpoints Utilizados:**
| Endpoint | Uso |
|----------|-----|
| `/oauth/token` | Autenticacion |
| `/users/{id}/items/search` | Listar productos |
| `/items/{id}` | Detalles de producto |
| `/user-products/{id}/stock` | Stock por ubicacion |
| `/orders/search` | Buscar ordenes/ventas |
| `/shipments/{id}` | Info de envio |

**Rate Limiting:**
- Batch size: 12 requests
- Interval: 500-5000ms entre batches

### Google Sheets

**Documento:** Inventario_ML
**Hoja:** Global

**Operaciones:**
- Append or Update (por SKU o Codigo_ML)
- Read (para merge con datos de ML)

### Supabase

**Tablas:**
- `escalations` - Casos de soporte
- `ai_interactions` - Historial de IA

---

## Estructura de Datos

### Producto en Sheet
```json
{
  "Proveedor": "string",
  "Codigo_ML": "MLC1234567890",
  "SKU": "SKU-001",
  "Titulo": "Nombre del producto",
  "Status": "active|paused|closed",
  "Stock_FULL": 10,
  "Stock_FLEX": 5,
  "Stock_Total": 15,
  "Supermarket": "Si|No",
  "Costo": 15000,
  "Valorizacion": 225000,
  "Ventas_60": 20,
  "Ventas_30": 12,
  "V30FULL": 8,
  "V30FLEX": 3,
  "V30CENTRO": 1,
  "Permalink": "https://..."
}
```

### Analisis de Rentabilidad
```json
{
  "Precio_Venta": 25000,
  "Comision_ML": 3500,
  "Costo_Envio": 2000,
  "Ingreso_Neto": 19500,
  "Costo_Producto": 15000,
  "Utilidad": 4500,
  "Rentabilidad_Porcentaje": 30,
  "ROI": 23.08
}
```

---

## Configuracion Recomendada

### Variables de Entorno
```bash
# Mercado Libre
ML_CLIENT_ID=5168368765576929
ML_CLIENT_SECRET=PInjmoLGlppXD5BVHXnCy2154voNQ8XM
ML_REFRESH_TOKEN=TG-xxxxx-2303729344

# Supabase
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_ANON_KEY=eyJxxx...

# n8n
N8N_HOST=https://agente-meli-n8n.7skqlp.easypanel.host
```

---

## Proximos Pasos (Modulo 1)

### Sistema de Alertas Low Stock
- [ ] Crear workflow de alertas
- [ ] Configurar umbral de 5 unidades
- [ ] Enviar notificaciones por Email
- [ ] Incluir sugerencia de reposicion

### Dashboard Looker Studio
- [ ] Conectar con Google Sheet
- [ ] Crear graficos de ventas
- [ ] Panel de stock actual
- [ ] Alertas visuales de stock bajo
- [ ] Calculo de capital para reposicion

### Gestion de Costos
- [ ] Integrar lista de precios de proveedores
- [ ] Calcular margen real actualizado
- [ ] Proyeccion de compras mensual

---

## Archivos del Backup

```
n8n/
├── README.md (este archivo)
└── 18-12-25 workflow/
    ├── VARIABLES.md
    ├── my_workflow.json
    ├── ml_total.json
    ├── ml_sales.json
    ├── ml_stock.json
    ├── ml_optimizar.json
    ├── maria_agente_postventa.json
    ├── ai_inventory_assistant.json
    ├── update_inventory_from_purchases.json
    ├── stock_ml_automation_v1.json
    ├── test_import.json
    └── eliminar.json
```
