#---------- 01. Create Tables ----------

CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(45) NOT NULL,
`last_name` VARCHAR(45) NOT NULL
);
CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL
);
CREATE TABLE `products`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL,
`category_id` INT
);


#---------- 02. Insert Data in Tables ----------

INSERT INTO `employees`(`id`, `first_name`, `last_name`)
VALUES(1, 'Ivan', 'Petkov'),
(2, 'Petko', 'Misho'),
(3, 'Joro', 'Kiro');


#---------- 03. Alter Table ----------

ALTER TABLE `employees`
ADD `middle_name` DECIMAL;


#---------- 04. Adding Constraints ----------

ALTER TABLE `products`
ADD CONSTRAINT `fk_products_cateories`
FOREIGN KEY (category_id)
REFERENCES categories(id);


#---------- 05. Modifying Columns ----------

ALTER TABLE `employees` 
CHANGE COLUMN `middle_name` `middle_name` VARCHAR(100);
