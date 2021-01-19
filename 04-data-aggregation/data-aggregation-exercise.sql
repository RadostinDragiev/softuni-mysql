#---------- 01. Records’ Count ----------

SELECT COUNT(`id`) AS 'count'
FROM `wizzard_deposits`;


#---------- 02. Longest Magic Wand ----------

SELECT max(`magic_wand_size`) AS 'longest magic wand' FROM `wizzard_deposits`;


#---------- 03. Longest Magic Wand per Deposit Groups ----------

SELECT `deposit_group`, max(`magic_wand_size`) AS 'longest_magic_wand' FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand`, `deposit_group`;


#---------- 04. Smallest Deposit Group per Magic Wand Size ----------

SELECT `deposit_group` FROM `wizzard_deposits`
HAVING min(`magic_wand_size`);


#---------- 05. Deposits Sum ----------

SELECT `deposit_group`, sum(`deposit_amount`) AS 'total_sum' FROM `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `total_sum`;


#---------- 06. Deposits Sum for Ollivander Family ----------

SELECT `deposit_group`, sum(`deposit_amount`) AS 'total_sum' FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group`;


#---------- 07. Deposits Filter ----------

SELECT `deposit_group`, sum(`deposit_amount`) AS 'total_sum' FROM `wizzard_deposits`
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;


#---------- 08. Deposit Charge ----------

SELECT `deposit_group`, `magic_wand_creator`, min(`deposit_charge`) FROM `wizzard_deposits`
GROUP BY `deposit_group`, `magic_wand_creator`
ORDER BY `magic_wand_creator`, `deposit_group`;


#---------- 09. Age Groups ----------

SELECT
(CASE
WHEN `age`BETWEEN 0 AND 10 THEN '[0-10]'
WHEN `age`BETWEEN 11 AND 20 THEN '[11-20]'
WHEN `age`BETWEEN 21 AND 30 THEN '[21-30]'
WHEN `age`BETWEEN 31 AND 40 THEN '[31-40]'
WHEN `age`BETWEEN 41 AND 50 THEN '[41-50]'
WHEN `age`BETWEEN 51 AND 60 THEN '[51-60]'
ELSE '[61+]'
END) AS 'age_group', COUNT(`age`)
FROM `wizzard_deposits`
GROUP BY `age_group`
ORDER BY `age_group`;


#---------- 10. First Letter ----------

SELECT SUBSTRING(`first_name`,1,1) AS 'first_letter' FROM `wizzard_deposits`
WHERE `deposit_group` = 'Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter`;


#---------- 11. Average Interest ----------

SELECT `deposit_group`, `is_deposit_expired`, AVG(`deposit_interest`) FROM `wizzard_deposits`
WHERE `deposit_start_date` > '1985-01-01'
GROUP BY `deposit_group` , `is_deposit_expired`
ORDER BY `deposit_group` DESC;


#---------- 12. Rich Wizard, Poor Wizard ----------

SELECT SUM(diff.next) AS 'sum_deifference'
FROM (
	SELECT `deposit_amount` - 
		(SELECT `deposit_amount`
         FROM `wizzard_deposits`
         WHERE `id` = wd.id + 1) AS 'next'
FROM `wizzard_deposits` AS wd) AS diff;


#---------- 13. Employees Minimum Salaries ----------

SELECT `department_id`, ROUND(MIN(`salary`), 4) AS 'minimum_salary' FROM `employees`
WHERE `department_id` IN(2,5,7) AND `hire_date` > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id`;


#---------- 14. Employees Average Salaries ----------

CREATE TABLE `average_salaries` AS
SELECT * FROM `employees` WHERE `salary` > 30000;

DELETE FROM `average_salaries`
WHERE `manager_id` = 42;

UPDATE `average_salaries`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;

SELECT `department_id`, AVG(`salary`) AS 'avg_salary'
FROM `average_salaries`
GROUP BY `department_id`
ORDER BY `department_id`;


#---------- 15. Employees Maximum Salaries ----------

SELECT `department_id`, MAX(`salary`) AS 'max_salary' FROM `employees`
GROUP BY `department_id`
HAVING MAX(`salary`) NOT BETWEEN 30000 AND 70000
ORDER BY `department_id`;


#---------- 16. Employees Count Salaries ----------

SELECT COUNT(`salary`) AS ''FROM `employees`
WHERE `manager_id` IS NULL;


#---------- 19. Departments Total Salaries ----------

SELECT `department_id`, SUM(`salary`) FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id`;