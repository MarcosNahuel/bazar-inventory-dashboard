/**
 * Calculadora de Márgenes y Utilidades
 * Portado desde calcular_utilidad.py de Bazaro
 *
 * Incluye cálculos para:
 * - Comisiones de Mercado Libre por categoría
 * - Costos de envío (Full/Flex)
 * - Utilidad bruta y neta
 * - IVA y rentabilidad
 */

// Constantes
export const IVA_FACTOR = 1.19; // IVA Chile 19%
export const DEFAULT_FLEX_COST = 3000; // CLP costo fijo Flex

// Tipos de envío
export type ShippingType = 'full' | 'flex' | 'me1' | 'me2' | 'acordar';

// Comisiones ML por categoría (porcentaje)
export const ML_CATEGORY_FEES: Record<string, number> = {
  'hogar': 0.13,
  'electronica': 0.12,
  'deportes': 0.13,
  'juguetes': 0.15,
  'ropa': 0.14,
  'accesorios': 0.13,
  'otros': 0.13,
  'default': 0.13, // 13% por defecto
};

// Costo fijo ML por transacción (CLP)
export const ML_FIXED_FEE = 500;

export interface SaleData {
  ventaId: string;
  sku: string;
  titulo: string;
  precioUnitario: number;
  cantidad: number;
  costo: number; // costo unitario del producto
  tipoEnvio: ShippingType;
  categoria?: string;
  bonificacionML?: number; // bonificación de ML por envío gratis
  costoEnvioCliente?: number; // lo que paga el cliente por envío
  proveedor?: string;
}

export interface MarginCalculation {
  ventaId: string;
  sku: string;
  titulo: string;

  // Facturación
  facturacionBruta: number;
  ivaFacturacion: number;

  // Comisiones ML
  comisionCategoria: number;
  comisionFija: number;
  comisionTotal: number;
  ivaComision: number;

  // Envío
  tipoEnvio: ShippingType;
  costoEnvio: number; // costo real del envío
  bonificacionML: number;
  costoEnvioNeto: number; // costo - bonificación
  ivaEnvio: number;

  // Costo producto
  costoProducto: number;
  ivaCostoProducto: number;

  // Utilidad
  ingreso: number; // facturación - comisión - envío
  utilidadBruta: number; // ingreso - costo
  ivaPorPagar: number;
  utilidadNeta: number; // después de IVA

  // Métricas
  rentabilidad: number; // porcentaje
  margenPorcentaje: number;

  proveedor: string;
}

/**
 * Calcula el IVA (19% Chile)
 */
export function calcularIVA(monto: number): number {
  return monto - monto / IVA_FACTOR;
}

/**
 * Extrae monto neto (sin IVA)
 */
export function montoNeto(montoBruto: number): number {
  return montoBruto / IVA_FACTOR;
}

/**
 * Obtiene la comisión por categoría
 */
export function getComisionCategoria(categoria?: string): number {
  if (!categoria) return ML_CATEGORY_FEES.default;
  const key = categoria.toLowerCase();
  return ML_CATEGORY_FEES[key] || ML_CATEGORY_FEES.default;
}

/**
 * Calcula costo de envío según tipo
 */
export function calcularCostoEnvio(
  tipoEnvio: ShippingType,
  bonificacionML: number = 0,
  costoFlexCustom?: number
): { costo: number; neto: number } {
  let costo = 0;

  switch (tipoEnvio) {
    case 'flex':
      costo = costoFlexCustom || parseInt(process.env.FLEX_SHIPPING_COST || '3000');
      break;
    case 'full':
      // FULL es gestionado por ML, el costo ya está en la comisión
      costo = 0;
      break;
    case 'me1':
    case 'me2':
      // Mercado Envíos 1 y 2 - calcular según zona
      costo = 0; // Se obtiene del API
      break;
    case 'acordar':
      costo = 0;
      break;
    default:
      costo = 0;
  }

  const neto = Math.max(0, costo - bonificacionML);
  return { costo, neto };
}

/**
 * Calcula márgenes completos para una venta
 * Replica la lógica de preprocesar_datos() de calcular_utilidad.py
 */
export function calcularMargenes(sale: SaleData): MarginCalculation {
  const {
    ventaId,
    sku,
    titulo,
    precioUnitario,
    cantidad,
    costo,
    tipoEnvio,
    categoria,
    bonificacionML = 0,
    proveedor = 'Sin Proveedor',
  } = sale;

  // 1. Facturación
  const facturacionBruta = precioUnitario * cantidad;
  const ivaFacturacion = calcularIVA(facturacionBruta);

  // 2. Comisiones ML
  const porcentajeCategoria = getComisionCategoria(categoria);
  const comisionCategoria = facturacionBruta * porcentajeCategoria;
  const comisionFija = ML_FIXED_FEE;
  const comisionTotal = comisionCategoria + comisionFija;
  const ivaComision = calcularIVA(comisionTotal);

  // 3. Envío
  const envioCalc = calcularCostoEnvio(tipoEnvio, bonificacionML);
  const costoEnvio = envioCalc.costo;
  const costoEnvioNeto = envioCalc.neto;
  const ivaEnvio = calcularIVA(costoEnvioNeto);

  // 4. Costo producto
  const costoProducto = costo * cantidad;
  const ivaCostoProducto = calcularIVA(costoProducto);

  // 5. Ingreso y Utilidad
  // Fórmula: ingreso = facturación - comisión - costo_envio_neto
  const ingreso = facturacionBruta - comisionTotal - costoEnvioNeto;

  // Utilidad bruta = ingreso - costo_producto
  const utilidadBruta = ingreso - costoProducto;

  // IVA por pagar = IVA facturación - IVA costo - IVA comisión - IVA envío
  const ivaPorPagar = ivaFacturacion - ivaCostoProducto - ivaComision - ivaEnvio;

  // Utilidad neta = utilidad bruta - IVA por pagar
  const utilidadNeta = utilidadBruta - ivaPorPagar;

  // 6. Métricas
  const rentabilidad = costoProducto > 0
    ? (utilidadBruta / costoProducto) * 100
    : 0;

  const margenPorcentaje = facturacionBruta > 0
    ? (utilidadBruta / facturacionBruta) * 100
    : 0;

  return {
    ventaId,
    sku,
    titulo,
    facturacionBruta,
    ivaFacturacion,
    comisionCategoria,
    comisionFija,
    comisionTotal,
    ivaComision,
    tipoEnvio,
    costoEnvio,
    bonificacionML,
    costoEnvioNeto,
    ivaEnvio,
    costoProducto,
    ivaCostoProducto,
    ingreso,
    utilidadBruta,
    ivaPorPagar,
    utilidadNeta,
    rentabilidad: Math.round(rentabilidad * 10) / 10,
    margenPorcentaje: Math.round(margenPorcentaje * 10) / 10,
    proveedor,
  };
}

/**
 * Calcula resumen por proveedor
 * Replica df_resumen_proovedor de app.py
 */
export interface ProviderSummary {
  proveedor: string;
  facturacion: number;
  ingreso: number;
  utilidad: number;
  costoSuministro: number;
  rentabilidadPorcentaje: number;
  cantidadVentas: number;
}

export function calcularResumenPorProveedor(
  calculations: MarginCalculation[]
): ProviderSummary[] {
  const byProvider = new Map<string, {
    facturacion: number;
    ingreso: number;
    utilidad: number;
    costoSuministro: number;
    count: number;
  }>();

  for (const calc of calculations) {
    const current = byProvider.get(calc.proveedor) || {
      facturacion: 0,
      ingreso: 0,
      utilidad: 0,
      costoSuministro: 0,
      count: 0,
    };

    current.facturacion += calc.facturacionBruta;
    current.ingreso += calc.ingreso;
    current.utilidad += calc.utilidadBruta;
    current.costoSuministro += calc.costoProducto;
    current.count++;

    byProvider.set(calc.proveedor, current);
  }

  const summaries: ProviderSummary[] = [];
  for (const [proveedor, data] of byProvider) {
    summaries.push({
      proveedor,
      facturacion: data.facturacion,
      ingreso: data.ingreso,
      utilidad: data.utilidad,
      costoSuministro: data.costoSuministro,
      rentabilidadPorcentaje: data.costoSuministro > 0
        ? Math.round((data.utilidad / data.costoSuministro) * 1000) / 10
        : 0,
      cantidadVentas: data.count,
    });
  }

  // Ordenar por utilidad descendente
  return summaries.sort((a, b) => b.utilidad - a.utilidad);
}

/**
 * Calcula proyección de utilidad basada en promedio diario
 */
export function calcularProyeccionMensual(
  dailyUtilities: number[],
  daysToProject: number = 30
): {
  promedioDiario: number;
  proyeccionMes: number;
  min: number;
  max: number;
} {
  if (dailyUtilities.length === 0) {
    return { promedioDiario: 0, proyeccionMes: 0, min: 0, max: 0 };
  }

  const avg = dailyUtilities.reduce((a, b) => a + b, 0) / dailyUtilities.length;

  // Calcular desviación estándar
  const variance = dailyUtilities.reduce((sum, val) => sum + Math.pow(val - avg, 2), 0) / dailyUtilities.length;
  const stdDev = Math.sqrt(variance);

  return {
    promedioDiario: Math.round(avg),
    proyeccionMes: Math.round(avg * daysToProject),
    min: Math.round((avg - stdDev) * daysToProject),
    max: Math.round((avg + stdDev) * daysToProject),
  };
}

/**
 * Formatea número como moneda CLP
 */
export function formatCLP(amount: number): string {
  return new Intl.NumberFormat('es-CL', {
    style: 'currency',
    currency: 'CLP',
    minimumFractionDigits: 0,
    maximumFractionDigits: 0,
  }).format(amount);
}

/**
 * Formatea porcentaje
 */
export function formatPercent(value: number): string {
  return `${value.toFixed(1)}%`;
}
