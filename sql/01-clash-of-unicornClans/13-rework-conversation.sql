--DROP TABLE conversations;

CREATE TABLE conversations (
    id serial PRIMARY KEY,
    unicorn_id INT NOT NULL,
    clan_id INT NOT NULL, 
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
)