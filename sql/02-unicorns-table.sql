CREATE TYPE unicorn_status AS ENUM ('warrior', 'worker', 'magical_one');

CREATE TABLE unicorns(
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200),
    salary INT,
    unicorn_type unicorn_status
);
