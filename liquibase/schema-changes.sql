--liquibase formatted sql

-- changeset dbteam:001-create-customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
-- rollback DROP TABLE customers;

-- changeset dbteam:002-create-orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10, 2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);
-- rollback DROP TABLE orders;