#---------- 01. Select Employee Information ----------

SELECT `id`, `first_name`, `last_name`, `job_title`
FROM `employees`;


#---------- 02. Select Employees with Filter ----------

SELECT `id`, concat_ws(' ',`first_name`, `last_name`) AS 'full_name', `job_title`, `salary`
CONCAT 
FROM `employees`
WHERE `salary` > 1000.00;


#---------- 03. Update Salary and Select ----------

UPDATE `employees`
SET `salary` = `salary` * 1.1
WHERE `job_title` = 'Therapist';

SELECT `salary` FROM `employees` ORDER BY `salary`;


#---------- 04. Top Paid Employee ----------

SELECT * FROM `employees` ORDER BY `salary` DESC
LIMIT 1;


#---------- 05. Select Employees by Multiple Filters ----------

SELECT * FROM `employees`
WHERE (`department_id` = 4 AND `salary` >= 1600);


#---------- 06. Delete from Table ----------

DELETE FROM `employees`
WHERE `department_id` = 1 OR `department_id` = 2;

SELECT * FROM `employees`;