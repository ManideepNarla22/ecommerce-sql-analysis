-- E-COMMERCE SQL ANALYSIS
-- BUSINESS QUESTIONS & SQL QUERIES

-- Orders by status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- Total revenue by product
SELECT 
    p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- Total revenue by category
SELECT 
    p.category,
    SUM(p.price * oi.quantity) AS total_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Total amount spent by each customer
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- Number of orders placed by each customer
SELECT 
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY order_count DESC;

-- Average order value
SELECT 
    AVG(order_total) AS average_order_value
FROM (
    SELECT 
        o.order_id,
        SUM(p.price * oi.quantity) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    WHERE o.status <> 'Cancelled'
    GROUP BY o.order_id
) AS order_totals;

-- Best-selling product by quantity
SELECT 
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;

-- Customers who spent more than ₹2,000
SELECT 
    c.name,
    SUM(p.price * oi.quantity) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status <> 'Cancelled'
GROUP BY c.customer_id, c.name
HAVING SUM(p.price * oi.quantity) > 2000
ORDER BY total_spent DESC;

-- Most expensive product
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 1;

-- Products that have never been ordered
SELECT 
    p.product_name
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;