# Challenge 001 — Recent Paid Orders

## Objective

Write a SQL query that returns the **10 most recent paid orders**.

You need to retrieve information about both the order and the customer who placed it.

## Requirements

Your query must return the following columns:

- `order_id` — the order ID
- `customer_name` — the customer's name
- `customer_email` — the customer's email
- `total_amount` — the order's total amount
- `created_at` — when the order was created

### Conditions

1. Only include orders with the status `PAID`.
2. Sort the results by the order creation date, with the **newest orders first**.
3. Return at most **10 orders**.
4. You will need to use the `"Order"` and `"User"` tables.

## Expected Columns

Your result should have exactly these columns:

```text
order_id
customer_name
customer_email
total_amount
created_at
```

## Example

Your result should look similar to:

```text
order_id                              customer_name    customer_email       total_amount    created_at
------------------------------------  ---------------  -------------------  -------------   -------------------
...                                   Charlie Brown    charlie@example.com  7999.00        2026-08-31 14:50:00
...                                   Alice Johnson    alice@example.com    15800.00       2026-08-30 12:15:00
...                                   Julia Martin     julia@example.com    5200.00        2026-08-29 17:30:00
...
```

The exact UUIDs and complete result set are intentionally not provided.

## Rules

- Write a single SQL query.
- Do not modify any data.
- Do not use `INSERT`, `UPDATE`, or `DELETE`.
- Do not create temporary tables or views.
- Do not hardcode the expected results.
- Your query should work against the provided database.

## Skills

This challenge is intended to test your understanding of:

- `SELECT`
- `JOIN`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- Table aliases
- Selecting columns from multiple tables
