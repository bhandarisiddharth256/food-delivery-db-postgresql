-- Order Status ENUM
CREATE TYPE order_status AS ENUM (
    'pending',
    'confirmed',
    'preparing',
    'ready_for_pickup',
    'out_for_delivery',
    'delivered',
    'cancelled'
);

-- Payment Status ENUM
CREATE TYPE payment_status AS ENUM (
    'pending',
    'completed',
    'failed',
    'refunded'
);

-- Payment Method ENUM
CREATE TYPE payment_method AS ENUM (
    'cash',
    'card',
    'upi',
    'wallet'
);

-- Delivery Status ENUM
CREATE TYPE delivery_status AS ENUM (
    'assigned',
    'picked_up',
    'on_the_way',
    'delivered',
    'failed'
);

-- Restaurant Status
CREATE TYPE restaurant_status AS ENUM (
    'open',
    'closed',
    'temporarily_unavailable'
);