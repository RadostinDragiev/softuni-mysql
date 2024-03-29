#---------- 01. Departments Info ----------

SELECT `department_id`, COUNT(`department_id`) FROM `employees`
GROUP BY `department_id`;


#---------- 02. Average Salary ----------

SELECT `department_id`, round(AVG(`salary`), 2) AS 'Average Salary'
FROM `employees`
GROUP BY `department_id`;


#---------- 03. Minimum Salary ----------

SELECT `department_id`, ROUND(MIN(`salary`)) AS 'Min Salary'
FROM `employees`
GROUP BY `department_id`
HAVING min(`salary`) > 800;


#---------- 04. Appetizers Count ----------

SELECT COUNT(`category_id`) AS 'This' FROM `products`
WHERE `category_id` = 2 AND `price` > 8
GROUP BY `category_id`;


#---------- 05. Menu Prices ----------

SELECT `category_id`, round(avg(`price`), 2) AS 'Average Price', round(min(`price`), 2) AS 'Cheapest Product',
round(max(`price`), 2) AS 'Most Expensice Product'
FROM `products`
GROUP BY `category_id`;