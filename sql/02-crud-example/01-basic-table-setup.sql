--CREATE DATABASE crud_example;


CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    date_created DATE DEFAULT CURRENT_DATE,
    date_fulfilled DATE DEFAULT NULL,
    customer_name VARCHAR(200) NOT NULL,
    customer_email VARCHAR(200) NOT NULL UNIQUE,
    product_name VARCHAR(200) NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    is_recurring BOOLEAN DEFAULT FALSE,
    is_disputed BOOLEAN DEFAULT FALSE
)

