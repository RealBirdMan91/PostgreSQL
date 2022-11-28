SELECT c.city_name, l.area_name, unicorn_name
FROM cities AS c
INNER JOIN locations AS l ON c.id = l.city_id
INNER JOIN unicorns AS u ON l.id = u.location_id;