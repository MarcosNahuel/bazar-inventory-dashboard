import * as XLSX from 'xlsx';
import * as fs from 'fs';
import * as path from 'path';

export interface InventoryItem {
  proveedor: string;
  codigo_ml: string;
  sku: string | null;
  titulo: string;
  status: string;
  stock_full: number;
  stock_flex: number;
  stock_total: number;
  supermarket: boolean;
  costo: number;
  valorizacion: number;
  ventas_30d: number;
  v30_full: number;
  v30_flex: number;
  v30_centro: number;
  rep_full: number;
  rep_flex: number;
  rep_total: number;
  permalink: string;
}

export interface CostAnalysis {
  proveedor: string;
  codigo_ml: string;
  sku: string | null;
  titulo: string;
  precio: number;
  comision_pct: number;
  comision_monto: number;
  envio: number;
  ingreso: number;
  costo: number;
  utilidad: number;
  rentabilidad: number;
  unidades_caja: number;
}

export interface SupplierSummary {
  proveedor: string;
  productos: number;
  stock_total: number;
  valorizacion: number;
  ventas_30d: number;
}

function parseNumber(value: unknown): number {
  if (value === null || value === undefined || value === '') return 0;
  if (typeof value === 'number') return value;
  const str = String(value).replace(/[$,%\s]/g, '').replace(',', '.');
  const num = parseFloat(str);
  return isNaN(num) ? 0 : num;
}

function parsePercentage(value: unknown): number {
  if (value === null || value === undefined || value === '') return 0;
  if (typeof value === 'number') return value;
  const str = String(value).replace(/[%\s]/g, '').replace(',', '.');
  const num = parseFloat(str);
  return isNaN(num) ? 0 : num / 100;
}

export function loadInventoryFromExcel(filePath: string): {
  inventory: InventoryItem[];
  costs: CostAnalysis[];
  suppliers: SupplierSummary[];
} {
  const absolutePath = path.resolve(filePath);

  if (!fs.existsSync(absolutePath)) {
    throw new Error(`Excel file not found: ${absolutePath}`);
  }

  let workbook;
  try {
    // Read file as buffer first to avoid path issues
    const fileBuffer = fs.readFileSync(absolutePath);
    workbook = XLSX.read(fileBuffer, { type: 'buffer' });
  } catch (readError) {
    throw new Error(`Cannot read Excel file ${absolutePath}: ${readError instanceof Error ? readError.message : String(readError)}`);
  }

  // Load Global sheet
  const globalSheet = workbook.Sheets['Global'];
  const globalData = XLSX.utils.sheet_to_json(globalSheet) as Record<string, unknown>[];

  const inventory: InventoryItem[] = globalData.map(row => ({
    proveedor: String(row['Proveedor'] || ''),
    codigo_ml: String(row['Codigo_ML'] || ''),
    sku: row['SKU'] ? String(row['SKU']) : null,
    titulo: String(row['Titulo'] || ''),
    status: String(row['Status'] || ''),
    stock_full: parseNumber(row['Stock_FULL']),
    stock_flex: parseNumber(row['Stock_FLEX']),
    stock_total: parseNumber(row['Stock_Total']),
    supermarket: row['Supermarket'] === 'Si' || row['Supermarket'] === 'Sí',
    costo: parseNumber(row['Costo']),
    valorizacion: parseNumber(row['Valorización']),
    ventas_30d: parseNumber(row['V30D']),
    v30_full: parseNumber(row['V30FULL']),
    v30_flex: parseNumber(row['V30FLEX']),
    v30_centro: parseNumber(row['V30CENTRO']),
    rep_full: parseNumber(row['RepFULL']),
    rep_flex: parseNumber(row['RepFLEX']),
    rep_total: parseNumber(row['RepTotal']),
    permalink: String(row['Permalink'] || ''),
  }));

  // Load Costos_Proveedores sheet
  const costsSheet = workbook.Sheets['Costos_Proveedores'];
  const costsData = XLSX.utils.sheet_to_json(costsSheet) as Record<string, unknown>[];

  const costs: CostAnalysis[] = costsData.map(row => ({
    proveedor: String(row['Proveedor'] || ''),
    codigo_ml: String(row['Número de publicación'] || ''),
    sku: row['SKU'] ? String(row['SKU']) : null,
    titulo: String(row['Título'] || ''),
    precio: parseNumber(row['Precio']),
    comision_pct: parsePercentage(row['Comision %']),
    comision_monto: parseNumber(row['Comision $']),
    envio: parseNumber(row['Envio']),
    ingreso: parseNumber(row['Ingreso']),
    costo: parseNumber(row['Costo']),
    utilidad: parseNumber(row['Utilidad']),
    rentabilidad: parsePercentage(row['Rentabilidad']),
    unidades_caja: parseNumber(row['un x Caja Maestra']) || 1,
  }));

  // Calculate supplier summaries
  const supplierMap = new Map<string, SupplierSummary>();

  for (const item of inventory) {
    if (!item.proveedor) continue;

    const existing = supplierMap.get(item.proveedor);
    if (existing) {
      existing.productos++;
      existing.stock_total += item.stock_total;
      existing.valorizacion += item.valorizacion;
      existing.ventas_30d += item.ventas_30d;
    } else {
      supplierMap.set(item.proveedor, {
        proveedor: item.proveedor,
        productos: 1,
        stock_total: item.stock_total,
        valorizacion: item.valorizacion,
        ventas_30d: item.ventas_30d,
      });
    }
  }

  const suppliers = Array.from(supplierMap.values())
    .sort((a, b) => b.valorizacion - a.valorizacion);

  return { inventory, costs, suppliers };
}

// Pareto Analysis (80/20 rule)
export function paretoAnalysis(inventory: InventoryItem[]): {
  top20Products: InventoryItem[];
  top20Contribution: number;
  totalSales: number;
} {
  // Sort by sales descending
  const sorted = [...inventory]
    .filter(item => item.ventas_30d > 0)
    .sort((a, b) => b.ventas_30d - a.ventas_30d);

  const totalSales = sorted.reduce((sum, item) => sum + item.ventas_30d, 0);
  const top20Count = Math.ceil(sorted.length * 0.2);
  const top20Products = sorted.slice(0, top20Count);
  const top20Sales = top20Products.reduce((sum, item) => sum + item.ventas_30d, 0);
  const top20Contribution = totalSales > 0 ? (top20Sales / totalSales) * 100 : 0;

  return {
    top20Products,
    top20Contribution,
    totalSales,
  };
}

// Ticket Analysis
export interface TicketAnalysis {
  avgTicket: number;
  minTicket: number;
  maxTicket: number;
  medianTicket: number;
  ticketDistribution: {
    range: string;
    count: number;
    percentage: number;
  }[];
}

export function ticketAnalysis(costs: CostAnalysis[]): TicketAnalysis {
  const prices = costs
    .filter(c => c.precio > 0)
    .map(c => c.precio)
    .sort((a, b) => a - b);

  if (prices.length === 0) {
    return {
      avgTicket: 0,
      minTicket: 0,
      maxTicket: 0,
      medianTicket: 0,
      ticketDistribution: [],
    };
  }

  const sum = prices.reduce((a, b) => a + b, 0);
  const avgTicket = sum / prices.length;
  const minTicket = prices[0];
  const maxTicket = prices[prices.length - 1];
  const medianTicket = prices[Math.floor(prices.length / 2)];

  // Distribution by price ranges
  const ranges = [
    { min: 0, max: 5000, label: '$0 - $5,000' },
    { min: 5000, max: 10000, label: '$5,000 - $10,000' },
    { min: 10000, max: 20000, label: '$10,000 - $20,000' },
    { min: 20000, max: 50000, label: '$20,000 - $50,000' },
    { min: 50000, max: 100000, label: '$50,000 - $100,000' },
    { min: 100000, max: Infinity, label: '$100,000+' },
  ];

  const ticketDistribution = ranges.map(range => {
    const count = prices.filter(p => p >= range.min && p < range.max).length;
    return {
      range: range.label,
      count,
      percentage: (count / prices.length) * 100,
    };
  });

  return {
    avgTicket: Math.round(avgTicket),
    minTicket,
    maxTicket,
    medianTicket,
    ticketDistribution,
  };
}

// Stock Health Analysis
export interface StockHealth {
  healthy: number;
  warning: number;
  critical: number;
  outOfStock: number;
  overstocked: number;
  daysOfStock: { codigo_ml: string; titulo: string; days: number; status: string }[];
}

export function stockHealthAnalysis(inventory: InventoryItem[]): StockHealth {
  let healthy = 0;
  let warning = 0;
  let critical = 0;
  let outOfStock = 0;
  let overstocked = 0;

  const daysOfStock: StockHealth['daysOfStock'] = [];

  for (const item of inventory) {
    if (item.status !== 'active') continue;

    const dailySales = item.ventas_30d / 30;
    const daysRemaining = dailySales > 0 ? item.stock_total / dailySales : 999;

    let status = 'healthy';
    if (item.stock_total === 0) {
      outOfStock++;
      status = 'out_of_stock';
    } else if (daysRemaining > 90) {
      overstocked++;
      status = 'overstocked';
    } else if (daysRemaining <= 7) {
      critical++;
      status = 'critical';
    } else if (daysRemaining <= 14) {
      warning++;
      status = 'warning';
    } else {
      healthy++;
    }

    daysOfStock.push({
      codigo_ml: item.codigo_ml,
      titulo: item.titulo,
      days: Math.round(daysRemaining),
      status,
    });
  }

  // Sort by days remaining (critical first)
  daysOfStock.sort((a, b) => a.days - b.days);

  return {
    healthy,
    warning,
    critical,
    outOfStock,
    overstocked,
    daysOfStock: daysOfStock.slice(0, 50),
  };
}
