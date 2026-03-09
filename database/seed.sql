INSERT INTO restaurant_categories (id, name) VALUES
(1, 'Pizza'),
(2, 'Indian'),
(3, 'Chinese'),
(4, 'Fast Food'),
(5, 'Desserts');

INSERT INTO users (id, name, email, phone, password_hash) VALUES
(1, 'Siddharth Bhandari', 'sid@example.com', '9876543210', 'hashed_pass_1'),
(2, 'Rahul Sharma', 'rahul@example.com', '9876543211', 'hashed_pass_2'),
(3, 'Ananya Verma', 'ananya@example.com', '9876543212', 'hashed_pass_3');

INSERT INTO addresses (id, user_id, address_line, city, state, pincode) VALUES
(1, 1, 'Street 10, Sector 5', 'Raipur', 'Chhattisgarh', '492001'),
(2, 2, 'Pandri Market', 'Raipur', 'Chhattisgarh', '492004'),
(3, 3, 'GE Road', 'Raipur', 'Chhattisgarh', '492002');

INSERT INTO restaurants (id, name, phone, address, rating, status) VALUES
(1, 'Pizza Hut', '9000000001', 'City Mall Raipur', 4.2, 'open'),
(2, 'Dominos', '9000000002', 'Pandri Market Raipur', 4.5, 'open'),
(3, 'Biryani House', '9000000003', 'GE Road Raipur', 4.3, 'open');

INSERT INTO restaurant_category_mapping (restaurant_id, category_id) VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 4),
(3, 2);

INSERT INTO menu_items (id, restaurant_id, name, description, price, category) VALUES
(1, 1, 'Margherita Pizza', 'Classic cheese pizza', 299, 'Pizza'),
(2, 1, 'Veg Supreme Pizza', 'Loaded vegetable pizza', 399, 'Pizza'),
(3, 2, 'Farmhouse Pizza', 'Veg pizza with mushrooms and corn', 349, 'Pizza'),
(4, 3, 'Chicken Biryani', 'Hyderabadi style biryani', 249, 'Indian');

INSERT INTO delivery_partners (id, name, phone, vehicle_number) VALUES
(1, 'Amit Kumar', '9000000011', 'CG04AB1234'),
(2, 'Rohit Yadav', '9000000012', 'CG04CD5678');

INSERT INTO orders (id, user_id, restaurant_id, address_id, status, total_amount) VALUES
(1, 1, 1, 1, 'confirmed', 299),
(2, 2, 3, 2, 'preparing', 249);

INSERT INTO order_items (id, order_id, menu_item_id, quantity, price) VALUES
(1, 1, 1, 1, 299),
(2, 2, 4, 1, 249);

INSERT INTO payments (id, order_id, amount, payment_method, payment_status) VALUES
(1, 1, 299, 'upi', 'completed'),
(2, 2, 249, 'cash', 'pending');

INSERT INTO deliveries (id, order_id, delivery_partner_id, status) VALUES
(1, 1, 1, 'assigned'),
(2, 2, 2, 'assigned');

INSERT INTO reviews (id, user_id, restaurant_id, order_id, rating, comment) VALUES
(1, 1, 1, 1, 5, 'Great pizza and fast delivery!');

INSERT INTO coupons (id, code, discount_amount, min_order_value, expiry_date) VALUES
(1, 'WELCOME50', 50, 300, '2026-12-31'),
(2, 'SAVE100', 100, 500, '2026-12-31');