# Resumen detallado de la reunión

## Asistentes
- Bazaro Importaciones
- Nahuel Albornoz
- Nacho

## Objetivo
Revisar la primera versión del dashboard de inventario y costos desarrollado por el equipo, definir requerimientos funcionales y de datos para la siguiente iteración, y acordar próximos pasos y entregables.

## Estado actual
- Ya se conectaron a la API de MercadoLibre con las credenciales proporcionadas y cargaron datos iniciales en una primera versión del dashboard (enlace: https://bazar-inventory-dashboard.vercel.app/).
- La versión actual permite visualizar ventas, stock y algunas métricas básicas; es una primera implementación pensada para tester y ajuste.

## Requerimientos y mejoras solicitadas (funcionales y de datos)
1. Fuente de costos
   - Reemplazar o complementar la carga manual de Excel por lectura directa de un Google Sheet con la información de costos y proveedores para evitar cargas manuales frecuentes.
   - Mantener posibilidad de edición manual desde el dashboard para ajustes puntuales.

2. Alerta de stock crítico y proyección de quiebre
   - Definir criterio de stock crítico: stock disponible menor a las ventas del producto en los últimos 30 días.
   - Calcular cantidad a reponer (por ejemplo, si vendieron X y quedan Y, sugerir reposición: X-Y o el número necesario para cubrir proyección). 
   - Proyección por producto que estime en cuánto tiempo se romperá el stock según ventas de los últimos 30 días y genere alertas de productos próximos a entrar en umbral crítico.

3. Margen y costos por envío (incluyendo modalidades Full y Flex)
   - Mostrar utilidades/márgenes por producto incluyendo costo del producto, comisiones de MercadoLibre y costos de envío.
   - Distinguir tipos de envío: Full (envío gestionado por MercadoLibre) y Flex (envío gestionado por proveedor/logística contratada por el vendedor). Para Flex se maneja un costo fijo por envío acordado con la empresa de logística.
   - Incluir bonificaciones de MercadoLibre por Flex y por ofrecer envío gratis; esas bonificaciones varían según ubicación del comprador y deberían extraerse de la API cuando sea posible o estimarse por promedio si no está disponible directamente.

4. Cálculo de órdenes de compra por proveedor
   - Considerar cantidad por caja maestra (cantidades mínimas o múltiplos de compra) para redondear la orden a unidades comprables por proveedor.
   - Generar una orden de compra consolidada por proveedor con la valorización (monto total) y opción de incluir IVA o sin IVA.
   - Integrar proyecciones para agrupar productos próximos a reponer de un mismo proveedor y optimizar compras.

5. Detección de cambios de costo en proveedores (OCR / análisis de facturas)
   - Permitir subir fotos/PDFs o facturas para extraer y comparar costos históricos y detectar cambios de precio en proveedores.
   - Implementación por fases: (1) extracción de texto desde la imagen/PDF; (2) interpretación y mapeo de valores relevantes con tasa de confianza y revisión manual cuando la confianza sea baja.
   - Mantener histórico de costos por proveedor y permitir alertas cuando se detecten variaciones significativas.

6. Métricas adicionales y alertas comerciales
   - Incluir ventas últimos 30 días, márgenes, rotación de productos, y alertas de capital inmovilizado (productos con stock alto pero baja/ninguna demanda).
   - Detectar productos con rotación anormal (ruptura de tendencia) y sugerir acciones (p. ej. liquidación, ajuste de precio).

7. Acceso y mantenimiento del código
   - Se acordó que el cliente tendrá acceso al código y a la base de datos; se discutió cómo manejar la mantención y futuras ampliaciones. Se evaluará la forma de trabajo y costos para ampliaciones posteriores.

8. Datos y materiales adicionales que compartirá el cliente
   - Google Sheet con datos (ya compartido).
   - Repositorio/local del dashboard previo en Streamlit y scripts en Python que contienen reglas de reposición y otras métricas; el equipo podrá integrarlos.

9. Export y sincronización
   - Posibilidad de descargar CSVs desde la interfaz y sincronizar datos periódicamente (ej.: actualizaciones automáticas en intervalos definidos).
   - Repositorio de datos en base de datos hospedada (Hostinger) y replicado a un Google Sheet si el cliente lo prefiere para manejo fácil.

## Consideraciones técnicas y limitaciones discutidas
- Algunas comisiones o bonificaciones puntuales de MercadoLibre podrían no estar explícitas en la API; se intentará extraerlo desde la información del pedido (order) o estimar por promedio según ubicación cuando sea necesario.
- La extracción de datos de facturas (OCR) tendrá una tasa de confianza; se recomienda revisión humana para los casos con baja confianza. Implementación por fases para minimizar riesgos.
- Personalización y escalabilidad: cada cliente tendrá formatos y estructuras de datos distintos, por lo que el producto debe ser modular y tolerante a variaciones en los inputs.

## Alineamiento comercial y roadmap preliminar
- Prioridades funcionales acordadas para la próxima iteración: integración de Google Sheets para costos, alertas de stock crítico con criterio de 30 días, proyección de quiebre por producto, cálculos de margen incluyendo envío y comisiones, y generación de órdenes de compra por proveedor considerando cajas maestras.
- Fases adicionales: OCR de facturas para detectar cambios de costo; mejoras en UX; sincronización automática y documentación para acceso/descarga de CSVs.
- Plazo inmediato: el equipo trabajará durante el fin de semana para avanzar en varias mejoras y continuará la comunicación por el grupo (chat) para aclarar dudas y compartir códigos/repositorios.

## Acciones pendientes y responsables (acuerdos verbales)
- Bazaro: compartir el Google Sheet con costos y el código/repositorio local (Streamlit, scripts en Python) en el grupo.
- Equipo (Nacho y Nahuel): continuar integración de datos, revisar API de MercadoLibre para obtener bonificaciones/envíos/comisiones y avanzar en la implementación del dashboard con las mejoras acordadas.
- Equipo: revisar posibilidad de extraer datos de bonificaciones de Flex/Full desde el order ID y, en caso de no estar disponibles, definir método de estimación.
- Equipo: diseñar la lógica para redondeo por caja maestra y la generación de órdenes de compra por proveedor.

## Comentarios finales y próximos pasos
- Se acordó comunicación continua por el grupo para resolver dudas y compartir archivos.
- El equipo avanzará con varias tareas durante el próximo fin de semana y coordinará la siguiente revisión.
- Se planteó la oportunidad de desarrollar el producto como una oferta modular y escalable para vender a otros vendedores de MercadoLibre, con posibles modelos de suscripción o cobro por porcentaje/servicio en el futuro.

unidades ventas promedio por mes
proyecciones de quiebre de stock
Margenes, utilidades,  tipo de envio y comisiones full, flex, ME, promedio de flex tomando bonificacion. Buscar bonificaciones, comisiones para determinar costos y con ello margenes
incluir unidades de cajas de los sku
poder incluir cantides en paquetes de los sku
lector coprobantes ocr
para tickets de proveedores
Mercaderia inmovilizada (metricas de mercaderia inmovilizada).
matener los datos en sheet