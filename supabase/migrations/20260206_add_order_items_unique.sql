-- Add uniqueness guarantee for order_items so upserts are truly idempotent.
-- The API code uses onConflict: 'order_id,ml_item_id'. That requires a UNIQUE
-- constraint or UNIQUE index on (order_id, ml_item_id).

-- 1) Best-effort dedupe (keep one arbitrary row per (order_id, ml_item_id)).
-- If there are no duplicates, this is a no-op.
DELETE FROM order_items a
USING order_items b
WHERE a.order_id = b.order_id
  AND a.ml_item_id = b.ml_item_id
  AND a.ctid < b.ctid;

-- 2) Create unique index (safe for existing rows after dedupe).
CREATE UNIQUE INDEX IF NOT EXISTS order_items_order_id_ml_item_id_uq
  ON order_items(order_id, ml_item_id);

