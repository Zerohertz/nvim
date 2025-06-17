-- [CREATE] Add a new customer
INSERT INTO customers (name, email, registered_date)
VALUES ('John Doe', 'john@example.com', NOW());

-- [READ] Customer and order JOIN (all orders for a specific customer)
SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.status
FROM
    customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE
    c.customer_id = 1;

-- [READ] Order + order details + product JOIN (details for a specific order)
SELECT
    o.order_id,
    o.order_date,
    od.product_id,
    p.product_name,
    od.quantity,
    od.unit_price
FROM
    orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE
    o.order_id = 1001;

-- [UPDATE] Update customer email
UPDATE customers
SET email = 'new_email@example.com'
WHERE customer_id = 1;

-- [DELETE] Cancel order (delete order details then order)
DELETE FROM order_details
WHERE order_id = 1001;

DELETE FROM orders
WHERE order_id = 1001;

-- [READ] Orders with payment info
SELECT
    o.order_id,
    o.order_date,
    o.status,
    p.payment_id,
    p.amount,
    p.payment_date
FROM
    orders o
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE
    o.customer_id = 1;

-- [READ] Products with reviews
SELECT
    p.product_id,
    p.product_name,
    r.review_id,
    r.rating,
    r.comment
FROM
    products p
LEFT JOIN reviews r ON p.product_id = r.product_id
WHERE
    p.product_id = 2001;

-- [READ] Customer, order, and shipment JOIN
SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    s.shipment_id,
    s.shipment_date,
    s.tracking_number
FROM
    customers c
JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN shipments s ON o.order_id = s.order_id
WHERE
    c.customer_id = 1;
