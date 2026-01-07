import { NextRequest, NextResponse } from 'next/server';
import { getMercadoLibreClient } from '@/lib/mercadolibre/client';
import { getCachedCosts } from '@/lib/google-sheets/costs-cache';

export const dynamic = 'force-dynamic';
export const maxDuration = 120;

interface SaleDetail {
  order_id: string;
  date: string;
  producto: string;
  codigo_ml: string;
  proveedor: string;
  precio_venta: number;
  cantidad: number;
  comision_ml: number;
  costo_envio: number;
  ingreso_neto: number;
  costo_producto: number;
  utilidad: number;
  roi: number;
  logistic_type: string;
}

interface DailySummary {
  date: string;
  ventas_count: number;
  facturacion: number;
  comisiones: number;
  costos_envio: number;
  ingreso_neto: number;
  costo_productos: number;
  utilidad: number;
}

interface ProviderSummary {
  proveedor: string;
  facturacion: number;
  ingreso_neto: number;
  utilidad: number;
  ventas_count: number;
  rentabilidad: number;
}

// GET /api/monthly-monitor - Monitor mensual del negocio
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const month = searchParams.get('month'); // Formato: YYYY-MM
    const year = searchParams.get('year');

    const ml = getMercadoLibreClient();
    const ML_COMMISSION = 0.13; // 13%
    const FLEX_SHIPPING_COST = 2990; // $2,990 por envío FLEX

    // Determinar rango de fechas
    let startDate: Date;
    let endDate: Date;

    if (month) {
      const [y, m] = month.split('-').map(Number);
      startDate = new Date(y, m - 1, 1);
      endDate = new Date(y, m, 0); // Último día del mes
    } else {
      // Por defecto: mes actual
      const now = new Date();
      startDate = new Date(now.getFullYear(), now.getMonth(), 1);
      endDate = new Date(now.getFullYear(), now.getMonth() + 1, 0);
    }

    // Calcular días desde inicio del mes
    const daysBack = Math.ceil((new Date().getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)) + 1;

    // Cargar costos desde Google Sheets
    const costsMap = new Map<string, { costo: number; proveedor: string }>();
    try {
      const costs = await getCachedCosts();
      for (const cost of costs) {
        if (cost.codigoML) {
          costsMap.set(cost.codigoML.toLowerCase(), { costo: cost.costo, proveedor: cost.proveedor });
        }
        if (cost.sku) {
          costsMap.set(cost.sku.toLowerCase(), { costo: cost.costo, proveedor: cost.proveedor });
        }
      }
    } catch (e) {
      console.error('[MonthlyMonitor] Error loading costs:', e);
    }

    // Obtener órdenes del período
    const orders = await ml.getAllOrders(Math.min(daysBack, 90)); // Máximo 90 días

    // Filtrar órdenes del mes seleccionado
    const filteredOrders = orders.filter(order => {
      const orderDate = new Date(order.date_created);
      return orderDate >= startDate && orderDate <= endDate && order.status !== 'cancelled';
    });

    // Procesar cada venta en detalle
    const salesDetails: SaleDetail[] = [];
    const dailySummaries: Record<string, DailySummary> = {};
    const providerSummaries: Record<string, ProviderSummary> = {};

    for (const order of filteredOrders) {
      const orderDate = new Date(order.date_created);
      const dateKey = orderDate.toISOString().split('T')[0];

      // Inicializar resumen diario si no existe
      if (!dailySummaries[dateKey]) {
        dailySummaries[dateKey] = {
          date: dateKey,
          ventas_count: 0,
          facturacion: 0,
          comisiones: 0,
          costos_envio: 0,
          ingreso_neto: 0,
          costo_productos: 0,
          utilidad: 0,
        };
      }

      // Determinar costo de envío del paquete
      const itemsInOrder = order.order_items.length;
      const totalUnitsInOrder = order.order_items.reduce((sum: number, item: { quantity: number }) => sum + item.quantity, 0);

      // Determinar tipo de logística desde el shipping de la orden
      // Por ahora asumimos costo FLEX para órdenes con shipping (se puede mejorar con API de shipments)
      const hasShipping = order.shipping && order.shipping.id;
      const logisticType = hasShipping ? 'self_service' : 'unknown'; // Asumimos FLEX por defecto
      const isFlexOrder = hasShipping; // Si tiene shipping, tiene costo de envío
      const packageShippingCost = isFlexOrder ? FLEX_SHIPPING_COST : 0;

      for (const item of order.order_items) {
        const itemId = item.item.id;
        const sku = item.item.seller_sku;
        const unitPrice = item.unit_price;
        const quantity = item.quantity;

        // Buscar costo y proveedor
        const costByMl = costsMap.get(itemId.toLowerCase());
        const costBySku = sku ? costsMap.get(sku.toLowerCase()) : null;
        const costData = costByMl || costBySku || { costo: 0, proveedor: 'Sin asignar' };

        // Calcular comisión por unidad
        const comisionUnit = Math.round(unitPrice * ML_COMMISSION);

        // Distribuir costo de envío entre unidades del paquete
        const shippingCostPerUnit = Math.round(packageShippingCost / totalUnitsInOrder);

        // Calcular financieros
        const ingresoNeto = unitPrice - comisionUnit - shippingCostPerUnit;
        const utilidad = costData.costo > 0 ? ingresoNeto - costData.costo : 0;
        const roi = costData.costo > 0 ? Math.round((utilidad / costData.costo) * 1000) / 10 : 0;

        // Agregar detalle de venta
        const saleDetail: SaleDetail = {
          order_id: order.id.toString(),
          date: dateKey,
          producto: item.item.title.substring(0, 50),
          codigo_ml: itemId,
          proveedor: costData.proveedor,
          precio_venta: unitPrice,
          cantidad: quantity,
          comision_ml: comisionUnit * quantity,
          costo_envio: shippingCostPerUnit * quantity,
          ingreso_neto: ingresoNeto * quantity,
          costo_producto: costData.costo * quantity,
          utilidad: utilidad * quantity,
          roi,
          logistic_type: logisticType,
        };
        salesDetails.push(saleDetail);

        // Actualizar resumen diario
        const daily = dailySummaries[dateKey];
        daily.ventas_count += quantity;
        daily.facturacion += unitPrice * quantity;
        daily.comisiones += comisionUnit * quantity;
        daily.costos_envio += shippingCostPerUnit * quantity;
        daily.ingreso_neto += ingresoNeto * quantity;
        daily.costo_productos += costData.costo * quantity;
        daily.utilidad += utilidad * quantity;

        // Actualizar resumen por proveedor
        const provKey = costData.proveedor;
        if (!providerSummaries[provKey]) {
          providerSummaries[provKey] = {
            proveedor: provKey,
            facturacion: 0,
            ingreso_neto: 0,
            utilidad: 0,
            ventas_count: 0,
            rentabilidad: 0,
          };
        }
        const prov = providerSummaries[provKey];
        prov.facturacion += unitPrice * quantity;
        prov.ingreso_neto += ingresoNeto * quantity;
        prov.utilidad += utilidad * quantity;
        prov.ventas_count += quantity;
      }
    }

    // Calcular rentabilidad por proveedor
    for (const prov of Object.values(providerSummaries)) {
      prov.rentabilidad = prov.ingreso_neto > 0
        ? Math.round((prov.utilidad / prov.ingreso_neto) * 1000) / 10
        : 0;
    }

    // Ordenar datos
    const dailyArray = Object.values(dailySummaries).sort((a, b) => a.date.localeCompare(b.date));
    const providerArray = Object.values(providerSummaries).sort((a, b) => b.utilidad - a.utilidad);

    // Calcular totales del mes
    const totalFacturacion = dailyArray.reduce((sum, d) => sum + d.facturacion, 0);
    const totalComisiones = dailyArray.reduce((sum, d) => sum + d.comisiones, 0);
    const totalCostosEnvio = dailyArray.reduce((sum, d) => sum + d.costos_envio, 0);
    const totalIngresoNeto = dailyArray.reduce((sum, d) => sum + d.ingreso_neto, 0);
    const totalCostoProductos = dailyArray.reduce((sum, d) => sum + d.costo_productos, 0);
    const totalUtilidad = dailyArray.reduce((sum, d) => sum + d.utilidad, 0);
    const totalVentas = dailyArray.reduce((sum, d) => sum + d.ventas_count, 0);

    const response = {
      period: {
        month: month || `${startDate.getFullYear()}-${String(startDate.getMonth() + 1).padStart(2, '0')}`,
        start_date: startDate.toISOString().split('T')[0],
        end_date: endDate.toISOString().split('T')[0],
        days_count: dailyArray.length,
      },
      summary: {
        total_ventas: totalVentas,
        total_facturacion: Math.round(totalFacturacion),
        total_comisiones: Math.round(totalComisiones),
        total_costos_envio: Math.round(totalCostosEnvio),
        total_ingreso_neto: Math.round(totalIngresoNeto),
        total_costo_productos: Math.round(totalCostoProductos),
        total_utilidad: Math.round(totalUtilidad),
        roi_promedio: totalCostoProductos > 0
          ? Math.round((totalUtilidad / totalCostoProductos) * 1000) / 10
          : 0,
        rentabilidad: totalIngresoNeto > 0
          ? Math.round((totalUtilidad / totalIngresoNeto) * 1000) / 10
          : 0,
      },
      daily: dailyArray,
      by_provider: providerArray,
      sales_detail: salesDetails.slice(0, 100), // Limitar a 100 para performance
      generated_at: new Date().toISOString(),
    };

    return NextResponse.json(response);
  } catch (error) {
    console.error('[MonthlyMonitor] Error:', error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : 'Error loading monthly data' },
      { status: 500 }
    );
  }
}
