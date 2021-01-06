---------- 01. Mountains and Peaks ----------

CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(45) NOT NULL
);

CREATE TABLE `peaks`(
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `mountain_id` INT NOT NULL,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
);


---------- 02. Trip Organization ----------

SELECT vehicles.driver_id, vehicles.vehicle_type, CONCAT(campers.first_name,' ' , campers.last_name) AS 'driver_name'
FROM vehicles
JOIN campers ON
campers.id = vehicles.driver_id;


---------- 03. SoftUni Hiking ----------

SELECT r.starting_point AS 'route_starting_point',
	r.end_point AS 'route_ending_point',
    r.leader_id,
    CONCAT(c.first_name, ' ', c.last_name) AS 'leader_name'
FROM routes AS r
JOIN campers AS c
ON c.id = r.leader_id;


---------- 04. Delete Mountains ----------

CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(45) NOT NULL
);

CREATE TABLE `peaks`(
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `mountain_id` INT NOT NULL,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
    ON DELETE CASCADE
);