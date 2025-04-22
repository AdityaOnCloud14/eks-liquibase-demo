--liquibase formatted sql

-- changeset dbteam:001-create-address
CREATE TABLE address (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
-- rollback DROP TABLE address;

-- changeset dbteam:002-create-details
CREATE TABLE details (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10, 2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);
-- rollback DROP TABLE details;

-- changeset dbteam:003-create-type
CREATE TABLE type (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10, 2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id)
);
-- rollback DROP TABLE type;
