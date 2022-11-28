CREATE TYPE u_status AS ENUM ('warrior', 'worker', 'magical_one');
CREATE TYPE personality AS ENUM ('sleepy', 'greedy', 'lazy', 'aggressive', 'funny', 'cuddly', 'hyperactive', 'grumpy');
CREATE TYPE area AS ENUM ('Mushroom forest', 'sugar mountains', 'Rainbow dimming', 'cotton candy clouds', 'gummy worms caves');


CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    area_name VARCHAR(300) NOT NULL,
    lat NUMERIC(5,2) NOT NULL,
    lng NUMERIC(5,2) NOT NULL,
    area_type area
);

CREATE TABLE unicorns (
    id SERIAL PRIMARY KEY,
    unicorn_name VARCHAR(300) NOT NULL UNIQUE,
    unicorn_status u_status NOT NULL,
    unicorn_personality personality NOT NULL,
    location_id INTEGER NOT NULL REFERENCES locations (id)
);