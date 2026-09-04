-- =========================
-- Users
-- =========================
INSERT INTO "User" (name, email, createdAt, updatedAt)
VALUES
    ('Alice Johnson', 'alice@example.com', '2026-08-20 08:00:00', '2026-08-20 08:00:00'),
    ('Bob Smith', 'bob@example.com', '2026-08-20 09:00:00', '2026-08-20 09:00:00'),
    ('Charlie Brown', 'charlie@example.com', '2026-08-21 10:00:00', '2026-08-21 10:00:00'),
    ('Diana Wilson', 'diana@example.com', '2026-08-21 11:00:00', '2026-08-21 11:00:00'),
    ('Ethan Davis', 'ethan@example.com', '2026-08-22 08:30:00', '2026-08-22 08:30:00'),
    ('Fiona Miller', 'fiona@example.com', '2026-08-22 09:15:00', '2026-08-22 09:15:00'),
    ('George Taylor', 'george@example.com', '2026-08-23 12:00:00', '2026-08-23 12:00:00'),
    ('Hannah Anderson', 'hannah@example.com', '2026-08-23 13:00:00', '2026-08-23 13:00:00'),
    ('Ian Thomas', 'ian@example.com', '2026-08-24 10:30:00', '2026-08-24 10:30:00'),
    ('Julia Martin', 'julia@example.com', '2026-08-24 11:00:00', '2026-08-24 11:00:00');

-- =========================
-- Categories
-- =========================
INSERT INTO "Category" (name, createdAt, updatedAt)
VALUES
    ('Electronics', '2026-08-20 07:00:00', '2026-08-20 07:00:00'),
    ('Clothing', '2026-08-20 07:05:00', '2026-08-20 07:05:00'),
    ('Books', '2026-08-20 07:10:00', '2026-08-20 07:10:00'),
    ('Home & Kitchen', '2026-08-20 07:15:00', '2026-08-20 07:15:00'),
    ('Sports', '2026-08-20 07:20:00', '2026-08-20 07:20:00');

-- =========================
-- Products
-- =========================
INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Wireless Headphones',
    7999.00,
    id,
    '2026-08-20 08:00:00',
    '2026-08-20 08:00:00'
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Mechanical Keyboard',
    9500.00,
    id,
    '2026-08-20 08:05:00',
    '2026-08-20 08:05:00'
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Gaming Mouse',
    4500.00,
    id,
    '2026-08-20 08:10:00',
    '2026-08-20 08:10:00'
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'USB-C Hub',
    3200.00,
    id,
    '2026-08-20 08:15:00',
    '2026-08-20 08:15:00'
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Running Shoes',
    12000.00,
    id,
    '2026-08-20 08:20:00',
    '2026-08-20 08:20:00'
FROM
    "Category"
WHERE
    name = 'Sports';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Sports Jacket',
    8500.00,
    id,
    '2026-08-20 08:25:00',
    '2026-08-20 08:25:00'
FROM
    "Category"
WHERE
    name = 'Clothing';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Clean Code',
    4500.00,
    id,
    '2026-08-20 08:30:00',
    '2026-08-20 08:30:00'
FROM
    "Category"
WHERE
    name = 'Books';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'The Pragmatic Programmer',
    5200.00,
    id,
    '2026-08-20 08:35:00',
    '2026-08-20 08:35:00'
FROM
    "Category"
WHERE
    name = 'Books';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Coffee Maker',
    11000.00,
    id,
    '2026-08-20 08:40:00',
    '2026-08-20 08:40:00'
FROM
    "Category"
WHERE
    name = 'Home & Kitchen';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Air Fryer',
    13500.00,
    id,
    '2026-08-20 08:45:00',
    '2026-08-20 08:45:00'
FROM
    "Category"
WHERE
    name = 'Home & Kitchen';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'Yoga Mat',
    2500.00,
    id,
    '2026-08-20 08:50:00',
    '2026-08-20 08:50:00'
FROM
    "Category"
WHERE
    name = 'Sports';

INSERT INTO "Product" (name, price, categoryId, createdAt, updatedAt)
SELECT
    'T-Shirt',
    1800.00,
    id,
    '2026-08-20 08:55:00',
    '2026-08-20 08:55:00'
FROM
    "Category"
WHERE
    name = 'Clothing';

-- =========================
-- Orders
-- =========================
INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    12999.00,
    '2026-08-20 09:30:00',
    '2026-08-20 09:30:00'
FROM
    "User"
WHERE
    email = 'alice@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    9500.00,
    '2026-08-21 11:15:00',
    '2026-08-21 11:15:00'
FROM
    "User"
WHERE
    email = 'bob@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PENDING',
    20500.00,
    '2026-08-22 14:20:00',
    '2026-08-22 14:20:00'
FROM
    "User"
WHERE
    email = 'charlie@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    12000.00,
    '2026-08-23 08:45:00',
    '2026-08-23 08:45:00'
FROM
    "User"
WHERE
    email = 'diana@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'CANCELLED',
    4500.00,
    '2026-08-24 16:10:00',
    '2026-08-24 16:10:00'
FROM
    "User"
WHERE
    email = 'ethan@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    18000.00,
    '2026-08-25 10:05:00',
    '2026-08-25 10:05:00'
FROM
    "User"
WHERE
    email = 'fiona@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    9300.00,
    '2026-08-26 13:40:00',
    '2026-08-26 13:40:00'
FROM
    "User"
WHERE
    email = 'george@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'REFUNDED',
    13500.00,
    '2026-08-27 15:25:00',
    '2026-08-27 15:25:00'
FROM
    "User"
WHERE
    email = 'hannah@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    16300.00,
    '2026-08-28 09:10:00',
    '2026-08-28 09:10:00'
FROM
    "User"
WHERE
    email = 'ian@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    5200.00,
    '2026-08-29 17:30:00',
    '2026-08-29 17:30:00'
FROM
    "User"
WHERE
    email = 'julia@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    15800.00,
    '2026-08-30 12:15:00',
    '2026-08-30 12:15:00'
FROM
    "User"
WHERE
    email = 'alice@example.com';

INSERT INTO "Order" (userId, status, totalAmount, createdAt, updatedAt)
SELECT
    id,
    'PAID',
    7999.00,
    '2026-08-31 14:50:00',
    '2026-08-31 14:50:00'
FROM
    "User"
WHERE
    email = 'charlie@example.com';

-- =========================
-- Order Items
-- =========================
-- Alice - first order
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Wireless Headphones'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'alice@example.com')
    AND o.createdAt = '2026-08-20 09:30:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'USB-C Hub'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'alice@example.com')
    AND o.createdAt = '2026-08-20 09:30:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'T-Shirt'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'alice@example.com')
    AND o.createdAt = '2026-08-20 09:30:00';

-- Bob
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Mechanical Keyboard'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'bob@example.com')
    AND o.createdAt = '2026-08-21 11:15:00';

-- Charlie - first order
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Running Shoes'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'charlie@example.com')
    AND o.createdAt = '2026-08-22 14:20:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Sports Jacket'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'charlie@example.com')
    AND o.createdAt = '2026-08-22 14:20:00';

-- Diana
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Running Shoes'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'diana@example.com')
    AND o.createdAt = '2026-08-23 08:45:00';

-- Ethan
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Gaming Mouse'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'ethan@example.com')
    AND o.createdAt = '2026-08-24 16:10:00';

-- Fiona
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Air Fryer'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'fiona@example.com')
    AND o.createdAt = '2026-08-25 10:05:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Clean Code'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'fiona@example.com')
    AND o.createdAt = '2026-08-25 10:05:00';

-- George
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'USB-C Hub'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'george@example.com')
    AND o.createdAt = '2026-08-26 13:40:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Yoga Mat'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'george@example.com')
    AND o.createdAt = '2026-08-26 13:40:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    2,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'T-Shirt'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'george@example.com')
    AND o.createdAt = '2026-08-26 13:40:00';

-- Hannah
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Air Fryer'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'hannah@example.com')
    AND o.createdAt = '2026-08-27 15:25:00';

-- Ian
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Running Shoes'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'ian@example.com')
    AND o.createdAt = '2026-08-28 09:10:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Yoga Mat'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'ian@example.com')
    AND o.createdAt = '2026-08-28 09:10:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'T-Shirt'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'ian@example.com')
    AND o.createdAt = '2026-08-28 09:10:00';

-- Julia
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'The Pragmatic Programmer'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'julia@example.com')
    AND o.createdAt = '2026-08-29 17:30:00';

-- Alice - second order
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Mechanical Keyboard'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'alice@example.com')
    AND o.createdAt = '2026-08-30 12:15:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Gaming Mouse'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'alice@example.com')
    AND o.createdAt = '2026-08-30 12:15:00';

INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'T-Shirt'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'alice@example.com')
    AND o.createdAt = '2026-08-30 12:15:00';

-- Charlie - second order
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    o.id,
    p.id,
    1,
    p.price
FROM
    "Order" o
    JOIN "Product" p ON p.name = 'Wireless Headphones'
WHERE
    o.userId = (
        SELECT
            id
        FROM
            "User"
        WHERE
            email = 'charlie@example.com')
    AND o.createdAt = '2026-08-31 14:50:00';

