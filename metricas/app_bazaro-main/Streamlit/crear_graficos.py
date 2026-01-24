import matplotlib.pyplot as plt
import matplotlib.ticker as mtick
import plotly.graph_objects as go
import pandas as pd

def plot_utilidades_plotly(df, df_completo,
                           titulo, y, label_y, add_line=False, min_ventas=None):
    """
    Crea gráficos con superposición correcta de datos mensuales
    
    Args:
        df: DataFrame con datos del mes actual
        df_completo: DataFrame con datos del mes anterior (puede estar vacío)
        titulo: Título del gráfico
        y: Columna a graficar en el eje Y
        label_y: Label para el eje Y
        add_line: Si agregar línea de promedio
        min_ventas: Valor mínimo para cálculo de promedio
    """
    
    # Validar que df no esté vacío
    if df.empty:
        # Crear gráfico vacío si no hay datos
        fig = go.Figure()
        fig.update_layout(
            title=titulo + " - Sin datos disponibles",
            xaxis_title="Día del Mes",
            yaxis_title=label_y,
            height=500
        )
        return fig
    
    # Copiar dataframes para evitar modificar originales
    df_plot = df.copy()
    
    # Validar que df_completo no sea None y manejarlo
    if df_completo is None or df_completo.empty:
        df_completo_plot = pd.DataFrame()
        has_comparison = False
    else:
        df_completo_plot = df_completo.copy()
        has_comparison = True
    
    fig = go.Figure()

    # Definir los números de día ANTES del ordenamiento
    if 'fecha_del_cargo' in df_plot.columns:
        df_plot['dia_numero'] = df_plot['fecha_del_cargo'].dt.day
    elif 'dia_mes' in df_plot.columns:
        df_plot['dia_numero'] = df_plot['dia_mes']
    else:
        df_plot['dia_numero'] = df_plot.index
    
    if has_comparison:
        if 'fecha_del_cargo' in df_completo_plot.columns:
            df_completo_plot['dia_numero'] = df_completo_plot['fecha_del_cargo'].dt.day
        elif 'dia_mes' in df_completo_plot.columns:
            df_completo_plot['dia_numero'] = df_completo_plot['dia_mes']
        else:
            df_completo_plot['dia_numero'] = df_completo_plot.index

    # Ordenar por ciclo de facturación (15-15) SIEMPRE
    def ordenar_por_ciclo_facturacion(df):
        """Ordena los datos por ciclo de facturación: 15, 16, 17, ..., 31, 1, 2, 3, ..., 14"""
        if df.empty:
            return df
        
        # Crear una columna de orden personalizado para el ciclo 15-15
        df = df.copy()
        df['orden_facturacion'] = df['dia_numero'].apply(lambda x: x if x >= 15 else x + 31)
        df = df.sort_values('orden_facturacion')
        return df
    
    # SIEMPRE ordenar por ciclo de facturación, no por dia_mes
    df_plot = ordenar_por_ciclo_facturacion(df_plot)
    
    if has_comparison and not df_completo_plot.empty:
        df_completo_plot = ordenar_por_ciclo_facturacion(df_completo_plot)
    
    # Obtener nombres de los meses para la leyenda
    mes_actual = "Mes Actual"
    mes_anterior = "Mes Anterior"
    
    if 'fecha_del_cargo' in df_plot.columns:
        mes_actual = df_plot['fecha_del_cargo'].dt.strftime('%B %Y').iloc[0].title()
    
    if has_comparison and 'fecha_del_cargo' in df_completo_plot.columns:
        mes_anterior = df_completo_plot['fecha_del_cargo'].dt.strftime('%B %Y').iloc[0].title()
    
    # Definir los números de día para superposición
    dias_semana_es = {
        'Monday': 'Lunes',
        'Tuesday': 'Martes', 
        'Wednesday': 'Miércoles',
        'Thursday': 'Jueves',
        'Friday': 'Viernes',
        'Saturday': 'Sábado',
        'Sunday': 'Domingo'
    }

    # Crear posiciones X artificiales para mantener el orden del ciclo de facturación
    df_plot = df_plot.reset_index(drop=True)
    df_plot['x_position'] = range(len(df_plot))  # 0, 1, 2, 3, ... (orden secuencial)
    
    if has_comparison and not df_completo_plot.empty:
        df_completo_plot = df_completo_plot.reset_index(drop=True)
        df_completo_plot['x_position'] = range(len(df_completo_plot))

    # Primer trazo (mes actual) - usa x_position para mantener orden
    fig.add_trace(go.Scatter(
        x=df_plot['x_position'],  # Usar posición secuencial en lugar del día
        y=df_plot[y],
        mode='lines+markers',
        name=mes_actual,
        line=dict(dash='solid', color='blue', width=2),
        marker=dict(size=8),
        customdata=df_plot.apply(lambda row: f"Día {int(row['dia_numero'])} - {df_plot[df_plot['dia_numero']==row['dia_numero']]['fecha_del_cargo'].dt.strftime('%A').map(dias_semana_es).iloc[0]}" if 'fecha_del_cargo' in df_plot.columns else f"Día {int(row['dia_numero'])}", axis=1),
        hovertemplate='<b>%{customdata}</b><br>' +
                      f'{label_y}: $%{{y:,.0f}}<br>' +
                      '<extra></extra>'
    ))
    
    # Segundo trazo (mes anterior) - usa x_position para superposición correcta
    if has_comparison:
        fig.add_trace(go.Scatter(
            x=df_completo_plot['x_position'],  # Usar posición secuencial
            y=df_completo_plot[y],
            mode='lines+markers',
            name=mes_anterior,
            line=dict(dash='dash', color='violet', width=2),
            marker=dict(size=8),
            customdata=df_completo_plot.apply(lambda row: f"Día {int(row['dia_numero'])} - {df_completo_plot[df_completo_plot['dia_numero']==row['dia_numero']]['fecha_del_cargo'].dt.strftime('%A').map(dias_semana_es).iloc[0]}" if 'fecha_del_cargo' in df_completo_plot.columns else f"Día {int(row['dia_numero'])}", axis=1),
            hovertemplate='<b>%{customdata}</b><br>' +
                          f'{label_y}: $%{{y:,.0f}}<br>' +
                          '<extra></extra>'
        ))

    # Configurar las etiquetas del eje X - usar posiciones artificiales con etiquetas de días
    tickvals = df_plot['x_position'].tolist()  # Posiciones secuenciales: 0, 1, 2, 3...
    ticktext = df_plot['dia_numero'].astype(str).tolist()  # Etiquetas de días en el orden correcto

    fig.update_layout(
        title=titulo,
        xaxis_title="Día del Mes",
        yaxis_title=label_y,
        yaxis_tickprefix="$",
        yaxis_tickformat=",",
        height=500,
        margin=dict(l=40, r=40, t=60, b=100),
        showlegend=True,
        legend=dict(
            orientation="h",
            yanchor="bottom",
            y=1.02,
            xanchor="right",
            x=1
        ),
        xaxis=dict(
            tickmode='array',
            tickvals=tickvals,
            ticktext=ticktext,
            tickangle=-45
        )
    )
    
    # Agregar línea de promedio si se solicita
    if add_line and not df_plot.empty:
        try:
            # Calcular promedio con validación
            if min_ventas is not None and min_ventas < 200000:
                if len(df_plot) > 1:
                    promedio = df_plot[y].iloc[:-1].mean()
                else:
                    promedio = df_plot[y].mean()
            else:
                promedio = df_plot[y].mean()
            
            # Agregar línea horizontal del promedio
            fig.add_shape(
                type="line",
                xref="paper",
                x0=0,
                x1=1,
                y0=promedio,
                y1=promedio,
                line=dict(color="red", dash="dot"),
            )
            
            # Agregar anotación del promedio
            x_pos = df_plot['x_position'].iloc[len(df_plot) // 2] if len(df_plot) > 1 else df_plot['x_position'].iloc[0]
            fig.add_annotation(
                x=x_pos,
                y=promedio,
                text=f"Promedio: ${promedio:,.0f}",
                showarrow=False,
                yshift=10,
                font=dict(color="red")
            )
        except Exception as e:
            print(f"Error al calcular promedio: {e}")

    return fig