CREATE DATABASE IF NOT EXISTS clothing_store DEFAULT CHARACTER SET utf8mb4;
USE clothing_store;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS product_images;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS clothing;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS categories;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE categories (category_id INT PRIMARY KEY, category_name VARCHAR(20) NOT NULL);
CREATE TABLE brands (brand_id INT PRIMARY KEY, brand_name VARCHAR(50) NOT NULL, country VARCHAR(20));
CREATE TABLE clothing (
  product_id VARCHAR(10) PRIMARY KEY, product_name VARCHAR(50) NOT NULL,
  category_id INT NOT NULL, brand_id INT NOT NULL, color VARCHAR(10), size VARCHAR(5),
  price DECIMAL(10,2) NOT NULL, stock_qty INT NOT NULL, listed_date DATE,
  FOREIGN KEY (category_id) REFERENCES categories(category_id),
  FOREIGN KEY (brand_id) REFERENCES brands(brand_id));
CREATE TABLE customers (customer_id VARCHAR(10) PRIMARY KEY, customer_name VARCHAR(30) NOT NULL, city VARCHAR(20), member_level VARCHAR(10));
CREATE TABLE orders (order_id VARCHAR(10) PRIMARY KEY, customer_id VARCHAR(10) NOT NULL, order_date DATE NOT NULL, status VARCHAR(10) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
CREATE TABLE order_items (item_id VARCHAR(10) PRIMARY KEY, order_id VARCHAR(10) NOT NULL, product_id VARCHAR(10) NOT NULL, quantity INT NOT NULL, unit_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES clothing(product_id));
