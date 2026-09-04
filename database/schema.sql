DROP TABLE IF EXISTS "OrderItem";

DROP TABLE IF EXISTS "Order";

DROP TABLE IF EXISTS "Product";

DROP TABLE IF EXISTS "Category";

DROP TABLE IF EXISTS "User";

CREATE TABLE "User" (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid (),
    name varchar(100) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE "Category" (
    id uuid PRIMARY KEY,
    name varchar(100) NOT NULL UNIQUE,
    createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE "Product" (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid (),
    name varchar(150) NOT NULL,
    price numeric(10, 2) NOT NULL CHECK (price >= 0),
    categoryId uuid NOT NULL REFERENCES "Category" (id),
    createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE "Order" (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid (),
    userId uuid NOT NULL REFERENCES "User" (id),
    status varchar(20) NOT NULL CHECK (status IN ('PENDING', 'PAID', 'CANCELLED', 'REFUNDED')),
    totalAmount numeric(10, 2) NOT NULL CHECK (totalAmount >= 0),
    createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE "OrderItem" (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid (),
    orderId uuid NOT NULL REFERENCES "Order" (id),
    productId uuid NOT NULL REFERENCES "Product" (id),
    quantity integer NOT NULL CHECK (quantity > 0),
    unitPrice numeric(10, 2) NOT NULL CHECK (unitPrice >= 0),
    createdAt timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

