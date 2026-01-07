'use client';

import { useEffect, useState } from 'react';
import {
  Package, AlertTriangle, TrendingUp, DollarSign, ShoppingCart,
  RefreshCw, ExternalLink, BarChart3, PieChart, Users, Mail,
  Upload, FileSpreadsheet, Activity, Target, Boxes, Rocket,
  MessageSquare, Headphones, Bot, Clock, LineChart, Brain,
  Calendar, ArrowUpRight, ArrowDownRight, Moon, Sun
} from 'lucide-react';
import { StockStatusIndicator } from '@/components/ui/TrafficLight';
import {
  ChannelDistributionChart,
  StockDistributionChart,
  TopProductsChart,
  ProfitabilityChart
} from '@/components/charts/SalesChart';
import { CostUploader } from '@/components/CostUploader';

interface Stats {
  products: { total: number; stock_total: number; critical_count: number };
  orders: { total_30d: number; revenue_sampled: number; paid_rate: number };
  thresholds: { stock_alert: number };
  generated_at: string;
}

interface Alert {
  id: string;
  title: string;
  sku: string | null;
  stock: number;
  price: number;
  permalink: string;
  thumbnail: string;
}

interface ParetoProduct {
  codigo_ml: string;
  titulo: string;
  ventas_30d: number;
  stock: number;
  proveedor: string;
  logistic_type?: string;
  status?: 'healthy' | 'warning' | 'critical' | 'out_of_stock' | 'overstocked';
  precio?: number;
  costo?: number;
  comision?: number;
  utilidad?: number;
  utilidad_30d?: number;
  roi?: number;
  margen?: number;
}

interface InventoryData {
  summary: {
    stock_total: number;
    valorizacion_total: number;
    ventas_30d_total: number;
  };
  pareto: {
    top_20_percent_contributes: number;
    total_sales: number;
    total_utilidad_top20?: number;
    total_utilidad?: number;
    total_products_with_sales?: number;
    // 3 pestañas de Pareto
    by_sales?: {
      title: string;
      description: string;
      contribution_percent: number;
      products_count: number;
      total_sales: number;
      top_products: Array<ParetoProduct>;
    };
    by_utilidad?: {
      title: string;
      description: string;
      contribution_percent: number;
      products_count: number;
      total_utilidad: number;
      top_products: Array<ParetoProduct>;
    };
    by_roi?: {
      title: string;
      description: string;
      avg_roi: number;
      products_count: number;
      top_products: Array<ParetoProduct>;
    };
    // Retrocompatibilidad
    top_products: Array<ParetoProduct>;
  };
  tickets: {
    avg_ticket: number;
    min_ticket: number;
    max_ticket: number;
    distribution: Array<{ range: string; count: number; percentage: number }>;
  };
  stock_health: {
    healthy: number;
    warning: number;
    critical: number;
    out_of_stock: number;
    overstocked: number;
    critical_items: Array<{ codigo_ml: string; titulo: string; days: number; stock: number; ventas_30d: number; status: string }>;
    all_products?: Array<{
      codigo_ml: string;
      titulo: string;
      stock: number;
      ventas_30d: number;
      days: number;
      status: 'healthy' | 'warning' | 'critical' | 'out_of_stock' | 'overstocked';
      price: number;
      valorizacion: number;
      proveedor: string;
      logistic_type: string;
      costo: number;
    }>;
  };
  logistics_distribution?: {
    flex: { name: string; productos: number; stock_total: number; ventas_30d: number; valorizacion: number; necesita_reposicion: number };
    full: { name: string; productos: number; stock_total: number; ventas_30d: number; valorizacion: number; necesita_reposicion: number };
    other: { name: string; productos: number; stock_total: number; ventas_30d: number; valorizacion: number };
    products_to_restock: {
      flex: Array<{ codigo_ml: string; titulo: string; stock: number; ventas_30d: number; sugerido_reponer: number; proveedor: string }>;
      full: Array<{ codigo_ml: string; titulo: string; stock: number; ventas_30d: number; sugerido_reponer: number; proveedor: string }>;
    };
  };
  suppliers: Array<{
    proveedor: string;
    productos: number;
    stock_total: number;
    valorizacion: number;
    ventas_30d: number;
  }>;
  profitability: {
    avg_margin: number;
    total_utilidad_30d?: number;
    productos_con_costo?: number;
    productos_sin_costo?: number;
    top_profitable: Array<{
      codigo_ml: string;
      titulo: string;
      precio: number;
      costo: number;
      comision?: number;
      envio?: number;
      utilidad: number;
      rentabilidad: number;
      utilidad_30d?: number;
      ventas_30d?: number;
    }>;
    negative_margin: Array<{
      codigo_ml: string;
      titulo: string;
      precio?: number;
      costo?: number;
      utilidad?: number;
      rentabilidad: number;
    }>;
  };
}

interface ProjectionsData {
  historical: Array<{
    date: string;
    dayName: string;
    dayOfWeek: number;
    revenue: number;
    orders_count: number;
    units_sold: number;
    utilidad?: number;
  }>;
  projections: Array<{
    date: string;
    dayName: string;
    dayOfWeek: number;
    revenue_forecast: number;
    revenue_lower: number;
    revenue_upper: number;
    orders_forecast: number;
    units_forecast: number;
    utilidad_forecast?: number;
    roi_forecast?: number;
  }>;
  combined_series: Array<{
    date: string;
    dayName: string;
    revenue: number | null;
    revenue_forecast: number | null;
    revenue_lower: number | null;
    revenue_upper: number | null;
    utilidad?: number | null;
    utilidad_forecast?: number | null;
    is_projection: boolean;
  }>;
  insights: string[];
  seasonality: Record<number, number>;
  regression: {
    slope: number;
    intercept: number;
    r2: number;
    daily_trend: number;
    monthly_growth_pct: number;
  };
  model_quality?: {
    mape: number;
    mape_interpretation: string;
    cv: number;
    r2: number;
    r2_note: string;
  };
  methodology?: {
    model: string;
    description: string;
    components: string[];
    metrics_explained: {
      MAPE: string;
      CV: string;
      R2: string;
    };
  };
  summary: {
    historical_days: number;
    days_with_sales: number;
    forecast_days: number;
    total_historical_revenue: number;
    total_projected_revenue: number;
    avg_daily_revenue: number;
    model: string;
    generated_at: string;
  };
  financial?: {
    avg_cost_ratio: number;
    avg_margin: number;
    historical_utilidad: number;
    projected_utilidad_30d: number;
    roi_estimado: number;
    nota: string;
  };
}

type TabType = 'overview' | 'inventory' | 'pareto' | 'costs' | 'alerts' | 'projections' | 'monitor' | 'coming-soon';

// Tipos para Monitor Mensual
interface MonthlyMonitorData {
  period: {
    month: string;
    start_date: string;
    end_date: string;
    days_count: number;
  };
  summary: {
    total_ventas: number;
    total_facturacion: number;
    total_comisiones: number;
    total_costos_envio: number;
    total_ingreso_neto: number;
    total_costo_productos: number;
    total_utilidad: number;
    roi_promedio: number;
    rentabilidad: number;
  };
  daily: Array<{
    date: string;
    ventas_count: number;
    facturacion: number;
    comisiones: number;
    costos_envio: number;
    ingreso_neto: number;
    costo_productos: number;
    utilidad: number;
  }>;
  by_provider: Array<{
    proveedor: string;
    facturacion: number;
    ingreso_neto: number;
    utilidad: number;
    ventas_count: number;
    rentabilidad: number;
  }>;
}

// Componente ParetoSection con 3 sub-pestañas
function ParetoSection({ pareto }: { pareto: InventoryData['pareto'] }) {
  const [subTab, setSubTab] = useState<'ventas' | 'utilidad' | 'roi'>('ventas');

  // Función para renderizar la tabla de productos
  const renderProductsTable = (products: ParetoProduct[], highlightColumn: 'ventas' | 'utilidad' | 'roi') => (
    <div className="overflow-x-auto">
      <table className="min-w-full divide-y divide-gray-200">
        <thead className="bg-gray-50">
          <tr>
            <th className="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">#</th>
            <th className="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
            <th className="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">Proveedor</th>
            <th className="px-3 py-3 text-right text-xs font-medium text-gray-500 uppercase">Precio</th>
            <th className="px-3 py-3 text-right text-xs font-medium text-gray-500 uppercase">Costo</th>
            <th className={`px-3 py-3 text-right text-xs font-medium uppercase ${highlightColumn === 'ventas' ? 'text-blue-600 bg-blue-50' : 'text-gray-500'}`}>Ventas</th>
            <th className={`px-3 py-3 text-right text-xs font-medium uppercase ${highlightColumn === 'utilidad' ? 'text-green-600 bg-green-50' : 'text-gray-500'}`}>Utilidad 30D</th>
            <th className={`px-3 py-3 text-right text-xs font-medium uppercase ${highlightColumn === 'roi' ? 'text-purple-600 bg-purple-50' : 'text-gray-500'}`}>ROI</th>
            <th className="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">Estado</th>
          </tr>
        </thead>
        <tbody className="bg-white divide-y divide-gray-200">
          {products.map((p, i) => (
            <tr key={i} className="hover:bg-gray-50">
              <td className="px-3 py-3 text-sm font-bold text-blue-600">{i + 1}</td>
              <td className="px-3 py-3">
                <p className="text-sm font-medium text-gray-900 truncate max-w-[180px]">{p.titulo}</p>
                <p className="text-xs text-gray-500">{p.codigo_ml}</p>
              </td>
              <td className="px-3 py-3 text-xs text-gray-600">{p.proveedor || 'Sin asignar'}</td>
              <td className="px-3 py-3 text-right text-sm text-gray-900">
                ${p.precio?.toLocaleString() || '---'}
              </td>
              <td className="px-3 py-3 text-right text-sm">
                {p.costo && p.costo > 0 ? (
                  <span className="text-gray-600">${p.costo.toLocaleString()}</span>
                ) : (
                  <span className="text-orange-500 text-xs">Sin costo</span>
                )}
              </td>
              <td className={`px-3 py-3 text-right font-medium ${highlightColumn === 'ventas' ? 'text-blue-700 bg-blue-50' : 'text-gray-900'}`}>
                {p.ventas_30d}
              </td>
              <td className={`px-3 py-3 text-right ${highlightColumn === 'utilidad' ? 'bg-green-50' : ''}`}>
                {p.utilidad_30d && p.utilidad_30d > 0 ? (
                  <span className="text-green-600 font-bold">${(p.utilidad_30d / 1000).toFixed(0)}K</span>
                ) : p.utilidad_30d && p.utilidad_30d < 0 ? (
                  <span className="text-red-600 font-bold">-${Math.abs(p.utilidad_30d / 1000).toFixed(0)}K</span>
                ) : (
                  <span className="text-gray-400">---</span>
                )}
              </td>
              <td className={`px-3 py-3 text-right ${highlightColumn === 'roi' ? 'bg-purple-50' : ''}`}>
                {p.roi && p.roi > 0 ? (
                  <span className={`font-medium ${p.roi >= 30 ? 'text-green-600' : p.roi >= 15 ? 'text-purple-600' : 'text-gray-600'}`}>
                    {p.roi}%
                  </span>
                ) : p.roi && p.roi < 0 ? (
                  <span className="text-red-600 font-medium">{p.roi}%</span>
                ) : (
                  <span className="text-gray-400">---</span>
                )}
              </td>
              <td className="px-3 py-3 text-center">
                <StockStatusIndicator stock={p.stock} ventas30d={p.ventas_30d} statusOverride={p.status} />
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );

  return (
    <div className="space-y-6">
      {/* Pareto Summary */}
      <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-xl p-6 text-white">
        <h3 className="text-xl font-bold mb-2">Análisis Pareto 80/20</h3>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mt-4">
          <div className="bg-white/10 rounded-lg p-4">
            <p className="text-blue-200 text-sm">Contribución Top 20%</p>
            <p className="text-3xl font-bold">{pareto.top_20_percent_contributes}%</p>
            <p className="text-blue-200 text-xs">de las ventas totales</p>
          </div>
          <div className="bg-white/10 rounded-lg p-4">
            <p className="text-blue-200 text-sm">Ventas 30 días</p>
            <p className="text-3xl font-bold">{pareto.total_sales.toLocaleString()}</p>
            <p className="text-blue-200 text-xs">unidades vendidas</p>
          </div>
          <div className="bg-white/10 rounded-lg p-4">
            <p className="text-blue-200 text-sm">Utilidad Total</p>
            <p className="text-3xl font-bold text-green-300">
              ${pareto.total_utilidad ? (pareto.total_utilidad / 1000).toFixed(0) + 'K' : '---'}
            </p>
            <p className="text-blue-200 text-xs">ganancia estimada</p>
          </div>
        </div>
      </div>

      {/* Sub-tabs para las 3 vistas */}
      <div className="bg-white rounded-xl shadow-sm overflow-hidden">
        <div className="px-6 py-4 border-b">
          <div className="flex items-center justify-between">
            <h3 className="text-lg font-semibold flex items-center gap-2">
              <Target className="w-5 h-5 text-blue-600" />
              Análisis por Criterio
            </h3>
            <div className="flex gap-2">
              <button
                onClick={() => setSubTab('ventas')}
                className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                  subTab === 'ventas'
                    ? 'bg-blue-600 text-white'
                    : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                }`}
              >
                Por Ventas
              </button>
              <button
                onClick={() => setSubTab('utilidad')}
                className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                  subTab === 'utilidad'
                    ? 'bg-green-600 text-white'
                    : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                }`}
              >
                Por Utilidad
              </button>
              <button
                onClick={() => setSubTab('roi')}
                className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors ${
                  subTab === 'roi'
                    ? 'bg-purple-600 text-white'
                    : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                }`}
              >
                Por ROI
              </button>
            </div>
          </div>

          {/* Descripción de la pestaña activa */}
          <div className="mt-3 text-sm text-gray-500">
            {subTab === 'ventas' && pareto.by_sales && (
              <p>{pareto.by_sales.description} - <strong>{pareto.by_sales.products_count} productos</strong> generan el {pareto.by_sales.contribution_percent}% de las ventas</p>
            )}
            {subTab === 'utilidad' && pareto.by_utilidad && (
              <p>{pareto.by_utilidad.description} - <strong>{pareto.by_utilidad.products_count} productos</strong> generan el {pareto.by_utilidad.contribution_percent}% de la utilidad</p>
            )}
            {subTab === 'roi' && pareto.by_roi && (
              <p>{pareto.by_roi.description} - ROI promedio: <strong>{pareto.by_roi.avg_roi}%</strong></p>
            )}
          </div>
        </div>

        {/* Contenido de cada sub-tab */}
        {subTab === 'ventas' && pareto.by_sales && renderProductsTable(pareto.by_sales.top_products, 'ventas')}
        {subTab === 'utilidad' && pareto.by_utilidad && renderProductsTable(pareto.by_utilidad.top_products, 'utilidad')}
        {subTab === 'roi' && pareto.by_roi && renderProductsTable(pareto.by_roi.top_products, 'roi')}

        {/* Fallback si no hay datos de las nuevas pestañas */}
        {!pareto.by_sales && !pareto.by_utilidad && !pareto.by_roi && renderProductsTable(pareto.top_products, 'ventas')}
      </div>
    </div>
  );
}

export default function Dashboard() {
  const [activeTab, setActiveTab] = useState<TabType>('overview');
  const [stats, setStats] = useState<Stats | null>(null);
  const [alerts, setAlerts] = useState<{ summary: { total: number; urgent: number; warning: number; low: number }; products: Alert[] } | null>(null);
  const [inventory, setInventory] = useState<InventoryData | null>(null);
  const [projections, setProjections] = useState<ProjectionsData | null>(null);
  const [projectionsLoading, setProjectionsLoading] = useState(false);
  const [monthlyMonitor, setMonthlyMonitor] = useState<MonthlyMonitorData | null>(null);
  const [monitorLoading, setMonitorLoading] = useState(false);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [refreshing, setRefreshing] = useState(false);
  const [sendingAlerts, setSendingAlerts] = useState(false);
  const [darkMode, setDarkMode] = useState(false);

  // Filtros de inventario
  const [inventoryProveedorFilter, setInventoryProveedorFilter] = useState<string>('all');
  const [inventoryStatusFilter, setInventoryStatusFilter] = useState<string>('all');
  const [inventoryGroupByProveedor, setInventoryGroupByProveedor] = useState(false);

  // Initialize dark mode from localStorage
  useEffect(() => {
    const saved = localStorage.getItem('darkMode');
    if (saved === 'true') {
      setDarkMode(true);
      document.documentElement.classList.add('dark');
    }
  }, []);

  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
    if (!darkMode) {
      document.documentElement.classList.add('dark');
      localStorage.setItem('darkMode', 'true');
    } else {
      document.documentElement.classList.remove('dark');
      localStorage.setItem('darkMode', 'false');
    }
  };

  const fetchData = async () => {
    try {
      setRefreshing(true);
      const [statsRes, alertsRes, inventoryRes] = await Promise.all([
        fetch('/api/stats'),
        fetch('/api/alerts'),
        fetch('/api/inventory?analysis=full').catch(() => null)
      ]);

      if (!statsRes.ok || !alertsRes.ok) throw new Error('Error al cargar datos');

      const [statsData, alertsData] = await Promise.all([
        statsRes.json(),
        alertsRes.json()
      ]);

      setStats(statsData);
      setAlerts(alertsData);

      if (inventoryRes?.ok) {
        const inventoryData = await inventoryRes.json();
        setInventory(inventoryData);
      }

      setError(null);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Error desconocido');
    } finally {
      setLoading(false);
      setRefreshing(false);
    }
  };

  const sendEmailAlerts = async () => {
    setSendingAlerts(true);
    try {
      const res = await fetch('/api/webhook/send-alerts', { method: 'POST' });
      const data = await res.json();
      if (data.success) {
        alert(`Alertas enviadas: ${data.summary.total} productos notificados`);
      }
    } catch (err) {
      alert('Error enviando alertas');
    } finally {
      setSendingAlerts(false);
    }
  };

  const fetchProjections = async () => {
    if (projections) return; // Already loaded
    setProjectionsLoading(true);
    try {
      const res = await fetch('/api/projections?historical=365&forecast=30');
      if (res.ok) {
        const data = await res.json();
        setProjections(data);
      }
    } catch (err) {
      console.error('Error loading projections:', err);
    } finally {
      setProjectionsLoading(false);
    }
  };

  const fetchMonthlyMonitor = async () => {
    if (monthlyMonitor) return; // Already loaded
    setMonitorLoading(true);
    try {
      const res = await fetch('/api/monthly-monitor');
      if (res.ok) {
        const data = await res.json();
        setMonthlyMonitor(data);
      }
    } catch (err) {
      console.error('Error loading monthly monitor:', err);
    } finally {
      setMonitorLoading(false);
    }
  };

  useEffect(() => { fetchData(); }, []);

  useEffect(() => {
    if (activeTab === 'projections' && !projections && !projectionsLoading) {
      fetchProjections();
    }
    if (activeTab === 'monitor' && !monthlyMonitor && !monitorLoading) {
      fetchMonthlyMonitor();
    }
  }, [activeTab]);

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <RefreshCw className="w-12 h-12 animate-spin text-blue-600 mx-auto mb-4" />
          <p className="text-gray-600">Cargando datos...</p>
        </div>
      </div>
    );
  }

  const tabs = [
    { id: 'overview', label: 'Resumen', icon: Activity },
    { id: 'inventory', label: 'Inventario', icon: Boxes },
    { id: 'pareto', label: 'Pareto 80/20', icon: Target },
    { id: 'costs', label: 'Costos', icon: FileSpreadsheet },
    { id: 'alerts', label: 'Alertas', icon: AlertTriangle },
    { id: 'projections', label: 'Proyecciones', icon: LineChart },
    { id: 'monitor', label: 'Monitor', icon: BarChart3 },
    { id: 'coming-soon', label: 'Próximamente', icon: Rocket },
  ];

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white shadow-sm sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-4 py-4">
          <div className="flex justify-between items-center">
            <div>
              <h1 className="text-2xl font-bold text-gray-900">BAZAR Importaciones</h1>
              <p className="text-sm text-gray-500">Gestor de Inventario - Mercado Libre Chile</p>
            </div>
            <div className="flex gap-2">
              <button
                onClick={toggleDarkMode}
                className="flex items-center gap-2 bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-200 px-3 py-2 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600 transition-colors"
                title={darkMode ? 'Modo claro' : 'Modo oscuro'}
              >
                {darkMode ? <Sun className="w-5 h-5" /> : <Moon className="w-5 h-5" />}
              </button>
              <button
                onClick={sendEmailAlerts}
                disabled={sendingAlerts}
                className="flex items-center gap-2 bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 disabled:opacity-50"
              >
                <Mail className={`w-4 h-4 ${sendingAlerts ? 'animate-pulse' : ''}`} />
                Enviar Alertas
              </button>
              <button
                onClick={fetchData}
                disabled={refreshing}
                className="flex items-center gap-2 bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 disabled:opacity-50"
              >
                <RefreshCw className={`w-4 h-4 ${refreshing ? 'animate-spin' : ''}`} />
                Actualizar
              </button>
            </div>
          </div>

          {/* Tabs */}
          <div className="flex gap-1 mt-4 overflow-x-auto">
            {tabs.map(tab => (
              <button
                key={tab.id}
                onClick={() => setActiveTab(tab.id as TabType)}
                className={`flex items-center gap-2 px-4 py-2 rounded-t-lg font-medium transition-colors ${
                  activeTab === tab.id
                    ? 'bg-blue-600 text-white'
                    : 'bg-gray-100 text-gray-600 hover:bg-gray-200'
                }`}
              >
                <tab.icon className="w-4 h-4" />
                {tab.label}
              </button>
            ))}
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 py-6">
        {error && (
          <div className="mb-4 p-4 bg-red-50 border border-red-200 rounded-lg text-red-700">
            {error}
          </div>
        )}

        {/* Overview Tab */}
        {activeTab === 'overview' && (
          <div className="space-y-6">
            {/* KPI Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
              <KPICard
                title="Productos Activos"
                value={stats?.products.total || 0}
                subtitle={`Stock: ${inventory?.summary?.stock_total?.toLocaleString() || 0} uds`}
                icon={Package}
                color="blue"
              />
              <KPICard
                title="Stock Crítico"
                value={alerts?.summary.total || 0}
                subtitle={`${alerts?.summary.urgent || 0} urgentes`}
                icon={AlertTriangle}
                color="red"
              />
              <KPICard
                title="Ventas 30 días"
                value={inventory?.summary?.ventas_30d_total?.toLocaleString() || stats?.orders.total_30d || 0}
                subtitle="unidades vendidas"
                icon={ShoppingCart}
                color="green"
              />
              <KPICard
                title="Valorización"
                value={`$${(inventory?.summary?.valorizacion_total || 0).toLocaleString()}`}
                subtitle="CLP en inventario"
                icon={DollarSign}
                color="yellow"
              />
            </div>

            {/* Charts Row */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {/* Stock Distribution */}
              <div className="bg-white rounded-xl shadow-sm p-6">
                <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                  <BarChart3 className="w-5 h-5 text-blue-600" />
                  Distribución de Stock
                </h3>
                {inventory?.stock_health && (
                  <StockDistributionChart
                    data={{
                      critical: inventory.stock_health.critical,
                      warning: inventory.stock_health.warning,
                      low: inventory.stock_health.out_of_stock,
                      normal: inventory.stock_health.healthy,
                    }}
                  />
                )}
              </div>

              {/* Ticket Distribution */}
              <div className="bg-white rounded-xl shadow-sm p-6">
                <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                  <PieChart className="w-5 h-5 text-green-600" />
                  Distribución de Precios
                </h3>
                {inventory?.tickets && (
                  <div className="space-y-4">
                    <div className="grid grid-cols-3 gap-4 text-center">
                      <div>
                        <p className="text-2xl font-bold text-gray-900">${inventory.tickets.avg_ticket.toLocaleString()}</p>
                        <p className="text-sm text-gray-500">Ticket Promedio</p>
                      </div>
                      <div>
                        <p className="text-2xl font-bold text-gray-900">${inventory.tickets.min_ticket.toLocaleString()}</p>
                        <p className="text-sm text-gray-500">Mínimo</p>
                      </div>
                      <div>
                        <p className="text-2xl font-bold text-gray-900">${inventory.tickets.max_ticket.toLocaleString()}</p>
                        <p className="text-sm text-gray-500">Máximo</p>
                      </div>
                    </div>
                    <div className="space-y-2">
                      {inventory.tickets.distribution.map((d, i) => (
                        <div key={i} className="flex items-center gap-2">
                          <span className="w-32 text-sm text-gray-600">{d.range}</span>
                          <div className="flex-1 bg-gray-200 rounded-full h-4">
                            <div
                              className="bg-blue-500 h-4 rounded-full"
                              style={{ width: `${Math.min(d.percentage, 100)}%` }}
                            />
                          </div>
                          <span className="w-16 text-sm text-gray-600 text-right">{d.count}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </div>
            </div>

            {/* Suppliers Table */}
            {inventory?.suppliers && (
              <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                <div className="px-6 py-4 border-b">
                  <h3 className="text-lg font-semibold flex items-center gap-2">
                    <Users className="w-5 h-5 text-purple-600" />
                    Proveedores
                  </h3>
                </div>
                <div className="overflow-x-auto">
                  <table className="min-w-full divide-y divide-gray-200">
                    <thead className="bg-gray-50">
                      <tr>
                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Proveedor</th>
                        <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Productos</th>
                        <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Stock</th>
                        <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Valorización</th>
                        <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Ventas 30d</th>
                      </tr>
                    </thead>
                    <tbody className="bg-white divide-y divide-gray-200">
                      {inventory.suppliers.slice(0, 10).map((s, i) => (
                        <tr key={i} className="hover:bg-gray-50">
                          <td className="px-6 py-4 font-medium text-gray-900">{s.proveedor}</td>
                          <td className="px-6 py-4 text-right text-gray-600">{s.productos}</td>
                          <td className="px-6 py-4 text-right text-gray-600">{s.stock_total.toLocaleString()}</td>
                          <td className="px-6 py-4 text-right text-gray-900">${s.valorizacion.toLocaleString()}</td>
                          <td className="px-6 py-4 text-right text-gray-600">{s.ventas_30d}</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            )}
          </div>
        )}

        {/* Inventory Tab */}
        {activeTab === 'inventory' && inventory?.stock_health && (
          <div className="space-y-6">
            {/* Explicación del Criterio */}
            <div className="bg-blue-50 border border-blue-200 rounded-xl p-4">
              <h4 className="font-semibold text-blue-800 mb-2">Criterio de Salud de Stock</h4>
              <p className="text-sm text-blue-700">
                <strong>Saludable:</strong> Stock mayor o igual a Ventas30D (cubre el próximo mes) |
                <strong> Alerta:</strong> Stock entre 50%-100% de Ventas30D |
                <strong> Crítico:</strong> Stock menor a 50% de Ventas30D
              </p>
            </div>

            {/* Stock Health Cards */}
            <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
              <HealthCard title="Saludable" value={inventory.stock_health.healthy} color="green" />
              <HealthCard title="Alerta" value={inventory.stock_health.warning} color="yellow" />
              <HealthCard title="Crítico" value={inventory.stock_health.critical} color="red" />
              <HealthCard title="Sin Stock" value={inventory.stock_health.out_of_stock} color="gray" />
              <HealthCard title="Sobrestock" value={inventory.stock_health.overstocked} color="purple" />
            </div>

            {/* Distribución FLEX vs FULL */}
            {inventory.logistics_distribution && (
              <div className="bg-white rounded-xl shadow-sm p-6">
                <h3 className="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
                  <Boxes className="w-5 h-5 text-indigo-600" />
                  Distribución por Modalidad de Envío
                </h3>
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                  {/* FLEX Card */}
                  <div className="bg-gradient-to-br from-blue-50 to-blue-100 rounded-lg p-4 border border-blue-200">
                    <h4 className="font-semibold text-blue-800">{inventory.logistics_distribution.flex.name}</h4>
                    <div className="mt-2 space-y-1 text-sm">
                      <p className="text-blue-700">Productos: <span className="font-bold">{inventory.logistics_distribution.flex.productos}</span></p>
                      <p className="text-blue-700">Stock: <span className="font-bold">{inventory.logistics_distribution.flex.stock_total.toLocaleString()}</span></p>
                      <p className="text-blue-700">Ventas 30D: <span className="font-bold">{inventory.logistics_distribution.flex.ventas_30d}</span></p>
                      <p className="text-blue-700">Valorización: <span className="font-bold">${inventory.logistics_distribution.flex.valorizacion.toLocaleString()}</span></p>
                      {inventory.logistics_distribution.flex.necesita_reposicion > 0 && (
                        <p className="text-red-600 font-semibold mt-2">
                          Reponer: {inventory.logistics_distribution.flex.necesita_reposicion} productos
                        </p>
                      )}
                    </div>
                  </div>
                  {/* FULL Card */}
                  <div className="bg-gradient-to-br from-green-50 to-green-100 rounded-lg p-4 border border-green-200">
                    <h4 className="font-semibold text-green-800">{inventory.logistics_distribution.full.name}</h4>
                    <div className="mt-2 space-y-1 text-sm">
                      <p className="text-green-700">Productos: <span className="font-bold">{inventory.logistics_distribution.full.productos}</span></p>
                      <p className="text-green-700">Stock: <span className="font-bold">{inventory.logistics_distribution.full.stock_total.toLocaleString()}</span></p>
                      <p className="text-green-700">Ventas 30D: <span className="font-bold">{inventory.logistics_distribution.full.ventas_30d}</span></p>
                      <p className="text-green-700">Valorización: <span className="font-bold">${inventory.logistics_distribution.full.valorizacion.toLocaleString()}</span></p>
                      {inventory.logistics_distribution.full.necesita_reposicion > 0 && (
                        <p className="text-red-600 font-semibold mt-2">
                          Reponer: {inventory.logistics_distribution.full.necesita_reposicion} productos
                        </p>
                      )}
                    </div>
                  </div>
                  {/* Otros Card */}
                  <div className="bg-gradient-to-br from-gray-50 to-gray-100 rounded-lg p-4 border border-gray-200">
                    <h4 className="font-semibold text-gray-800">{inventory.logistics_distribution.other.name}</h4>
                    <div className="mt-2 space-y-1 text-sm">
                      <p className="text-gray-700">Productos: <span className="font-bold">{inventory.logistics_distribution.other.productos}</span></p>
                      <p className="text-gray-700">Stock: <span className="font-bold">{inventory.logistics_distribution.other.stock_total.toLocaleString()}</span></p>
                      <p className="text-gray-700">Ventas 30D: <span className="font-bold">{inventory.logistics_distribution.other.ventas_30d}</span></p>
                      <p className="text-gray-700">Valorización: <span className="font-bold">${inventory.logistics_distribution.other.valorizacion.toLocaleString()}</span></p>
                    </div>
                  </div>
                </div>
              </div>
            )}

            {/* TODOS los productos */}
            {(() => {
              // Lista de proveedores únicos
              const proveedores = [...new Set((inventory.stock_health.all_products || []).map(p => p.proveedor || 'Sin asignar'))].sort();

              // Filtrar productos
              const filteredProducts = (inventory.stock_health.all_products || []).filter(item => {
                const matchProveedor = inventoryProveedorFilter === 'all' || (item.proveedor || 'Sin asignar') === inventoryProveedorFilter;
                const matchStatus = inventoryStatusFilter === 'all' || item.status === inventoryStatusFilter;
                return matchProveedor && matchStatus;
              });

              // Calcular totales de los filtrados
              const filteredTotals = filteredProducts.reduce((acc, item) => ({
                productos: acc.productos + 1,
                stock: acc.stock + item.stock,
                ventas: acc.ventas + item.ventas_30d,
                valorizacion: acc.valorizacion + (item.valorizacion || 0)
              }), { productos: 0, stock: 0, ventas: 0, valorizacion: 0 });

              // Agrupar por proveedor si está activo
              const groupedByProveedor = inventoryGroupByProveedor
                ? proveedores.map(prov => ({
                    proveedor: prov,
                    products: filteredProducts.filter(p => (p.proveedor || 'Sin asignar') === prov),
                    totals: filteredProducts.filter(p => (p.proveedor || 'Sin asignar') === prov).reduce((acc, item) => ({
                      stock: acc.stock + item.stock,
                      ventas: acc.ventas + item.ventas_30d,
                      valorizacion: acc.valorizacion + (item.valorizacion || 0)
                    }), { stock: 0, ventas: 0, valorizacion: 0 })
                  })).filter(g => g.products.length > 0)
                : null;

              return (
            <div className="bg-white rounded-xl shadow-sm overflow-hidden">
              <div className="px-6 py-4 border-b">
                <h3 className="text-lg font-semibold text-gray-800 flex items-center gap-2">
                  <Boxes className="w-5 h-5 text-blue-600" />
                  Todos los Productos ({filteredProducts.length}{filteredProducts.length !== (inventory.stock_health.all_products?.length || 0) ? ` de ${inventory.stock_health.all_products?.length}` : ''})
                </h3>
                <p className="text-sm text-gray-500 mt-1">
                  Ordenados por estado de urgencia (críticos primero). Incluye proveedor y valorización.
                </p>

                {/* Filtros */}
                <div className="mt-4 flex flex-wrap gap-4 items-center">
                  {/* Filtro por Proveedor */}
                  <div className="flex items-center gap-2">
                    <label className="text-sm font-medium text-gray-700">Proveedor:</label>
                    <select
                      value={inventoryProveedorFilter}
                      onChange={(e) => setInventoryProveedorFilter(e.target.value)}
                      className="border border-gray-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    >
                      <option value="all">Todos</option>
                      {proveedores.map(prov => (
                        <option key={prov} value={prov}>{prov}</option>
                      ))}
                    </select>
                  </div>

                  {/* Filtro por Estado */}
                  <div className="flex items-center gap-2">
                    <label className="text-sm font-medium text-gray-700">Estado:</label>
                    <select
                      value={inventoryStatusFilter}
                      onChange={(e) => setInventoryStatusFilter(e.target.value)}
                      className="border border-gray-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    >
                      <option value="all">Todos</option>
                      <option value="critical">Crítico</option>
                      <option value="warning">Alerta</option>
                      <option value="healthy">Saludable</option>
                      <option value="out_of_stock">Sin Stock</option>
                      <option value="overstocked">Sobrestock</option>
                    </select>
                  </div>

                  {/* Toggle Agrupar por Proveedor */}
                  <div className="flex items-center gap-2">
                    <label className="text-sm font-medium text-gray-700">Agrupar por Proveedor:</label>
                    <button
                      onClick={() => setInventoryGroupByProveedor(!inventoryGroupByProveedor)}
                      className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
                        inventoryGroupByProveedor
                          ? 'bg-blue-600 text-white'
                          : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
                      }`}
                    >
                      {inventoryGroupByProveedor ? 'Activado' : 'Desactivado'}
                    </button>
                  </div>

                  {/* Limpiar filtros */}
                  {(inventoryProveedorFilter !== 'all' || inventoryStatusFilter !== 'all') && (
                    <button
                      onClick={() => {
                        setInventoryProveedorFilter('all');
                        setInventoryStatusFilter('all');
                      }}
                      className="text-sm text-blue-600 hover:text-blue-800 underline"
                    >
                      Limpiar filtros
                    </button>
                  )}
                </div>

                {/* Totales de filtrado */}
                {(inventoryProveedorFilter !== 'all' || inventoryStatusFilter !== 'all') && (
                  <div className="mt-4 p-3 bg-blue-50 rounded-lg border border-blue-200">
                    <p className="text-sm font-medium text-blue-800">
                      Totales filtrados: {filteredTotals.productos} productos | Stock: {filteredTotals.stock.toLocaleString()} | Ventas 30D: {filteredTotals.ventas.toLocaleString()} | Valorización: ${filteredTotals.valorizacion.toLocaleString()}
                    </p>
                  </div>
                )}
              </div>

              {/* Vista agrupada por proveedor */}
              {inventoryGroupByProveedor && groupedByProveedor ? (
                <div className="divide-y divide-gray-200">
                  {groupedByProveedor.map((group, gi) => (
                    <div key={gi} className="p-4">
                      <div className="flex items-center justify-between mb-3 bg-gray-100 rounded-lg p-3">
                        <h4 className="font-semibold text-gray-800 flex items-center gap-2">
                          <Users className="w-4 h-4 text-indigo-600" />
                          {group.proveedor} ({group.products.length} productos)
                        </h4>
                        <div className="flex gap-4 text-sm text-gray-600">
                          <span>Stock: <strong>{group.totals.stock.toLocaleString()}</strong></span>
                          <span>Ventas 30D: <strong>{group.totals.ventas.toLocaleString()}</strong></span>
                          <span>Valor: <strong>${group.totals.valorizacion.toLocaleString()}</strong></span>
                        </div>
                      </div>
                      <div className="overflow-x-auto">
                        <table className="min-w-full divide-y divide-gray-200">
                          <thead className="bg-gray-50">
                            <tr>
                              <th className="px-3 py-2 text-left text-xs font-medium text-gray-500 uppercase">Código</th>
                              <th className="px-3 py-2 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                              <th className="px-3 py-2 text-center text-xs font-medium text-gray-500 uppercase">Tipo</th>
                              <th className="px-3 py-2 text-center text-xs font-medium text-gray-500 uppercase">Stock</th>
                              <th className="px-3 py-2 text-center text-xs font-medium text-gray-500 uppercase">Ventas 30D</th>
                              <th className="px-3 py-2 text-center text-xs font-medium text-gray-500 uppercase">Días</th>
                              <th className="px-3 py-2 text-right text-xs font-medium text-gray-500 uppercase">Precio</th>
                              <th className="px-3 py-2 text-right text-xs font-medium text-gray-500 uppercase">Valorización</th>
                              <th className="px-3 py-2 text-center text-xs font-medium text-gray-500 uppercase">Estado</th>
                            </tr>
                          </thead>
                          <tbody className="bg-white divide-y divide-gray-200">
                            {group.products.map((item, i) => (
                              <tr key={i} className={`hover:bg-gray-50 ${
                                item.status === 'critical' ? 'bg-red-50' :
                                item.status === 'warning' ? 'bg-yellow-50' :
                                item.status === 'out_of_stock' ? 'bg-gray-100' : ''
                              }`}>
                                <td className="px-3 py-2 text-xs text-gray-500 font-mono">{item.codigo_ml}</td>
                                <td className="px-3 py-2 text-sm text-gray-900 max-w-[200px] truncate">{item.titulo}</td>
                                <td className="px-3 py-2 text-center">
                                  <span className={`px-2 py-0.5 rounded text-xs font-medium ${
                                    item.logistic_type === 'self_service' ? 'bg-blue-100 text-blue-800' :
                                    item.logistic_type === 'fulfillment' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-600'
                                  }`}>
                                    {item.logistic_type === 'self_service' ? 'FLEX' : item.logistic_type === 'fulfillment' ? 'FULL' : 'Otro'}
                                  </span>
                                </td>
                                <td className="px-3 py-2 text-center">
                                  <span className={`px-2 py-1 rounded text-sm font-medium ${
                                    item.stock === 0 ? 'bg-gray-200 text-gray-600' :
                                    item.stock < item.ventas_30d * 0.5 ? 'bg-red-100 text-red-800' :
                                    item.stock < item.ventas_30d ? 'bg-yellow-100 text-yellow-800' : 'bg-green-100 text-green-800'
                                  }`}>
                                    {item.stock}
                                  </span>
                                </td>
                                <td className="px-3 py-2 text-center text-sm text-gray-600">{item.ventas_30d}</td>
                                <td className="px-3 py-2 text-center">
                                  <span className={`px-2 py-0.5 rounded text-xs font-medium ${
                                    item.days <= 7 ? 'bg-red-100 text-red-800' :
                                    item.days <= 30 ? 'bg-yellow-100 text-yellow-800' :
                                    item.days > 90 ? 'bg-purple-100 text-purple-800' : 'bg-green-100 text-green-800'
                                  }`}>
                                    {item.days === 999 ? 'Inf' : `${item.days}d`}
                                  </span>
                                </td>
                                <td className="px-3 py-2 text-right text-sm text-gray-900">${item.price.toLocaleString()}</td>
                                <td className="px-3 py-2 text-right text-sm text-gray-600">${item.valorizacion?.toLocaleString() || 0}</td>
                                <td className="px-3 py-2 text-center">
                                  <StockStatusIndicator stock={item.stock} ventas30d={item.ventas_30d} statusOverride={item.status} />
                                </td>
                              </tr>
                            ))}
                          </tbody>
                        </table>
                      </div>
                    </div>
                  ))}
                </div>
              ) : (
              <div className="overflow-x-auto max-h-[600px] overflow-y-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50 sticky top-0">
                    <tr>
                      <th className="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">Código</th>
                      <th className="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                      <th className="px-3 py-3 text-left text-xs font-medium text-gray-500 uppercase">Proveedor</th>
                      <th className="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">Tipo</th>
                      <th className="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">Stock</th>
                      <th className="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">Ventas 30D</th>
                      <th className="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">Días</th>
                      <th className="px-3 py-3 text-right text-xs font-medium text-gray-500 uppercase">Precio</th>
                      <th className="px-3 py-3 text-right text-xs font-medium text-gray-500 uppercase">Valorización</th>
                      <th className="px-3 py-3 text-center text-xs font-medium text-gray-500 uppercase">Estado</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {filteredProducts.map((item, i) => (
                      <tr key={i} className={`hover:bg-gray-50 ${
                        item.status === 'critical' ? 'bg-red-50' :
                        item.status === 'warning' ? 'bg-yellow-50' :
                        item.status === 'out_of_stock' ? 'bg-gray-100' :
                        ''
                      }`}>
                        <td className="px-3 py-2 text-xs text-gray-500 font-mono">{item.codigo_ml}</td>
                        <td className="px-3 py-2 text-sm text-gray-900 max-w-[200px] truncate">{item.titulo}</td>
                        <td className="px-3 py-2 text-xs text-gray-600">{item.proveedor || 'Sin asignar'}</td>
                        <td className="px-3 py-2 text-center">
                          <span className={`px-2 py-0.5 rounded text-xs font-medium ${
                            item.logistic_type === 'self_service' ? 'bg-blue-100 text-blue-800' :
                            item.logistic_type === 'fulfillment' ? 'bg-green-100 text-green-800' :
                            'bg-gray-100 text-gray-600'
                          }`}>
                            {item.logistic_type === 'self_service' ? 'FLEX' :
                             item.logistic_type === 'fulfillment' ? 'FULL' : 'Otro'}
                          </span>
                        </td>
                        <td className="px-3 py-2 text-center">
                          <span className={`px-2 py-1 rounded text-sm font-medium ${
                            item.stock === 0 ? 'bg-gray-200 text-gray-600' :
                            item.stock < item.ventas_30d * 0.5 ? 'bg-red-100 text-red-800' :
                            item.stock < item.ventas_30d ? 'bg-yellow-100 text-yellow-800' :
                            'bg-green-100 text-green-800'
                          }`}>
                            {item.stock}
                          </span>
                        </td>
                        <td className="px-3 py-2 text-center text-sm text-gray-600">{item.ventas_30d}</td>
                        <td className="px-3 py-2 text-center">
                          <span className={`px-2 py-0.5 rounded text-xs font-medium ${
                            item.days <= 7 ? 'bg-red-100 text-red-800' :
                            item.days <= 30 ? 'bg-yellow-100 text-yellow-800' :
                            item.days > 90 ? 'bg-purple-100 text-purple-800' :
                            'bg-green-100 text-green-800'
                          }`}>
                            {item.days === 999 ? 'Inf' : `${item.days}d`}
                          </span>
                        </td>
                        <td className="px-3 py-2 text-right text-sm text-gray-900">
                          ${item.price.toLocaleString()}
                        </td>
                        <td className="px-3 py-2 text-right text-sm text-gray-600">
                          ${item.valorizacion?.toLocaleString() || 0}
                        </td>
                        <td className="px-3 py-2 text-center">
                          <StockStatusIndicator
                            stock={item.stock}
                            ventas30d={item.ventas_30d}
                            statusOverride={item.status}
                          />
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              )}
            </div>
              );
            })()}
          </div>
        )}

        {/* Pareto Tab - Con 3 Sub-pestañas */}
        {activeTab === 'pareto' && inventory?.pareto && (
          <ParetoSection pareto={inventory.pareto} />
        )}

        {/* Costs Tab */}
        {activeTab === 'costs' && (
          <div className="space-y-6">
            {/* Google Sheets Link */}
            <div className="bg-gradient-to-r from-green-600 to-emerald-700 rounded-xl p-6 text-white">
              <div className="flex items-center justify-between">
                <div>
                  <div className="flex items-center gap-3 mb-2">
                    <FileSpreadsheet className="w-8 h-8" />
                    <h2 className="text-2xl font-bold">Base de Costos - Google Sheets</h2>
                  </div>
                  <p className="text-green-100">
                    Edita los costos directamente en Google Sheets. Los cambios se sincronizan automáticamente.
                  </p>
                  <p className="text-sm text-green-200 mt-2">
                    Columnas editables: Costo, Proveedor, Caja Maestra
                  </p>
                </div>
                <a
                  href="https://docs.google.com/spreadsheets/d/1z2yPe2-_pf-m86P9gFetlh7lapVANF8um_qsbNZdOEc"
                  target="_blank"
                  rel="noopener noreferrer"
                  className="flex items-center gap-2 bg-white text-green-700 px-6 py-3 rounded-lg hover:bg-green-50 transition-colors font-semibold"
                >
                  <ExternalLink className="w-5 h-5" />
                  Abrir Google Sheet
                </a>
              </div>
            </div>

            {/* Cost Uploader */}
            <CostUploader onUpload={async (costs) => {
              const res = await fetch('/api/costs/update', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ costs }),
              });
              if (!res.ok) throw new Error('Error actualizando costos');
            }} />

            {/* Profitability Analysis */}
            {inventory?.profitability && (
              <>
                {/* KPIs de Rentabilidad */}
                <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <p className="text-sm text-gray-500">Margen Promedio</p>
                    <p className={`text-3xl font-bold ${inventory.profitability.avg_margin > 0 ? 'text-green-600' : 'text-red-600'}`}>
                      {inventory.profitability.avg_margin}%
                    </p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <p className="text-sm text-gray-500">Utilidad 30 días</p>
                    <p className="text-3xl font-bold text-blue-600">
                      ${((inventory.profitability.total_utilidad_30d || 0) / 1000).toFixed(0)}K
                    </p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <p className="text-sm text-gray-500">Con Costo</p>
                    <p className="text-3xl font-bold text-gray-900">
                      {inventory.profitability.productos_con_costo || 0}
                    </p>
                    <p className="text-xs text-gray-400">productos</p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <p className="text-sm text-gray-500">Sin Costo</p>
                    <p className={`text-3xl font-bold ${(inventory.profitability.productos_sin_costo || 0) > 0 ? 'text-yellow-600' : 'text-green-600'}`}>
                      {inventory.profitability.productos_sin_costo || 0}
                    </p>
                    <p className="text-xs text-gray-400">completar en Sheet</p>
                  </div>
                </div>

                {/* Top Productos Rentables */}
                <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                  <div className="px-6 py-4 border-b bg-green-50">
                    <h3 className="text-lg font-semibold text-green-800 flex items-center gap-2">
                      <TrendingUp className="w-5 h-5" />
                      Top 10 Productos Más Rentables (Utilidad 30D)
                    </h3>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="min-w-full divide-y divide-gray-200">
                      <thead className="bg-gray-50">
                        <tr>
                          <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Precio</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Costo</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Comisión</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Utilidad/U</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Ventas 30D</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Utilidad 30D</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">ROI</th>
                        </tr>
                      </thead>
                      <tbody className="bg-white divide-y divide-gray-200">
                        {inventory.profitability.top_profitable.map((p, i) => (
                          <tr key={i} className="hover:bg-gray-50">
                            <td className="px-4 py-3">
                              <p className="text-sm font-medium text-gray-900">{p.titulo}</p>
                              <p className="text-xs text-gray-500">{p.codigo_ml}</p>
                            </td>
                            <td className="px-4 py-3 text-right text-sm text-gray-900">
                              ${p.precio.toLocaleString()}
                            </td>
                            <td className="px-4 py-3 text-right text-sm text-gray-600">
                              ${p.costo.toLocaleString()}
                            </td>
                            <td className="px-4 py-3 text-right text-sm text-gray-500">
                              ${(p.comision || 0).toLocaleString()}
                            </td>
                            <td className="px-4 py-3 text-right">
                              <span className={`px-2 py-1 rounded text-sm font-medium ${p.utilidad > 0 ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}`}>
                                ${p.utilidad.toLocaleString()}
                              </span>
                            </td>
                            <td className="px-4 py-3 text-right text-sm text-gray-600">
                              {p.ventas_30d || 0}
                            </td>
                            <td className="px-4 py-3 text-right text-sm font-bold text-green-600">
                              ${((p.utilidad_30d || 0) / 1000).toFixed(0)}K
                            </td>
                            <td className="px-4 py-3 text-right">
                              <span className={`px-2 py-1 rounded text-sm font-medium ${p.rentabilidad > 30 ? 'bg-green-100 text-green-800' : p.rentabilidad > 15 ? 'bg-yellow-100 text-yellow-800' : 'bg-gray-100 text-gray-800'}`}>
                                {p.rentabilidad}%
                              </span>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>

                {/* Negative Margin Alert */}
                {inventory.profitability.negative_margin.length > 0 && (
                  <div className="bg-red-50 rounded-xl shadow-sm overflow-hidden border border-red-200">
                    <div className="px-6 py-4 border-b border-red-200">
                      <h3 className="text-lg font-semibold text-red-800 flex items-center gap-2">
                        <AlertTriangle className="w-5 h-5" />
                        ⚠️ Productos con Margen Negativo ({inventory.profitability.negative_margin.length})
                      </h3>
                      <p className="text-sm text-red-600 mt-1">
                        Estos productos generan pérdidas. Revisa los costos en Google Sheets.
                      </p>
                    </div>
                    <div className="overflow-x-auto">
                      <table className="min-w-full divide-y divide-red-200">
                        <thead className="bg-red-100">
                          <tr>
                            <th className="px-4 py-3 text-left text-xs font-medium text-red-800 uppercase">Producto</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-red-800 uppercase">Precio</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-red-800 uppercase">Costo</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-red-800 uppercase">Pérdida/U</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-red-800 uppercase">ROI</th>
                          </tr>
                        </thead>
                        <tbody className="bg-white divide-y divide-red-100">
                          {inventory.profitability.negative_margin.map((p, i) => (
                            <tr key={i} className="hover:bg-red-50">
                              <td className="px-4 py-3">
                                <p className="text-sm font-medium text-gray-900">{p.titulo}</p>
                                <p className="text-xs text-gray-500">{p.codigo_ml}</p>
                              </td>
                              <td className="px-4 py-3 text-right text-sm text-gray-900">
                                ${(p.precio || 0).toLocaleString()}
                              </td>
                              <td className="px-4 py-3 text-right text-sm text-gray-600">
                                ${(p.costo || 0).toLocaleString()}
                              </td>
                              <td className="px-4 py-3 text-right text-sm font-bold text-red-600">
                                ${(p.utilidad || 0).toLocaleString()}
                              </td>
                              <td className="px-4 py-3 text-right">
                                <span className="px-2 py-1 rounded text-sm font-bold bg-red-200 text-red-800">
                                  {p.rentabilidad}%
                                </span>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                  </div>
                )}
              </>
            )}
          </div>
        )}

        {/* Alerts Tab */}
        {activeTab === 'alerts' && alerts && (
          <div className="space-y-6">
            {/* Alert Summary */}
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
              <div className="bg-red-500 text-white rounded-xl p-6 text-center">
                <p className="text-4xl font-bold">{alerts.summary.urgent}</p>
                <p className="text-red-100">URGENTES</p>
              </div>
              <div className="bg-yellow-500 text-white rounded-xl p-6 text-center">
                <p className="text-4xl font-bold">{alerts.summary.warning}</p>
                <p className="text-yellow-100">ALERTA</p>
              </div>
              <div className="bg-blue-500 text-white rounded-xl p-6 text-center">
                <p className="text-4xl font-bold">{alerts.summary.low}</p>
                <p className="text-blue-100">BAJO</p>
              </div>
              <div className="bg-gray-800 text-white rounded-xl p-6 text-center">
                <p className="text-4xl font-bold">{alerts.summary.total}</p>
                <p className="text-gray-300">TOTAL</p>
              </div>
            </div>

            {/* Alerts Table */}
            <div className="bg-white rounded-xl shadow-sm overflow-hidden">
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                      <th className="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Stock</th>
                      <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Precio</th>
                      <th className="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Estado</th>
                      <th className="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {alerts.products.slice(0, 30).map((product) => (
                      <tr key={product.id} className="hover:bg-gray-50">
                        <td className="px-6 py-4">
                          <div className="flex items-center">
                            <img src={product.thumbnail} alt="" className="w-10 h-10 rounded-lg object-cover mr-3" />
                            <div>
                              <p className="text-sm font-medium text-gray-900 truncate max-w-xs">{product.title}</p>
                              <p className="text-xs text-gray-500">{product.id}</p>
                            </div>
                          </div>
                        </td>
                        <td className="px-6 py-4 text-center">
                          <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                            product.stock <= 1 ? 'bg-red-100 text-red-800' :
                            product.stock <= 3 ? 'bg-yellow-100 text-yellow-800' :
                            'bg-blue-100 text-blue-800'
                          }`}>
                            {product.stock}
                          </span>
                        </td>
                        <td className="px-6 py-4 text-right text-sm text-gray-900">
                          ${product.price.toLocaleString()}
                        </td>
                        <td className="px-6 py-4 text-center">
                          <StockStatusIndicator stock={product.stock} showLabel />
                        </td>
                        <td className="px-6 py-4 text-center">
                          <a href={product.permalink} target="_blank" rel="noopener noreferrer"
                             className="text-blue-600 hover:text-blue-800">
                            <ExternalLink className="w-5 h-5 inline" />
                          </a>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        )}

        {/* Projections Tab */}
        {activeTab === 'projections' && (
          <div className="space-y-6">
            {/* Header */}
            <div className="bg-gradient-to-r from-indigo-600 to-purple-700 rounded-xl p-6 text-white">
              <div className="flex items-center gap-3 mb-2">
                <Brain className="w-8 h-8" />
                <h2 className="text-2xl font-bold">Proyecciones ML</h2>
              </div>
              <p className="text-indigo-100">
                Análisis predictivo basado en histórico de ventas 2024-2025 usando Machine Learning
              </p>
              {projections?.summary && (
                <p className="text-sm text-indigo-200 mt-2">
                  Modelo: {projections.summary.model}
                </p>
              )}
            </div>

            {projectionsLoading ? (
              <div className="bg-white rounded-xl shadow-sm p-12 text-center">
                <RefreshCw className="w-12 h-12 animate-spin text-indigo-600 mx-auto mb-4" />
                <p className="text-gray-600">Cargando serie histórica y calculando proyecciones...</p>
                <p className="text-sm text-gray-400 mt-2">Esto puede tomar unos segundos</p>
              </div>
            ) : projections ? (
              <>
                {/* KPI Summary */}
                <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <div className="flex items-center gap-2 text-gray-500 mb-1">
                      <Calendar className="w-4 h-4" />
                      <span className="text-sm">Días Históricos</span>
                    </div>
                    <p className="text-3xl font-bold text-gray-900">{projections.summary.historical_days}</p>
                    <p className="text-xs text-gray-400">{projections.summary.days_with_sales} con ventas</p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <div className="flex items-center gap-2 text-gray-500 mb-1">
                      <DollarSign className="w-4 h-4" />
                      <span className="text-sm">Revenue Histórico</span>
                    </div>
                    <p className="text-3xl font-bold text-gray-900">
                      ${(projections.summary.total_historical_revenue / 1000000).toFixed(1)}M
                    </p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <div className="flex items-center gap-2 text-gray-500 mb-1">
                      <TrendingUp className="w-4 h-4" />
                      <span className="text-sm">Proyección 30 días</span>
                    </div>
                    <p className="text-3xl font-bold text-indigo-600">
                      ${(projections.summary.total_projected_revenue / 1000000).toFixed(1)}M
                    </p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <div className="flex items-center gap-2 text-gray-500 mb-1">
                      <BarChart3 className="w-4 h-4" />
                      <span className="text-sm">Promedio Diario</span>
                    </div>
                    <p className="text-3xl font-bold text-gray-900">
                      ${(projections.summary.avg_daily_revenue / 1000).toFixed(0)}K
                    </p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <div className="flex items-center gap-2 text-gray-500 mb-1">
                      <Activity className="w-4 h-4" />
                      <span className="text-sm">MAPE (Precisión)</span>
                    </div>
                    <p className={`text-3xl font-bold ${
                      (projections.model_quality?.mape || 0) < 20 ? 'text-green-600' :
                      (projections.model_quality?.mape || 0) < 30 ? 'text-yellow-600' :
                      'text-gray-600'
                    }`}>
                      {projections.model_quality?.mape?.toFixed(1) || '—'}%
                    </p>
                    <p className="text-xs text-gray-400">
                      {projections.model_quality?.mape_interpretation || 'Error promedio'}
                    </p>
                  </div>
                </div>

                {/* Financial KPIs */}
                {projections.financial && (
                  <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div className="bg-gradient-to-br from-green-50 to-emerald-100 rounded-xl shadow-sm p-6 border border-green-200">
                      <div className="flex items-center gap-2 text-green-700 mb-1">
                        <DollarSign className="w-4 h-4" />
                        <span className="text-sm font-medium">Utilidad Histórica</span>
                      </div>
                      <p className="text-3xl font-bold text-green-800">
                        ${(projections.financial.historical_utilidad / 1000000).toFixed(2)}M
                      </p>
                      <p className="text-xs text-green-600">Basado en margen promedio</p>
                    </div>
                    <div className="bg-gradient-to-br from-purple-50 to-violet-100 rounded-xl shadow-sm p-6 border border-purple-200">
                      <div className="flex items-center gap-2 text-purple-700 mb-1">
                        <TrendingUp className="w-4 h-4" />
                        <span className="text-sm font-medium">Utilidad Proyectada 30D</span>
                      </div>
                      <p className="text-3xl font-bold text-purple-800">
                        ${(projections.financial.projected_utilidad_30d / 1000000).toFixed(2)}M
                      </p>
                      <p className="text-xs text-purple-600">Próximos 30 días</p>
                    </div>
                    <div className="bg-gradient-to-br from-blue-50 to-cyan-100 rounded-xl shadow-sm p-6 border border-blue-200">
                      <div className="flex items-center gap-2 text-blue-700 mb-1">
                        <Activity className="w-4 h-4" />
                        <span className="text-sm font-medium">Margen Promedio</span>
                      </div>
                      <p className="text-3xl font-bold text-blue-800">
                        {projections.financial.avg_margin}%
                      </p>
                      <p className="text-xs text-blue-600">Sobre ventas</p>
                    </div>
                    <div className="bg-gradient-to-br from-amber-50 to-yellow-100 rounded-xl shadow-sm p-6 border border-amber-200">
                      <div className="flex items-center gap-2 text-amber-700 mb-1">
                        <BarChart3 className="w-4 h-4" />
                        <span className="text-sm font-medium">ROI Estimado</span>
                      </div>
                      <p className="text-3xl font-bold text-amber-800">
                        {projections.financial.roi_estimado}%
                      </p>
                      <p className="text-xs text-amber-600">Retorno sobre inversión</p>
                    </div>
                  </div>
                )}

                {/* Model Quality & Methodology Documentation */}
                {projections.model_quality && (
                  <div className="bg-gradient-to-r from-blue-50 to-indigo-50 rounded-xl shadow-sm p-6 border border-blue-200">
                    <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                      <Brain className="w-5 h-5 text-blue-600" />
                      Calidad del Modelo y Metodología
                    </h3>
                    <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                      <div className="bg-white p-4 rounded-lg">
                        <p className="text-sm text-gray-500">MAPE (Error Promedio)</p>
                        <p className="text-2xl font-bold text-blue-600">{projections.model_quality.mape}%</p>
                        <p className="text-xs text-gray-400">{projections.model_quality.mape_interpretation}</p>
                      </div>
                      <div className="bg-white p-4 rounded-lg">
                        <p className="text-sm text-gray-500">CV (Volatilidad)</p>
                        <p className="text-2xl font-bold text-purple-600">{projections.model_quality.cv}%</p>
                        <p className="text-xs text-gray-400">Variación día a día</p>
                      </div>
                      <div className="bg-white p-4 rounded-lg">
                        <p className="text-sm text-gray-500">R² (Determinación)</p>
                        <p className="text-2xl font-bold text-gray-600">{projections.model_quality.r2}%</p>
                        <p className="text-xs text-gray-400">Bajo es normal en e-commerce</p>
                      </div>
                    </div>
                    {projections.methodology && (
                      <div className="bg-white p-4 rounded-lg">
                        <p className="font-medium text-gray-800 mb-2">{projections.methodology.model}</p>
                        <p className="text-sm text-gray-600 mb-3">{projections.methodology.description}</p>
                        <div className="flex flex-wrap gap-2">
                          {projections.methodology.components.map((comp, i) => (
                            <span key={i} className="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">
                              {comp}
                            </span>
                          ))}
                        </div>
                        <p className="text-xs text-gray-500 mt-3 italic">
                          💡 {projections.model_quality.r2_note}
                        </p>
                      </div>
                    )}
                  </div>
                )}

                {/* Time Series Chart */}
                <div className="bg-white rounded-xl shadow-sm p-6">
                  <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                    <LineChart className="w-5 h-5 text-indigo-600" />
                    Serie Temporal de Ventas + Proyecciones
                  </h3>
                  <div className="h-80">
                    <TimeSeriesChart data={projections.combined_series} />
                  </div>
                </div>

                {/* Insights Panel */}
                <div className="bg-white rounded-xl shadow-sm p-6">
                  <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                    <Brain className="w-5 h-5 text-purple-600" />
                    Insights y Recomendaciones (Análisis Prescriptivo)
                  </h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    {projections.insights.map((insight, i) => (
                      <div key={i} className="p-4 bg-gray-50 rounded-lg border-l-4 border-indigo-500">
                        <p className="text-gray-700">{insight}</p>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Weekly Seasonality */}
                {projections.seasonality && (
                  <div className="bg-white rounded-xl shadow-sm p-6">
                    <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                      <Calendar className="w-5 h-5 text-blue-600" />
                      Ciclo Semanal (Estacionalidad)
                    </h3>
                    <div className="grid grid-cols-7 gap-2">
                      {['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'].map((day, i) => {
                        const factor = projections.seasonality[i] || 1;
                        const isHigh = factor > 1.1;
                        const isLow = factor < 0.9;
                        return (
                          <div key={i} className={`p-4 rounded-lg text-center ${
                            isHigh ? 'bg-green-100 border-2 border-green-500' :
                            isLow ? 'bg-red-100 border-2 border-red-300' :
                            'bg-gray-100'
                          }`}>
                            <p className="text-sm font-medium text-gray-700">{day}</p>
                            <p className={`text-2xl font-bold ${
                              isHigh ? 'text-green-700' :
                              isLow ? 'text-red-600' :
                              'text-gray-600'
                            }`}>
                              {(factor * 100).toFixed(0)}%
                            </p>
                            <p className="text-xs text-gray-500">
                              {isHigh ? '↑ Alto' : isLow ? '↓ Bajo' : 'Normal'}
                            </p>
                          </div>
                        );
                      })}
                    </div>
                  </div>
                )}

                {/* Tables */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                  {/* Historical Table (last 14 days) */}
                  <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                    <div className="px-6 py-4 border-b bg-gray-50">
                      <h3 className="text-lg font-semibold flex items-center gap-2">
                        <Calendar className="w-5 h-5 text-gray-600" />
                        Histórico Diario (últimos 14 días)
                      </h3>
                    </div>
                    <div className="max-h-96 overflow-y-auto">
                      <table className="min-w-full divide-y divide-gray-200">
                        <thead className="bg-gray-50 sticky top-0">
                          <tr>
                            <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Fecha</th>
                            <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Día</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Revenue</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Utilidad</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Órdenes</th>
                          </tr>
                        </thead>
                        <tbody className="bg-white divide-y divide-gray-200">
                          {projections.historical.slice(-14).reverse().map((h, i) => {
                            // Calcular utilidad estimada usando el margen promedio del financial
                            const avgMargin = projections.financial?.avg_margin || 15;
                            const utilidadEstimada = h.revenue > 0 ? Math.round(h.revenue * (avgMargin / 100)) : 0;
                            return (
                              <tr key={i} className={`hover:bg-gray-50 ${h.revenue === 0 ? 'opacity-50' : ''}`}>
                                <td className="px-4 py-2 text-sm font-medium text-gray-900">
                                  {new Date(h.date).toLocaleDateString('es-CL', { day: '2-digit', month: 'short' })}
                                </td>
                                <td className="px-4 py-2 text-sm text-gray-600">{h.dayName}</td>
                                <td className="px-4 py-2 text-sm text-right text-gray-900">
                                  {h.revenue > 0 ? `$${(h.revenue / 1000).toFixed(0)}K` : '-'}
                                </td>
                                <td className="px-4 py-2 text-sm text-right text-green-600 font-medium">
                                  {utilidadEstimada > 0 ? `$${(utilidadEstimada / 1000).toFixed(0)}K` : '-'}
                                </td>
                                <td className="px-4 py-2 text-sm text-right text-gray-600">{h.orders_count || '-'}</td>
                              </tr>
                            );
                          })}
                        </tbody>
                      </table>
                    </div>
                  </div>

                  {/* Projections Table (next 14 days) */}
                  <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                    <div className="px-6 py-4 border-b bg-indigo-50">
                      <h3 className="text-lg font-semibold flex items-center gap-2 text-indigo-800">
                        <TrendingUp className="w-5 h-5" />
                        Proyección (próximos 14 días)
                      </h3>
                    </div>
                    <div className="max-h-96 overflow-y-auto">
                      <table className="min-w-full divide-y divide-gray-200">
                        <thead className="bg-gray-50 sticky top-0">
                          <tr>
                            <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Fecha</th>
                            <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Día</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Revenue</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Utilidad</th>
                            <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">ROI</th>
                          </tr>
                        </thead>
                        <tbody className="bg-white divide-y divide-gray-200">
                          {projections.projections.slice(0, 14).map((p, i) => (
                            <tr key={i} className="hover:bg-indigo-50">
                              <td className="px-4 py-2 text-sm font-medium text-indigo-700">
                                {new Date(p.date).toLocaleDateString('es-CL', { day: '2-digit', month: 'short' })}
                              </td>
                              <td className="px-4 py-2 text-sm text-indigo-600">{p.dayName}</td>
                              <td className="px-4 py-2 text-sm text-right font-bold text-indigo-600">
                                ${(p.revenue_forecast / 1000).toFixed(0)}K
                              </td>
                              <td className="px-4 py-2 text-sm text-right text-green-600 font-medium">
                                ${((p.utilidad_forecast || 0) / 1000).toFixed(0)}K
                              </td>
                              <td className="px-4 py-2 text-sm text-right">
                                <span className={`px-2 py-0.5 rounded text-xs font-medium ${
                                  (p.roi_forecast || 0) > 30 ? 'bg-green-100 text-green-800' :
                                  (p.roi_forecast || 0) > 15 ? 'bg-yellow-100 text-yellow-800' :
                                  'bg-gray-100 text-gray-800'
                                }`}>
                                  {p.roi_forecast || projections.financial?.roi_estimado || 0}%
                                </span>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </>
            ) : (
              <div className="bg-white rounded-xl shadow-sm p-12 text-center">
                <LineChart className="w-12 h-12 text-gray-400 mx-auto mb-4" />
                <p className="text-gray-600">No se pudieron cargar las proyecciones</p>
                <button
                  onClick={() => { setProjections(null); fetchProjections(); }}
                  className="mt-4 px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700"
                >
                  Reintentar
                </button>
              </div>
            )}
          </div>
        )}

        {/* Monitor Tab */}
        {activeTab === 'monitor' && (
          <div className="space-y-6">
            {/* Header */}
            <div className="bg-gradient-to-r from-emerald-600 to-teal-700 rounded-xl p-6 text-white">
              <div className="flex items-center gap-3 mb-2">
                <BarChart3 className="w-8 h-8" />
                <h2 className="text-2xl font-bold">Monitor del Negocio Mensual</h2>
              </div>
              <p className="text-emerald-100">
                Resumen financiero completo con detalle por proveedor, ingresos, utilidad y ROI
              </p>
            </div>

            {monitorLoading ? (
              <div className="flex items-center justify-center py-12">
                <RefreshCw className="w-8 h-8 animate-spin text-emerald-600" />
                <span className="ml-2 text-gray-600">Cargando datos del mes...</span>
              </div>
            ) : monthlyMonitor ? (
              <>
                {/* Period Info */}
                <div className="bg-white rounded-xl shadow-sm p-4">
                  <p className="text-sm text-gray-600">
                    Periodo: <strong>{monthlyMonitor.period.start_date}</strong> al <strong>{monthlyMonitor.period.end_date}</strong>
                    {' '}({monthlyMonitor.period.days_count} dias con ventas)
                  </p>
                </div>

                {/* KPIs Summary */}
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
                  <div className="bg-white rounded-xl shadow-sm p-4">
                    <p className="text-xs text-gray-500 uppercase">Ventas Totales</p>
                    <p className="text-2xl font-bold text-gray-900">{monthlyMonitor.summary.total_ventas.toLocaleString()}</p>
                    <p className="text-xs text-gray-400">unidades</p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-4">
                    <p className="text-xs text-gray-500 uppercase">Facturacion</p>
                    <p className="text-2xl font-bold text-blue-600">${(monthlyMonitor.summary.total_facturacion / 1000000).toFixed(1)}M</p>
                    <p className="text-xs text-gray-400">bruto</p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-4">
                    <p className="text-xs text-gray-500 uppercase">Utilidad</p>
                    <p className="text-2xl font-bold text-green-600">${(monthlyMonitor.summary.total_utilidad / 1000).toFixed(0)}K</p>
                    <p className="text-xs text-gray-400">neto</p>
                  </div>
                  <div className="bg-white rounded-xl shadow-sm p-4">
                    <p className="text-xs text-gray-500 uppercase">Rentabilidad</p>
                    <p className="text-2xl font-bold text-purple-600">{monthlyMonitor.summary.rentabilidad}%</p>
                    <p className="text-xs text-gray-400">ROI: {monthlyMonitor.summary.roi_promedio}%</p>
                  </div>
                </div>

                {/* Desglose de Costos */}
                <div className="bg-white rounded-xl shadow-sm p-6">
                  <h3 className="text-lg font-semibold mb-4">Desglose Financiero</h3>
                  <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
                    <div className="text-center p-3 bg-blue-50 rounded-lg">
                      <p className="text-xs text-blue-600">Facturacion</p>
                      <p className="text-lg font-bold">${monthlyMonitor.summary.total_facturacion.toLocaleString()}</p>
                    </div>
                    <div className="text-center p-3 bg-orange-50 rounded-lg">
                      <p className="text-xs text-orange-600">Comisiones ML</p>
                      <p className="text-lg font-bold">-${monthlyMonitor.summary.total_comisiones.toLocaleString()}</p>
                    </div>
                    <div className="text-center p-3 bg-yellow-50 rounded-lg">
                      <p className="text-xs text-yellow-600">Costos Envio</p>
                      <p className="text-lg font-bold">-${monthlyMonitor.summary.total_costos_envio.toLocaleString()}</p>
                    </div>
                    <div className="text-center p-3 bg-gray-50 rounded-lg">
                      <p className="text-xs text-gray-600">Costo Productos</p>
                      <p className="text-lg font-bold">-${monthlyMonitor.summary.total_costo_productos.toLocaleString()}</p>
                    </div>
                    <div className="text-center p-3 bg-green-50 rounded-lg">
                      <p className="text-xs text-green-600">Utilidad Neta</p>
                      <p className="text-lg font-bold text-green-700">${monthlyMonitor.summary.total_utilidad.toLocaleString()}</p>
                    </div>
                  </div>
                </div>

                {/* Resumen por Proveedor */}
                <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                  <div className="px-6 py-4 border-b">
                    <h3 className="text-lg font-semibold flex items-center gap-2">
                      <Users className="w-5 h-5 text-emerald-600" />
                      Resumen por Proveedor
                    </h3>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="min-w-full divide-y divide-gray-200">
                      <thead className="bg-gray-50">
                        <tr>
                          <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">#</th>
                          <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Proveedor</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Facturacion</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Ingreso Neto</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Utilidad</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Ventas</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Rentabilidad</th>
                        </tr>
                      </thead>
                      <tbody className="bg-white divide-y divide-gray-200">
                        {monthlyMonitor.by_provider.map((prov, i) => (
                          <tr key={i} className="hover:bg-gray-50">
                            <td className="px-4 py-3 text-sm font-bold text-emerald-600">{i + 1}</td>
                            <td className="px-4 py-3 text-sm font-medium text-gray-900">{prov.proveedor}</td>
                            <td className="px-4 py-3 text-right text-sm text-gray-600">${prov.facturacion.toLocaleString()}</td>
                            <td className="px-4 py-3 text-right text-sm text-gray-600">${prov.ingreso_neto.toLocaleString()}</td>
                            <td className="px-4 py-3 text-right text-sm font-medium text-green-600">${prov.utilidad.toLocaleString()}</td>
                            <td className="px-4 py-3 text-right text-sm text-gray-600">{prov.ventas_count}</td>
                            <td className="px-4 py-3 text-right">
                              <span className={`px-2 py-1 rounded text-xs font-medium ${
                                prov.rentabilidad >= 20 ? 'bg-green-100 text-green-800' :
                                prov.rentabilidad >= 10 ? 'bg-blue-100 text-blue-800' :
                                prov.rentabilidad >= 0 ? 'bg-yellow-100 text-yellow-800' :
                                'bg-red-100 text-red-800'
                              }`}>
                                {prov.rentabilidad}%
                              </span>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>

                {/* Resumen Diario */}
                <div className="bg-white rounded-xl shadow-sm overflow-hidden">
                  <div className="px-6 py-4 border-b">
                    <h3 className="text-lg font-semibold flex items-center gap-2">
                      <Calendar className="w-5 h-5 text-emerald-600" />
                      Tendencia Diaria
                    </h3>
                  </div>
                  <div className="overflow-x-auto max-h-[400px]">
                    <table className="min-w-full divide-y divide-gray-200">
                      <thead className="bg-gray-50 sticky top-0">
                        <tr>
                          <th className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase">Fecha</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Ventas</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Facturacion</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Comisiones</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Envio</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Costo Prod.</th>
                          <th className="px-4 py-3 text-right text-xs font-medium text-gray-500 uppercase">Utilidad</th>
                        </tr>
                      </thead>
                      <tbody className="bg-white divide-y divide-gray-200">
                        {monthlyMonitor.daily.map((day, i) => (
                          <tr key={i} className="hover:bg-gray-50">
                            <td className="px-4 py-2 text-sm text-gray-900">{day.date}</td>
                            <td className="px-4 py-2 text-right text-sm text-gray-600">{day.ventas_count}</td>
                            <td className="px-4 py-2 text-right text-sm text-blue-600">${day.facturacion.toLocaleString()}</td>
                            <td className="px-4 py-2 text-right text-sm text-orange-500">-${day.comisiones.toLocaleString()}</td>
                            <td className="px-4 py-2 text-right text-sm text-yellow-600">-${day.costos_envio.toLocaleString()}</td>
                            <td className="px-4 py-2 text-right text-sm text-gray-500">-${day.costo_productos.toLocaleString()}</td>
                            <td className="px-4 py-2 text-right text-sm font-medium text-green-600">${day.utilidad.toLocaleString()}</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </>
            ) : (
              <div className="text-center py-12 text-gray-500">
                No se pudieron cargar los datos del monitor mensual
              </div>
            )}
          </div>
        )}

        {/* Coming Soon Tab */}
        {activeTab === 'coming-soon' && (
          <div className="space-y-6">
            {/* Header */}
            <div className="bg-gradient-to-r from-purple-600 to-indigo-700 rounded-xl p-6 text-white">
              <div className="flex items-center gap-3 mb-2">
                <Rocket className="w-8 h-8" />
                <h2 className="text-2xl font-bold">Módulos en Desarrollo</h2>
              </div>
              <p className="text-purple-100">
                Estamos trabajando en nuevas funcionalidades para potenciar tu negocio en Mercado Libre.
              </p>
            </div>

            {/* Coming Soon Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <ComingSoonCard
                title="Preventa Automatizada"
                description="Respuestas automáticas a preguntas de productos con IA. Aumenta tu tasa de conversión respondiendo 24/7."
                icon={MessageSquare}
                status="En desarrollo"
                features={[
                  "Respuestas instantáneas a preguntas frecuentes",
                  "Integración con ChatGPT/Claude",
                  "Templates personalizables",
                  "Métricas de conversión"
                ]}
              />
              <ComingSoonCard
                title="Postventa Inteligente"
                description="Gestión automatizada de tracking, facturas, garantías y devoluciones. Mejora la experiencia del cliente."
                icon={Package}
                status="Planificado"
                features={[
                  "Notificaciones automáticas de envío",
                  "Generación de facturas",
                  "Gestión de garantías",
                  "Proceso de devoluciones simplificado"
                ]}
              />
              <ComingSoonCard
                title="Panel de Soporte"
                description="Centro de escalaciones para atención humana con contexto enriquecido del cliente y su historial."
                icon={Headphones}
                status="Planificado"
                features={[
                  "Historial completo del cliente",
                  "Tickets priorizados por urgencia",
                  "Integración con WhatsApp",
                  "Dashboard de métricas de soporte"
                ]}
              />
              <ComingSoonCard
                title="Chatbot IA (MarIA)"
                description="Agente conversacional inteligente para atención 24/7. Ya integrado con n8n, próximamente en el dashboard."
                icon={Bot}
                status="En desarrollo"
                features={[
                  "Respuestas naturales con IA",
                  "Integración con WhatsApp/Messenger",
                  "Aprendizaje continuo",
                  "Escalación automática a humanos"
                ]}
              />
            </div>

            {/* Contact CTA */}
            <div className="bg-gray-100 rounded-xl p-6 text-center">
              <p className="text-gray-600 mb-2">¿Interesado en algún módulo específico?</p>
              <a
                href="mailto:bazaroimportaciones@gmail.com?subject=Consulta%20Módulos%20BAZAR"
                className="inline-flex items-center gap-2 bg-indigo-600 text-white px-6 py-3 rounded-lg hover:bg-indigo-700 transition-colors"
              >
                <Mail className="w-5 h-5" />
                Contáctanos
              </a>
            </div>
          </div>
        )}

        {/* Footer */}
        <div className="mt-8 text-center text-sm text-gray-500">
          Última actualización: {stats?.generated_at ? new Date(stats.generated_at).toLocaleString('es-CL') : '-'}
        </div>
      </main>
    </div>
  );
}

// Helper Components
function KPICard({ title, value, subtitle, icon: Icon, color }: {
  title: string;
  value: string | number;
  subtitle: string;
  icon: React.ElementType;
  color: 'blue' | 'red' | 'green' | 'yellow';
}) {
  const colors = {
    blue: 'bg-blue-100 text-blue-600',
    red: 'bg-red-100 text-red-600',
    green: 'bg-green-100 text-green-600',
    yellow: 'bg-yellow-100 text-yellow-600',
  };

  return (
    <div className="bg-white rounded-xl shadow-sm p-6">
      <div className="flex items-center justify-between">
        <div>
          <p className="text-sm font-medium text-gray-500">{title}</p>
          <p className="text-3xl font-bold text-gray-900">{value}</p>
        </div>
        <div className={`p-3 rounded-full ${colors[color]}`}>
          <Icon className="w-6 h-6" />
        </div>
      </div>
      <p className="text-sm text-gray-500 mt-2">{subtitle}</p>
    </div>
  );
}

function HealthCard({ title, value, color }: {
  title: string;
  value: number;
  color: 'green' | 'yellow' | 'red' | 'gray' | 'purple';
}) {
  const colors = {
    green: 'bg-green-500',
    yellow: 'bg-yellow-500',
    red: 'bg-red-500',
    gray: 'bg-gray-500',
    purple: 'bg-purple-500',
  };

  return (
    <div className={`${colors[color]} text-white rounded-xl p-4 text-center`}>
      <p className="text-3xl font-bold">{value}</p>
      <p className="text-sm opacity-90">{title}</p>
    </div>
  );
}

function ComingSoonCard({ title, description, icon: Icon, status, features }: {
  title: string;
  description: string;
  icon: React.ElementType;
  status: string;
  features: string[];
}) {
  const statusColors = {
    'En desarrollo': 'bg-green-100 text-green-800',
    'Planificado': 'bg-blue-100 text-blue-800',
  };

  return (
    <div className="bg-white rounded-xl shadow-sm p-6 border-2 border-dashed border-gray-200 relative overflow-hidden">
      <div className="absolute top-0 right-0 bg-gradient-to-l from-purple-100 to-transparent w-32 h-32 -mr-10 -mt-10 rounded-full opacity-50" />

      <div className="relative">
        <div className="flex items-start justify-between mb-4">
          <div className={`p-3 rounded-xl bg-purple-100`}>
            <Icon className="w-6 h-6 text-purple-600" />
          </div>
          <span className={`px-2 py-1 text-xs rounded-full ${statusColors[status as keyof typeof statusColors] || 'bg-gray-100 text-gray-800'}`}>
            {status}
          </span>
        </div>

        <h3 className="text-lg font-semibold text-gray-900 mb-2">{title}</h3>
        <p className="text-sm text-gray-600 mb-4">{description}</p>

        <div className="space-y-2">
          {features.map((feature, i) => (
            <div key={i} className="flex items-center gap-2 text-sm text-gray-500">
              <div className="w-1.5 h-1.5 rounded-full bg-purple-400" />
              {feature}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

// Time Series Chart Component (SVG-based for simplicity)
function TimeSeriesChart({ data }: {
  data: Array<{
    date: string;
    dayName: string;
    revenue: number | null;
    revenue_forecast: number | null;
    revenue_lower: number | null;
    revenue_upper: number | null;
    is_projection: boolean;
  }>;
}) {
  if (!data || data.length === 0) {
    return <div className="text-center text-gray-500">Sin datos disponibles</div>;
  }

  const width = 900;
  const height = 300;
  const padding = { top: 30, right: 30, bottom: 60, left: 70 };
  const chartWidth = width - padding.left - padding.right;
  const chartHeight = height - padding.top - padding.bottom;

  // Get all values for scaling
  const allValues = data.flatMap(d => [
    d.revenue,
    d.revenue_forecast,
    d.revenue_upper
  ]).filter((v): v is number => v !== null && v > 0);

  if (allValues.length === 0) {
    return <div className="text-center text-gray-500">Sin datos de ventas disponibles</div>;
  }

  const maxValue = Math.max(...allValues) * 1.1; // 10% padding
  const minValue = 0;

  // Scale functions
  const xScale = (index: number) => padding.left + (index / Math.max(data.length - 1, 1)) * chartWidth;
  const yScale = (value: number) => padding.top + chartHeight - ((value - minValue) / (maxValue - minValue)) * chartHeight;

  // Generate path for historical data (only where revenue > 0)
  const historicalData = data.filter(d => d.revenue !== null && d.revenue > 0);
  const historicalPath = historicalData.map((d, i) => {
    const x = xScale(data.indexOf(d));
    const y = yScale(d.revenue!);
    return i === 0 ? `M ${x} ${y}` : `L ${x} ${y}`;
  }).join(' ');

  // Generate path for forecast data
  const forecastData = data.filter(d => d.revenue_forecast !== null);

  // Connect historical to forecast
  const lastHistorical = historicalData[historicalData.length - 1];
  const lastHistoricalX = lastHistorical ? xScale(data.indexOf(lastHistorical)) : 0;
  const lastHistoricalY = lastHistorical ? yScale(lastHistorical.revenue!) : 0;

  const forecastPath = forecastData.map((d, i) => {
    const x = xScale(data.indexOf(d));
    const y = yScale(d.revenue_forecast!);
    if (i === 0 && lastHistorical) {
      return `M ${lastHistoricalX} ${lastHistoricalY} L ${x} ${y}`;
    }
    return `L ${x} ${y}`;
  }).join(' ');

  // Generate confidence band path
  const confidenceBandPath = forecastData.length > 0 ? (() => {
    const upperPath = forecastData.map((d, i) => {
      const x = xScale(data.indexOf(d));
      const y = yScale(d.revenue_upper!);
      return i === 0 ? `M ${x} ${y}` : `L ${x} ${y}`;
    }).join(' ');

    const lowerPathReverse = [...forecastData].reverse().map((d) => {
      const x = xScale(data.indexOf(d));
      const y = yScale(d.revenue_lower!);
      return `L ${x} ${y}`;
    }).join(' ');

    return `${upperPath} ${lowerPathReverse} Z`;
  })() : '';

  // Y-axis ticks
  const yTicks = 5;
  const yTickValues = Array.from({ length: yTicks }, (_, i) =>
    minValue + ((maxValue - minValue) / (yTicks - 1)) * i
  );

  // Format date for x-axis label
  const formatDateLabel = (dateStr: string) => {
    const date = new Date(dateStr);
    return date.toLocaleDateString('es-CL', { day: '2-digit', month: 'short' });
  };

  // Select which dates to show on x-axis (every ~10 days for readability)
  const labelInterval = Math.max(1, Math.ceil(data.length / 10));

  return (
    <div className="w-full overflow-x-auto">
      <svg viewBox={`0 0 ${width} ${height}`} className="w-full min-w-[700px]">
        {/* Grid lines */}
        {yTickValues.map((tick, i) => (
          <line
            key={i}
            x1={padding.left}
            y1={yScale(tick)}
            x2={width - padding.right}
            y2={yScale(tick)}
            stroke="#e5e7eb"
            strokeDasharray="4,4"
          />
        ))}

        {/* Vertical line separating historical from forecast */}
        {lastHistorical && forecastData.length > 0 && (
          <line
            x1={lastHistoricalX}
            y1={padding.top}
            x2={lastHistoricalX}
            y2={height - padding.bottom}
            stroke="#94a3b8"
            strokeDasharray="6,3"
            strokeWidth="1"
          />
        )}

        {/* Confidence band */}
        {confidenceBandPath && (
          <path
            d={confidenceBandPath}
            fill="rgba(99, 102, 241, 0.15)"
            stroke="none"
          />
        )}

        {/* Historical line */}
        {historicalPath && (
          <path
            d={historicalPath}
            fill="none"
            stroke="#3b82f6"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
          />
        )}

        {/* Forecast line */}
        {forecastPath && (
          <path
            d={forecastPath}
            fill="none"
            stroke="#6366f1"
            strokeWidth="2"
            strokeDasharray="6,3"
            strokeLinecap="round"
            strokeLinejoin="round"
          />
        )}

        {/* Data points - Historical (only show some to avoid clutter) */}
        {historicalData.filter((_, i) => i % 3 === 0 || i === historicalData.length - 1).map((d, i) => (
          <circle
            key={`hist-${i}`}
            cx={xScale(data.indexOf(d))}
            cy={yScale(d.revenue!)}
            r="3"
            fill="#3b82f6"
            stroke="white"
            strokeWidth="1.5"
          />
        ))}

        {/* Data points - Forecast (only show some) */}
        {forecastData.filter((_, i) => i % 3 === 0 || i === forecastData.length - 1).map((d, i) => (
          <circle
            key={`forecast-${i}`}
            cx={xScale(data.indexOf(d))}
            cy={yScale(d.revenue_forecast!)}
            r="3"
            fill="#6366f1"
            stroke="white"
            strokeWidth="1.5"
          />
        ))}

        {/* Y-axis */}
        <line
          x1={padding.left}
          y1={padding.top}
          x2={padding.left}
          y2={height - padding.bottom}
          stroke="#9ca3af"
        />

        {/* X-axis */}
        <line
          x1={padding.left}
          y1={height - padding.bottom}
          x2={width - padding.right}
          y2={height - padding.bottom}
          stroke="#9ca3af"
        />

        {/* Y-axis labels */}
        {yTickValues.map((tick, i) => (
          <text
            key={i}
            x={padding.left - 10}
            y={yScale(tick) + 4}
            textAnchor="end"
            className="text-xs fill-gray-500"
          >
            ${tick >= 1000000 ? `${(tick / 1000000).toFixed(1)}M` : `${(tick / 1000).toFixed(0)}K`}
          </text>
        ))}

        {/* X-axis labels */}
        {data.filter((_, i) => i % labelInterval === 0 || i === data.length - 1).map((d, i) => {
          const index = data.indexOf(d);
          return (
            <g key={i}>
              <text
                x={xScale(index)}
                y={height - padding.bottom + 18}
                textAnchor="middle"
                className={`text-xs ${d.is_projection ? 'fill-indigo-600 font-medium' : 'fill-gray-500'}`}
              >
                {formatDateLabel(d.date)}
              </text>
              {/* Small tick mark */}
              <line
                x1={xScale(index)}
                y1={height - padding.bottom}
                x2={xScale(index)}
                y2={height - padding.bottom + 4}
                stroke="#9ca3af"
              />
            </g>
          );
        })}

        {/* Legend */}
        <g transform={`translate(${padding.left + 20}, ${padding.top - 15})`}>
          <line x1="0" y1="0" x2="20" y2="0" stroke="#3b82f6" strokeWidth="2" />
          <text x="25" y="4" className="text-xs fill-gray-600">Histórico</text>
          <line x1="90" y1="0" x2="110" y2="0" stroke="#6366f1" strokeWidth="2" strokeDasharray="4,2" />
          <text x="115" y="4" className="text-xs fill-gray-600">Proyección</text>
          <rect x="190" y="-5" width="20" height="10" fill="rgba(99, 102, 241, 0.15)" rx="2" />
          <text x="215" y="4" className="text-xs fill-gray-600">Intervalo 95%</text>
        </g>
      </svg>
    </div>
  );
}
// Deploy trigger: 2025-12-19T02:00:00Z
