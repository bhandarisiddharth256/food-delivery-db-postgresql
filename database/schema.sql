CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    name TEXT NOT NULL,
    
    email TEXT UNIQUE NOT NULL,
    
    phone TEXT UNIQUE NOT NULL,
    
    password_hash TEXT NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE addresses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    
    address_line TEXT NOT NULL,
    
    city TEXT NOT NULL,
    
    state TEXT NOT NULL,
    
    pincode TEXT NOT NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE restaurants (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    name TEXT NOT NULL,
    
    phone TEXT UNIQUE,
    
    address TEXT NOT NULL,
    
    rating NUMERIC(2,1) DEFAULT 0,
    
    status restaurant_status DEFAULT 'open',
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE restaurant_categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    name TEXT UNIQUE NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE restaurant_category_mapping (
    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,
    
    category_id UUID REFERENCES restaurant_categories(id) ON DELETE CASCADE,
    
    PRIMARY KEY (restaurant_id, category_id)
);

CREATE TABLE menu_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,

    name TEXT NOT NULL,

    description TEXT,

    price NUMERIC(10,2) NOT NULL CHECK (price > 0),

    category TEXT,

    is_available BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    user_id UUID REFERENCES users(id) ON DELETE CASCADE,

    restaurant_id UUID REFERENCES restaurants(id) ON DELETE CASCADE,

    address_id UUID REFERENCES addresses(id),

    status order_status DEFAULT 'pending',

    total_amount NUMERIC(10,2) NOT NULL CHECK (total_amount >= 0),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,

    menu_item_id UUID REFERENCES menu_items(id),

    quantity INTEGER NOT NULL CHECK (quantity > 0),

    price NUMERIC(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE payments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,

    amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),

    payment_method payment_method NOT NULL,

    payment_status payment_status DEFAULT 'pending',

    transaction_id TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_status_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,

    status order_status NOT NULL,

    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE delivery_partners (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    name TEXT NOT NULL,

    phone TEXT UNIQUE NOT NULL,

    vehicle_number TEXT UNIQUE,

    is_available BOOLEAN DEFAULT TRUE,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deliveries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),

    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,

    delivery_partner_id UUID REFERENCES delivery_partners(id),

    status delivery_status DEFAULT 'assigned',

    pickup_time TIMESTAMP,

    delivered_time TIMESTAMP,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

