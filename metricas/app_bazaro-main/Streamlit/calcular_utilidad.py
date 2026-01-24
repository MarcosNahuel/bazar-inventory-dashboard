import pandas as pd
import re
import numpy as np
def formato_contabilidad(valor):
    if pd.isna(valor):
        return ""
    return f"${valor:,.0f}".replace(",", "X").replace(".", ",").replace("X", ".")

def formato_porcentaje(valor):
    if pd.isna(valor):
        return ""
    return f"{valor:,.1f}%".replace(",", "X").replace(".", ",").replace("X", ".")

import pandas as pd
import re

def procesar_paquetes(df):
    """
    Agrega columna 'cantidad' basada en paquetes de productos.
    
    Args:
        df (pandas.DataFrame): DataFrame con columna 'estado'
    
    Returns:
        pandas.DataFrame: DataFrame con nueva columna 'cantidad'
    """
    df = df.copy()
    df['cantidad'] = 0
    
    procesadas = set()
    
    for i in range(len(df)):
        if i in procesadas:
            continue
        match = re.search(r'Paquete de (\d+) productos?', str(df.iloc[i]['estado']), re.IGNORECASE)
        
        if match:
            
            x = int(match.group(1))
            fin = min(i + x + 1, len(df))
            if df.iloc[i]['forma_de_entrega'] == 'Mercado Envíos Flex':
                df.loc[i + 1:fin-1, 'cantidad'] = x
                df.loc[i + 1:fin-1, 'envio_clp'] = df.iloc[i]['ingresos_por_envio_clp_']/x
                df.loc[i + 1:fin-1, 'costo_envio_flex'] = 3000/x
                df.loc[i + 1:fin-1, 'forma_de_entrega'] = 'Mercado Envíos Flex'
            procesadas.update(range(i, fin))
        elif df.iloc[i]['forma_de_entrega'] == 'Mercado Envíos Flex':
            df.loc[i, 'cantidad'] = 1
            df.loc[i, 'envio_clp'] = df.iloc[i]['ingresos_por_envio_clp_']
            df.loc[i, 'costo_envio_flex'] = 3000
            df.loc[i, 'forma_de_entrega'] = 'Mercado Envíos Flex'
        else:
            pass
    
    return df


def preprocesar_datos(df_reporte: pd.DataFrame,
                      df_utilidad,
                      df_flex) -> pd.DataFrame:
    #df_reporte = df_raw.copy()
    # df_flex = df_raw2.copy()
    
    df_limpio = procesar_paquetes(df_flex)

    df_limpio = df_limpio[df_limpio['forma_de_entrega'] == 'Mercado Envíos Flex'][['#_de_venta', 'ingresos_por_envio_clp_', 'envio_clp', 'cantidad', 'costo_envio_flex', 'forma_de_entrega']]
    # df_limpio['envio_clp'] = df_limpio['envio_clp'].fillna(df_limpio['ingresos_por_envio_clp_'])
    df_limpio['iva_costo_flex'] = df_limpio['costo_envio_flex'] - df_limpio['costo_envio_flex']/1.19
    df_limpio = df_limpio[df_limpio['cantidad'] != 0]

    df_productos = pd.merge(df_reporte, df_utilidad, how = 'outer').dropna(subset = ['fecha_del_cargo'])

    df_productos = df_productos.merge(df_limpio, left_on = 'numero_de_venta', right_on='#_de_venta', how='left')

    idx_drop = ['MLC1582646059', 'MLC1591492553', 'MLC1604270301']
    df_productos = df_productos[~df_productos['numero_de_publicacion'].isin(idx_drop)]

    idx_drop_2 = df_productos[df_productos['descontado_de_la_operacion'] == 'No aplica'].dropna(subset = 'numero_de_venta')['numero_de_venta'].unique()
    df_productos = df_productos[~df_productos['numero_de_venta'].isin(idx_drop_2)]

    df_productos['valor_del_descuento'] = df_productos['subtotal_sin_descuento'] - df_productos['valor_del_descuento'] 
    df_descontado = df_productos[df_productos['descontado_de_la_operacion'] == 'Si']
    df_por_pagar = df_productos[(df_productos['descontado_de_la_operacion'] == 'No') & (df_productos['estado_del_cargo'] != 'Anulado en factura') | 
                                ((df_productos['forma_de_entrega'] == 'Mercado Envíos Flex') & (df_productos['descontado_de_la_operacion'] == 'Si'))]

    df_descontado_envio = df_descontado[df_descontado['detalle'].str.contains('Envíos|Envios|envios|envíos', case=False, na=False)].copy()
    df_descontado_venta = df_descontado[~df_descontado['detalle'].str.contains('Envíos|Envios|envios|envíos', case=False, na=False)].copy()
    
    df_cargo_devo = df_descontado_venta[df_descontado_venta['detalle'].str.contains('devolución')]
    df_descontado_venta = df_descontado_venta[~df_descontado_venta['detalle'].str.contains('devolución')]

    df_descontado_envio['envio_a_cargo_del_cliente'] = df_descontado_envio['envio_a_cargo_del_cliente'].fillna(0)

    df_descontado_envio['valor_envio'] = df_descontado_envio['valor_del_cargo'] - df_descontado_envio['envio_a_cargo_del_cliente']
    df_descontado_envio['valor_envio']  = np.where(df_descontado_envio['valor_envio'] == 0, np.nan, df_descontado_envio['valor_envio'])


    df_descontado = df_descontado_venta.merge(df_descontado_envio[['numero_de_venta', 'valor_envio']], on = 'numero_de_venta', how = 'outer')

    rows_with_nan = df_descontado[df_descontado['costo'].isna()]
    df_total = df_descontado.dropna(subset = 'costo')
    #df_total = df_descontado.copy()
    factor = 1 - 1/1.19

    df_total.loc[:, 'iva_descuento'] = df_total['valor_envio']*factor
    df_total.loc[:, 'valor_envio'] = df_total['valor_envio'].fillna(df_total['costo_envio_flex'] - df_total['envio_clp'])
    df_total.loc[:, 'iva_descuento'] = df_total['iva_descuento'].fillna(df_total['iva_costo_flex'])

    df_total.loc[:, 'iva_descuento'] = df_total.loc[:, 'iva_descuento'].fillna(0)
    df_total.loc[:, 'valor_envio'] = df_total.loc[:, 'valor_envio'].fillna(0)

    df_total.loc[:, 'costo_por_categoria_calculado'] = (df_total['precio_unitario']*df_total['cantidad_vendida'])*df_total['porcentaje_por_categoria']
    df_total.loc[:, 'comision_por_venta'] = df_total['costo_por_categoria_calculado'] + df_total['costo_fijo'] 
    df_total.loc[:, 'iva_comision'] = df_total['comision_por_venta']*factor
    df_total.loc[:, 'iva_costo_producto'] = df_total['costo']*factor*df_total['cantidad_vendida']
    df_total.loc[:, 'facturacion'] = df_total['precio_unitario']*df_total['cantidad_vendida']
    df_total.loc[:, 'iva_facturacion'] = (df_total['precio_unitario']*df_total['cantidad_vendida'])*factor

    df_total.loc[:, 'ingreso'] = df_total['precio_unitario']*df_total['cantidad_vendida'] - df_total['comision_por_venta'] - df_total['valor_envio']

    df_total.loc[:, 'utilidad'] = df_total['ingreso'] - df_total['costo']*df_total['cantidad_vendida']
    df_total.loc[:, 'rentabilidad'] = round((df_total['utilidad']/(df_total['costo']*df_total['cantidad_vendida']))*100, 1)
    df_total.loc[:, 'costo2'] = df_total['costo']*df_total['cantidad_vendida']
    df_total = df_total.set_index('numero_de_venta')

    df_total.index.names = ['N° Venta']
    df_resumen_proovedor = df_total.groupby('proveedor').agg({'facturacion' : 'sum',
                                                            'ingreso' : 'sum',
                                                            'utilidad' : 'sum',
                                                            'costo2' : 'sum'}).reset_index()
    df_resumen_proovedor.columns = ['Proveedor', 'Facturación', 'Ingreso', 'Utilidad', 'Suministro']
    df_resumen_proovedor = df_resumen_proovedor.sort_values('Facturación', ascending=False)
    cols_save = ['fecha_del_cargo', 'detalle', 'numero_de_publicacion', 
                'titulo_de_publicacion', 
                'facturacion', 'iva_facturacion', 'precio_unitario',
                'comision_por_venta', 'iva_comision', 
                'valor_envio', 'iva_descuento' ,'ingreso', 'costo', 
                'iva_costo_producto', 'utilidad', 'rentabilidad']
    df_save = df_total[cols_save]

    df_por_pagar = df_por_pagar[['fecha_del_cargo', 'detalle', 'valor_del_cargo']]
    if df_cargo_devo.shape[0] != 0:
        df_cargo_devo = df_cargo_devo[['fecha_del_cargo', 'detalle', 'valor_del_cargo']]
        df_por_pagar = pd.concat([df_por_pagar, df_cargo_devo])
    df_por_pagar['detalle'] = np.where(df_por_pagar['detalle'] == 'Cargo por venta', 'Cargo por Flex', df_por_pagar['detalle'])

    df_resumen_por_pagar = df_por_pagar.groupby(['detalle']).agg({'valor_del_cargo' : 'sum'}).reset_index()
    df_resumen_por_pagar.loc[:, 'Deuda Bruta'] = -df_resumen_por_pagar['valor_del_cargo']
    df_resumen_por_pagar.loc[:, 'IVA'] = df_resumen_por_pagar['Deuda Bruta']*factor
    df_por_pagar = df_por_pagar[df_por_pagar['detalle'] != 'Cargo por Flex']
    df_por_pagar = df_por_pagar.groupby(['fecha_del_cargo']).agg({'valor_del_cargo' : 'sum'}).reset_index()
    df_por_pagar.loc[:, 'Deuda Bruta'] = -df_por_pagar['valor_del_cargo']
    df_por_pagar.loc[:, 'IVA'] = df_por_pagar['Deuda Bruta']*factor 

    cols_names = ['Fecha', 'Detalle', 'Número de publicación',
                'Título de la publicación' ,'Facturación bruta' ,
                'F IVA', 'Precio Venta', 
                'Comisión por venta Mercado Libre bruta', 'C IVA', 
                'Costo de Envio', 'D IVA','Ingreso', 
                'Costo producto', 'Cp IVA', 'Utilidad bruta', 'Rentabilidad']
    # F IVA - otros

    df = df_save.copy()
    df.columns = cols_names
    df.loc[:, 'Fecha'] = df['Fecha'].dt.strftime('%Y-%m-%d')
    # df_resumen_por_pagar.loc[:, 'Fecha'] = df_resumen_por_pagar['Fecha'].dt.strftime('%Y-%m-%d')
    df_resumen_por_pagar = df_resumen_por_pagar[['detalle', 'Deuda Bruta', 'IVA']]
    df_resumen_por_pagar = df_resumen_por_pagar.rename(columns = {'detalle' : 'Detalle'})

    
    return df_save, df, df_resumen_por_pagar, rows_with_nan, df_resumen_proovedor, df_total, df_por_pagar

def generar_reporte(df_utilidad: pd.DataFrame, df_save, buffer):
    with pd.ExcelWriter(buffer, engine='xlsxwriter') as writer:
        df_utilidad.to_excel(writer, sheet_name ="Productos", index=False)
        df_save.to_excel(writer, sheet_name = "EERR", index=False)
        
        workbook  = writer.book
        worksheet = writer.sheets['EERR']

        # Formato contabilidad
        formato_contabilidad = workbook.add_format({
            'num_format': '_($* #,##0.00_);_($* (#,##0.00);_($* "-"??_);_(@_)'
        })

        # Formato fecha (solo año-mes-día)
        formato_fecha = workbook.add_format({'num_format': 'yyyy-mm-dd'})

        # Formato para columna de fecha (columna A en Excel → índice 0)
        worksheet.set_column(0, 0, 12, formato_fecha)
        # Formato contabilidad para columnas 5 a 10 (índices 5 a 10 → columnas F a K)
        worksheet.set_column(5, 10, 18, formato_contabilidad)

        # Crear nueva hoja para los gráficos
        worksheet_graficos = workbook.add_worksheet('graficos')

        # Insertar las dos imágenes en posiciones distintas
        worksheet_graficos.insert_image('B2', "grafico_utilidad.jpg")
        worksheet_graficos.insert_image('B30', "grafico_utilidad_acumulada.jpg")
