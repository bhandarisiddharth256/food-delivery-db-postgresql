CREATE INDEX idx_orders_user_id ON orders(user_id);

CREATE INDEX idx_orders_restaurant_id ON orders(restaurant_id);

CREATE INDEX idx_menu_items_restaurant_id ON menu_items(restaurant_id);

CREATE INDEX idx_order_items_order_id ON order_items(order_id);

CREATE INDEX idx_deliveries_partner ON deliveries(delivery_partner_id);

CREATE INDEX idx_reviews_restaurant ON reviews(restaurant_id);

CREATE INDEX idx_order_status_history ON order_status_history(order_id);

CREATE INDEX idx_user_orders ON orders(user_id, created_at DESC);