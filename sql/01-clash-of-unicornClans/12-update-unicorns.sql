ALTER TABLE unicorns
ADD COLUMN email VARCHAR(200) DEFAULT NULL UNIQUE;


--INSERT INTO unicorns (unicorn_name, salary, unicorn_type, email) VALUES ('FunnyCorn', 6000, 'magical_one', 'funny@corn.de');