ALTER TABLE clans 
ALTER yearly_salary SET DATA TYPE REAL;

ALTER TABLE clans RENAME COLUMN yearly_salary TO yearly_revenue;