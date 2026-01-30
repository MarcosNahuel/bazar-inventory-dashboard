'use client';

import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  Legend,
  LineChart,
  Line,
} from 'recharts';

interface SalesData {
  name: string;
  value: number;
  color?: string;
}

interface ChannelChartProps {
  data: {
    full: number;
    flex: number;
    centro: number;
  };
}

const COLORS = ['#3B82F6', '#10B981', '#F59E0B', '#EF4444'];

export function ChannelDistributionChart({ data }: ChannelChartProps) {
  const chartData = [
    { name: 'FULL', value: data.full, color: '#3B82F6' },
    { name: 'FLEX', value: data.flex, color: '#10B981' },
    { name: 'Centro', value: data.centro, color: '#F59E0B' },
  ].filter(d => d.value > 0);

  const total = chartData.reduce((sum, d) => sum + d.value, 0);

  return (
    <div className="h-64">
      <ResponsiveContainer width="100%" height="100%">
        <PieChart>
          <Pie
            data={chartData}
            cx="50%"
            cy="50%"
            innerRadius={60}
            outerRadius={80}
            paddingAngle={5}
            dataKey="value"
            label={({ name, percent }) => `${name} ${((percent ?? 0) * 100).toFixed(0)}%`}
          >
            {chartData.map((entry, index) => (
              <Cell key={`cell-${index}`} fill={entry.color} />
            ))}
          </Pie>
          <Tooltip
            formatter={(value) => [
              `${value} ventas (${((Number(value) / total) * 100).toFixed(1)}%)`,
              ''
            ]}
          />
          <Legend />
        </PieChart>
      </ResponsiveContainer>
    </div>
  );
}

interface StockDistributionProps {
  data: {
    critical: number;
    warning: number;
    low: number;
    normal: number;
  };
}

export function StockDistributionChart({ data }: StockDistributionProps) {
  const chartData = [
    { name: 'Crítico (≤1)', value: data.critical, color: '#EF4444' },
    { name: 'Alerta (2-3)', value: data.warning, color: '#F59E0B' },
    { name: 'Bajo (4-5)', value: data.low, color: '#3B82F6' },
    { name: 'Normal (>5)', value: data.normal, color: '#10B981' },
  ];

  return (
    <div className="h-64">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={chartData} layout="vertical">
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis type="number" />
          <YAxis dataKey="name" type="category" width={100} tick={{ fontSize: 12 }} />
          <Tooltip />
          <Bar dataKey="value" radius={[0, 4, 4, 0]}>
            {chartData.map((entry, index) => (
              <Cell key={`cell-${index}`} fill={entry.color} />
            ))}
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

interface TopProductsProps {
  products: Array<{
    name: string;
    sales: number;
    revenue: number;
  }>;
}

export function TopProductsChart({ products }: TopProductsProps) {
  const data = products.slice(0, 10).map(p => ({
    name: p.name.length > 20 ? p.name.substring(0, 20) + '...' : p.name,
    ventas: p.sales,
    ingresos: p.revenue,
  }));

  return (
    <div className="h-80">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={data} layout="vertical">
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis type="number" />
          <YAxis dataKey="name" type="category" width={150} tick={{ fontSize: 11 }} />
          <Tooltip
            formatter={(value, name) => [
              name === 'ingresos' ? `$${Number(value).toLocaleString()}` : value,
              name === 'ingresos' ? 'Ingresos' : 'Ventas'
            ]}
          />
          <Legend />
          <Bar dataKey="ventas" fill="#3B82F6" name="Ventas" radius={[0, 4, 4, 0]} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

interface ProfitabilityData {
  titulo?: string;
  producto?: string;
  rentabilidad?: number;
  utilidad?: number;
  margen?: number;
  roi?: number;
  costo?: number;
  precio?: number;
}

interface ProfitabilityChartProps {
  data: ProfitabilityData[];
}

export function ProfitabilityChart({ data }: ProfitabilityChartProps) {
  const chartData = data.slice(0, 10).map(p => {
    const name = p.titulo || p.producto || '';
    return {
      name: name.length > 15 ? name.substring(0, 15) + '...' : name,
      margen: p.utilidad ?? p.margen ?? 0,
      roi: p.rentabilidad ?? p.roi ?? 0,
    };
  });

  return (
    <div className="h-64">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" tick={{ fontSize: 10 }} angle={-45} textAnchor="end" height={80} />
          <YAxis yAxisId="left" orientation="left" stroke="#10B981" />
          <YAxis yAxisId="right" orientation="right" stroke="#3B82F6" />
          <Tooltip
            formatter={(value, name) => [
              name === 'margen' ? `$${Number(value).toLocaleString()}` : `${Number(value).toFixed(1)}%`,
              name === 'margen' ? 'Margen' : 'ROI'
            ]}
          />
          <Legend />
          <Bar yAxisId="left" dataKey="margen" fill="#10B981" name="Margen ($)" radius={[4, 4, 0, 0]} />
          <Bar yAxisId="right" dataKey="roi" fill="#3B82F6" name="ROI (%)" radius={[4, 4, 0, 0]} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

// Gráfico de Tendencia Diaria para Monitor
interface DailyTrendData {
  date: string;
  ventas_count: number;
  facturacion: number;
  comisiones: number;
  costos_envio: number;
  costo_productos: number;
  utilidad: number;
}

interface DailyTrendChartProps {
  data: DailyTrendData[];
}

export function DailyTrendChart({ data }: DailyTrendChartProps) {
  // Preparar datos para el gráfico (ordenar por fecha)
  const chartData = [...data].reverse().map(d => ({
    fecha: d.date.substring(5), // Solo MM-DD
    facturacion: d.facturacion,
    costos: d.comisiones + d.costos_envio + d.costo_productos,
    utilidad: d.utilidad,
  }));

  return (
    <div className="h-72">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis
            dataKey="fecha"
            tick={{ fontSize: 10 }}
            angle={-45}
            textAnchor="end"
            height={50}
          />
          <YAxis
            tick={{ fontSize: 10 }}
            tickFormatter={(value) => `$${(value / 1000).toFixed(0)}K`}
          />
          <Tooltip
            formatter={(value, name) => [
              `$${Number(value || 0).toLocaleString()}`,
              name === 'facturacion' ? 'Facturación' :
              name === 'costos' ? 'Costos Totales' : 'Utilidad'
            ]}
            labelFormatter={(label) => `Fecha: ${label}`}
          />
          <Legend
            formatter={(value) =>
              value === 'facturacion' ? 'Facturación' :
              value === 'costos' ? 'Costos Totales' : 'Utilidad'
            }
          />
          <Line
            type="monotone"
            dataKey="facturacion"
            stroke="#3B82F6"
            strokeWidth={2}
            dot={{ r: 3 }}
          />
          <Line
            type="monotone"
            dataKey="costos"
            stroke="#EF4444"
            strokeWidth={2}
            dot={{ r: 3 }}
          />
          <Line
            type="monotone"
            dataKey="utilidad"
            stroke="#10B981"
            strokeWidth={2}
            dot={{ r: 3 }}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}

// Gráfico de Barras de Facturación Acumulada
export function DailyBillingChart({ data }: DailyTrendChartProps) {
  // Preparar datos con acumulado
  let acumulado = 0;
  const chartData = [...data].reverse().map(d => {
    acumulado += d.facturacion;
    return {
      fecha: d.date.substring(5), // Solo MM-DD
      facturacion: d.facturacion,
      acumulado: acumulado,
    };
  });

  return (
    <div className="h-72">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis
            dataKey="fecha"
            tick={{ fontSize: 10 }}
            angle={-45}
            textAnchor="end"
            height={50}
          />
          <YAxis
            yAxisId="left"
            orientation="left"
            tick={{ fontSize: 10 }}
            tickFormatter={(value) => `$${(value / 1000).toFixed(0)}K`}
          />
          <YAxis
            yAxisId="right"
            orientation="right"
            tick={{ fontSize: 10 }}
            tickFormatter={(value) => `$${(value / 1000000).toFixed(1)}M`}
          />
          <Tooltip
            formatter={(value, name) => [
              `$${Number(value || 0).toLocaleString()}`,
              name === 'facturacion' ? 'Facturación Diaria' : 'Acumulado'
            ]}
            labelFormatter={(label) => `Fecha: ${label}`}
          />
          <Legend
            formatter={(value) =>
              value === 'facturacion' ? 'Facturación Diaria' : 'Acumulado'
            }
          />
          <Bar yAxisId="left" dataKey="facturacion" fill="#3B82F6" radius={[4, 4, 0, 0]} />
          <Line yAxisId="right" type="monotone" dataKey="acumulado" stroke="#10B981" strokeWidth={2} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

// Gráfico de Serie Histórica Mensual
interface MonthlySeriesData {
  month: string;
  month_num: number;
  year: number;
  revenue: number;
  orders_count: number;
  units_sold: number;
  avg_ticket: number;
}

interface MonthlySeriesChartProps {
  data: MonthlySeriesData[];
}

export function MonthlyRevenueChart({ data }: MonthlySeriesChartProps) {
  // Preparar datos (ordenados cronológicamente)
  const chartData = [...data].reverse().map(d => ({
    mes: d.month.substring(0, 3) + ' ' + d.year.toString().slice(-2), // "Ene 26"
    facturacion: d.revenue,
    ordenes: d.orders_count,
    unidades: d.units_sold,
  }));

  return (
    <div className="h-72">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis
            dataKey="mes"
            tick={{ fontSize: 10 }}
          />
          <YAxis
            yAxisId="left"
            orientation="left"
            tick={{ fontSize: 10 }}
            tickFormatter={(value) => `$${(value / 1000000).toFixed(1)}M`}
          />
          <YAxis
            yAxisId="right"
            orientation="right"
            tick={{ fontSize: 10 }}
            tickFormatter={(value) => `${value}`}
          />
          <Tooltip
            formatter={(value, name) => [
              name === 'facturacion' ? `$${Number(value || 0).toLocaleString()}` : Number(value || 0).toLocaleString(),
              name === 'facturacion' ? 'Facturación' :
              name === 'ordenes' ? 'Órdenes' : 'Unidades'
            ]}
          />
          <Legend
            formatter={(value) =>
              value === 'facturacion' ? 'Facturación' :
              value === 'ordenes' ? 'Órdenes' : 'Unidades'
            }
          />
          <Bar yAxisId="left" dataKey="facturacion" fill="#3B82F6" radius={[4, 4, 0, 0]} />
          <Line yAxisId="right" type="monotone" dataKey="ordenes" stroke="#10B981" strokeWidth={2} dot={{ r: 3 }} />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
}

// Gráfico de Comparación Año a Año
export function YearOverYearChart({ data }: MonthlySeriesChartProps) {
  // Agrupar por mes y año
  const monthNames = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
  const years = [...new Set(data.map(d => d.year))].sort();

  // Crear datos comparativos por mes
  const chartData = monthNames.map((mes, idx) => {
    const monthNum = idx + 1;
    const result: Record<string, string | number> = { mes };
    years.forEach(year => {
      const monthData = data.find(d => d.month_num === monthNum && d.year === year);
      result[`rev_${year}`] = monthData?.revenue || 0;
    });
    return result;
  });

  const colors = ['#CBD5E1', '#94A3B8', '#3B82F6', '#10B981'];

  return (
    <div className="h-72">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={chartData}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="mes" tick={{ fontSize: 10 }} />
          <YAxis
            tick={{ fontSize: 10 }}
            tickFormatter={(value) => `$${(value / 1000000).toFixed(1)}M`}
          />
          <Tooltip
            formatter={(value) => [`$${Number(value || 0).toLocaleString()}`, '']}
          />
          <Legend />
          {years.map((year, idx) => (
            <Line
              key={year}
              type="monotone"
              dataKey={`rev_${year}`}
              name={year.toString()}
              stroke={colors[idx % colors.length]}
              strokeWidth={idx === years.length - 1 ? 3 : 1.5}
              dot={{ r: idx === years.length - 1 ? 4 : 2 }}
            />
          ))}
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}
