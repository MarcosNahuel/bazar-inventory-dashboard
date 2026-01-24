# Dashboard de Análisis de Utilidad - Bazaro Importaciones

## 📊 Descripción

Sistema de análisis financiero desarrollado en Streamlit para procesar y visualizar datos de ventas de MercadoLibre. La aplicación calcula automáticamente utilidades, costos operativos, IVA por pagar y genera proyecciones financieras con visualizaciones interactivas.

## 🚀 Características Principales

### Procesamiento de Datos
- **Carga múltiple de archivos**: Soporta reportes de ventas actuales y históricos
- **Procesamiento automático de paquetes**: Identifica y distribuye costos en ventas de productos múltiples
- **Cálculo de costos Flex**: Procesa automáticamente envíos de Mercado Envíos Flex
- **Integración de costos de productos**: Cruza datos con catálogo de publicaciones

### Cálculos Financieros
- ✅ Facturación bruta y neta
- ✅ Comisiones de MercadoLibre
- ✅ Costos de envío (Flex y tradicional)
- ✅ IVA por pagar (diferencial entre facturación y costos)
- ✅ Utilidad bruta y neta
- ✅ Rentabilidad por producto y proveedor
- ✅ Proyección mensual basada en promedio diario

### Visualizaciones Interactivas
- 📈 Tendencias de facturación (diaria y acumulada)
- 📊 Tendencias de utilidad (bruta y neta)
- 💰 Análisis de costos por fecha
- 🔄 Comparación mensual (mes actual vs. mes anterior)
- 📅 Ordenamiento por ciclo de facturación (15-15)

### Filtros y Búsqueda
- 🗓️ Filtro por fecha específica
- 🔍 Búsqueda por palabra clave (título de publicación)
- 📋 Resumen por proveedor

## 📁 Estructura del Proyecto

```
├── app.py                          # Aplicación principal Streamlit
├── calcular_utilidad.py            # Lógica de cálculos financieros
├── crear_graficos.py               # Generación de gráficos Plotly
├── banner.png                      # Banner de la aplicación
└── CONSOLIDADO PUBLICACIONES.xlsx  # Catálogo de productos y costos
```

## 🛠️ Instalación

### Requisitos Previos
- Python 3.8 o superior
- pip (gestor de paquetes de Python)

### Dependencias

```bash
pip install streamlit pandas numpy xlsxwriter janitor plotly openpyxl
```

### Instalación Rápida

1. **Clonar o descargar el proyecto**:
```bash
cd ruta/del/proyecto
```

2. **Instalar dependencias**:
```bash
pip install -r requirements.txt
```

## 📝 Archivos de Entrada Requeridos

### 1. Ventas CL (`*.xlsx`)
Reporte de ventas de MercadoLibre con las siguientes columnas:
- `#_de_venta`
- `estado`
- `forma_de_entrega`
- `ingresos_por_envio_clp_`

**Formato**: Excel, debe contener 41 columnas, datos desde la fila 6

### 2. Reporte Nuevo (`*.xlsx`)
Reporte financiero de MercadoLibre con hoja "REPORT":
- Datos desde la fila 8
- Incluye: fecha del cargo, detalle, número de venta, publicación, costos, etc.

### 3. Reporte Antiguo (`*.xlsx`) - Opcional
Para comparación mensual, mismo formato que el Reporte Nuevo

### 4. CONSOLIDADO PUBLICACIONES.xlsx
Catálogo maestro con:
- `proveedor`
- `numero_de_publicacion`
- `titulo`
- `costo`

**Hoja**: "Publicaciones" (datos desde la fila 2)

## 🎯 Uso

### Iniciar la Aplicación

```bash
streamlit run app.py
```

La aplicación se abrirá automáticamente en tu navegador en `http://localhost:8501`

### Flujo de Trabajo

1. **Cargar archivos**:
   - Arrastra o selecciona el archivo de "Ventas CL"
   - Arrastra o selecciona el "Reporte nuevo"
   - (Opcional) Arrastra el "Reporte antiguo" para comparación

2. **Explorar resultados**:
   - **Tabla de resultados**: Visualiza ventas individuales con filtros
   - **Costos**: Revisa desglose de costos operativos
   - **Tarjeta de información**: Métricas clave consolidadas
   - **Gráficos**: Analiza tendencias temporales

3. **Aplicar filtros**:
   - Activa "Filtrar por fecha" para ver ventas de un día específico
   - Usa el campo de búsqueda para filtrar por nombre de producto

4. **Analizar comparaciones**:
   - Si cargaste el reporte antiguo, verás líneas punteadas violetas en los gráficos
   - Compara el rendimiento actual vs. el mes anterior

## 📊 Métricas Calculadas

### Tarjeta de Información
- **Facturación**: Ingresos brutos totales
- **Utilidad Productos**: Margen antes de impuestos y costos
- **Total Costos Suministros**: Costo de productos vendidos
- **IVA por Pagar**: Diferencial de IVA (facturación - costos - comisiones)
- **Utilidad Neta**: Utilidad después de IVA y costos operativos
- **Proyección Neta**: Proyección mensual (promedio diario × 30.4)

### Resumen por Proveedor
- Facturación por proveedor
- Utilidad por proveedor
- Rentabilidad % (Utilidad/Suministro)

### Tabla de Costos
- Cargo por campaña de publicidad - Product Ads
- Cargo por devolución
- Cargo por incumplimiento en Envíos Full
- Cargo por mantenimiento de Mi página
- Cargo por retiro de stock Full
- Cargo por servicio de almacenamiento Full
- Cargo por servicio de colecta Full
- Cargo por stock antiguo en Full
- Cargo por Flex
- **Costo Total** (suma de todos los anteriores)

## 🔧 Funcionalidades Técnicas

### Procesamiento de Paquetes
La función `procesar_paquetes()` identifica ventas múltiples y distribuye costos:
```python
# Ejemplo: "Paquete de 3 productos"
# Distribuye: costo_envio_flex / 3
# Asigna: envio_clp / 3
```

### Ciclo de Facturación
Los gráficos ordenan datos por ciclo 15-15:
- Del 15 al final del mes
- Del 1 al 14 del mes siguiente

Esto permite una visualización más coherente con el ciclo de facturación de MercadoLibre.

### Cálculo de IVA
```python
factor = 1 - 1/1.19  # 15.966%
iva_por_pagar = IVA_facturacion - IVA_costos - IVA_comisiones - IVA_descuentos + IVA_otros_costos
```

### Cálculo de Utilidad Neta
```python
utilidad_neta = utilidad_bruta - iva_por_pagar + deuda_bruta
```

### Proyección Mensual
```python
# Si la última venta del mes es < $200,000, se excluye del promedio
if min_ventas < 200000:
    promedio = utilidad_neta[:-1].mean()
else:
    promedio = utilidad_neta.mean()

proyeccion_neta = promedio * 30.4
```

## 🎨 Personalización

### Colores de la Interfaz
Modifica en `app.py`:
```python
st.markdown("""
    <style>
        .main { background-color: #d7e6fc !important; }
    </style>
""", unsafe_allow_html=True)
```

### Banner
Reemplaza `banner.png` con tu imagen personalizada (recomendado: 1600x200px)

### Agregar Nuevos Gráficos
Edita `crear_graficos.py` y agrega llamadas en `app.py`:
```python
fig = plot_utilidades_plotly(
    df_plot, 
    df_plot_anterior,
    titulo='Mi Nuevo Gráfico', 
    y='columna_a_graficar', 
    label_y='Etiqueta Y'
)
st.plotly_chart(fig, use_container_width=True)
```

## ⚠️ Advertencias y Validaciones

### Alertas Automáticas
- **Publicaciones sin costo**: Se muestran en tabla separada para revisión
- **Exclusiones automáticas**: Ciertas publicaciones se excluyen automáticamente
- **Operaciones anuladas**: Se filtran del cálculo de utilidad

### Publicaciones Excluidas por Defecto
```python
idx_drop = ['MLC1582646059', 'MLC1591492553', 'MLC1604270301']
```

### Validaciones
- Ventas sin detalle de entrega aplicable son excluidas
- Operaciones con estado "Anulado en factura" no se consideran
- Campos vacíos se rellenan con 0 para evitar errores

## 🐛 Solución de Problemas

### Error: "No such file or directory: CONSOLIDADO PUBLICACIONES.xlsx"
**Causa**: El archivo de catálogo no está en la ubicación correcta  
**Solución**: Asegúrate de tener el archivo en la misma carpeta que `app.py`

### Los gráficos no muestran comparación (línea violeta)
**Causa**: No se cargó el "Reporte antiguo"  
**Solución**: Carga también el archivo del mes anterior en el tercer campo de carga

### Datos incorrectos en costos Flex
**Causa**: Formato incorrecto del reporte de ventas  
**Solución**: Verifica que el reporte de ventas tenga exactamente 41 columnas y datos desde la fila 6

### Error al cargar archivos Excel
**Causa**: Versión incompatible de openpyxl o archivo corrupto  
**Solución**: 
```bash
pip install --upgrade openpyxl
```

### La aplicación se queda en "Loading..."
**Causa**: Archivos muy grandes o formato incorrecto  
**Solución**: 
- Verifica que los archivos estén en formato `.xlsx`
- Comprueba que las hojas tengan los nombres correctos ("REPORT", "Publicaciones")

### Valores NaN en la tabla
**Causa**: Publicaciones sin costo en el catálogo  
**Solución**: Actualiza `CONSOLIDADO PUBLICACIONES.xlsx` con los costos faltantes

## 📦 Crear requirements.txt

Crea un archivo `requirements.txt` con:

```txt
streamlit==1.31.0
pandas==2.1.4
numpy==1.26.3
xlsxwriter==3.1.9
pyjanitor==0.26.0
plotly==5.18.0
openpyxl==3.1.2
```

Luego instala con:
```bash
pip install -r requirements.txt
```

## 🚀 Despliegue en Producción

### Streamlit Cloud (Recomendado)

1. Sube tu código a GitHub
2. Ve a [share.streamlit.io](https://share.streamlit.io)
3. Conecta tu repositorio
4. ¡Listo! Tu aplicación estará en línea

### Servidor Local

```bash
# Para acceso desde red local
streamlit run app.py --server.address 0.0.0.0 --server.port 8501
```

## 👨‍💻 Autor

**Bazaro Importaciones**  
Dashboard desarrollado para análisis de operaciones en MercadoLibre Chile

## 📄 Licencia

Uso interno - Bazaro Importaciones  
Todos los derechos reservados © 2025

---

**Versión**: 1.0  
**Última actualización**: Diciembre 2025  
**Compatible con**: Python 3.8+, Streamlit 1.31+

## 📚 Recursos Adicionales

- [Documentación de Streamlit](https://docs.streamlit.io)
- [Documentación de Pandas](https://pandas.pydata.org/docs/)
- [Documentación de Plotly](https://plotly.com/python/)
- [API de MercadoLibre](https://developers.mercadolibre.cl/)


