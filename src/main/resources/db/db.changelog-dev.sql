-- liquibase formatted sql

-- changeset liquibase:id201
CREATE TABLE IF NOT EXISTS dogs (
    dog_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    breed VARCHAR(100),
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- rollback DROP TABLE IF EXISTS dogs;

-- changeset liquibase:id202
CREATE TABLE IF NOT EXISTS cats (
    cat_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    color VARCHAR(50),
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- rollback DROP TABLE IF EXISTS cats;
