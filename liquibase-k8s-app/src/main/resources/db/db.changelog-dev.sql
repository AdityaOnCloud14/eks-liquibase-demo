--liquibase formatted sql

-- changeset liquibase:001-create-cars-table
CREATE TABLE IF NOT EXISTS cars (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
