-- liquibase formatted sql

-- changeset author:1
CREATE TABLE IF NOT EXISTS dogs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    breed VARCHAR(100),
    age INTEGER
);
-- rollback DROP TABLE IF EXISTS dogs;

-- changeset author:2
CREATE TABLE IF NOT EXISTS cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    breed VARCHAR(100),
    age INTEGER
);
-- rollback DROP TABLE IF EXISTS cats;

-- changeset author:3
CREATE TABLE IF NOT EXISTS owners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);
-- rollback DROP TABLE IF EXISTS owners;
