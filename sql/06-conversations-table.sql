CREATE TABLE conversations (
    id serial PRIMARY KEY,
    unicorn_name VARCHAR(200),
    clan_name VARCHAR(200), 
    message TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
)