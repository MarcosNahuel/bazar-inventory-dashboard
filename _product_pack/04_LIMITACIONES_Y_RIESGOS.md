# BAZAR Importaciones — Limitaciones y Riesgos
## Sin Maquillaje: Riesgos Reales y Mitigaciones

**Producto:** Dashboard de Inventario
**Última actualización:** Enero 2026
**Nivel de transparencia:** 100% (sin ocultamiento)

---

## Filosofía de Este Documento

Este documento NO es una lista de excusas. Es un análisis honesto de:
- **Riesgos técnicos reales** que pueden afectar al negocio
- **Limitaciones actuales** del sistema
- **Mitigaciones implementadas** y pendientes
- **Decisiones de trade-off** y sus consecuencias

**Regla:** Si un riesgo puede costar dinero, perder datos o afectar al cliente, está aquí.

---

## Riesgos Críticos (Impacto Alto)

### 1. Dependencia Total de API de Mercado Libre

#### Riesgo
- **Si ML API cae o cambia sin aviso → el dashboard queda inoperante**
- ML tiene historial de cambios breaking en API sin deprecation period
- Rate limits de 10,000 req/hora pueden alcanzarse en operación intensa

#### Impacto
- **Probabilidad:** Media (ML ha tenido outages de 2-4 horas)
- **Impacto:** **Crítico** — Sin API ML, no hay datos, no hay dashboard
- **Costo estimado:** $0 (no hay ventas en dashboard, es herramienta interna), pero pérdida de visibilidad operativa

#### Mitigación Actual
✅ **Cache de 1 hora** reduce dependencia para datos históricos
✅ **Fallback a env vars** si Supabase falla para tokens
✅ **Retry con exponential backoff** en errores 429/502/503

#### Mitigación Pendiente (Alta Prioridad)
❌ **Modo degradado:** Mostrar últimos datos cacheados con warning "Datos de hace X horas"
❌ **Alertas proactivas:** Webhook a n8n si API ML no responde en 30s
❌ **Data lake secundario:** Backup diario de productos/ventas en Supabase para consultas históricas sin depender de ML

**Responsable:** Equipo de backend
**Plazo recomendado:** 30 días

---

### 2. Proyecciones ML con Baja Confianza en Negocios Irregulares

#### Riesgo
- **R² de 73% significa que el 27% de la variabilidad NO está explicada**
- En negocios con alta estacionalidad (ej: Black Friday, Navidad), proyecciones pueden estar desfasadas hasta 40%
- Eventos no predecibles (cambio de proveedor, competencia nueva, crisis económica) no se capturan

#### Impacto
- **Probabilidad:** **Alta** en periodos de alta variabilidad
- **Impacto:** Medio — Decisiones de compra basadas en proyecciones erróneas
- **Costo estimado:** $2,000-$5,000 en sobre-stock o quiebres no anticipados

#### Mitigación Actual
✅ **Intervalo de confianza 95%** se muestra en UI
✅ **R² visible** para que usuario juzque confianza del modelo
⚠️ **Warning en UI:** "Las proyecciones son estimaciones, NO garantías"

#### Mitigación Pendiente (Media Prioridad)
❌ **Ajuste manual:** Permitir al usuario modificar proyección con % custom
❌ **Detección de anomalías:** Alertar si ventas se desvían >30% de lo proyectado
❌ **Modelos alternativos:** ARIMA, Prophet para comparar accuracy

**Responsable:** Data Science / Analytics
**Plazo recomendado:** 60 días

---

### 3. Tokens ML Expiran y Pueden No Refrescarse

#### Riesgo
- **Si `refresh_token` expira (90 días sin uso) → pérdida total de acceso a ML API**
- Usuario debe re-autenticar manualmente en portal de ML
- Proceso de re-auth requiere permisos de admin en cuenta ML

#### Impacto
- **Probabilidad:** Baja (solo si no se usa por 90+ días)
- **Impacto:** **Alto** — Dashboard inoperante hasta re-auth
- **Tiempo de recuperación:** 5-30 minutos (depende de disponibilidad del dueño)

#### Mitigación Actual
✅ **Refresh automático** 30 min antes de expirar
✅ **Persistencia en Supabase** + fallback a env vars
⚠️ **Logs de refresh:** Se registra en console cada refresh exitoso

#### Mitigación Pendiente (Alta Prioridad)
❌ **Alerta proactiva:** Email 7 días antes de que refresh_token expire
❌ **Documentación:** Guía de re-auth con screenshots paso a paso
❌ **Webhook de emergencia:** Notificar a admin si access_token falla 3 veces consecutivas

**Responsable:** DevOps + Cliente
**Plazo recomendado:** 15 días

---

## Riesgos Moderados (Impacto Medio)

### 4. Latencia Extrema en Primera Carga del Día

#### Riesgo
- **Primera carga del dashboard (proyecciones ML) tarda 60-80 segundos**
- Usuario puede pensar que está caído y cerrar la pestaña
- API ML consulta 365 días de órdenes (puede ser 2,000-5,000 órdenes)

#### Impacto
- **Probabilidad:** **100%** (ocurre todos los días)
- **Impacto:** Bajo-Medio — UX degradada, frustración del usuario
- **Costo:** $0 (no hay pérdida funcional), pero afecta adopción

#### Mitigación Actual
✅ **Cache de 1 hora** hace que cargas subsecuentes sean <2s
✅ **Loading state** con mensaje "Consultando 365 días de ventas..."
⚠️ **Warning en docs:** Explicación de por qué tarda

#### Mitigación Pendiente (Media Prioridad)
❌ **Pre-carga nocturna:** Cron job a las 6 AM que cachea datos antes de que usuario abra
❌ **Reducir ventana:** Opción de analizar solo últimos 180 días (sacrifica accuracy por velocidad)
❌ **Streaming de datos:** Mostrar primeros 90 días mientras carga el resto en background

**Responsable:** Frontend + Backend
**Plazo recomendado:** 45 días

---

### 5. Costos Deben Cargarse Manualmente

#### Riesgo
- **ML API NO provee costos de productos → deben ingresarse manualmente**
- Si usuario no carga costos → cálculo de márgenes es imposible
- Riesgo de datos desactualizados si proveedor cambia precios

#### Impacto
- **Probabilidad:** **Alta** (cliente debe recordar actualizar)
- **Impacto:** Medio — Decisiones de pricing sin fundamento
- **Costo potencial:** Vender productos con margen negativo sin saberlo

#### Mitigación Actual
✅ **Upload masivo Excel/CSV** facilita carga batch
✅ **Validación de formato** previene errores de tipeo
⚠️ **Reminder visual:** UI muestra "Sin costo configurado" en productos

#### Mitigación Pendiente (Alta Prioridad)
❌ **OCR automático de facturas:** Ya implementado (`/api/ocr`), falta integrar a UI
❌ **Alerta de desactualización:** "Costos tienen >60 días sin actualizar"
❌ **Integración con proveedores:** API directa a proveedores top para costos en tiempo real

**Responsable:** Cliente + Equipo de integraciones
**Plazo recomendado:** 30 días (OCR UI), 90 días (integración proveedores)

---

### 6. Sincronización Google Sheets es Unidireccional (por ahora)

#### Riesgo
- **Actualmente solo EXPORTA de Dashboard → Sheets**
- No hay importación automática de Sheets → Dashboard
- Cambios en Sheets no se reflejan en Dashboard sin proceso manual

#### Impacto
- **Probabilidad:** Media (solo si contador usa Sheets como source of truth)
- **Impacto:** Bajo-Medio — Datos duplicados, posible inconsistencia

#### Mitigación Actual
✅ **Documentación clara:** README especifica que Sheets es solo output
⚠️ **Warning en UI:** "Cambios en Sheets no afectan al Dashboard"

#### Mitigación Pendiente (Baja Prioridad)
❌ **Sincronización bidireccional:** Detectar cambios en Sheets y aplicar a Dashboard
❌ **Conflict resolution:** UI para resolver conflictos de datos

**Responsable:** Equipo de integraciones
**Plazo recomendado:** 90 días (no urgente)

---

## Riesgos de Datos y Privacidad

### 7. Tokens ML en Supabase (Tabla sin Encriptar)

#### Riesgo
- **Tokens se guardan en Supabase en texto plano** (no encriptados at-rest)
- Si Supabase es comprometido → atacante tiene acceso total a cuenta ML
- RLS protege lectura, pero `service_role_key` tiene acceso full

#### Impacto
- **Probabilidad:** Muy Baja (requiere compromiso de Supabase + service_role_key)
- **Impacto:** **Crítico** — Acceso total a inventario, órdenes, datos de clientes ML

#### Mitigación Actual
✅ **RLS habilitado:** Solo backend con service_role_key puede leer/escribir
✅ **service_role_key en env vars:** No en código ni en frontend
⚠️ **Supabase encryption at-rest:** Supabase encripta disco por defecto (AES-256), pero no a nivel de columna

#### Mitigación Pendiente (Alta Prioridad - Seguridad)
❌ **Encriptar tokens:** Usar `pgcrypto` para encriptar `access_token` y `refresh_token` a nivel de columna
❌ **Rotación de service_role_key:** Cada 90 días
❌ **Audit logs:** Registrar todo acceso a tabla `ml_tokens`

**Responsable:** DevOps + Security
**Plazo recomendado:** **INMEDIATO** (30 días máximo)

---

### 8. Sin Autenticación de Usuario (Dashboard Público)

#### Riesgo
- **Actualmente NO hay login → cualquiera con la URL accede al dashboard**
- Datos de ventas, costos, proveedores son visibles
- Si URL se filtra → competencia puede ver estrategia de negocio

#### Impacto
- **Probabilidad:** Baja (URL solo en poder del cliente)
- **Impacto:** **Alto** — Exposición de datos sensibles de negocio

#### Mitigación Actual
⚠️ **URL no listada:** No está en Google ni redes sociales
⚠️ **Deploy privado:** Vercel no indexa por bots

#### Mitigación Pendiente (Alta Prioridad - Seguridad)
❌ **Supabase Auth:** Login con email/password
❌ **Row Level Security:** Filtrar datos por usuario autenticado
❌ **IP whitelist:** Restringir acceso solo desde IPs del cliente (Vercel Pro)
❌ **Basic Auth como mínimo:** Username/password simple via Next.js middleware

**Responsable:** Security + Frontend
**Plazo recomendado:** **45 días** (antes de escalar a más usuarios)

---

### 9. Logs con Datos Sensibles (Tokens en Console)

#### Riesgo
- **Console.log en código puede filtrar tokens o datos sensibles**
- Vercel Logs retiene logs por 30 días (plan Pro) → ventana de exposición
- Si atacante accede a Vercel dashboard → ve tokens en logs

#### Impacto
- **Probabilidad:** Baja (requiere acceso a Vercel)
- **Impacto:** Alto — Exposición de tokens ML

#### Mitigación Actual
⚠️ **Revisión de código:** Tokens NO se loguean explícitamente
✅ **Vercel auth 2FA:** Cuenta protegida con 2FA

#### Mitigación Pendiente (Media Prioridad)
❌ **Sanitización de logs:** Regex para redactar tokens antes de loguear
❌ **Structured logging:** Usar Pino/Winston con niveles (debug, info, error)
❌ **Log rotation:** Reducir retención a 7 días en producción

**Responsable:** DevOps
**Plazo recomendado:** 60 días

---

## Riesgos de Performance y Escalabilidad

### 10. Cache In-Memory No Escala en Serverless

#### Riesgo
- **Cache actual es in-memory → se pierde en cada cold start de Vercel**
- En tráfico bajo, cada request puede ser cold start = no hay cache efectivo
- Múltiples instancias serverless no comparten cache

#### Impacto
- **Probabilidad:** Media (depende de tráfico)
- **Impacto:** Medio — Latencia inconsistente, más llamadas a ML API

#### Mitigación Actual
✅ **TTL de 1 hora** reduce frecuencia de misses
⚠️ **Cold starts:** Vercel mantiene funciones "warm" con tráfico regular

#### Mitigación Pendiente (Media Prioridad)
❌ **Redis/Upstash:** Cache distribuido que persiste entre cold starts
❌ **Vercel KV:** Alternativa de Vercel para key-value store
❌ **Preload en cron:** Calentar cache cada hora con cron job

**Responsable:** Backend + Infrastructure
**Plazo recomendado:** 60 días

---

### 11. Sin Rate Limiting Interno

#### Riesgo
- **Usuario puede hacer refresh compulsivo → agotar rate limit de ML API**
- No hay throttling en frontend ni backend
- 10,000 req/hora de ML se comparten con otras integraciones del cliente

#### Impacto
- **Probabilidad:** Baja (usuario normal no hace >10 refreshes/min)
- **Impacto:** Medio — Error 429 de ML API, dashboard temporalmente inoperante

#### Mitigación Actual
⚠️ **Cache de 1 hora** hace que refreshes no golpeen ML API
❌ **Sin rate limiting interno:** Usuario puede forzar bypass de cache

#### Mitigación Pendiente (Baja Prioridad)
❌ **Client-side throttling:** Deshabilitar botón "Actualizar" por 5 minutos después de usar
❌ **Backend rate limiting:** Máximo 1 request/min por endpoint desde misma IP
❌ **Monitoring:** Alerta si rate limit de ML llega a 80%

**Responsable:** Backend + Frontend
**Plazo recomendado:** 90 días (no urgente)

---

### 12. Sin Manejo de Concurrencia en Supabase

#### Riesgo
- **Dos usuarios actualizando costos simultáneamente → race condition**
- Último write gana, puede sobrescribir cambios del otro usuario
- No hay optimistic locking ni versionado

#### Impacto
- **Probabilidad:** Muy Baja (dashboard es single-user por diseño)
- **Impacto:** Bajo — Solo aplica si se escala a multi-usuario

#### Mitigación Actual
✅ **Single-user:** Diseñado para 1 vendedor/cuenta
⚠️ **Supabase ACID:** PostgreSQL garantiza atomicidad por transacción

#### Mitigación Pendiente (Baja Prioridad - Solo si multi-user)
❌ **Optimistic locking:** Columna `version` en tabla `costs`
❌ **Conflict resolution UI:** Mostrar conflictos al usuario para elegir

**Responsable:** Backend (solo si se implementa multi-user)
**Plazo:** N/A (condicional)

---

## Riesgos de Integraciones

### 13. n8n Webhook Puede Fallar Sin Notificación

#### Riesgo
- **Si n8n está caído → alertas de email NO se envían**
- Dashboard no valida si webhook fue exitoso
- Usuario asume que alertas fueron enviadas

#### Impacto
- **Probabilidad:** Baja (n8n tiene 99% uptime)
- **Impacto:** Medio — Alertas críticas no llegan, posibles quiebres de stock

#### Mitigación Actual
⚠️ **Console.log:** Se registra response de webhook
❌ **Sin validación en UI:** Botón no muestra error si webhook falla

#### Mitigación Pendiente (Media Prioridad)
❌ **Retry automático:** 3 intentos con exponential backoff
❌ **Fallback a Vercel Email:** Si n8n falla, enviar via Vercel SMTP
❌ **Toast de confirmación:** UI muestra "Alertas enviadas exitosamente" o error

**Responsable:** Backend + n8n
**Plazo recomendado:** 45 días

---

### 14. Google Sheets Tiene Límites de Escritura

#### Riesgo
- **Google Sheets API tiene rate limit de 60 writes/min por proyecto**
- Si se sincronizan >1,000 productos → batch puede fallar
- No hay retry automático

#### Impacto
- **Probabilidad:** Baja (catálogos típicos <500 productos)
- **Impacto:** Bajo — Sincronización parcial, datos incompletos en Sheets

#### Mitigación Actual
✅ **Batch de 1,000 filas** por request (dentro del límite)
⚠️ **Sin retry:** Si falla, usuario debe reintentar manualmente

#### Mitigación Pendiente (Baja Prioridad)
❌ **Pagination:** Dividir en chunks de 500 filas
❌ **Retry con backoff:** 3 intentos con 5s de delay
❌ **Queue system:** Cola de trabajos para sincronizaciones grandes

**Responsable:** Backend
**Plazo recomendado:** 90 días

---

## Riesgos de Negocio

### 15. Cliente Depende 100% de TRAID para Mantenimiento

#### Riesgo
- **Sin equipo técnico interno → cliente no puede debuggear ni extender**
- Si TRAID descontinua soporte → sistema queda estancado
- Vendor lock-in

#### Impacto
- **Probabilidad:** Media (depende de modelo de negocio TRAID)
- **Impacto:** Alto — Cliente no puede evolucionar producto sin TRAID

#### Mitigación Actual
✅ **Código documentado:** README y comentarios en archivos críticos
✅ **Tech stack estándar:** Next.js, Supabase son open-source y bien documentados

#### Mitigación Pendiente (Alta Prioridad - Negocio)
❌ **Transfer de conocimiento:** Sesiones de capacitación con cliente
❌ **Documentación técnica completa:** Diagramas de arquitectura, guía de deployment
❌ **Código en repositorio del cliente:** GitHub privado con acceso full

**Responsable:** TRAID + Cliente
**Plazo recomendado:** 60 días

---

### 16. Sin SLA Documentado

#### Riesgo
- **No hay contrato formal de uptime/soporte → expectativas no alineadas**
- Cliente espera 99.9% uptime, TRAID provee 95%
- Sin compensación por caídas

#### Impacto
- **Probabilidad:** Alta (expectativas no escritas siempre fallan)
- **Impacto:** Medio — Insatisfacción del cliente, fricción comercial

#### Mitigación Actual
❌ **Sin SLA:** No existe documento formal

#### Mitigación Pendiente (Alta Prioridad - Negocio)
✅ **Definir SLA:** Acordar uptime mínimo, tiempo de respuesta a bugs críticos
✅ **Monitoreo:** Implementar Uptime Robot o Pingdom para medir disponibilidad real
✅ **Status page:** Página pública con estado del servicio

**Responsable:** TRAID + Cliente (legal/comercial)
**Plazo recomendado:** **30 días**

---

## Limitaciones Técnicas Aceptadas (Trade-offs Conscientes)

### 17. Sin Soporte Multi-Marketplace (Solo ML Chile)

**Limitación:** Dashboard solo soporta Mercado Libre Chile. No funciona con ML Argentina, Perú, Brasil, México.

**Razón:** ML tiene APIs diferentes por país (endpoints, fields, rate limits). Soporte multi-país requiere 3x desarrollo.

**Alternativa:** Roadmap 60d incluye ML Argentina + Perú. Brasil/México en 2026 Q2.

---

### 18. Sin Gestión de Inventario Físico (Solo Lógico)

**Limitación:** Dashboard muestra stock de ML API, NO rastrea inventario físico en bodega.

**Razón:** ML API no provee ubicaciones físicas. Cliente debe usar WMS externo si necesita control de ubicaciones.

**Alternativa:** Integración con WMS (ej: Odoo, SAP) en roadmap 90d si cliente lo requiere.

---

### 19. Sin Módulo Contable (Facturación, Impuestos)

**Limitación:** Dashboard NO genera facturas legales ni calcula impuestos.

**Razón:** Facturación requiere integración con SII (Servicio de Impuestos Internos) de Chile → complejidad legal alta.

**Alternativa:** Exportación a Excel/Sheets para que contador use software contable oficial.

---

### 20. Proyecciones ML Solo 30-60 Días (No Largo Plazo)

**Limitación:** Forecasting máximo 60 días. No hace proyecciones anuales.

**Razón:** Confidence interval se amplía exponencialmente después de 60 días → proyecciones anuales tienen error >50%.

**Alternativa:** Usar análisis de tendencia (línea de regresión) para estimación rough de 12 meses, pero sin accuracy garantizada.

---

## Matriz de Riesgos

| Riesgo | Probabilidad | Impacto | Prioridad | Estado |
|--------|-------------|---------|-----------|--------|
| Dependencia ML API | Media | **Crítico** | 🔴 Alta | ⚠️ Parcial |
| Proyecciones R² bajo | Alta | Medio | 🟡 Media | ✅ Mitigado |
| Tokens expiran | Baja | Alto | 🔴 Alta | ⚠️ Parcial |
| Latencia primera carga | **100%** | Bajo-Medio | 🟡 Media | ⚠️ Parcial |
| Costos manuales | Alta | Medio | 🔴 Alta | ⚠️ Parcial |
| Sheets unidireccional | Media | Bajo-Medio | 🟢 Baja | ✅ OK |
| Tokens sin encriptar | Muy Baja | **Crítico** | 🔴 Alta | ❌ **PENDIENTE** |
| Sin autenticación | Baja | Alto | 🔴 Alta | ❌ **PENDIENTE** |
| Logs con datos sensibles | Baja | Alto | 🟡 Media | ⚠️ Parcial |
| Cache in-memory | Media | Medio | 🟡 Media | ⚠️ Parcial |
| Sin rate limiting | Baja | Medio | 🟢 Baja | ✅ OK |
| Sin concurrencia | Muy Baja | Bajo | 🟢 Baja | ✅ OK |
| n8n webhook falla | Baja | Medio | 🟡 Media | ⚠️ Parcial |
| Sheets rate limit | Baja | Bajo | 🟢 Baja | ✅ OK |
| Vendor lock-in | Media | Alto | 🔴 Alta | ⚠️ Parcial |
| Sin SLA | Alta | Medio | 🔴 Alta | ❌ **PENDIENTE** |

**Leyenda:**
- 🔴 **Alta:** Requiere acción inmediata (0-45 días)
- 🟡 **Media:** Planificar en siguiente sprint (45-90 días)
- 🟢 **Baja:** Backlog (90+ días)

---

## Plan de Acción (Próximos 30/60/90 Días)

### Urgente (Próximos 30 Días)
1. ✅ **Encriptar tokens ML en Supabase** → pgcrypto (DevOps)
2. ✅ **Definir y firmar SLA con cliente** → uptime, soporte, compensaciones (Comercial)
3. ✅ **Implementar Basic Auth como mínimo** → Proteger dashboard (Frontend)
4. ✅ **Alerta de expiración de refresh_token** → Email 7 días antes (Backend)

### Importante (60 Días)
5. **Modo degradado para ML API down** → Mostrar últimos datos cacheados (Backend)
6. **Retry automático en n8n webhook** → 3 intentos con backoff (Backend)
7. **Transfer de conocimiento a cliente** → Sesión de arquitectura (TRAID)

### Nice-to-Have (90 Días)
8. **Redis/Upstash para cache distribuido** → Eliminar cold start issue (Infrastructure)
9. **Integración OCR de facturas en UI** → Automatizar carga de costos (Frontend)
10. **Rate limiting interno** → Proteger contra abuso de refresh (Backend)

---

## Aceptación de Riesgos

**Firmado por:** [TRAID Product Owner]
**Fecha:** Enero 2026

**El cliente BAZAR Importaciones reconoce y acepta:**
- Los riesgos documentados en este análisis
- Las limitaciones actuales del sistema
- El plan de mitigación propuesto con plazos
- Que algunos riesgos (ej: caída de ML API) están fuera del control de TRAID

**Riesgos NO aceptables (requieren mitigación inmediata):**
- Tokens sin encriptar (30 días max)
- Sin autenticación (45 días max)
- Sin SLA documentado (30 días max)

---

**Próxima revisión:** Marzo 2026 (post-implementación de mitigaciones urgentes)
