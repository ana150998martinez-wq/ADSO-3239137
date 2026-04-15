----------------------------------------------------------------------------------------------
								-- CREATE

CREATE TABLE client (
    id_client 		SERIAL	 	PRIMARY KEY,
    type_document 	VARCHAR(10),
    document 		INT,
    name 			VARCHAR(50),
    phone 			VARCHAR(20)
	);

CREATE TABLE vehicle (
    id_vehicle 		SERIAL 		PRIMARY KEY,
    brand 			VARCHAR(50),
    model 			VARCHAR(50),
    year 			INT,
    price_day 		DECIMAL(10,2),
    available 		BOOLEAN
);

CREATE TABLE employee (
    id_employee 	SERIAL 		PRIMARY KEY,
    type_document 	VARCHAR(10),
    document 		INT,
    name 			VARCHAR(50),
    phone 			VARCHAR(20)
	);

CREATE TABLE rent (
    id_rent 		SERIAL 		PRIMARY KEY,
    id_client 		INT,
    id_employee 	INT,
    date 			TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_client) REFERENCES client (id_client),
    FOREIGN KEY (id_employee) REFERENCES employee (id_employee)
	);
    
CREATE TABLE detail_rent (
    id_detail_rent 	SERIAL 		PRIMARY KEY,
    id_rent 		INT,
    id_vehicle 		INT,
    days 			INT,
    price 			DECIMAL(10,2),
    
    FOREIGN KEY (id_rent) REFERENCES rent (id_rent),
    FOREIGN KEY (id_vehicle) REFERENCES vehicle (id_vehicle)
	);

----------------------------------------------------------------------------------------------
  								-- INSERT
    
INSERT INTO client (type_document, document, name, phone) VALUES
	('CC', 	123456, 	'Juan Perez', 	'300123456'),
	('CC', 	789012, 	'Maria Lopez', 	'301987654'),
	('TI', 	456789, 	'Carlos Ruiz', 	'302456789'),
	('CE', 	321654, 	'Ana Torres', 	'303654987'),
	('CC', 	987321, 	'Luis Gomez', 	'304789123');

INSERT INTO vehicle (brand, model, year, price_day, available) VALUES
	('Toyota', 		'Corolla', 	 2020, 	80000, 	true),
	('Mazda', 		'CX-5', 	 2021, 	120000, true),
	('Chevrolet', 	'Spark',	 2019,	60000, 	true),
	('Kia', 		'Rio',		 2022, 	90000, 	true),
	('Nissan', 		'Versa', 	 2020, 	85000, 	true);

INSERT INTO employee (type_document, document, name, phone) VALUES
	('CC', 	111111, 	'Laura Gomez', 	'300111111'),
	('CC', 	222222, 	'Carlos Perez', '300222222'),
	('TI', 	333333, 	'Ana Ruiz', 	'300333333'),
	('CE', 	444444, 	'Luis Torres', 	'300444444'),
	('CC',	555555, 	'Maria Diaz', 	'300555555');

INSERT INTO rent (id_client, id_employee, date) VALUES
	(1, 	1, 		'2026-04-01 10:00:00'),
	(2, 	2, 		'2026-04-02 11:30:00'),
	(3, 	3, 		'2026-04-03 09:15:00'),
	(4, 	4, 		'2026-04-04 14:45:00'),
	(5, 	5, 		'2026-04-05 16:20:00');

INSERT INTO detail_rent (id_rent, id_vehicle, days, price) VALUES
	(1, 	1, 		3, 		240000),
	(1, 	2, 		2, 		240000),
	(2, 	3, 		5, 		300000),
	(3, 	4, 		1, 		90000),
	(4, 	5, 		4, 		340000),
	(5, 	1, 		2, 		160000);

----------------------------------------------------------------------------------------------
								-- SELECT 
-- Client
SELECT * FROM client;
SELECT name, phone FROM client WHERE type_document = 'CC';

-- Vehicle
SELECT * FROM vehicle;
SELECT brand, price_day FROM vehicle WHERE price_day > 80000;

-- Employee
SELECT * FROM employee;
SELECT name FROM employee WHERE type_document = 'CC';

-- Rent
SELECT * FROM rent;
SELECT * FROM rent WHERE id_client = 1;

-- Detail_rent
SELECT * FROM detail_rent;
SELECT * FROM detail_rent WHERE days > 2;

----------------------------------------------------------------------------------------------
								-- UPDATE 
-- Client 
UPDATE client SET name = 'Juan P.' WHERE id_client = 1;
UPDATE client SET phone = '300999999' WHERE id_client = 2;

-- Vehicle 
UPDATE vehicle SET price_day = 95000 WHERE id_vehicle = 4;
UPDATE vehicle SET available = false WHERE id_vehicle = 1;

-- Employee
UPDATE employee SET name = 'Laura G.' WHERE id_employee = 1;
UPDATE employee SET phone = '300888888' WHERE id_employee = 2;

-- Rent
UPDATE rent SET date = '2026-04-10 10:00:00' WHERE id_rent = 1;
UPDATE rent SET id_employee = 3 WHERE id_rent = 2;

-- Detail_rent
UPDATE detail_rent SET days = 5 WHERE id_detail_rent = 1;
UPDATE detail_rent SET price = 200000 WHERE id_detail_rent = 2;

----------------------------------------------------------------------------------------------
								-- DELETE 
-- CLient
DELETE FROM client WHERE id_client = 5;
DELETE FROM client WHERE document = 456789;

-- Vehicle
DELETE FROM vehicle WHERE id_vehicle = 5;
DELETE FROM vehicle WHERE brand = 'Chevrolet';

-- Employee
DELETE FROM employee WHERE id_employee = 5;
DELETE FROM employee WHERE document = 333333;

-- Rent
DELETE FROM rent WHERE id_rent = 5;
DELETE FROM rent WHERE id_client = 4;

-- Detail_rent
DELETE FROM detail_rent WHERE id_detail_rent = 6;
DELETE FROM detail_rent WHERE days = 1;

----------------------------------------------------------------------------------------------
								-- INNER JOIN 
-- Client
SELECT c.name, r.date FROM client c INNER JOIN rent r ON c.id_client = r.id_client;

-- Vehicle
SELECT v.brand, dr.days
FROM vehicle v
INNER JOIN detail_rent dr ON v.id_vehicle = dr.id_vehicle;

SELECT v.brand, c.name
FROM vehicle v
INNER JOIN detail_rent dr ON v.id_vehicle = dr.id_vehicle
INNER JOIN rent r ON dr.id_rent = r.id_rent
INNER JOIN client c ON r.id_client = c.id_client;

-- Employee
SELECT e.name, r.date
FROM employee e
INNER JOIN rent r ON e.id_employee = r.id_employee;

SELECT e.name, c.name
FROM employee e
INNER JOIN rent r ON e.id_employee = r.id_employee
INNER JOIN client c ON r.id_client = c.id_client;

-- Rent
SELECT r.id_rent, c.name
FROM rent r
INNER JOIN client c ON r.id_client = c.id_client;

SELECT r.id_rent, e.name
FROM rent r
INNER JOIN employee e ON r.id_employee = e.id_employee;

-- Detail_rent
SELECT dr.id_detail_rent, v.brand
FROM detail_rent dr
INNER JOIN vehicle v ON dr.id_vehicle = v.id_vehicle;
