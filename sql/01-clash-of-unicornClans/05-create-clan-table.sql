CREATE TABLE clans (
    id serial PRIMARY KEY,
    clan_name VARCHAR(200),
    clan_adress VARCHAR(300),
    yearly_salary NUMERIC(6, 2),
    is_searching_unicorns BOOLEAN DEFAULT false
)