-- E-COMMERCE SQL PROJECT - SAMPLE DATA

--  1. INSERT CUSTOMER DATA
INSERT INTO customers (customer_id, name, email, city)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Hyderabad'),
(2, 'Priya', 'priya@gmail.com', 'Bangalore'),
(3, 'Arjun', 'arjun@gmail.com', 'Chennai'),
(4, 'Sneha', 'sneha@gmail.com', 'Mumbai'),
(5, 'Kiran', 'kiran@gmail.com', 'Pune');


--  2. INSERT PRODUCT DATA
INSERT INTO products (product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Electronics', 800),
(103, 'Keyboard', 'Electronics', 1500),
(104, 'T-Shirt', 'Clothing', 700),
(105, 'Jeans', 'Clothing', 1800),
(106, 'Headphones', 'Electronics', 2500);


-- 3. INSERT ORDER DATA
INSERT INTO orders (order_id, customer_id, order_date, status)
VALUES
(1001, 1, '2026-08-01', 'Delivered'),
(1002, 2, '2026-08-02', 'Delivered'),
(1003, 1, '2026-08-05', 'Pending'),
(1004, 3, '2026-08-07', 'Delivered'),
(1005, 4, '2026-08-10', 'Cancelled'),
(1006, 5, '2026-08-12', 'Delivered'),
(1007, 2, '2026-08-15', 'Delivered');

-- 4. INSERT ORDER ITEM DATA
INSERT INTO order_items (order_item_id, order_id, product_id, quantity)
VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 104, 2),
(4, 1002, 105, 1),
(5, 1003, 106, 1),
(6, 1004, 103, 2),
(7, 1004, 102, 1),
(8, 1005, 101, 1),
(9, 1006, 106, 2),
(10, 1007, 105, 1),
(11, 1007, 102, 1);