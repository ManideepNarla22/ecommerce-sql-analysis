-- E-COMMERCE SQL PROJECT
-- DATABASE SCHEMA

-- Create database
CREATE DATABASE ecommerce_project;

USE ecommerce_project;

-- 1. CUSTOMERS TABLE
-- Stores customer information

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR(25),
    email VARCHAR(30),
    city VARCHAR(32)
);

-- 2. PRODUCTS TABLE
-- Stores product information and prices

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(20),
    category VARCHAR(15),
    price DECIMAL(10,2)
);

-- 3. ORDERS TABLE
-- Stores customer order information


CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(10)
);

-- 4. ORDER ITEMS TABLE
-- Stores products and quantities in each order

CREATE TABLE order_items(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

-- FOREIGN KEY RELATIONSHIPS

-- Connect orders to customers
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);


-- Connect order items to orders
ALTER TABLE order_items
ADD CONSTRAINT fk_items_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-- Connect order items to products
ALTER TABLE order_items
ADD CONSTRAINT fk_items_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);