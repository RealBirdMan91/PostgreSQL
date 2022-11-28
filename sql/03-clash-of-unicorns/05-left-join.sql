--INSERT INTO locations (area_name, lat, lng, area_type)
--VALUES (
--        'strange camp',
--        663.85,
--        805.77,
--        'sugar mountains'
--    ),
--    (
--        'strange castle',
--        663.85,
--        805.77,
--        'sugar mountains'
--    );

--SELECT u.unicorn_name, u.unicorn_status, u.location_id, l.area_name
--FROM unicorns AS U
--INNER JOIN locations AS l ON u.location_id = l.id;

SELECT c.city_name, c.population, l.area_name, lat
FROM locations AS l
LEFT JOIN cities AS c ON l.city_id = c.id


