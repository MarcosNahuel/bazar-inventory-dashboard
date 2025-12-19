-- =====================================================
-- BAZAR Importaciones - Schema Supabase
-- Sincronizacion dinamica con Mercado Libre API
-- =====================================================

-- Habilitar extensiones necesarias
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- 1. TABLA DE PRODUCTOS (sincronizada con ML)
-- =====================================================
CREATE TABLE IF NOT EXISTS products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  ml_id TEXT UNIQUE NOT NULL,                    -- ID de Mercado Libre (MLCxxxxxxxx)
  sku TEXT,                                       -- SKU interno
  title TEXT NOT NULL,
  price DECIMAL(12,2) DEFAULT 0,
  cost DECIMAL(12,2) DEFAULT 0,                  -- Costo unitario (manual)
  commission_rate DECIMAL(5,4) DEFAULT 0.13,     -- Comision ML (13%)

  -- Stock por ubicacion
  stock_full INTEGER DEFAULT 0,
  stock_flex INTEGER DEFAULT 0,
  stock_total INTEGER DEFAULT 0,

  -- Ventas
  sales_30d INTEGER DEFAULT 0,
  sales_60d INTEGER DEFAULT 0,
  sales_full_30d INTEGER DEFAULT 0,
  sales_flex_30d INTEGER DEFAULT 0,

  -- Metricas calculadas
  margin DECIMAL(12,2) GENERATED ALWAYS AS (price - cost - (price * commission_rate)) STORED,
  valuation DECIMAL(14,2) GENERATED ALWAYS AS (stock_total * cost) STORED,
  days_of_stock DECIMAL(6,1) GENERATED ALWAYS AS (
    CASE WHEN sales_30d > 0 THEN (stock_total * 30.0 / sales_30d) ELSE 999 END
  ) STORED,
  roi DECIMAL(8,4) GENERATED ALWAYS AS (
    CASE WHEN cost > 0 THEN ((price - cost - (price * commission_rate)) / cost) ELSE 0 END
  ) STORED,

  -- Metadata
  supplier TEXT,
  category_id TEXT,
  status TEXT DEFAULT 'active',                  -- active, paused, closed
  logistic_type TEXT,                            -- fulfillment, flex, xd_drop_off
  permalink TEXT,
  thumbnail TEXT,
  supermarket BOOLEAN DEFAULT FALSE,

  -- Timestamps
  ml_created_at TIMESTAMPTZ,
  ml_updated_at TIMESTAMPTZ,
  synced_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indices para busquedas rapidas
CREATE INDEX idx_products_ml_id ON products(ml_id);
CREATE INDEX idx_products_supplier ON products(supplier);
CREATE INDEX idx_products_status ON products(status);
CREATE INDEX idx_products_stock_total ON products(stock_total);
CREATE INDEX idx_products_days_of_stock ON products(days_of_stock);

-- =====================================================
-- 2. TABLA DE ORDENES (sincronizada con ML)
-- =====================================================
CREATE TABLE IF NOT EXISTS orders (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  ml_order_id BIGINT UNIQUE NOT NULL,
  status TEXT NOT NULL,                          -- paid, cancelled, etc.

  -- Comprador
  buyer_id BIGINT,
  buyer_nickname TEXT,

  -- Totales
  total_amount DECIMAL(12,2),
  currency_id TEXT DEFAULT 'CLP',

  -- Envio
  shipping_id BIGINT,
  shipping_status TEXT,
  logistic_type TEXT,

  -- Timestamps ML
  date_created TIMESTAMPTZ,
  date_closed TIMESTAMPTZ,

  -- Timestamps internos
  synced_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_orders_ml_order_id ON orders(ml_order_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_date_created ON orders(date_created);

-- =====================================================
-- 3. TABLA DE ITEMS DE ORDEN
-- =====================================================
CREATE TABLE IF NOT EXISTS order_items (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  ml_item_id TEXT NOT NULL,                      -- ID del producto en ML
  product_id UUID REFERENCES products(id),

  title TEXT,
  sku TEXT,
  quantity INTEGER DEFAULT 1,
  unit_price DECIMAL(12,2),

  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_ml_item_id ON order_items(ml_item_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- =====================================================
-- 4. TABLA DE PROVEEDORES
-- =====================================================
CREATE TABLE IF NOT EXISTS suppliers (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT UNIQUE NOT NULL,
  contact_name TEXT,
  email TEXT,
  phone TEXT,
  notes TEXT,

  -- Metricas agregadas (calculadas por trigger)
  total_products INTEGER DEFAULT 0,
  total_stock INTEGER DEFAULT 0,
  total_valuation DECIMAL(14,2) DEFAULT 0,
  total_sales_30d INTEGER DEFAULT 0,

  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_suppliers_name ON suppliers(name);

-- =====================================================
-- 5. TABLA DE HISTORIAL DE COSTOS
-- =====================================================
CREATE TABLE IF NOT EXISTS cost_history (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  ml_id TEXT NOT NULL,

  old_cost DECIMAL(12,2),
  new_cost DECIMAL(12,2) NOT NULL,
  changed_by TEXT,                               -- 'manual', 'bulk_upload', 'api'

  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_cost_history_product_id ON cost_history(product_id);
CREATE INDEX idx_cost_history_ml_id ON cost_history(ml_id);
CREATE INDEX idx_cost_history_created_at ON cost_history(created_at);

-- =====================================================
-- 6. TABLA DE ALERTAS
-- =====================================================
CREATE TABLE IF NOT EXISTS alerts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  product_id UUID REFERENCES products(id) ON DELETE CASCADE,
  ml_id TEXT NOT NULL,

  type TEXT NOT NULL,                            -- 'low_stock', 'out_of_stock', 'negative_margin'
  severity TEXT DEFAULT 'warning',               -- 'critical', 'warning', 'info'
  message TEXT,

  -- Estado de notificacion
  notified BOOLEAN DEFAULT FALSE,
  notified_at TIMESTAMPTZ,
  notified_via TEXT,                             -- 'email', 'webhook', 'both'

  -- Resolucion
  resolved BOOLEAN DEFAULT FALSE,
  resolved_at TIMESTAMPTZ,

  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_alerts_product_id ON alerts(product_id);
CREATE INDEX idx_alerts_type ON alerts(type);
CREATE INDEX idx_alerts_notified ON alerts(notified);
CREATE INDEX idx_alerts_resolved ON alerts(resolved);

-- =====================================================
-- 7. TABLA DE TOKENS ML (para refresh automatico)
-- =====================================================
CREATE TABLE IF NOT EXISTS ml_tokens (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id TEXT UNIQUE NOT NULL,                  -- ML User ID
  access_token TEXT NOT NULL,
  refresh_token TEXT NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,

  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- 8. TABLA DE SYNC LOG
-- =====================================================
CREATE TABLE IF NOT EXISTS sync_logs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  sync_type TEXT NOT NULL,                       -- 'products', 'orders', 'stock', 'full'
  status TEXT NOT NULL,                          -- 'started', 'completed', 'failed'

  items_processed INTEGER DEFAULT 0,
  items_created INTEGER DEFAULT 0,
  items_updated INTEGER DEFAULT 0,
  items_failed INTEGER DEFAULT 0,

  error_message TEXT,
  duration_ms INTEGER,

  started_at TIMESTAMPTZ DEFAULT NOW(),
  completed_at TIMESTAMPTZ
);

CREATE INDEX idx_sync_logs_sync_type ON sync_logs(sync_type);
CREATE INDEX idx_sync_logs_status ON sync_logs(status);
CREATE INDEX idx_sync_logs_started_at ON sync_logs(started_at);

-- =====================================================
-- 9. TABLA DE CONFIGURACION
-- =====================================================
CREATE TABLE IF NOT EXISTS config (
  key TEXT PRIMARY KEY,
  value JSONB NOT NULL,
  description TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insertar configuracion inicial
INSERT INTO config (key, value, description) VALUES
  ('stock_alert_threshold', '5', 'Umbral de stock bajo para alertas'),
  ('commission_rate', '0.13', 'Comision ML por defecto (13%)'),
  ('sync_interval_minutes', '30', 'Intervalo de sincronizacion automatica'),
  ('webhook_url', 'null', 'URL del webhook n8n para alertas'),
  ('last_full_sync', 'null', 'Timestamp de ultima sincronizacion completa')
ON CONFLICT (key) DO NOTHING;

-- =====================================================
-- 10. FUNCIONES Y TRIGGERS
-- =====================================================

-- Funcion para actualizar updated_at automaticamente
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers para updated_at
CREATE TRIGGER update_products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_suppliers_updated_at
  BEFORE UPDATE ON suppliers
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_ml_tokens_updated_at
  BEFORE UPDATE ON ml_tokens
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

-- Funcion para crear alerta de stock bajo automaticamente
CREATE OR REPLACE FUNCTION check_low_stock()
RETURNS TRIGGER AS $$
DECLARE
  threshold INTEGER;
BEGIN
  -- Obtener umbral de configuracion
  SELECT (value::TEXT)::INTEGER INTO threshold
  FROM config WHERE key = 'stock_alert_threshold';

  threshold := COALESCE(threshold, 5);

  -- Si el stock es bajo y no hay alerta activa, crear una
  IF NEW.stock_total <= threshold AND NEW.status = 'active' THEN
    INSERT INTO alerts (product_id, ml_id, type, severity, message)
    SELECT
      NEW.id,
      NEW.ml_id,
      CASE
        WHEN NEW.stock_total = 0 THEN 'out_of_stock'
        ELSE 'low_stock'
      END,
      CASE
        WHEN NEW.stock_total <= 1 THEN 'critical'
        WHEN NEW.stock_total <= 3 THEN 'warning'
        ELSE 'info'
      END,
      'Stock bajo: ' || NEW.title || ' (' || NEW.stock_total || ' unidades)'
    WHERE NOT EXISTS (
      SELECT 1 FROM alerts
      WHERE product_id = NEW.id
        AND type IN ('low_stock', 'out_of_stock')
        AND resolved = FALSE
    );
  END IF;

  -- Si el stock se recupero, resolver alertas
  IF NEW.stock_total > threshold AND OLD.stock_total <= threshold THEN
    UPDATE alerts
    SET resolved = TRUE, resolved_at = NOW()
    WHERE product_id = NEW.id
      AND type IN ('low_stock', 'out_of_stock')
      AND resolved = FALSE;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_product_stock
  AFTER INSERT OR UPDATE OF stock_total ON products
  FOR EACH ROW EXECUTE FUNCTION check_low_stock();

-- Funcion para registrar cambios de costo
CREATE OR REPLACE FUNCTION log_cost_change()
RETURNS TRIGGER AS $$
BEGIN
  IF OLD.cost IS DISTINCT FROM NEW.cost THEN
    INSERT INTO cost_history (product_id, ml_id, old_cost, new_cost, changed_by)
    VALUES (NEW.id, NEW.ml_id, OLD.cost, NEW.cost, 'manual');
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_product_cost_change
  AFTER UPDATE OF cost ON products
  FOR EACH ROW EXECUTE FUNCTION log_cost_change();

-- =====================================================
-- 11. VISTAS UTILES
-- =====================================================

-- Vista de productos con stock critico
CREATE OR REPLACE VIEW v_critical_stock AS
SELECT
  p.id,
  p.ml_id,
  p.title,
  p.sku,
  p.supplier,
  p.stock_total,
  p.sales_30d,
  p.days_of_stock,
  p.price,
  p.cost,
  p.valuation,
  p.permalink,
  CASE
    WHEN p.stock_total = 0 THEN 'out_of_stock'
    WHEN p.stock_total <= 1 THEN 'critical'
    WHEN p.stock_total <= 3 THEN 'warning'
    WHEN p.stock_total <= 5 THEN 'low'
    ELSE 'normal'
  END as stock_status
FROM products p
WHERE p.status = 'active'
  AND p.stock_total <= 5
ORDER BY p.stock_total ASC, p.sales_30d DESC;

-- Vista de analisis Pareto
CREATE OR REPLACE VIEW v_pareto_analysis AS
WITH ranked_products AS (
  SELECT
    p.*,
    ROW_NUMBER() OVER (ORDER BY sales_30d DESC) as rank,
    SUM(sales_30d) OVER () as total_sales,
    SUM(sales_30d) OVER (ORDER BY sales_30d DESC) as cumulative_sales,
    COUNT(*) OVER () as total_products
  FROM products p
  WHERE p.status = 'active' AND p.sales_30d > 0
)
SELECT
  *,
  ROUND((cumulative_sales * 100.0 / NULLIF(total_sales, 0))::NUMERIC, 2) as cumulative_percentage,
  CASE
    WHEN rank <= (total_products * 0.2) THEN 'top_20'
    WHEN rank <= (total_products * 0.5) THEN 'middle_30'
    ELSE 'bottom_50'
  END as pareto_category
FROM ranked_products;

-- Vista de resumen por proveedor
CREATE OR REPLACE VIEW v_supplier_summary AS
SELECT
  supplier,
  COUNT(*) as total_products,
  SUM(stock_total) as total_stock,
  SUM(valuation) as total_valuation,
  SUM(sales_30d) as total_sales_30d,
  ROUND(AVG(margin)::NUMERIC, 2) as avg_margin,
  ROUND(AVG(roi * 100)::NUMERIC, 2) as avg_roi_percent,
  COUNT(*) FILTER (WHERE stock_total <= 5) as low_stock_count
FROM products
WHERE status = 'active' AND supplier IS NOT NULL
GROUP BY supplier
ORDER BY total_valuation DESC;

-- Vista de alertas pendientes
CREATE OR REPLACE VIEW v_pending_alerts AS
SELECT
  a.id,
  a.type,
  a.severity,
  a.message,
  a.created_at,
  p.ml_id,
  p.title,
  p.stock_total,
  p.price,
  p.permalink
FROM alerts a
JOIN products p ON a.product_id = p.id
WHERE a.resolved = FALSE AND a.notified = FALSE
ORDER BY
  CASE a.severity
    WHEN 'critical' THEN 1
    WHEN 'warning' THEN 2
    ELSE 3
  END,
  a.created_at DESC;

-- =====================================================
-- 12. ROW LEVEL SECURITY (RLS)
-- =====================================================

-- Habilitar RLS
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE suppliers ENABLE ROW LEVEL SECURITY;
ALTER TABLE alerts ENABLE ROW LEVEL SECURITY;
ALTER TABLE cost_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE ml_tokens ENABLE ROW LEVEL SECURITY;
ALTER TABLE sync_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE config ENABLE ROW LEVEL SECURITY;

-- Politicas para lectura publica (anon)
CREATE POLICY "Allow anon read products" ON products FOR SELECT TO anon USING (true);
CREATE POLICY "Allow anon read suppliers" ON suppliers FOR SELECT TO anon USING (true);
CREATE POLICY "Allow anon read alerts" ON alerts FOR SELECT TO anon USING (true);

-- Politicas para service_role (escritura completa)
CREATE POLICY "Allow service_role all on products" ON products FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on orders" ON orders FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on order_items" ON order_items FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on suppliers" ON suppliers FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on alerts" ON alerts FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on cost_history" ON cost_history FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on ml_tokens" ON ml_tokens FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on sync_logs" ON sync_logs FOR ALL TO service_role USING (true);
CREATE POLICY "Allow service_role all on config" ON config FOR ALL TO service_role USING (true);

-- =====================================================
-- FIN DEL SCHEMA
-- =====================================================
