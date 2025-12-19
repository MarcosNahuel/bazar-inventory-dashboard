'use client';

import { useEffect, useState } from 'react';
import {
  Package, AlertTriangle, TrendingUp, DollarSign, ShoppingCart,
  RefreshCw, ExternalLink, BarChart3, PieChart, Users, Mail,
  Upload, FileSpreadsheet, Activity, Target, Boxes, Rocket,
  MessageSquare, Headphones, Bot, Clock
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

interface InventoryData {
  summary: {
    stock_total: number;
    valorizacion_total: number;
    ventas_30d_total: number;
  };
  pareto: {
    top_20_percent_contributes: number;
    total_sales: number;
    top_products: Array<{
      codigo_ml: string;
      titulo: string;
      ventas_30d: number;
      stock: number;
      proveedor: string;
    }>;
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
    critical_items: Array<{ codigo_ml: string; titulo: string; days: number }>;
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
    top_profitable: Array<{
      codigo_ml: string;
      titulo: string;
      rentabilidad: number;
      utilidad: number;
    }>;
    negative_margin: Array<{
      codigo_ml: string;
      titulo: string;
      rentabilidad: number;
    }>;
  };
}

type TabType = 'overview' | 'inventory' | 'pareto' | 'costs' | 'alerts' | 'coming-soon';

export default function Dashboard() {
  const [activeTab, setActiveTab] = useState<TabType>('overview');
  const [stats, setStats] = useState<Stats | null>(null);
  const [alerts, setAlerts] = useState<{ summary: { total: number; urgent: number; warning: number; low: number }; products: Alert[] } | null>(null);
  const [inventory, setInventory] = useState<InventoryData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [refreshing, setRefreshing] = useState(false);
  const [sendingAlerts, setSendingAlerts] = useState(false);

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

  useEffect(() => { fetchData(); }, []);

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
            {/* Stock Health Cards */}
            <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
              <HealthCard title="Saludable" value={inventory.stock_health.healthy} color="green" />
              <HealthCard title="Alerta" value={inventory.stock_health.warning} color="yellow" />
              <HealthCard title="Crítico" value={inventory.stock_health.critical} color="red" />
              <HealthCard title="Sin Stock" value={inventory.stock_health.out_of_stock} color="gray" />
              <HealthCard title="Sobrestock" value={inventory.stock_health.overstocked} color="purple" />
            </div>

            {/* Critical Items */}
            <div className="bg-white rounded-xl shadow-sm overflow-hidden">
              <div className="px-6 py-4 border-b bg-red-50">
                <h3 className="text-lg font-semibold text-red-800 flex items-center gap-2">
                  <AlertTriangle className="w-5 h-5" />
                  Productos Críticos (días de stock restantes)
                </h3>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Código</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                      <th className="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Días Stock</th>
                      <th className="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Estado</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {inventory.stock_health.critical_items.slice(0, 20).map((item, i) => (
                      <tr key={i} className="hover:bg-gray-50">
                        <td className="px-6 py-3 text-sm text-gray-500">{item.codigo_ml}</td>
                        <td className="px-6 py-3 text-sm text-gray-900">{item.titulo}</td>
                        <td className="px-6 py-3 text-center">
                          <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                            item.days <= 7 ? 'bg-red-100 text-red-800' :
                            item.days <= 14 ? 'bg-yellow-100 text-yellow-800' :
                            'bg-green-100 text-green-800'
                          }`}>
                            {item.days} días
                          </span>
                        </td>
                        <td className="px-6 py-3 text-center">
                          <StockStatusIndicator stock={item.days} threshold={14} />
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        )}

        {/* Pareto Tab */}
        {activeTab === 'pareto' && inventory?.pareto && (
          <div className="space-y-6">
            {/* Pareto Summary */}
            <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-xl p-6 text-white">
              <h3 className="text-xl font-bold mb-2">Análisis Pareto 80/20</h3>
              <p className="text-blue-100 mb-4">
                El {20}% de tus productos genera el <span className="text-2xl font-bold">{inventory.pareto.top_20_percent_contributes}%</span> de las ventas
              </p>
              <p className="text-sm text-blue-200">
                Ventas totales 30 días: {inventory.pareto.total_sales.toLocaleString()} unidades
              </p>
            </div>

            {/* Top Products */}
            <div className="bg-white rounded-xl shadow-sm overflow-hidden">
              <div className="px-6 py-4 border-b">
                <h3 className="text-lg font-semibold flex items-center gap-2">
                  <Target className="w-5 h-5 text-blue-600" />
                  Top 20 Productos (Pareto)
                </h3>
              </div>
              <div className="overflow-x-auto">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">#</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Producto</th>
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Proveedor</th>
                      <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Ventas 30d</th>
                      <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase">Stock</th>
                      <th className="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase">Estado</th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {inventory.pareto.top_products.map((p, i) => (
                      <tr key={i} className="hover:bg-gray-50">
                        <td className="px-6 py-3 text-sm font-bold text-blue-600">{i + 1}</td>
                        <td className="px-6 py-3">
                          <p className="text-sm font-medium text-gray-900">{p.titulo}</p>
                          <p className="text-xs text-gray-500">{p.codigo_ml}</p>
                        </td>
                        <td className="px-6 py-3 text-sm text-gray-600">{p.proveedor}</td>
                        <td className="px-6 py-3 text-right font-medium text-gray-900">{p.ventas_30d}</td>
                        <td className="px-6 py-3 text-right text-gray-600">{p.stock}</td>
                        <td className="px-6 py-3 text-center">
                          <StockStatusIndicator stock={p.stock} />
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        )}

        {/* Costs Tab */}
        {activeTab === 'costs' && (
          <div className="space-y-6">
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
                <div className="bg-white rounded-xl shadow-sm p-6">
                  <h3 className="text-lg font-semibold mb-4 flex items-center gap-2">
                    <TrendingUp className="w-5 h-5 text-green-600" />
                    Margen Promedio: {inventory.profitability.avg_margin}%
                  </h3>
                  <ProfitabilityChart data={inventory.profitability.top_profitable} />
                </div>

                {/* Negative Margin Alert */}
                {inventory.profitability.negative_margin.length > 0 && (
                  <div className="bg-red-50 rounded-xl shadow-sm p-6 border border-red-200">
                    <h3 className="text-lg font-semibold text-red-800 mb-4 flex items-center gap-2">
                      <AlertTriangle className="w-5 h-5" />
                      Productos con Margen Negativo ({inventory.profitability.negative_margin.length})
                    </h3>
                    <div className="space-y-2">
                      {inventory.profitability.negative_margin.map((p, i) => (
                        <div key={i} className="flex justify-between items-center p-3 bg-white rounded-lg">
                          <span className="text-sm text-gray-900">{p.titulo}</span>
                          <span className="text-sm font-bold text-red-600">{p.rentabilidad}%</span>
                        </div>
                      ))}
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
                eta="Q1 2025"
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
                eta="Q2 2025"
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
                eta="Q2 2025"
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
                eta="Q1 2025"
                features={[
                  "Respuestas naturales con IA",
                  "Integración con WhatsApp/Messenger",
                  "Aprendizaje continuo",
                  "Escalación automática a humanos"
                ]}
              />
            </div>

            {/* Roadmap Timeline */}
            <div className="bg-white rounded-xl shadow-sm p-6">
              <h3 className="text-lg font-semibold mb-6 flex items-center gap-2">
                <Clock className="w-5 h-5 text-indigo-600" />
                Roadmap 2025
              </h3>
              <div className="space-y-4">
                <RoadmapItem
                  quarter="Q1 2025"
                  items={["Preventa Automatizada", "Chatbot MarIA v1", "Métricas de visitas/conversión"]}
                  status="in-progress"
                />
                <RoadmapItem
                  quarter="Q2 2025"
                  items={["Postventa Inteligente", "Panel de Soporte", "Proyecciones ML avanzadas"]}
                  status="planned"
                />
                <RoadmapItem
                  quarter="Q3 2025"
                  items={["Multi-marketplace", "Análisis de competencia", "Integraciones avanzadas"]}
                  status="future"
                />
              </div>
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

function ComingSoonCard({ title, description, icon: Icon, status, eta, features }: {
  title: string;
  description: string;
  icon: React.ElementType;
  status: string;
  eta: string;
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
          <div className="flex gap-2">
            <span className={`px-2 py-1 text-xs rounded-full ${statusColors[status as keyof typeof statusColors] || 'bg-gray-100 text-gray-800'}`}>
              {status}
            </span>
            <span className="px-2 py-1 text-xs rounded-full bg-purple-100 text-purple-800">
              {eta}
            </span>
          </div>
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

function RoadmapItem({ quarter, items, status }: {
  quarter: string;
  items: string[];
  status: 'in-progress' | 'planned' | 'future';
}) {
  const statusConfig = {
    'in-progress': { bg: 'bg-green-500', border: 'border-green-500', text: 'text-green-700' },
    'planned': { bg: 'bg-blue-500', border: 'border-blue-500', text: 'text-blue-700' },
    'future': { bg: 'bg-gray-300', border: 'border-gray-300', text: 'text-gray-500' },
  };

  const config = statusConfig[status];

  return (
    <div className="flex gap-4">
      <div className="flex flex-col items-center">
        <div className={`w-4 h-4 rounded-full ${config.bg}`} />
        <div className={`w-0.5 flex-1 ${config.bg} opacity-30`} />
      </div>
      <div className="pb-6">
        <p className={`font-semibold ${config.text}`}>{quarter}</p>
        <div className="mt-2 space-y-1">
          {items.map((item, i) => (
            <p key={i} className="text-sm text-gray-600">• {item}</p>
          ))}
        </div>
      </div>
    </div>
  );
}
// Deploy trigger: 2025-12-19T02:00:00Z
