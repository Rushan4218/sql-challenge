# PostgreSQL Challenges

A collection of PostgreSQL challenges designed to build practical SQL skills through progressively harder problems.

The challenges use a single **e-commerce database**, so as you progress, you'll continue working with the same kind of data and relationships you would encounter in a real application.

## Getting Started

### 1. Start PostgreSQL

Make sure Docker is installed, then start the database:

```bash
docker compose up -d
```

### 2. Create the database schema

Run:

```bash
psql -U postgres -d ecommerce -f database/schema.sql
```

### 3. Seed the database

Run:

```bash
psql -U postgres -d ecommerce -f database/seed.sql
```

You can now start solving the challenges.

---

## Database

The database represents a simple e-commerce application.

### Tables

```text
User
 └── Order
      └── OrderItem
           └── Product
                └── Category
```

### `User`

Stores customers registered in the application.

| Column      | Type      | Description           |
| ----------- | --------- | --------------------- |
| `id`        | UUID      | Unique user ID        |
| `name`      | VARCHAR   | Customer name         |
| `email`     | VARCHAR   | Customer email        |
| `createdAt` | TIMESTAMP | Account creation time |
| `updatedAt` | TIMESTAMP | Last update time      |

### `Category`

Stores product categories.

| Column      | Type      | Description        |
| ----------- | --------- | ------------------ |
| `id`        | UUID      | Unique category ID |
| `name`      | VARCHAR   | Category name      |
| `createdAt` | TIMESTAMP | Creation time      |
| `updatedAt` | TIMESTAMP | Last update time   |

### `Product`

Stores products available for purchase.

| Column       | Type      | Description       |
| ------------ | --------- | ----------------- |
| `id`         | UUID      | Unique product ID |
| `name`       | VARCHAR   | Product name      |
| `price`      | NUMERIC   | Product price     |
| `categoryId` | UUID      | Product category  |
| `createdAt`  | TIMESTAMP | Creation time     |
| `updatedAt`  | TIMESTAMP | Last update time  |

### `Order`

Stores customer orders.

| Column        | Type      | Description                   |
| ------------- | --------- | ----------------------------- |
| `id`          | UUID      | Unique order ID               |
| `userId`      | UUID      | Customer who placed the order |
| `status`      | VARCHAR   | Order status                  |
| `totalAmount` | NUMERIC   | Total order amount            |
| `createdAt`   | TIMESTAMP | Order creation time           |
| `updatedAt`   | TIMESTAMP | Last update time              |

Possible order statuses:

```text
PENDING
PAID
CANCELLED
REFUNDED
```

### `OrderItem`

Stores the individual products included in an order.

| Column      | Type      | Description                   |
| ----------- | --------- | ----------------------------- |
| `id`        | UUID      | Unique order item ID          |
| `orderId`   | UUID      | Order this item belongs to    |
| `productId` | UUID      | Product being purchased       |
| `quantity`  | INTEGER   | Quantity purchased            |
| `unitPrice` | NUMERIC   | Price at the time of purchase |
| `createdAt` | TIMESTAMP | Creation time                 |
| `updatedAt` | TIMESTAMP | Last update time              |

---

## Relationships

The tables are related as follows:

```text
User
 │
 │ 1:N
 ▼
Order
 │
 │ 1:N
 ▼
OrderItem
 │
 │ N:1
 ▼
Product
 │
 │ N:1
 ▼
Category
```

In other words:

- A `User` can have many `Order`s.
- An `Order` belongs to one `User`.
- An `Order` can contain many `OrderItem`s.
- An `OrderItem` belongs to one `Order`.
- An `OrderItem` references one `Product`.
- A `Product` belongs to one `Category`.
- A `Category` can contain many `Product`s.

---

## Challenges

Challenges are ordered from easier to harder.

### 001 — Recent Paid Orders

Practice:

- `SELECT`
- `JOIN`
- `WHERE`
- `ORDER BY`
- `LIMIT`

Find the 10 most recent paid orders and return information about the order and customer.

[Open Challenge →](./challenges/001-customer-orders/README.md)

### 002 — Product Order Details

Practice:

- Multiple `JOIN`s
- `SELECT`
- `ORDER BY`

Retrieve order items together with their customer and product information.

[Open Challenge →](./challenges/002-product-order-details/README.md)

---

## Challenge Rules

For each challenge:

1. Read the challenge description carefully.
2. Inspect the database schema when necessary.
3. Write your SQL query.
4. Test your query against the local database.
5. Submit your solution through the challenge system.

Solutions should not be committed to this repository.

You may create a local file such as:

```text
solution.sql
```

The repository's `.gitignore` prevents solution files from being committed.

## Learning Path

The challenges will gradually introduce more advanced PostgreSQL concepts.

```text
SELECT
  ↓
WHERE
  ↓
ORDER BY
  ↓
LIMIT
  ↓
JOIN
  ↓
GROUP BY
  ↓
HAVING
  ↓
Aggregate Functions
  ↓
Subqueries
  ↓
CTEs
  ↓
Window Functions
  ↓
Transactions
  ↓
Cursor Pagination
  ↓
Indexes
  ↓
EXPLAIN / Query Optimization
```

The goal isn't just to memorize SQL syntax.

The goal is to become comfortable working with relational data and writing queries that would make sense in a real production application.

## Database Reset

If you want to reset the database completely, run the schema and seed files again:

```bash
psql -U postgres -d ecommerce -f database/schema.sql
psql -U postgres -d ecommerce -f database/seed.sql
```

This recreates the tables and generates new UUIDs for the seeded records.

## License

This repository is intended for educational purposes.
