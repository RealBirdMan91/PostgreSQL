--SELECT  u.unicorn_name, u.unicorn_status, l.area_name
--FROM unicorns AS U
--INNER JOIN locations AS l ON u.location_id = l.id;

SELECT  u.unicorn_name, u.unicorn_status, l.area_name, c.city_name, c.population
FROM unicorns AS U
INNER JOIN locations AS l ON u.location_id = l.id
INNER JOIN cities AS c ON l.city_id = c.id;