/**
 * Generador de Órdenes de Compra por Proveedor
 * Agrupa productos por proveedor y calcula cantidades considerando cajas maestras
 */

import { formatCLP } from '../margins/calculator';

export interface ProductToOrder {
  sku: string;
  codigoML: string;
  titulo: string;
  stockActual: number;
  ventas30d: number;
  diasHastaQuiebre: number;
  cantidadSugerida: number;
  cajaMaestra: number; // unidades por caja
  cantidadAjustada: number; // redondeado a cajas
  cajasAComprar: number;
  costoUnitario: number;
  costoTotal: number;
  proveedor: string;
}

export interface PurchaseOrder {
  proveedor: string;
  fecha: string;
  productos: ProductToOrder[];
  subtotal: number;
  iva: number;
  total: number;
  totalCajas: number;
  totalUnidades: number;
}

export interface StockBreakProjection {
  sku: string;
  stockActual: number;
  ventasDiarias: number;
  diasHastaQuiebre: number;
  fechaQuiebre: Date;
  esUrgente: boolean; // < 7 días
  esAlerta: boolean; // < 14 días
}

/**
 * Calcula proyección de quiebre de stock
 */
export function calcularQuiebreStock(
  stockActual: number,
  ventas30d: number
): StockBreakProjection {
  const ventasDiarias = ventas30d / 30;
  const diasHastaQuiebre = ventasDiarias > 0
    ? Math.floor(stockActual / ventasDiarias)
    : 999; // Sin ventas = no se agota

  const fechaQuiebre = new Date();
  fechaQuiebre.setDate(fechaQuiebre.getDate() + diasHastaQuiebre);

  return {
    sku: '',
    stockActual,
    ventasDiarias: Math.round(ventasDiarias * 10) / 10,
    diasHastaQuiebre,
    fechaQuiebre,
    esUrgente: diasHastaQuiebre <= 7,
    esAlerta: diasHastaQuiebre <= 14,
  };
}

/**
 * Calcula cantidad a reponer considerando stock de seguridad
 * Objetivo: tener stock para 30 días + margen de seguridad de 15 días
 */
export function calcularCantidadReponer(
  stockActual: number,
  ventas30d: number,
  diasObjetivo: number = 45 // 30 días + 15 de seguridad
): number {
  const stockObjetivo = (ventas30d / 30) * diasObjetivo;
  const diferencia = stockObjetivo - stockActual;
  return Math.max(0, Math.ceil(diferencia));
}

/**
 * Ajusta cantidad a múltiplos de caja maestra
 */
export function ajustarACajaMaestra(
  cantidad: number,
  unidadesPorCaja: number
): { cajas: number; unidades: number } {
  if (unidadesPorCaja <= 1) {
    return { cajas: cantidad, unidades: cantidad };
  }

  // Redondear hacia arriba al múltiplo de caja más cercano
  const cajas = Math.ceil(cantidad / unidadesPorCaja);
  const unidades = cajas * unidadesPorCaja;

  return { cajas, unidades };
}

/**
 * Genera orden de compra agrupada por proveedor
 */
export function generarOrdenCompra(
  productos: Array<{
    sku: string;
    codigoML: string;
    titulo: string;
    stockActual: number;
    ventas30d: number;
    costoUnitario: number;
    cajaMaestra: number;
    proveedor: string;
  }>,
  diasObjetivo: number = 45
): PurchaseOrder[] {
  const ordenesPorProveedor = new Map<string, ProductToOrder[]>();

  for (const producto of productos) {
    // Calcular cantidad sugerida
    const cantidadSugerida = calcularCantidadReponer(
      producto.stockActual,
      producto.ventas30d,
      diasObjetivo
    );

    // Solo incluir si necesita reposición
    if (cantidadSugerida <= 0) continue;

    // Ajustar a caja maestra
    const { cajas, unidades } = ajustarACajaMaestra(
      cantidadSugerida,
      producto.cajaMaestra || 1
    );

    // Calcular días hasta quiebre
    const quiebre = calcularQuiebreStock(producto.stockActual, producto.ventas30d);

    const productoOrden: ProductToOrder = {
      sku: producto.sku,
      codigoML: producto.codigoML,
      titulo: producto.titulo,
      stockActual: producto.stockActual,
      ventas30d: producto.ventas30d,
      diasHastaQuiebre: quiebre.diasHastaQuiebre,
      cantidadSugerida,
      cajaMaestra: producto.cajaMaestra || 1,
      cantidadAjustada: unidades,
      cajasAComprar: cajas,
      costoUnitario: producto.costoUnitario,
      costoTotal: unidades * producto.costoUnitario,
      proveedor: producto.proveedor,
    };

    const existente = ordenesPorProveedor.get(producto.proveedor) || [];
    existente.push(productoOrden);
    ordenesPorProveedor.set(producto.proveedor, existente);
  }

  // Generar órdenes
  const ordenes: PurchaseOrder[] = [];
  const fechaHoy = new Date().toISOString().split('T')[0];

  for (const [proveedor, productos] of ordenesPorProveedor) {
    // Ordenar por urgencia (días hasta quiebre)
    productos.sort((a, b) => a.diasHastaQuiebre - b.diasHastaQuiebre);

    const subtotal = productos.reduce((sum, p) => sum + p.costoTotal, 0);
    const iva = Math.round(subtotal * 0.19);
    const totalCajas = productos.reduce((sum, p) => sum + p.cajasAComprar, 0);
    const totalUnidades = productos.reduce((sum, p) => sum + p.cantidadAjustada, 0);

    ordenes.push({
      proveedor,
      fecha: fechaHoy,
      productos,
      subtotal,
      iva,
      total: subtotal + iva,
      totalCajas,
      totalUnidades,
    });
  }

  // Ordenar órdenes por total (mayor primero)
  return ordenes.sort((a, b) => b.total - a.total);
}

/**
 * Genera HTML de la orden de compra para exportar/imprimir
 */
export function generarHTMLOrdenCompra(orden: PurchaseOrder): string {
  const productosHTML = orden.productos.map(p => `
    <tr class="${p.diasHastaQuiebre <= 7 ? 'urgente' : p.diasHastaQuiebre <= 14 ? 'alerta' : ''}">
      <td>${p.sku}</td>
      <td>${p.titulo.substring(0, 50)}${p.titulo.length > 50 ? '...' : ''}</td>
      <td class="center">${p.stockActual}</td>
      <td class="center">${p.ventas30d}</td>
      <td class="center ${p.diasHastaQuiebre <= 7 ? 'urgente' : ''}">${p.diasHastaQuiebre}d</td>
      <td class="center">${p.cantidadAjustada} (${p.cajasAComprar} cajas)</td>
      <td class="right">${formatCLP(p.costoUnitario)}</td>
      <td class="right">${formatCLP(p.costoTotal)}</td>
    </tr>
  `).join('');

  return `
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Orden de Compra - ${orden.proveedor}</title>
  <style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    h1 { color: #1a365d; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    th { background-color: #2563eb; color: white; }
    .right { text-align: right; }
    .center { text-align: center; }
    .urgente { background-color: #fee2e2; }
    .alerta { background-color: #fef3c7; }
    .totales { margin-top: 20px; text-align: right; }
    .total-row { font-size: 1.2em; font-weight: bold; }
    .header-info { margin-bottom: 20px; }
  </style>
</head>
<body>
  <h1>Orden de Compra</h1>
  <div class="header-info">
    <p><strong>Proveedor:</strong> ${orden.proveedor}</p>
    <p><strong>Fecha:</strong> ${orden.fecha}</p>
    <p><strong>Total Unidades:</strong> ${orden.totalUnidades} | <strong>Total Cajas:</strong> ${orden.totalCajas}</p>
  </div>

  <table>
    <thead>
      <tr>
        <th>SKU</th>
        <th>Producto</th>
        <th>Stock</th>
        <th>Vtas 30d</th>
        <th>Quiebre</th>
        <th>Cantidad</th>
        <th>P. Unit</th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody>
      ${productosHTML}
    </tbody>
  </table>

  <div class="totales">
    <p>Subtotal: ${formatCLP(orden.subtotal)}</p>
    <p>IVA (19%): ${formatCLP(orden.iva)}</p>
    <p class="total-row">TOTAL: ${formatCLP(orden.total)}</p>
  </div>

  <p style="margin-top: 40px; font-size: 0.9em; color: #666;">
    Generado por BAZAR Dashboard - ${new Date().toLocaleString('es-CL')}
  </p>
</body>
</html>
  `;
}

/**
 * Identifica productos con capital inmovilizado
 * (stock alto pero sin ventas)
 */
export interface ImmobilizedProduct {
  sku: string;
  titulo: string;
  stockActual: number;
  ventas30d: number;
  ventas60d: number;
  ventas90d: number;
  costoUnitario: number;
  capitalInmovilizado: number;
  diasSinVenta: number;
  sugerencia: 'liquidar' | 'promocion' | 'revisar' | 'normal';
}

export function detectarCapitalInmovilizado(
  productos: Array<{
    sku: string;
    titulo: string;
    stockActual: number;
    ventas30d: number;
    ventas60d: number;
    ventas90d: number;
    costoUnitario: number;
  }>
): ImmobilizedProduct[] {
  return productos
    .filter(p => p.stockActual > 5) // Al menos 5 unidades
    .map(p => {
      let diasSinVenta = 0;
      let sugerencia: ImmobilizedProduct['sugerencia'] = 'normal';

      if (p.ventas30d === 0 && p.ventas60d === 0 && p.ventas90d === 0) {
        diasSinVenta = 90;
        sugerencia = 'liquidar';
      } else if (p.ventas30d === 0 && p.ventas60d === 0) {
        diasSinVenta = 60;
        sugerencia = 'liquidar';
      } else if (p.ventas30d === 0) {
        diasSinVenta = 30;
        sugerencia = 'promocion';
      } else if (p.ventas30d < 3) {
        diasSinVenta = 0;
        sugerencia = 'revisar';
      }

      return {
        sku: p.sku,
        titulo: p.titulo,
        stockActual: p.stockActual,
        ventas30d: p.ventas30d,
        ventas60d: p.ventas60d,
        ventas90d: p.ventas90d,
        costoUnitario: p.costoUnitario,
        capitalInmovilizado: p.stockActual * p.costoUnitario,
        diasSinVenta,
        sugerencia,
      };
    })
    .filter(p => p.sugerencia !== 'normal')
    .sort((a, b) => b.capitalInmovilizado - a.capitalInmovilizado);
}
