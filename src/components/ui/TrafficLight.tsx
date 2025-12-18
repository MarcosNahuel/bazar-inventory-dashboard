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
  threshold?: number;
  showLabel?: boolean;
}

export function StockStatusIndicator({
  stock,
  threshold = 5,
  showLabel = true
}: StockStatusIndicatorProps) {
  let status: 'red' | 'yellow' | 'green';
  let label: string;

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

  return (
    <TrafficLight
      status={status}
      label={showLabel ? label : undefined}
      pulse={status === 'red'}
    />
  );
}
