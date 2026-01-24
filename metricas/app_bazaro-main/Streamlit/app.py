import streamlit as st
import pandas as pd
from calcular_utilidad import *
from crear_graficos import *
from io import BytesIO
from janitor import clean_names
import warnings
import numpy as np
warnings.filterwarnings("ignore", message="Conversion of an array with ndim > 0")
warnings.filterwarnings("ignore", message="Workbook contains no default style")

def etiqueta_metrica(texto: str, size: int = 20, weight: int = 600):
    """
    Muestra una etiqueta con estilo personalizado para métricas en Streamlit.

    Parámetros:
    - texto: str → texto a mostrar.
    - size: int → tamaño de fuente en px (por defecto 16).
    - weight: int → grosor de la fuente (por defecto 500).
    """
    st.markdown(
        f"<span style='font-size:{size}px; font-weight:{weight}'>{texto}</span>",
        unsafe_allow_html=True
    )
# Función auxiliar actualizada para procesar datos para gráficos
def procesar_datos_para_grafico(df, columna_y, add_completo=False, df_anterior=None, max_fecha=None):
    """
    Procesa los datos para crear gráficos con superposición correcta por día del mes
    Mantiene la información de fecha para etiquetas del eje X
    Ordena según ciclo de facturación (15-15)
    """
    def ordenar_por_ciclo_facturacion(df_temp):
        """Ordena los datos por ciclo de facturación: 15, 16, 17, ..., 31, 1, 2, 3, ..., 14"""
        if df_temp.empty:
            return df_temp
        
        df_temp = df_temp.copy()
        # Crear una columna de orden personalizado para el ciclo 15-15
        df_temp['orden_facturacion'] = df_temp['dia_mes'].apply(lambda x: x if x >= 15 else x + 31)
        df_temp = df_temp.sort_values('orden_facturacion')
        return df_temp
    
    # Procesar datos actuales
    df_actual = df.copy()
    df_actual = df_actual.groupby('fecha_del_cargo').agg({columna_y: 'sum'}).reset_index()
    df_actual['dia_mes'] = df_actual['fecha_del_cargo'].dt.day
    df_actual = ordenar_por_ciclo_facturacion(df_actual)
    
    df_anterior_proc = pd.DataFrame()
    if add_completo and df_anterior is not None and not df_anterior.empty:
        # Filtrar datos anteriores por el mismo rango de días que el mes actual
        dias_actuales = set(df_actual['dia_mes'].tolist())
        
        # Procesar datos anteriores
        if max_fecha is not None:
            df_anterior_proc = df_anterior[df_anterior['fecha_del_cargo'] <= max_fecha].copy()
        else:
            df_anterior_proc = df_anterior.copy()
            
        df_anterior_proc = df_anterior_proc.groupby('fecha_del_cargo').agg({columna_y: 'sum'}).reset_index()
        df_anterior_proc['dia_mes'] = df_anterior_proc['fecha_del_cargo'].dt.day
        
        # FILTRAR SOLO LOS DÍAS QUE EXISTEN EN EL MES ACTUAL
        df_anterior_proc = df_anterior_proc[df_anterior_proc['dia_mes'].isin(dias_actuales)]
        
        df_anterior_proc = ordenar_por_ciclo_facturacion(df_anterior_proc)
    
    return df_actual, df_anterior_proc

def procesar_datos_utilidad_para_grafico(df, df_por_pagar, add_completo=False, df_anterior=None, df_por_pagar_anterior=None, max_fecha=None):
    """
    Procesa los datos de utilidad específicamente
    Mantiene la información de fecha para etiquetas del eje X
    Ordena según ciclo de facturación (15-15)
    """
    def ordenar_por_ciclo_facturacion(df_temp):
        """Ordena los datos por ciclo de facturación: 15, 16, 17, ..., 31, 1, 2, 3, ..., 14"""
        if df_temp.empty:
            return df_temp
        
        df_temp = df_temp.copy()
        # Crear una columna de orden personalizado para el ciclo 15-15
        df_temp['orden_facturacion'] = df_temp['dia_mes'].apply(lambda x: x if x >= 15 else x + 31)
        df_temp = df_temp.sort_values('orden_facturacion')
        return df_temp
    
    # Procesar datos actuales
    df_actual = df.copy()
    df_actual = df_actual.groupby('fecha_del_cargo').agg({
        'utilidad': 'sum',
        'iva_facturacion': 'sum',
        'iva_costo_producto': 'sum',
        'iva_comision': 'sum',
        'iva_descuento': 'sum'
    }).reset_index()
    df_actual = pd.merge(df_actual, df_por_pagar, on='fecha_del_cargo', how='left')
    df_actual['utilidad'] = round(df_actual['utilidad'], 0)
    df_actual['iva_por_pagar'] = (df_actual['iva_facturacion'] - df_actual['iva_costo_producto'] - 
                                 df_actual['iva_comision'] - df_actual['iva_descuento'] + df_actual['IVA'])
    
    df_actual['utilidad_neta'] = round(df_actual['utilidad'] - df_actual['iva_por_pagar'] + df_actual['Deuda Bruta'], 0)
    df_actual['dia_mes'] = df_actual['fecha_del_cargo'].dt.day
    df_actual = ordenar_por_ciclo_facturacion(df_actual)
    
    # Obtener los días del mes actual para filtrar
    dias_actuales = set(df_actual['dia_mes'].tolist())
    
    df_anterior_proc = pd.DataFrame()
    if add_completo and df_anterior is not None and not df_anterior.empty:
        # Procesar datos anteriores
        if max_fecha is not None:
            df_anterior_proc = df_anterior[df_anterior['fecha_del_cargo'] <= max_fecha].copy()
        else:
            df_anterior_proc = df_anterior.copy()
            
        df_anterior_proc = df_anterior_proc.groupby('fecha_del_cargo').agg({
            'utilidad': 'sum',
            'iva_facturacion': 'sum',
            'iva_costo_producto': 'sum',
            'iva_comision': 'sum',
            'iva_descuento': 'sum'
        }).reset_index()
        if df_por_pagar_anterior is not None and not df_por_pagar_anterior.empty:
            df_anterior_proc = pd.merge(df_anterior_proc, df_por_pagar_anterior, on='fecha_del_cargo', how='left')
            df_anterior_proc['utilidad'] = round(df_anterior_proc['utilidad'], 0)
            df_anterior_proc['iva_por_pagar'] = (df_anterior_proc['iva_facturacion'] - df_anterior_proc['iva_costo_producto'] - 
                                               df_anterior_proc['iva_comision'] - df_anterior_proc['iva_descuento'] + 
                                               df_anterior_proc['IVA'])
            df_anterior_proc['utilidad_neta'] = round(df_anterior_proc['utilidad'] - df_anterior_proc['iva_por_pagar'] + 
                                                     df_anterior_proc['Deuda Bruta'], 0)
        
        df_anterior_proc['dia_mes'] = df_anterior_proc['fecha_del_cargo'].dt.day
        
        # FILTRAR SOLO LOS DÍAS QUE EXISTEN EN EL MES ACTUAL
        df_anterior_proc = df_anterior_proc[df_anterior_proc['dia_mes'].isin(dias_actuales)]
        
        df_anterior_proc = ordenar_por_ciclo_facturacion(df_anterior_proc)
    
    return df_actual, df_anterior_proc

st.markdown("""
        <style>
            html, body, .main, .stApp {
                background-color: #d7e6fc !important;
                color: black !important;
            }
            .block-container {
                padding-left: 1rem;
                padding-right: 1rem;
                max-width: 100% !important;
            }
            * {
                color: black !important;
            }
            .stDataFrame, .stPlotlyChart, .stDownloadButton, .stButton {
                background-color: #d7e6fc !important;
                color: black !important;
                border: 1px solid #ccc !important;
            }
            section[data-testid="stFileUploader"] {
                background-color: #d7e6fc !important;
                color: black !important;
            }
        </style>
""", unsafe_allow_html=True)

# Cargar el banner que ocupe todo el ancho de la página
st.image("banner.png", use_container_width=True)

col_0, col_1, col_2 = st.columns([0.3, 0.3, 0.3])

with col_0:
    uploaded_file_venta = st.file_uploader("Ventas CL", type=["xlsx"], label_visibility='collapsed')

with col_1:
    uploaded_file = st.file_uploader("Reporte nuevo", type=["xlsx"], label_visibility='collapsed')
with col_2:
    uploaded_file_2 = st.file_uploader("Reporte antiguo", type=["xlsx"], label_visibility='collapsed')

df_utilidad = clean_names(pd.read_excel("CONSOLIDADO PUBLICACIONES.xlsx", sheet_name='Publicaciones', skiprows=1))
df_utilidad = df_utilidad[['proveedor', 'numero_de_publicacion', 'titulo', 'costo']].dropna(subset='numero_de_publicacion')

if uploaded_file and uploaded_file_venta:
    df_raw = clean_names(pd.read_excel(uploaded_file, sheet_name='REPORT', skiprows=7))
    df_raw2 = clean_names(pd.read_excel(uploaded_file_venta,  skiprows=5, usecols = list(range(0, 41))))
    df_raw2 = df_raw2.replace(r'^\s*$', np.nan, regex=True)

    df_save, df_proc, df_resumen_por_pagar, rows_with_nan, df_resumen_proovedor, df_total, df_por_pagar_d = preprocesar_datos(df_raw, df_utilidad, df_raw2)

    if uploaded_file_2:
        add_completo = True
        df_raw = clean_names(pd.read_excel(uploaded_file_2, sheet_name='REPORT', skiprows=7))
        df_save_completo, _, _, _, _, _, df_por_pagar_completo = preprocesar_datos(df_raw, df_utilidad, df_raw2)
    else:
        add_completo = False
        df_save_completo = pd.DataFrame([])
        df_por_pagar_completo = pd.DataFrame([])
        
    # Copiar y formatear df para visualización
    df_filtrado = df_proc.copy()
    publicaciones_sin_costo = rows_with_nan[['numero_de_publicacion', 'titulo_de_publicacion']].drop_duplicates()
    publicaciones_sin_costo.columns = ['N° publicación', 'Título de la Publicación']
    columnas_numericas = df_filtrado.drop(columns='Rentabilidad').select_dtypes(include=['float64', 'int64']).columns
    for col in columnas_numericas:
        df_filtrado[col] = df_filtrado[col].apply(formato_contabilidad)
        
    st.markdown("---")
    st.markdown("### Resultados")
    st.markdown("##### Filtros")
    
    filtrar_fecha = st.checkbox("Filtrar por fecha")
    col_1, col_2 = st.columns([0.5, 0.5])
    with col_1:    
        fecha_seleccionada_2 = st.date_input("Selecciona una fecha", key = 'fecha2', disabled=not filtrar_fecha)
    with col_2:
        filtro_palabra = st.text_input("Ingrese una palabra")

    # Aplicar filtro de fecha solo si está habilitado
    if filtrar_fecha:
        df_filtrado_fecha = df_filtrado[
                df_filtrado["Fecha"].dt.date == fecha_seleccionada_2
            ]
    else:
        df_filtrado_fecha = df_filtrado.copy()

    # Aplicar filtro de palabra si no está vacío
    if filtro_palabra != '':
        import unicodedata
        
        def normalizar_texto(texto):
            if pd.isna(texto):
                return ''
            texto = str(texto).lower()
            return unicodedata.normalize('NFD', texto).encode('ascii', 'ignore').decode('ascii')
        
        filtro_normalizado = normalizar_texto(filtro_palabra)
        mask = df_filtrado_fecha['Título de la publicación'].apply(normalizar_texto).str.contains(filtro_normalizado, na=False)
        df_filtrado_fecha = df_filtrado_fecha[mask]

    st.dataframe(df_filtrado_fecha)
    
    if publicaciones_sin_costo.shape[0] == 0:
        pass
    else:
        st.markdown(f"#### La siguientes publicaciones no poseen un costo asociado")
        st.dataframe(publicaciones_sin_costo)
    # df_resumen_por_pagar['IVA'] = np.where(df_resumen_por_pagar['Detalle'] == 'Cargo por Flex', -df_resumen_por_pagar['IVA'], df_resumen_por_pagar['IVA']) 
    totales = df_resumen_por_pagar[df_resumen_por_pagar['Detalle'] != "Cargo por Flex"].select_dtypes(include='number').sum()
    iva_por_pagar = sum(df_save['iva_facturacion']) - sum(df_save['iva_costo_producto']) - sum(df_save['iva_comision']) - sum(df_save['iva_descuento']) + sum(df_resumen_por_pagar['IVA']) 
    costo = sum(df_save['costo'])
    facturacion = sum(df_save['facturacion'])
    utilidad = sum(df_save['utilidad'])
    utilidad_real = utilidad - iva_por_pagar + (totales['Deuda Bruta'])
    max_fecha = max(df_save['fecha_del_cargo'])
    df_plot, df_plot_anterior = procesar_datos_utilidad_para_grafico(
            df_save, df_por_pagar_d, add_completo, df_save_completo, df_por_pagar_completo, max_fecha
    )
    df_ventas, df_ventas_anterior = procesar_datos_para_grafico(
            df_save, 'facturacion', add_completo, df_save_completo, max_fecha
        )
        
    min_ventas = df_ventas['facturacion'].iloc[-1]

    try:
        if min_ventas is not None and min_ventas < 200000:
            if len(df_plot) > 1:
                promedio = df_plot['utilidad_neta'].iloc[:-1].mean()
            else:
                promedio = df_plot['utilidad_neta'].mean()
        else:
            promedio = df_plot['utilidad_neta'].mean()
    except:
        promedio = 0
    utilidad_real_proyectada = promedio*30.4

    st.markdown("---")
    st.markdown("### Resumen por proveedor")
    col_1, col_2 = st.columns([0.5, 0.5])
    with col_1:
        df_resumen_proovedor = df_resumen_proovedor.sort_values('Utilidad', ascending=False)
        df_resumen_proovedor.loc[:, 'Rentabilidad %'] = (df_resumen_proovedor['Utilidad']/df_resumen_proovedor['Suministro'])*100
        columnas_numericas = df_resumen_proovedor.drop(columns=['Rentabilidad %']).select_dtypes(include=['float64', 'int64']).columns

        df_resumen_proovedor['Rentabilidad %'] = df_resumen_proovedor['Rentabilidad %'].apply(formato_porcentaje)
        for col in columnas_numericas:
            df_resumen_proovedor[col] = df_resumen_proovedor[col].apply(formato_contabilidad)

        st.dataframe(df_resumen_proovedor.reset_index(drop=True))

    with col_2:
        fecha_seleccionada = st.date_input("Selecciona una fecha", key = 'fecha')
        df_filtrado = df_total[
            df_total["fecha_del_cargo"].dt.date == fecha_seleccionada
        ]
        df_filtrado.loc[:, 'costo2'] = df_filtrado['costo']*df_filtrado['cantidad_vendida']
        df_resumen_proovedor_fitlro = df_filtrado.groupby('proveedor').agg({'facturacion': 'sum',
                                                                'ingreso': 'sum',
                                                                'utilidad': 'sum',
                                                                'costo2': 'sum'}).reset_index()
        df_resumen_proovedor_fitlro = df_resumen_proovedor_fitlro.sort_values('utilidad', ascending=False)
        df_resumen_proovedor_fitlro.loc[:, 'Rentabilidad'] = (df_resumen_proovedor_fitlro['utilidad']/df_resumen_proovedor_fitlro['costo2'])*100
        columnas_numericas = df_resumen_proovedor_fitlro.drop(columns=['Rentabilidad']).select_dtypes(include=['float64', 'int64']).columns
        df_resumen_proovedor_fitlro['Rentabilidad'] = df_resumen_proovedor_fitlro['Rentabilidad'].apply(formato_porcentaje)
        for col in columnas_numericas:
            df_resumen_proovedor_fitlro[col] = df_resumen_proovedor_fitlro[col].apply(formato_contabilidad)

        df_resumen_proovedor_fitlro.columns = ['Proveedor', 'Facturación', 'Ingreso', 'Utilidad', 'Suministro', 'Rentabilidad %']
        
        st.dataframe(df_resumen_proovedor_fitlro.reset_index(drop=True))
        
    col_1, col_2 = st.columns([0.5, 0.5])
    with col_1:
        # Crear la nueva fila con 'Detalle' = 'Costo Total'
        nueva_fila = {'Detalle': 'Costo Total'}
        nueva_fila.update(totales)

        # Añadir la fila al DataFrame
        df_resumen_con_total = pd.concat([df_resumen_por_pagar, pd.DataFrame([nueva_fila])], ignore_index=True)
        # Mover fila 3 al final
        condicion = df_resumen_con_total['Detalle'] == 'Cargo por Flex'
        df_resumen_con_total = pd.concat([df_resumen_con_total[~condicion], 
                                          df_resumen_con_total[condicion]], ignore_index=True)

        columnas_numericas = df_resumen_con_total.select_dtypes(include=['float64', 'int64']).columns
        for col in columnas_numericas:
            df_resumen_con_total[col] = df_resumen_con_total[col].apply(formato_contabilidad)

        st.markdown("---")
        st.markdown("### Costos")
        st.dataframe(df_resumen_con_total)

    # Contenido dentro de la tarjeta
    with col_2:
        with st.container():
            st.markdown("---")
            st.markdown("### 🧾 Tarjeta de Información")
            # Fila 1
            col1, col2 = st.columns(2)
            with col1:
                etiqueta_metrica("🔹 Facturación")
                st.metric(label=" ", value=f"${facturacion:,.0f}".replace(",", "X").replace(".", ",").replace("X", "."), label_visibility="collapsed")
            with col2:
                etiqueta_metrica("🔹 Utilidad Productos")
                st.metric(label=" ", value=f"${utilidad:,.0f}".replace(",", "X").replace(".", ",").replace("X", "."), label_visibility="collapsed")

            # Fila 2
            col3, col4 = st.columns(2)
            with col3:
                etiqueta_metrica("🔹 Total Costos suministros")
                st.metric(label=" ", value=f"${costo:,.0f}".replace(",", "X").replace(".", ",").replace("X", "."), label_visibility="collapsed")

            with col4:
                etiqueta_metrica("🔹 IVA por pagar")
                st.metric(label=" ", value=f"${iva_por_pagar:,.0f}".replace(",", "X").replace(".", ",").replace("X", "."), label_visibility="collapsed")

            # Fila 3 centrada
            col5, col6 = st.columns(2)
            with col5:
                etiqueta_metrica("🔹 Utilidad Neta")
                st.metric(label=" ", value=f"${utilidad_real:,.0f}".replace(",", "X").replace(".", ",").replace("X", "."), label_visibility="collapsed")
            with col6:
                etiqueta_metrica("🔹 Proyeccion Neta")
                st.metric(label=" ", value=f"${utilidad_real_proyectada:,.0f}".replace(",", "X").replace(".", ",").replace("X", "."), label_visibility="collapsed")

    st.markdown("---")
    st.markdown("### Tendencia ventas brutas")    
    col1, col2 = st.columns([0.5, 0.5])
    
    with col1:
        # Procesar datos para facturación diaria
        if add_completo and not df_ventas_anterior.empty:
            fig = plot_utilidades_plotly(df_ventas, 
                                        df_ventas_anterior,
                                        titulo=f'Facturación Diaria [observaciones = {df_ventas.shape[0]}]', 
                                        y='facturacion', 
                                        label_y='Facturación', 
                                        add_line=True, 
                                        min_ventas=min_ventas)
        else:
            fig = plot_utilidades_plotly(df_ventas, 
                                        pd.DataFrame([]),
                                        titulo=f'Facturación Diaria [observaciones = {df_ventas.shape[0]}]', 
                                        y='facturacion', 
                                        label_y='Facturación', 
                                        add_line=True, 
                                        min_ventas=min_ventas)
            
        st.plotly_chart(fig, use_container_width=True, height=600)
    
    with col2:
        # Crear datos acumulados manteniendo la estructura por día del mes
        df_ventas_acum = df_ventas.copy()
        # df_ventas_acum = df_ventas_acum.sort_values('dia_mes')
        df_ventas_acum['facturacion'] = df_ventas_acum['facturacion'].cumsum()
        
        if add_completo and not df_ventas_anterior.empty:
            df_ventas_anterior_acum = df_ventas_anterior.copy()
            # df_ventas_anterior_acum = df_ventas_anterior_acum.sort_values('dia_mes')
            df_ventas_anterior_acum['facturacion'] = df_ventas_anterior_acum['facturacion'].cumsum()
            
            fig_acum = plot_utilidades_plotly(df_ventas_acum, 
                                            df_ventas_anterior_acum,
                                            titulo='Facturación Acumulada', 
                                            y='facturacion', 
                                            label_y='Facturación')
        else:
            fig_acum = plot_utilidades_plotly(df_ventas_acum, 
                                            pd.DataFrame([]),
                                            titulo='Facturación Acumulada', 
                                            y='facturacion', 
                                            label_y='Facturación')
                        
        st.plotly_chart(fig_acum, use_container_width=True, height=600)
    
    st.markdown("---")
    st.markdown("### Tendencia utilidad")
    col1, col2 = st.columns([0.5, 0.5])
    
    with col1:
        # Procesar datos para utilidad bruta
        if add_completo and not df_plot_anterior.empty:
            fig = plot_utilidades_plotly(df_plot, 
                                        df_plot_anterior,
                                        titulo=f'Utilidad Bruta por Fecha [observaciones = {df_plot.shape[0]}]', 
                                        y='utilidad', 
                                        label_y='Utilidad Bruta', 
                                        add_line=True, 
                                        min_ventas=min_ventas)
        else:
            fig = plot_utilidades_plotly(df_plot, 
                                        pd.DataFrame([]),
                                        titulo=f'Utilidad Bruta por Fecha [observaciones = {df_plot.shape[0]}]', 
                                        y='utilidad', 
                                        label_y='Utilidad Bruta', 
                                        add_line=True, 
                                        min_ventas=min_ventas)
        st.plotly_chart(fig, use_container_width=True, height=600)
    
    with col2:
        # Utilidad neta
        if add_completo and not df_plot_anterior.empty:
            fig = plot_utilidades_plotly(df_plot, 
                                        df_plot_anterior,
                                        titulo=f'Utilidad Neta por Fecha [observaciones = {df_plot.shape[0]}]', 
                                        y='utilidad_neta', 
                                        label_y='Utilidad Neta', 
                                        add_line=True, 
                                        min_ventas=min_ventas)
        else:
            fig = plot_utilidades_plotly(df_plot, 
                                        pd.DataFrame([]),
                                        titulo=f'Utilidad Neta por Fecha [observaciones = {df_plot.shape[0]}]', 
                                        y='utilidad_neta', 
                                        label_y='Utilidad Neta', 
                                        add_line=True, 
                                        min_ventas=min_ventas)
        st.plotly_chart(fig, use_container_width=True, height=600)
    
    st.markdown("---")
    st.markdown("### Tendencia por Costos")
    
    # Calcular costos para ambos dataframes
    df_plot['costo'] = df_plot['utilidad'] - df_plot['utilidad_neta']
    if add_completo and not df_plot_anterior.empty:
        df_plot_anterior['costo'] = df_plot_anterior['utilidad'] - df_plot_anterior['utilidad_neta']
        fig = plot_utilidades_plotly(df_plot, 
                                    df_plot_anterior,
                                    titulo=f'Costo por Fecha', 
                                    y='costo', 
                                    label_y='Costo Diario', 
                                    add_line=True, 
                                    min_ventas=min_ventas)
    else:
        fig = plot_utilidades_plotly(df_plot, 
                                    pd.DataFrame([]),
                                    titulo=f'Costo por Fecha', 
                                    y='costo', 
                                    label_y='Costo Diario', 
                                    add_line=True, 
                                    min_ventas=min_ventas)
    st.plotly_chart(fig, use_container_width=True, height=600)

    # ===== DESCARGA DE REPORTE =====
    #buffer = BytesIO()
    #generar_reporte(df_utilidad, df_filtrado, buffer)
    #buffer.seek(0)
    #st.download_button("Descargar reporte Excel", buffer, file_name="reporte_utilidad.xlsx", mime="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")