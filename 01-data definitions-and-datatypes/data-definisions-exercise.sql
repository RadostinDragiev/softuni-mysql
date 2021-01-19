#---------- 01. Create Tables ----------

CREATE TABLE minions(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
	age INT
);

CREATE TABLE towns(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(45)
);


#---------- 02. Alter Minions Table ----------

ALTER TABLE `minions` ADD COLUMN `town_id` INT NOT NULL;

ALTER TABLE `minions` 
ADD CONSTRAINT fk_minions_towns 
FOREIGN KEY (`town_id`) REFERENCES `towns`(`id`);


#---------- 03. Insert Records in Both Tables ----------

INSERT INTO `towns`(id, name) VALUES (1, 'Sofia');
INSERT INTO `towns`(id, name) VALUES (2, 'Plovdiv');
INSERT INTO `towns`(id, name) VALUES (3, 'Varna');

INSERT INTO `minions`(id, name, age, town_id) VALUES (1, 'Kevin', 22, 1);
INSERT INTO `minions`(id, name, age, town_id) VALUES (2, 'Bob', 15, 3);
INSERT INTO `minions`(id, name, age, town_id) VALUES (3, 'Steward', NULL, 2);


#---------- 04. Truncate Table Minions ----------

TRUNCATE TABLE `minions`;


#---------- 05. Drop All Tables ----------

DROP TABLE `minions`;
DROP TABLE `towns`;


#---------- 06. Create Table People ----------

CREATE TABLE `people`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` DECIMAL(5, 2),
`weight` DECIMAL(5, 2),
`gender` CHAR(1) NOT NULL,
`birthdate` DATE NOT NULL,
`biography` TEXT
);

INSERT INTO `people`(name, gender, birthdate) VALUES('Ivan Ivanov', 'M', '1993-11-15');
INSERT INTO `people`(name, gender, birthdate) VALUES('Misho', 'M', '1993-09-15');
INSERT INTO `people`(name, gender, birthdate) VALUES('Maria', 'F', '1998-01-12');
INSERT INTO `people`(name, gender, birthdate) VALUES('Trifon', 'M', '1993-06-15');
INSERT INTO `people`(name, gender, birthdate) VALUES('Gabriela', 'F', '1993-05-25');


#---------- 07. Create Table Users ----------

CREATE TABLE `users`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB,
`last_login_time` TIMESTAMP,
`is_deleted` BOOLEAN
);

INSERT INTO `users`(username, password) 
VALUES('myaccount', 'password'),
('myaccount', 'password'),
('myaccount', 'password'),
('myaccount', 'password'),
('myaccount', 'password');


#---------- 08. Change Primary Key ----------

ALTER TABLE users
  MODIFY id INT NOT NULL;
ALTER TABLE users
  DROP PRIMARY KEY;
ALTER TABLE users
  ADD CONSTRAINT pk_users PRIMARY KEY (id,username);


#---------- 09. Set Default Value of a Field ----------

ALTER TABLE `users`
MODIFY COLUMN `last_login_time` TIMESTAMP
DEFAULT CURRENT_TIMESTAMP;


#---------- 10. Set Unique Field ----------

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_id
PRIMARY KEY(id),
ADD CONSTRAINT uq_username
UNIQUE(username);


#---------- 11. Movies Database ----------

CREATE TABLE `directors`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`director_name` VARCHAR(45) NOT NULL,
`notes` TEXT
);

CREATE TABLE `genres`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`genre_name` VARCHAR(45) NOT NULL,
`notes` TEXT
);

CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`category_name` VARCHAR(45) NOT NULL,
`notes` TEXT
);

CREATE TABLE `movies`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
`title` VARCHAR(45) NOT NULL,
`director_id` INT NOT NULL,
`copyright_year` INT,
`length` INT,
`genre_id` INT NOT NULL,
`category_id` INT NOT NULL,
`rating` INT,
`notes` TEXT
);

INSERT INTO `movies`(title, director_id, genre_id, category_id)
VALUES('Harry Potter', 1, 2, 3),
('Harry Potter', 3, 2, 3),
('Harry Potter', 1, 1, 2),
('Harry Potter', 3, 1, 2),
('Harry Potter', 2, 3, 1);

INSERT INTO `directors`(director_name) VALUES('Ivan');
INSERT INTO `directors`(director_name) VALUES('Ivan');
INSERT INTO `directors`(director_name) VALUES('Ivan');
INSERT INTO `directors`(director_name) VALUES('Ivan');
INSERT INTO `directors`(director_name) VALUES('Ivan');

INSERT INTO `genres`(genre_name) VALUES('Comedy');
INSERT INTO `genres`(genre_name) VALUES('Comedy');
INSERT INTO `genres`(genre_name) VALUES('Comedy');
INSERT INTO `genres`(genre_name) VALUES('Comedy');
INSERT INTO `genres`(genre_name) VALUES('Comedy');

INSERT INTO `categories`(category_name) VALUES('Cool');
INSERT INTO `categories`(category_name) VALUES('Cool');
INSERT INTO `categories`(category_name) VALUES('Cool');
INSERT INTO `categories`(category_name) VALUES('Cool');
INSERT INTO `categories`(category_name) VALUES('Cool');


#---------- 12. Car Rental Database ----------

create table categories
(
    id INT(11) AUTO_INCREMENT primary key,
    category varchar(50) not null,
    daily_rate int(3),
    weekly_rate int(3),
    monthly_rate int(3),
    weekend_rate int(3)
);
create table cars
(
    id INT AUTO_INCREMENT primary key,
    plate_number varchar(50) not null,
    make varchar(50),
        model varchar(50),
    car_year int(4),
    category_id INT(11),
    doors INT(2),
    picture blob,
    car_condition varchar(50),
    available bool
);
create table employees
(
    id INT AUTO_INCREMENT primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    title varchar(50),
    notes text
);
create table customers
(
    id INT AUTO_INCREMENT primary key,
    driver_licence_number int(11) not null,
    full_name varchar(50),
    address varchar(50),
    city varchar(50),
    zip_code int(5),
    notes text
);
 
create table rental_orders
(
    id INT AUTO_INCREMENT primary key,
    employee_id int(11) not null,
    customer_id int(11),
    car_id int(11) not null,
    car_condition varchar(50),
    tank_level INT(11),
    kilometrage_start int(11),
    kilometrage_end int(11),
    total_kilometrage int(11),
    start_date date,
    end_date date,
    total_days INT(11),
    rate_applied INT(3),
    tax_rate INT(11),
    order_status varchar(50),
    notes text
);
insert into cars(plate_number)
values ('123'),('1234'),('12345');
insert into categories(category)
values ('Classic'),('Limuzine'),('Sport');
insert into customers(driver_licence_number)
values ('2232'),('232323'),('111');
insert into employees(first_name,last_name)
values ('Ivan', 'Ivanov'),('Ivan1', 'Ivanov1'), ('Ivan2', 'Ivanov2');
insert into rental_orders(employee_id,car_id)
values (1, 1),(1, 2), (2, 3);


#---------- 14. Basic Insert ----------

INSERT INTO `towns`(name) VALUE('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO `departments`(name) VALUE('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO `employees`(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00);
INSERT INTO `employees`(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00);
INSERT INTO `employees`(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25);
INSERT INTO `employees`(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00);
INSERT INTO `employees`(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

#---------- 15. Basic Select All Fields ----------

SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;


#---------- 16. Basic Select All Fields and Order Them ----------

SELECT * FROM `towns`
ORDER BY name;
SELECT * FROM `departments`
ORDER BY name;
SELECT * FROM `employees`
ORDER BY salary DESC;

#---------- 17. Basic Select Some Fields ----------

SELECT towns.name FROM towns ORDER BY name;
SELECT departments.name FROM departments ORDER BY name;
SELECT e.first_name, e.last_name, e.job_title, e.salary FROM employees AS e ORDER BY salary DESC;


#---------- 18. Increase Employees Salary ----------

UPDATE `employees`
SET `salary` = `salary` * 1.1;
SELECT employees.salary FROM employees;


#---------- 19. Decrease Tax Rate ----------

UPDATE `payments`
SET `tax_rate` = `tax_rate` * 0.97;

SELECT `tax_rate` FROM `payments`;


#---------- 20. Delete All Records ----------

TRUNCATE TABLE `occupancies`;