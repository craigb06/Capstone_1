# create database for business operations of e-commerce business geared towards electronics

CREATE DATABASE business_opertaions;

USE business_opertaions;

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
    payment_date DATETIME NOT NULL,
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
    
# create table for invoices from suppliers

CREATE TABLE invoices (
	invoice_id INT PRIMARY KEY,
    supplier_id INT NOT NULL,
    stock_received VARCHAR(255) NOT NULL,
    amount_paid DECIMAL(9,2) NOT NULL
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
    price_per_item DECIMAL(6,2) NOT NULL
    );
    
# create table for order information

CREATE TABLE order_info (
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    item_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    payment_id INT NOT NULL
    );
    
# create table for shipment information

CREATE TABLE shipments (
	shipment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    shipment_date DATETIME NOT NULL,
    shipment_city VARCHAR(50) NOT NULL,
    shipment_state VARCHAR(50) NOT NULL,
    shipment_country VARCHAR(50) NOT NULL
    );
    
# add constraints to tables for foreign keys