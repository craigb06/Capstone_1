# create database for business operations of e-commerce business geared towards electronics

CREATE DATABASE business_operations;

USE business_operations;

# create table for customer information

CREATE TABLE customer_info (
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone_number VARCHAR(25)
    );
    
# create table for payment information
    
CREATE TABLE payment (
	payment_id INT PRIMARY KEY,
    payment_method VARCHAR(25) NOT NULL,
    total_amount DECIMAL(7,2) NOT NULL
    );
    
# create table for suppliers information

CREATE TABLE suppliers (
	supplier_id INT PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL,
    company_address VARCHAR(50),
    company_email VARCHAR(50) NOT NULL,
    company_number VARCHAR(25) NOT NULL
    );
    
# create table for categories of inventory

CREATE TABLE categories (
	category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
    );
    
# create table for inventory

CREATE TABLE inventory (
	item_id INT PRIMARY KEY,
    item_name VARCHAR(50) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    quantity_in_stock INT,
    storage_location VARCHAR(25),
    price_per_item DECIMAL(6,2) NOT NULL,
    CONSTRAINT FK_categoryid FOREIGN KEY (category_id) 
    REFERENCES business_operations.categories(category_id),
    CONSTRAINT FK_supplierid FOREIGN KEY (supplier_id)
    REFERENCES business_operations.suppliers(supplier_id)
    );
    
# create table for order information

CREATE TABLE order_info (
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    item_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    payment_id INT NOT NULL,
    CONSTRAINT FK_customerid FOREIGN KEY (customer_id)
    REFERENCES business_operations.customer_info(customer_id),
    CONSTRAINT FK_itemid FOREIGN KEY (item_id)
    REFERENCES business_operations.inventory(item_id),
    CONSTRAINT FK_paymentid FOREIGN KEY (payment_id)
    REFERENCES business_operations.payment(payment_id)
    );
    
# create table for shipment information

CREATE TABLE shipments (
	shipment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    shipment_date DATETIME NOT NULL,
    shipment_city VARCHAR(50) NOT NULL,
    shipment_state VARCHAR(50) NOT NULL,
    shipment_country VARCHAR(50) NOT NULL,
    CONSTRAINT FK_orderid FOREIGN KEY (order_id)
    REFERENCES business_operations.order_info(order_id)
    );
    
# insert values for sample data if able