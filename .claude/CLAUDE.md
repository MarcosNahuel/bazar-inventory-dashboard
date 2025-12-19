# BAZAR Importaciones - Proyecto de Automatizacion

## Descripcion del Proyecto

Sistema de automatizacion para **BAZAR Importaciones**, e-commerce que opera en Mercado Libre Chile.

**Cliente:** Akshay Mohandas
**Email:** bazaroimportaciones@gmail.com
**Presupuesto Modulo 1:** USD 600

---

## Modulo 1: Sistema de Stock, Costos y Dashboard

### Alcance

1. **Sincronizacion de Inventario**
   - Fuente: API Mercado Libre
   - Destino: Google Sheets
   - Frecuencia: Cada 6 horas (configurable)

2. **Sistema de Alertas Low Stock**
   - Umbral: 5 unidades
   - Canal: Email
   - Incluye sugerencia de reposicion

3. **Dashboard de Metricas (Looker Studio)**
   - Ventas historicas y actuales
   - Rentabilidad por producto
   - Proyeccion de capital para reposicion

4. **Gestion de Costos**
   - Lista de precios de proveedores
   - Margen real calculado
   - Valorizacion de inventario

---

## Recursos del Proyecto

### n8n Instance
- **URL:** https://agente-meli-n8n.7skqlp.easypanel.host
- **Documentacion:** /n8n/README.md
- **Variables:** /n8n/18-12-25 workflow/VARIABLES.md

### Google Sheets
- **Inventario:** https://docs.google.com/spreadsheets/d/1z2yPe2-_pf-m86P9gFetlh7lapVANF8um_qsbNZdOEc
- **Hoja:** Global

### Mercado Libre
- **Seller ID:** 2303729344
- **Pais:** Chile (MLC)

---

## Estructura de Archivos

```
BAZAR/
├── .claude/
│   └── CLAUDE.md (este archivo)
├── n8n/
│   ├── README.md
│   └── 18-12-25 workflow/
│       ├── VARIABLES.md
│       └── *.json (11 workflows)
├── Inventario_ML.xlsx
└── MCPTOOLS.md
```

---

## Workflows Disponibles

| Workflow | Funcion | Estado |
|----------|---------|--------|
| ML Total | Sync completo de inventario | Listo |
| ML STOCK | Gestion de stock | En desarrollo |
| ML SALES | Analisis de ventas | En desarrollo |
| MarIA | Agente postventa IA | Listo |

---

## APIs y Endpoints

### Mercado Libre
```
Base URL: https://api.mercadolibre.com
Auth: Bearer Token (refresh cada 6h)
```

### n8n API
```
Base URL: https://agente-meli-n8n.7skqlp.easypanel.host/api/v1
Auth: X-N8N-API-KEY header
```

---

## Tareas Pendientes

- [ ] Implementar alertas de stock bajo por email
- [ ] Crear dashboard en Looker Studio
- [ ] Integrar costos de proveedores
- [ ] Calcular proyeccion de capital mensual
- [ ] Activar workflow ML Total en produccion

---

## Notas Tecnicas

### Refresh Token ML
El refresh token de Mercado Libre debe actualizarse periodicamente.
Workflow `My workflow` maneja la autenticacion OAuth.

### Rate Limits
- ML API: 12 requests por batch, 500ms entre batches
- n8n: Sin limite conocido en instancia privada

### Columnas Clave del Sheet
- `SKU` - Identificador unico para merge
- `Codigo_ML` - ID MLC del producto
- `Stock_Total` - Para alertas
- `Costo` - Para calculos de rentabilidad
