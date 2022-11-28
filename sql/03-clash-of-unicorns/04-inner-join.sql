SELECT  u.unicorn_name, u.unicorn_status, l.area_name
FROM unicorns AS U
INNER JOIN locations AS l ON u.location_id = l.id;