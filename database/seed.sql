-- ============================================
-- USERS
-- ============================================
INSERT INTO "User" (name, email)
VALUES
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Smith', 'bob@example.com'),
    ('Charlie Brown', 'charlie@example.com'),
    ('Diana Wilson', 'diana@example.com'),
    ('Ethan Davis', 'ethan@example.com'),
    ('Fiona Miller', 'fiona@example.com'),
    ('George Taylor', 'george@example.com'),
    ('Hannah Anderson', 'hannah@example.com'),
    ('Ian Thomas', 'ian@example.com'),
    ('Julia Martin', 'julia@example.com');

-- ============================================
-- CATEGORIES
-- ============================================
INSERT INTO "Category" (name)
VALUES
    ('Electronics'),
    ('Clothing'),
    ('Books'),
    ('Home & Kitchen'),
    ('Sports');

-- ============================================
-- PRODUCTS
-- ============================================
INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Wireless Headphones',
    7999.00,
    id
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Mechanical Keyboard',
    9500.00,
    id
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Gaming Mouse',
    4500.00,
    id
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'USB-C Hub',
    3200.00,
    id
FROM
    "Category"
WHERE
    name = 'Electronics';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Running Shoes',
    12000.00,
    id
FROM
    "Category"
WHERE
    name = 'Sports';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Sports Jacket',
    8500.00,
    id
FROM
    "Category"
WHERE
    name = 'Clothing';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Clean Code',
    4500.00,
    id
FROM
    "Category"
WHERE
    name = 'Books';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'The Pragmatic Programmer',
    5200.00,
    id
FROM
    "Category"
WHERE
    name = 'Books';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Coffee Maker',
    11000.00,
    id
FROM
    "Category"
WHERE
    name = 'Home & Kitchen';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Air Fryer',
    13500.00,
    id
FROM
    "Category"
WHERE
    name = 'Home & Kitchen';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'Yoga Mat',
    2500.00,
    id
FROM
    "Category"
WHERE
    name = 'Sports';

INSERT INTO "Product" (name, price, categoryId)
SELECT
    'T-Shirt',
    1800.00,
    id
FROM
    "Category"
WHERE
    name = 'Clothing';

-- ============================================
-- ORDERS
-- ============================================
-- Alice - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        12999.00
    FROM
        "User"
    WHERE
        email = 'alice@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    item.quantity,
    p.price
FROM
    new_order
    CROSS JOIN (
        VALUES ('Wireless Headphones', 1),
            ('USB-C Hub', 1),
            ('T-Shirt', 1)) AS item (productName, quantity)
    JOIN "Product" p ON p.name = item.productName;

-- Bob - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        9500.00
    FROM
        "User"
    WHERE
        email = 'bob@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'Mechanical Keyboard';

-- Charlie - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PENDING',
        20500.00
    FROM
        "User"
    WHERE
        email = 'charlie@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    item.quantity,
    p.price
FROM
    new_order
    CROSS JOIN (
        VALUES ('Running Shoes', 1),
            ('Sports Jacket', 1)) AS item (productName, quantity)
    JOIN "Product" p ON p.name = item.productName;

-- Diana - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        12000.00
    FROM
        "User"
    WHERE
        email = 'diana@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'Running Shoes';

-- Ethan - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'CANCELLED',
        4500.00
    FROM
        "User"
    WHERE
        email = 'ethan@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'Gaming Mouse';

-- Fiona - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        18000.00
    FROM
        "User"
    WHERE
        email = 'fiona@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'Mechanical Keyboard';

-- Add another item to Fiona's order
WITH order_data AS (
    SELECT
        o.id
    FROM
        "Order" o
        JOIN "User" u ON u.id = o.userId
    WHERE
        u.email = 'fiona@example.com'
    ORDER BY
        o.id DESC
    LIMIT 1)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    order_data.id,
    p.id,
    1,
    p.price
FROM
    order_data
    CROSS JOIN "Product" p
WHERE
    p.name = 'Yoga Mat';

-- George - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        9300.00
    FROM
        "User"
    WHERE
        email = 'george@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    item.quantity,
    p.price
FROM
    new_order
    CROSS JOIN (
        VALUES ('Gaming Mouse', 1),
            ('T-Shirt', 1),
            ('Yoga Mat', 1)) AS item (productName, quantity)
    JOIN "Product" p ON p.name = item.productName;

-- Hannah - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'REFUNDED',
        13500.00
    FROM
        "User"
    WHERE
        email = 'hannah@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'Air Fryer';

-- Ian - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        16300.00
    FROM
        "User"
    WHERE
        email = 'ian@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    item.quantity,
    p.price
FROM
    new_order
    CROSS JOIN (
        VALUES ('Coffee Maker', 1),
            ('T-Shirt', 1),
            ('Yoga Mat', 1)) AS item (productName, quantity)
    JOIN "Product" p ON p.name = item.productName;

-- Julia - Order 1
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        5200.00
    FROM
        "User"
    WHERE
        email = 'julia@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'The Pragmatic Programmer';

-- Alice - Order 2
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        15800.00
    FROM
        "User"
    WHERE
        email = 'alice@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    item.quantity,
    p.price
FROM
    new_order
    CROSS JOIN (
        VALUES ('Mechanical Keyboard', 1),
            ('Gaming Mouse', 1),
            ('T-Shirt', 1)) AS item (productName, quantity)
    JOIN "Product" p ON p.name = item.productName;

-- Charlie - Order 2
WITH new_order AS (
INSERT INTO "Order" (userId, status, totalAmount)
    SELECT
        id,
        'PAID',
        7999.00
    FROM
        "User"
    WHERE
        email = 'charlie@example.com'
    RETURNING
        id)
INSERT INTO "OrderItem" (orderId, productId, quantity, unitPrice)
SELECT
    new_order.id,
    p.id,
    1,
    p.price
FROM
    new_order
    CROSS JOIN "Product" p
WHERE
    p.name = 'Wireless Headphones';

