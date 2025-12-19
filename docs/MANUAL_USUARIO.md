# Manual de Usuario - BAZAR Importaciones Dashboard

## Guía Completa del Sistema de Gestión de Inventario

**Versión:** 1.0
**Fecha:** Diciembre 2025
**Cliente:** BAZAR Importaciones - Mercado Libre Chile

---

## Introducción

Bienvenido al Dashboard de BAZAR Importaciones, tu centro de comando para gestionar el inventario y analizar el rendimiento de tu tienda en Mercado Libre Chile.

Este sistema te permite:
- Monitorear el estado de tu inventario en tiempo real
- Identificar productos con stock crítico
- Analizar qué productos generan el 80% de tus ventas
- Proyectar ventas futuras con Machine Learning
- Recibir alertas automáticas de reposición

---

## 1. Panel de Resumen (Overview)

![Resumen del Dashboard](screenshots/01-resumen.png)

### ¿Qué estoy viendo?

El panel de resumen es tu vista rápida del estado general del negocio. Aquí encontrarás:

#### KPIs Principales (Tarjetas Superiores)

| Métrica | Descripción | Fuente de Datos |
|---------|-------------|-----------------|
| **Productos Activos** | Cantidad de publicaciones activas en ML | API ML: `/users/{id}/items/search?status=active` |
| **Ingresos (30 días)** | Ventas totales del último mes | API ML: `/orders/search` (últimos 30 días) |
| **Ticket Promedio** | Valor promedio por orden | Cálculo: Ingresos ÷ Cantidad de órdenes |
| **Órdenes** | Total de pedidos procesados | API ML: `/orders/search` |

#### Gráfico de Ventas Mensuales

El gráfico de barras muestra la evolución de ventas mes a mes. Cada barra representa:
- **Eje X:** Mes del año
- **Eje Y:** Ingresos en pesos chilenos (CLP)
- **Color:** Degradado que indica intensidad de ventas

**Cómo se obtienen los datos:**
1. Se consultan todas las órdenes de los últimos 12 meses
2. Se agrupan por mes calendario
3. Se suman los montos de cada orden (excluyendo canceladas)

---

## 2. Estado del Inventario

![Estado del Inventario](screenshots/02-inventario.png)

### ¿Qué estoy viendo?

Este panel te muestra la "salud" de tu inventario categorizada por niveles de stock.

#### Semáforo de Stock

| Estado | Rango | Significado | Acción Recomendada |
|--------|-------|-------------|-------------------|
| **Crítico** | 0-1 unidades | Riesgo de quiebre de stock | Reponer inmediatamente |
| **Alerta** | 2-5 unidades | Stock bajo | Programar reposición |
| **Bajo** | 6-10 unidades | Atención necesaria | Monitorear ventas |
| **OK** | 11-20 unidades | Stock saludable | Sin acción |
| **Alto** | 21+ unidades | Stock abundante | Evaluar rotación |

#### Métricas de Salud

- **Health Score:** Porcentaje de productos con stock saludable (OK o Alto)
- **Productos en Riesgo:** Cantidad de SKUs con stock crítico o en alerta

**Cómo se obtienen los datos:**
1. Se consulta cada producto activo en ML
2. Se obtiene el stock disponible (`available_quantity`)
3. Se clasifica según los rangos definidos
4. Se calcula el porcentaje de cada categoría

---

## 3. Análisis Pareto 80/20

![Análisis Pareto](screenshots/03-pareto.png)

### ¿Qué estoy viendo?

El principio de Pareto aplicado a tu negocio: identificar el 20% de productos que generan el 80% de tus ingresos.

#### Gráfico Combinado

- **Barras (azul):** Ingresos por producto ordenados de mayor a menor
- **Línea (naranja):** Porcentaje acumulado de ventas

#### Tabla de Top Productos

| Columna | Descripción |
|---------|-------------|
| **Producto** | Título del artículo en ML |
| **SKU** | Código interno del vendedor |
| **Unidades** | Cantidad vendida en el período |
| **Ingresos** | Monto total generado |
| **% Acumulado** | Contribución acumulada a las ventas totales |

#### Insight Clave

El porcentaje mostrado en grande (ej. **83.3%**) indica qué proporción de tus ventas proviene de tu TOP 20% de productos.

**Cómo se obtienen los datos:**
1. Se consultan todas las órdenes del período seleccionado
2. Se agrupan las ventas por SKU/producto
3. Se ordenan de mayor a menor ingreso
4. Se calcula el porcentaje acumulado
5. Se identifica el punto de corte 80/20

---

## 4. Gestión de Costos y Márgenes

![Gestión de Costos](screenshots/04-costos.png)

### ¿Qué estoy viendo?

Panel para cargar y analizar los costos de tus productos, permitiendo calcular márgenes de rentabilidad reales.

#### Carga de Costos en Lote

Puedes subir un archivo Excel (.xlsx) o CSV con la siguiente estructura:

| Columna | Requerida | Descripción |
|---------|-----------|-------------|
| **SKU** | Sí | Código interno del producto |
| **Codigo_ML** | Sí | ID de Mercado Libre (MLC...) |
| **Costo** | Sí | Costo unitario en CLP |
| **Proveedor** | No | Nombre del proveedor |

#### Gráfico de Márgenes

- **Barras (azul):** Margen en pesos por producto
- **Línea (naranja):** ROI porcentual

#### Métricas Calculadas

| Métrica | Fórmula |
|---------|---------|
| **Margen ($)** | Precio Venta - Costo - Comisión ML |
| **ROI (%)** | (Margen / Costo) × 100 |
| **Margen Promedio** | Promedio ponderado por ventas |

**Cómo se obtienen los datos:**
1. Se cruzan los costos cargados con los productos de ML
2. Se calculan márgenes considerando comisiones de ML (~13%)
3. Se genera ranking de productos más rentables

---

## 5. Centro de Alertas

![Centro de Alertas](screenshots/05-alertas.png)

### ¿Qué estoy viendo?

Lista priorizada de productos que requieren atención inmediata por bajo stock.

#### Resumen de Alertas

- **Urgentes:** Productos con 1 unidad o menos (requieren acción HOY)
- **Alerta:** Productos con 2-5 unidades
- **Bajo:** Productos con 6-10 unidades
- **Total:** Suma de todos los productos en alerta

#### Tabla de Productos

| Columna | Descripción |
|---------|-------------|
| **Producto** | Nombre y código ML del artículo |
| **Stock** | Unidades disponibles actualmente |
| **Precio** | Precio de venta en ML |
| **Estado** | Clasificación de urgencia (Crítico/Bajo) |
| **Acciones** | Link directo a la publicación en ML |

#### Funcionalidad "Enviar Alertas"

El botón **Enviar Alertas** en la barra superior genera un email automático con:
- Lista de productos críticos
- Sugerencia de cantidades a reponer
- Proveedor sugerido (si está configurado)

**Cómo se obtienen los datos:**
1. Se filtran productos con stock ≤ 10 unidades
2. Se ordenan por stock ascendente (más críticos primero)
3. Se enriquecen con datos de precio y permalink

---

## 6. Proyecciones ML (Machine Learning)

![Proyecciones ML](screenshots/06-proyecciones.png)

### ¿Qué estoy viendo?

Análisis predictivo avanzado que utiliza regresión lineal y estacionalidad semanal para proyectar ventas futuras.

#### Métricas del Modelo

| Métrica | Descripción |
|---------|-------------|
| **Días Históricos** | Período analizado (ej. 365 días) |
| **Revenue Histórico** | Ventas totales del período |
| **Proyección 30 días** | Estimación de ventas próximo mes |
| **R² Regresión** | Calidad del modelo (0-100%, mayor = mejor ajuste) |
| **Tendencia** | Crecimiento/decrecimiento mensual |

#### Gráfico de Serie Temporal

- **Línea sólida:** Ventas históricas reales (día a día)
- **Línea punteada:** Proyección hacia el futuro
- **Área sombreada:** Intervalo de confianza 95%

#### Ciclo Semanal (Estacionalidad)

Muestra qué días de la semana venden más:
- **↑ Alto (>110%):** Días con ventas sobre el promedio
- **Normal (90-110%):** Días típicos
- **↓ Bajo (<90%):** Días con menor actividad

**Interpretación:** Si Miércoles muestra 129%, significa que ese día vendes un 29% más que el promedio semanal.

#### Insights y Recomendaciones

El sistema genera automáticamente recomendaciones como:
- Mejores días para promociones
- Días recomendados para lanzar productos nuevos
- Proyección de órdenes esperadas

**Cómo se obtienen los datos:**
1. Se consultan TODAS las órdenes de los últimos 365 días
2. Se agrupan por día calendario
3. Se aplica regresión lineal para detectar tendencia
4. Se calcula la estacionalidad semanal (promedio por día de semana)
5. Se proyectan los próximos 30 días combinando tendencia + estacionalidad
6. Se calcula intervalo de confianza basado en la desviación estándar

---

## 7. Módulos Próximamente

![Módulos Próximamente](screenshots/07-proximamente.png)

### ¿Qué estoy viendo?

Roadmap de funcionalidades en desarrollo para futuras versiones del dashboard.

#### Módulos Planificados

| Módulo | Estado | ETA | Descripción |
|--------|--------|-----|-------------|
| **Preventa Automatizada** | En desarrollo | Q1 2025 | Respuestas automáticas a preguntas con IA |
| **Postventa Inteligente** | Planificado | Q2 2025 | Tracking, facturas y devoluciones |
| **Panel de Soporte** | Planificado | Q2 2025 | Escalaciones con contexto del cliente |
| **Chatbot MarIA** | En desarrollo | Q1 2025 | Agente conversacional 24/7 |

---

## Arquitectura Técnica

### Flujo de Datos

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Mercado Libre  │────▶│   Next.js API   │────▶│    Dashboard    │
│      API        │     │    (Backend)    │     │   (Frontend)    │
└─────────────────┘     └─────────────────┘     └─────────────────┘
        │                       │
        │                       ▼
        │               ┌─────────────────┐
        └──────────────▶│     Cache       │
                        │   (1 hora TTL)  │
                        └─────────────────┘
```

### Endpoints API Mercado Libre Utilizados

| Endpoint | Uso en Dashboard |
|----------|-----------------|
| `/users/{id}/items/search` | Listar productos activos |
| `/items?ids=...` | Detalles de productos (batch) |
| `/orders/search` | Historial de ventas |
| `/users/{id}` | Información del vendedor |

### Sistema de Caché

Para optimizar tiempos de carga, el sistema implementa:
- **Cache TTL:** 1 hora para datos de inventario
- **Cache de Proyecciones:** Datos ML se cachean para evitar recálculos
- **Actualización Manual:** Botón "Actualizar" fuerza refresh

---

## Preguntas Frecuentes

### ¿Por qué las proyecciones tardan en cargar?

La primera carga del día consulta 365 días de órdenes a la API de Mercado Libre. Esto puede tomar hasta 80 segundos. Las siguientes consultas usan el caché y cargan en menos de 1 segundo.

### ¿Cada cuánto se actualizan los datos?

- **Automáticamente:** El caché se invalida cada 1 hora
- **Manualmente:** Usa el botón "Actualizar" para forzar refresh

### ¿Cómo se calcula el Health Score?

```
Health Score = (Productos OK + Productos Alto) / Total Productos × 100
```

### ¿Qué significa R² en las proyecciones?

R² (R-cuadrado) mide qué tan bien el modelo explica la variabilidad de los datos:
- **0-20%:** Modelo débil, alta incertidumbre
- **20-50%:** Modelo moderado
- **50-80%:** Buen modelo
- **80-100%:** Excelente ajuste

Un R² bajo no significa que la proyección sea inútil; simplemente indica mayor variabilidad en tus ventas.

---

## Soporte

**Email:** bazaroimportaciones@gmail.com
**Dashboard URL:** [https://bazar-dashboard.vercel.app](https://bazar-dashboard.vercel.app)

---

*Documento generado automáticamente - BAZAR Importaciones © 2025*
