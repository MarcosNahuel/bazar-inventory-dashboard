# Variables y Credenciales - Instancia n8n BAZAR

**Fecha de extraccion:** 2025-12-18
**Instancia:** https://agente-meli-n8n.7skqlp.easypanel.host

---

## 1. Credenciales Mercado Libre

| Variable | Valor |
|----------|-------|
| Client ID | `5168368765576929` |
| Client Secret | `PInjmoLGlppXD5BVHXnCy2154voNQ8XM` |
| Refresh Token | `TG-69322bd1aad70a0001bbe607-2303729344` |
| Seller ID | `2303729344` |
| Redirect URI | `https://agente-meli-n8n.7skqlp.easypanel.host/webhook/prueba` |

### URL de Autorizacion ML
```
https://auth.mercadolibre.com/authorization?response_type=code&client_id=5168368765576929&redirect_url=https://agente-meli-n8n.7skqlp.easypanel.host/webhook-test/prueba
```

### Scopes Autorizados
- `urn:ml:mktp:comunication:/read-write`
- `urn:ml:mktp:publish-sync:/read-write`
- `urn:ml:mktp:ads:/read-write`
- `urn:ml:mktp:invoices:/read-write`
- `urn:ml:mktp:metrics:/read-only`
- `urn:ml:mktp:offers:/read-write`
- `urn:ml:mktp:orders-shipments:/read-write`
- `offline_access`

---

## 2. Google Sheets

| Variable | Valor |
|----------|-------|
| Document ID | `1z2yPe2-_pf-m86P9gFetlh7lapVANF8um_qsbNZdOEc` |
| Sheet Name | `Global` |
| Sheet GID | `1150527612` |
| Credential ID | `CfOllqRMLaUn0Fa0` |
| Credential Name | `Google Sheets account` |

### URL del Sheet
```
https://docs.google.com/spreadsheets/d/1z2yPe2-_pf-m86P9gFetlh7lapVANF8um_qsbNZdOEc/edit#gid=1150527612
```

### Columnas del Inventario
| Columna | Descripcion |
|---------|-------------|
| Proveedor | Nombre del proveedor |
| Codigo_ML | Codigo MLC del producto |
| SKU | SKU interno del vendedor |
| Titulo | Titulo del producto |
| Status | Estado de la publicacion |
| Stock_FULL | Stock en Fulfillment ML |
| Stock_FLEX | Stock en Flex ML |
| Stock_Total | Total de stock |
| Supermarket | Elegible para Supermarket |
| Costo | Costo unitario del producto |
| Valorizacion | Valor total del inventario |
| Ventas_60 | Ventas ultimos 60 dias |
| Ventas_30 | Ventas ultimos 30 dias |
| V30FULL | Ventas 30d desde FULL |
| V30FLEX | Ventas 30d desde FLEX |
| V30CENTRO | Ventas 30d desde Centro |
| RepFULL | Reposicion FULL |
| RepFLEX | Reposicion FLEX |
| RepTotal | Reposicion Total |
| Permalink | Link al producto en ML |

---

## 3. Supabase (Self-Hosted)

**URL:** `https://agente-meli-supabase.7skqlp.easypanel.host`
**Dashboard:** `supabase` / `Nachonahue2`

### Credenciales Nuevas (Seguras - Generadas 2025-12-18)

| Variable | Valor |
|----------|-------|
| JWT_SECRET | `wcxrHXReql6/D8u6PZA83c0BXd/qv2zx46C0VL8bgQw=` |
| ANON_KEY | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNzY2MDk1NzkwLCJleHAiOjIwODE0NTU3OTB9.9FaWbm-Shq-DUWhot5D0DY9CdYAUnZ2Ftv6VkWLaRTE` |
| SERVICE_ROLE_KEY | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaXNzIjoic3VwYWJhc2UiLCJpYXQiOjE3NjYwOTU3OTAsImV4cCI6MjA4MTQ1NTc5MH0.nBdY5F5muq7lPOx9Ook0E3lanRUFOa-wJny5-woYyEI` |

### Tablas Supabase
- `escalations` - Casos escalados a humanos
- `ai_interactions` - Log de interacciones con IA

### Credenciales Mercado Libre (Nueva App - 2025-12-18)

| Variable | Valor |
|----------|-------|
| Client ID | `3004336950612441` |
| Client Secret | `GG5zMDMpovxuKWBeAV6dxNJMnF8uZ7lU` |
| Access Token | `APP_USR-3004336950612441-121817-c48717a0d43eee5e89319d8da896360b-2303729344` |
| Refresh Token | `TG-694473ebadde630001e08ea4-2303729344` |
| User ID | `2303729344` |

---

## 4. n8n Instance

| Variable | Valor |
|----------|-------|
| URL | `https://agente-meli-n8n.7skqlp.easypanel.host` |
| API Key | `eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...` |
| Owner Email | `bazaroimportaciones@gmail.com` |
| Owner Name | `Akshay Mohandas` |
| Project ID | `Dx5gmdaSDUeD6Fmv` |

---

## 5. Webhooks Configurados

| Nombre | Path | Workflow |
|--------|------|----------|
| Webhook ML Auth | `/webhook/prueba` | My workflow |
| Webhook Postventa | `/webhook/postventa-demo` | MarIA - Agente Postventa |

---

## 6. Triggers Programados

| Workflow | Frecuencia |
|----------|------------|
| ML Total | Cada 6 horas |
| MarIA - Agente Postventa | Cada 6 horas |

---

## IMPORTANTE: Seguridad

Estas credenciales son sensibles. Asegurate de:
1. No compartir este archivo publicamente
2. Rotar el refresh token de ML periodicamente
3. Usar variables de entorno en produccion
4. Mantener respaldo de las credenciales
