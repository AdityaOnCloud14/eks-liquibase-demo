--liquibase formatted sql

-- changeset dev_team:202
INSERT INTO customers (first_name, last_name, email)
VALUES
('Alice', 'Smith', 'alice.smith@example.com'),
('Bob', 'Johnson', 'bob.johnson@example.com'),
('Charlie', 'Brown', 'charlie.brown@example.com'),
('Diana', 'Prince', 'diana.prince@example.com'),
('Ethan', 'Hunt', 'ethan.hunt@example.com');

INSERT INTO orders (customer_id, order_date, status, total_amount)
VALUES
(1, '2025-01-10', 'Processing', 120.50),
(1, '2025-01-15', 'Shipped', 89.99),
(2, '2025-02-01', 'Delivered', 39.49),
(3, '2025-02-05', 'Cancelled', 79.00),
(4, '2025-02-10', 'Processing', 199.99),
(5, '2025-02-11', 'Processing', 299.99),
(1, '2025-03-01', 'Delivered', 45.75),
(3, '2025-03-05', 'Shipped', 150.00),
(2, '2025-03-10', 'Processing', 99.95),
(5, '2025-03-12', 'Delivered', 499.99);

-- rollback dev_team:202
DELETE FROM orders;
DELETE FROM customers;
