--SELECT c.city_name, c.population, l.area_name, l.lat
--FROM locations AS l
--LEFT JOIN cities AS c ON l.city_id = c.id


SELECT c.city_name, c.population, l.area_name, l.lat
FROM cities AS c
RIGHT JOIN locations AS l ON l.city_id = c.id