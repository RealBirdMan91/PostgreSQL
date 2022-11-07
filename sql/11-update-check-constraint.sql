ALTER TABLE unicorns
ADD CONSTRAINT salary_range CHECK (salary > 1000 AND salary < 100000);