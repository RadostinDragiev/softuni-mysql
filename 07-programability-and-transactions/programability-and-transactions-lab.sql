#---------- 01. Count Employees by Town ----------

DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(45))
RETURNS DOUBLE
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE employees_count DOUBLE;
    SET employees_count := 
    (
		SELECT COUNT(employee_id)
        FROM employees AS e
		JOIN addresses AS a
        ON e.address_id = a.address_id
        JOIN towns AS t
        ON a.town_id = t.town_id
        WHERE t.`name` = town_name
    );
    RETURN employees_count;
END$$


#---------- 02. Employees Promotion ----------

DELIMITER $$
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(45))
BEGIN
UPDATE employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
SET e.salary = e.salary * 1.05
WHERE d.`name` = department_name;
END;
END$$


#---------- 03. Employees Promotion By ID ----------

DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
	START TRANSACTION;
    IF((SELECT COUNT(employee_id)
		FROM employees
        WHERE employee_id = id)
        <>1)
	THEN
		ROLLBACK;
	ELSE
		UPDATE employees AS e
        SET salary = salary * 1.05
        WHERE e.employee_id = id;
	END IF;
END$$

    
#---------- 04. Triggered ----------

CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	middle_name VARCHAR(20),
	job_title VARCHAR(50),
	department_id INT,
	salary DOUBLE
);

DELIMITER $$
CREATE TRIGGER tr_deleted_employees
AFTER DELETE
ON employees
FOR EACH ROW
BEGIN
	INSERT INTO deleted_employees(first_name, last_name, middle_name, job_title, department_id, salary)
    VALUES (OLD. first_name, OLD.last_name, OLD.middle_name, OLD.job_title, OLD.department_id, OLD.salary);
    END;
END $$