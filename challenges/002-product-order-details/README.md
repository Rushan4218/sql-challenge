# Challenge 002 — Product Order Details

## Objective

Retrieve the products included in paid orders.

For each product in a paid order, return:

- Order ID
- Customer name
- Product name
- Quantity
- Unit price
- Total item price

Only include items belonging to orders with a `PAID` status.

Sort the results by the order creation date, newest orders first.

## Expected Columns

| Column          | Description             |
| --------------- | ----------------------- |
| `order_id`      | The order ID            |
| `customer_name` | Name of the customer    |
| `product_name`  | Name of the product     |
| `quantity`      | Quantity ordered        |
| `unit_price`    | Price of one unit       |
| `item_total`    | `quantity × unit_price` |

## Requirements

Your query must:

1. Return only `PAID` orders.
2. Join the required tables.
3. Calculate the total price for each order item.
4. Sort the results by the order creation date in descending order.

## Tables You May Need

- `"User"`
- `"Order"`
- `"OrderItem"`
- `"Product"`

## Skills

This challenge focuses on:

- `SELECT`
- `JOIN`
- `WHERE`
- Column aliases
- Arithmetic expressions
- `ORDER BY`

## Submission

Create a local `solution.sql` file and write your solution there.

Do not commit your solution to the repository.

## Hint

You will need to follow this relationship:

`"User" → "Order" → "OrderItem" → "Product"`

Think about which columns connect each table.

## Expected Result

Your result should contain one row for each product in a paid order.

The exact order of rows should follow the newest orders first.
