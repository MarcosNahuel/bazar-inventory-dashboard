'use client';

interface TrafficLightProps {
  status: 'red' | 'yellow' | 'green';
  size?: 'sm' | 'md' | 'lg';
  label?: string;
  pulse?: boolean;
}

export function TrafficLight({ status, size = 'md', label, pulse = false }: TrafficLightProps) {
  const sizeClasses = {
    sm: 'w-3 h-3',
    md: 'w-4 h-4',
    lg: 'w-6 h-6',
  };

  const colorClasses = {
    red: 'bg-red-500',
    yellow: 'bg-yellow-500',
    green: 'bg-green-500',
  };

  const glowClasses = {
    red: 'shadow-red-500/50',
    yellow: 'shadow-yellow-500/50',
    green: 'shadow-green-500/50',
  };

  return (
    <div className="flex items-center gap-2">
      <div
        className={`
          ${sizeClasses[size]}
          ${colorClasses[status]}
          ${glowClasses[status]}
          rounded-full shadow-lg
          ${pulse ? 'animate-pulse' : ''}
        `}
      />
      {label && <span className="text-sm text-gray-600">{label}</span>}
    </div>
  );
}

interface StockStatusIndicatorProps {
  stock: number;
  ventas30d?: number; // NUEVO: Ventas de los últimos 30 días
  threshold?: number; // Deprecated: solo para retrocompatibilidad
  showLabel?: boolean;
  statusOverride?: 'healthy' | 'warning' | 'critical' | 'out_of_stock' | 'overstocked';
}

export function StockStatusIndicator({
  stock,
  ventas30d,
  threshold = 5,
  showLabel = true,
  statusOverride
}: StockStatusIndicatorProps) {
  let status: 'red' | 'yellow' | 'green';
  let label: string;

  // Si hay un override de estado, usarlo directamente
  if (statusOverride) {
    switch (statusOverride) {
      case 'critical':
        status = 'red';
        label = 'Crítico';
        break;
      case 'warning':
        status = 'yellow';
        label = 'Alerta';
        break;
      case 'out_of_stock':
        status = 'red';
        label = 'Sin Stock';
        break;
      case 'overstocked':
        status = 'yellow';
        label = 'Sobrestock';
        break;
      default:
        status = 'green';
        label = 'Saludable';
    }
  }
  // NUEVO CRITERIO: Stock >= Ventas30D = Saludable
  else if (ventas30d !== undefined) {
    if (stock === 0) {
      status = 'red';
      label = 'Sin Stock';
    } else if (stock >= ventas30d) {
      status = 'green';
      label = 'Saludable';
    } else if (stock >= ventas30d * 0.5) {
      status = 'yellow';
      label = 'Alerta';
    } else {
      status = 'red';
      label = 'Crítico';
    }
  }
  // Fallback al comportamiento anterior (para retrocompatibilidad)
  else {
    if (stock <= 1) {
      status = 'red';
      label = 'Crítico';
    } else if (stock <= threshold) {
      status = 'yellow';
      label = 'Bajo';
    } else {
      status = 'green';
      label = 'Normal';
    }
  }

  return (
    <TrafficLight
      status={status}
      label={showLabel ? label : undefined}
      pulse={status === 'red'}
    />
  );
}
