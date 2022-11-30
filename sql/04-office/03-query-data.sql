SELECT e.first_name, e.last_name, e.id AS employee_id, p.title, p.id AS project_id FROM employees AS e
LEFT JOIN projects_employees AS pe ON pe.employee_id = e.id
LEFT JOIN projects AS p ON pe.project_id = p.id;