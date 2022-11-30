--SELECT e.first_name, e.last_name, e.id AS employee_id, p.title, p.id AS project_id FROM employees AS e
--LEFT JOIN projects_employees AS pe ON pe.employee_id = e.id
--LEFT JOIN projects AS p ON pe.project_id = p.id;

--SELECT e.id AS employee_id, e.first_name, e.last_name, t.name AS team_name
--FROM employees as e
--INNER JOIN teams as t ON e.team_id = t.id
--WHERE t.id = 2;

SELECT e.id AS employee_id, e.first_name,e.birthdate, e.last_name, t.name AS team_name, t.id AS team_id, t.building_id, b.name AS building_name
FROM employees AS e
INNER JOIN teams AS t ON e.team_id = t.id
INNER JOIN company_buildings AS b ON t.building_id = b.id
WHERE b.name = 'Darkroom'
ORDER BY e.birthdate;