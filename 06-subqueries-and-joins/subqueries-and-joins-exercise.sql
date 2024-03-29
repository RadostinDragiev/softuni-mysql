#---------- 01. Employee Address ----------

SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees AS e
JOIN addresses AS a
ON e.address_id = a.address_id
ORDER BY e.address_id
LIMIT 5;


#---------- 02. Addresses with Towns ----------

SELECT e.first_name, e.last_name, t.`name` AS 'town', a.address_text
FROM employees AS e
JOIN addresses AS a
ON e.address_id = a.address_id
JOIN towns AS t
ON a.town_id = t.town_id
ORDER BY e.first_name, e.last_name
LIMIT 5;


#---------- 03. Sales Employee ----------

SELECT e.employee_id, e.first_name, e.last_name, d.`name` AS `department_name`
FROM employees AS e
JOIN departments AS d
ON d.department_id = e.department_id
WHERE d.`name` = 'Sales'
ORDER BY e.employee_id DESC;


#---------- 04. Employee Departments ----------

SELECT e.employee_id, e.first_name, FORMAT(e.salary, 2), d.`name` AS 'department_name'
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY e.department_id DESC, e.first_name
LIMIT 5;


#---------- 05. Employees Without Project ----------

SELECT e.employee_id, e.`first_name`
FROM employees AS e
WHERE e.employee_id NOT IN (SELECT ep.employee_id FROM employees_projects AS ep)
ORDER BY e.employee_id DESC
LIMIT 3;


#---------- 06. Employees Hired After ----------

SELECT e.first_name, e.last_name, DATE_FORMAT(e.hire_date, '%m-%d-%Y %H:%i:%s'), d.`name` AS `dept_name`
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.hire_date > '1999-01-01' AND d.`name` = 'Finance'
ORDER BY e.hire_date;


#---------- 07. Employees with Project ----------

SELECT e.employee_id, e.first_name, p.`name` AS 'project_name'
FROM employees AS e
JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
JOIN projects AS p
ON p.project_id = ep.project_id
WHERE p.start_date > '2002-08-13' AND p.end_date IS NULL
ORDER BY e.first_name, p.`name`
LIMIT 5;


#---------- 08. Employee 24 ----------

SELECT e.employee_id, e.first_name, (
	CASE
    WHEN p.start_date > '2004-12-31' THEN NULL
    ELSE p.`name`
    END
) AS 'project_name', p.start_date
FROM employees AS e
JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
JOIN projects AS p
ON ep.project_id = p.project_id
WHERE e.employee_id = '24'
ORDER BY project_name;


#---------- 09. Employee Manager ----------

SELECT e.employee_id, 
e.first_name, 
(SELECT e.manager_id FROM employees AS m WHERE e.manager_id = m.employee_id) AS 'manager_id',
(SELECT m.first_name FROM employees AS m WHERE e.manager_id = m.employee_id) AS 'manager_name'
FROM employees AS e
WHERE e.manager_id = 3 OR e.manager_id = 7
ORDER BY e.first_name;


#---------- 10. Employee Summary ----------

SELECT e.employee_id, 
CONCAT_WS(' ', e.first_name, e.last_name) AS 'employee_name',
(SELECT CONCAT_WS(' ', m.first_name, m.last_name) FROM employees AS m WHERE e.manager_id = m.employee_id) AS 'manager_name',
(SELECT d.`name` FROM departments AS d WHERE e.department_id = d.department_id) AS 'department_name'
FROM employees AS e
WHERE e.manager_id IS NOT NULL
ORDER BY e.employee_id
LIMIT 5;


#---------- 11. Min Average Salary ----------

SELECT MIN(min_salaries) AS min_average_salary 
FROM 
(
	SELECT AVG(`salary`) AS min_salaries
	FROM employees 
    GROUP BY department_id
) AS min_salary;


#---------- 12. Highest Peaks in Bulgaria ----------

SELECT mc.country_code, m.mountain_range, p.peak_name, p.elevation
FROM peaks AS p
JOIN mountains_countries AS mc
ON p.mountain_id = mc.mountain_id
JOIN mountains AS m
ON p.mountain_id = m.id
WHERE mc.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;


#---------- 13. Count Mountain Ranges ----------

SELECT c.country_code, COUNT(m.mountain_range) AS 'mountain_range'
FROM countries AS c
JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
JOIN mountains AS m
ON m.id = mc.mountain_id
WHERE c.country_code IN ('BG', 'RU', 'US')
GROUP BY c.country_code
ORDER BY mountain_range DESC;


#---------- 14. Countries with Rivers ----------

SELECT c.country_name, r.river_name
FROM countries AS c
LEFT JOIN countries_rivers AS cr
ON c.country_code = cr.country_code
LEFT JOIN rivers AS r
ON cr.river_id = r.id
WHERE c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;


#---------- 16. Countries without any Mountains ----------

SELECT COUNT(c.country_code) AS 'country_count'
FROM countries AS c
LEFT JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
WHERE mc.mountain_id IS NULL;


#---------- 17. Highest Peak and Longest River by Country ----------

SELECT c.country_name, MAX(p.elevation) AS 'highest_peak_elevation', MAX(r.length) AS 'longest_river_length'
FROM countries AS c
LEFT JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
LEFT JOIN peaks AS p
ON mc.mountain_id = p.mountain_id
LEFT JOIN countries_rivers AS cr
ON c.country_code = cr.country_code
LEFT JOIN rivers AS r
ON cr.river_id = r.id
GROUP BY c.country_code
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name
LIMIT 5;