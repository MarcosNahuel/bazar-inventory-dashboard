// Producto de Mercado Libre
export interface MLProduct {
  id: string;
  title: string;
  sku: string | null;
  price: number;
  currency_id: string;
  available_quantity: number;
  status: 'active' | 'paused' | 'closed' | 'under_review';
  permalink: string;
  thumbnail: string;
  logistic_type: string | null;
  category_id: string;
  date_created: string;
  last_updated: string;
}

// Stock por ubicación
export interface StockLocation {
  type: 'fulfillment' | 'flex' | 'default';
  quantity: number;
  name?: string;
}

// Producto con información extendida
export interface Product {
  id: string;
  codigo_ml: string;
  sku: string;
  titulo: string;
  precio: number;
  stock_full: number;
  stock_flex: number;
  stock_total: number;
  costo: number;
  valorizacion: number;
  ventas_30: number;
  ventas_60: number;
  margen: number;
  roi: number;
  status: string;
  proveedor: string | null;
  permalink: string;
  thumbnail: string;
  supermarket: boolean;
  updated_at: string;
}

// Orden de Mercado Libre
export interface MLOrder {
  id: number;
  status: string;
  date_created: string;
  date_closed: string;
  total_amount: number;
  currency_id: string;
  buyer: {
    id: number;
    nickname: string;
  };
  order_items: {
    item: {
      id: string;
      title: string;
      seller_sku: string | null;
    };
    quantity: number;
    unit_price: number;
  }[];
  shipping: {
    id: number;
    status: string;
  };
}

// Estadísticas del dashboard
export interface DashboardStats {
  total_productos: number;
  stock_total: number;
  productos_criticos: number;
  valorizacion_total: number;
  ventas_30_dias: number;
  ventas_60_dias: number;
  ordenes_30_dias: number;
  ingresos_30_dias: number;
}

// Alerta de stock bajo
export interface StockAlert {
  id: string;
  product_id: string;
  product_title: string;
  sku: string;
  current_stock: number;
  threshold: number;
  created_at: string;
  notified: boolean;
}

// Respuesta de API ML
export interface MLApiResponse<T> {
  data: T;
  paging?: {
    total: number;
    offset: number;
    limit: number;
  };
}

// Configuración de tokens
export interface TokenConfig {
  access_token: string;
  refresh_token: string;
  expires_at: number;
}

// Ventas por período
export interface SalesSummary {
  period: string;
  total_orders: number;
  total_units: number;
  total_amount: number;
  by_channel: {
    full: number;
    flex: number;
    centro: number;
  };
}

// Proveedor
export interface Supplier {
  id: string;
  name: string;
  contact_email: string | null;
  phone: string | null;
  products_count: number;
  created_at: string;
}

// Database types (Supabase)
export interface Database {
  public: {
    Tables: {
      productos: {
        Row: Product;
        Insert: Omit<Product, 'id' | 'updated_at'>;
        Update: Partial<Omit<Product, 'id'>>;
      };
      alertas: {
        Row: StockAlert;
        Insert: Omit<StockAlert, 'id' | 'created_at'>;
        Update: Partial<Omit<StockAlert, 'id' | 'created_at'>>;
      };
      tokens: {
        Row: TokenConfig & { id: string; updated_at: string };
        Insert: TokenConfig;
        Update: Partial<TokenConfig>;
      };
      proveedores: {
        Row: Supplier;
        Insert: Omit<Supplier, 'id' | 'created_at' | 'products_count'>;
        Update: Partial<Omit<Supplier, 'id' | 'created_at'>>;
      };
    };
  };
}
