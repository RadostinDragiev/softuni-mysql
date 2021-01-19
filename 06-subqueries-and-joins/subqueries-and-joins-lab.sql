---------- 01. Managers ----------

SELECT e.employee_id, 
concat_ws(' ',e.first_name, e.middle_name, e.last_name) AS 'full_name', 
d.department_id, d.name AS 'department_name'
FROM employees AS e
JOIN departments AS d
ON d.manager_id = e.employee_id
ORDER BY e.employee_id limit 5;


---------- 02. Towns Addresses ----------

SELECT t.town_id, t.`name` AS 'town_name', a.address_text
FROM towns AS t
JOIN addresses AS a
ON t.town_id = a.town_id
WHERE t.`name` IN('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.town_id, a.address_id;


---------- 03. Employees Without Managers ----------

SELECT e.employee_id, e.first_name, e.last_name, e.department_id, format(e.salary, 0)
FROM employees AS e
WHERE e.manager_id IS NULL;


---------- 04. Higher Salary ----------

SELECT COUNT(employee_id) AS 'count' FROM employees
WHERE salary > 
(
	SELECT AVG(salary) FROM employees
);