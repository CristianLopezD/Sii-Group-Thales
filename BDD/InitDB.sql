



IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'siiGroup_ThalesDB')
    create database siiGroup_ThalesDB

use siiGroup_ThalesDB

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Employees')
	-- create the Employees table
	CREATE TABLE Employees (
	   EmployeeID	INT PRIMARY KEY,
	   FirstName	VARCHAR(50),
	   LastName		VARCHAR(50),
	   [Address]	VARCHAR(100),
	   Salary		MONEY,
	   AnualSalary AS Salary * 12,
	   HireDate		DATE
	);

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Period')
	-- create the [Period] table
	CREATE TABLE [Period] (
	   PeriodId		INT NOT NULL,
	   PeriodName	VARCHAR(50),
	   CONSTRAINT PK_Period PRIMARY KEY ( PeriodId)
	);

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Payroll')
	-- create the Payroll table
	CREATE TABLE Payroll (
	   PayrollID INT PRIMARY KEY,
	   EmployeeID INT,
	   PayPeriodID INT,
	   NetPay MONEY,
	   FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	   FOREIGN KEY (PayPeriodID) REFERENCES [Period](PeriodId)
	);


if(select Count(*) from Employees) = 0
	-- Insert data into the Employees table
	INSERT INTO Employees	(EmployeeID, FirstName, LastName, [Address], Salary,  HireDate) 
	VALUES					(1, 'John', 'Doe', '123 Main St',				50000,	'2020-01-01'),
							(2, 'Jane', 'Smith', '456 Elm St',				60000,	'2019-05-01'),
							(3, 'Bob', 'Johnson', '789 Oak St',				75000,	'2018-09-01'),
							(4, 'Mary', 'Williams', '1011 Maple St',		90000,  '2017-01-01'),
							(5, 'Tom', 'Brown', '1213 Pine St',				100000, '2016-02-01'),
							(6, 'Sara', 'Garcia', '1415 Cedar St',			55000,	'2021-03-01'),
							(7, 'David', 'Lee', '1617 Walnut St',			65000,	'2020-06-01'),
							(8, 'Lisa', 'Chen', '1819 Chestnut St',			80000,	'2019-08-01'),
							(9, 'Mike', 'Jones', '2021 Birch St',			70000,	'2018-02-01'),
							(10, 'Amy', 'Kim', '2223 Spruce St',			95000,	'2017-05-01'),
							(11, 'William', 'Davis', '2425 Oak St',			85000,	'2020-01-15'),
							(12, 'Emily', 'Gonzalez', '2627 Cedar St',		75000,	'2019-02-14'),
							(13, 'Daniel', 'Lee', '2829 Maple St',			60000,	'2018-03-13'),
							(14, 'Catherine', 'Wang', '3031 Pine St',		95000,	'2017-04-12'),
							(15, 'James', 'Lopez', '3233 Elm St',			70000,	'2016-05-11'),
							(16, 'Rachel', 'Harris', '3435 Walnut St',		80000,	'2021-06-10'),
							(17, 'Steven', 'Nguyen', '3637 Chestnut St',	55000,	'2020-07-09'),
							(18, 'Karen', 'Martinez', '3839 Birch St',		90000,	'2019-08-08'),
							(19, 'Andrew', 'Wilson', '4041 Spruce St',		65000,	'2018-09-07'),
							(20, 'Jessica', 'Taylor', '4243 Oak St',		100000, '2017-10-06'),
							(21, 'Maria', 'Garcia', '4445 Pine St',			85000,  '2020-01-15'),
							(22, 'David', 'Smith', '4647 Elm St',			75000,	'2019-02-14'),
							(23, 'Isabella', 'Davis', '4849 Walnut St',		60000,	'2018-03-13'),
							(24, 'Jacob', 'Wilson', '5051 Spruce St',		95000,  '2017-04-12'),
							(25, 'Ella', 'Brown', '5253 Oak St',			70000,	'2016-05-11'),
							(26, 'Ethan', 'Johnson', '5455 Cedar St',		80000,	'2021-06-10'),
							(27, 'Avery', 'Williams', '5657 Chestnut St',	55000,	'2020-07-09'),
							(28, 'Mia', 'Miller', '5859 Birch St',			90000,  '2019-08-08'),
							(29, 'Michael', 'Gonzalez', '6061 Maple St',	65000,	'2018-09-07'),
							(30, 'Sophia', 'Davis', '6263 Pine St',			100000, '2017-10-06'),
							(31, 'Emily', 'Johnson', '6465 Ash St',			85000,  '2021-11-05'),
							(32, 'Daniel', 'Brown', '6667 Elm St',			75000,	'2020-12-04'),
							(33, 'Grace', 'Garcia', '6869 Walnut St',		60000,	'2019-01-03'),
							(34, 'Ryan', 'Smith', '7071 Spruce St',			95000,  '2018-02-02'),
							(35, 'Chloe', 'Wilson', '7273 Oak St',			70000,	'2017-03-03'),
							(36, 'Noah', 'Miller', '7475 Cedar St',			80000,	'2016-04-04'),
							(37, 'Ava', 'Davis', '7677 Chestnut St',		55000,	'2021-05-05'),
							(38, 'William', 'Williams', '7879 Birch St',	90000,  '2020-06-06'),
							(39, 'Victoria', 'Gonzalez', '8081 Maple St',	65000,	'2019-07-07'),
							(40, 'Oliver', 'Davis', '8283 Pine St',			100000, '2018-08-08');

if(select Count(*) from [Period]) = 0
	-- Insert data into the Period table
	INSERT INTO [Period] (PeriodId, PeriodName) 
	VALUES				 (1, 'January'		),
						 (2, 'February'		),
						 (3, 'March'		),
						 (4, 'April'		),
						 (5, 'May'			),
						 (6, 'June'			),
						 (7, 'July'			),
						 (8, 'August'		),
						 (9, 'September'	),
						 (10, 'October'		),
						 (11, 'November'	),
						 (12, 'December'	);

if(select Count(*) from Payroll) = 0
	-- Insert data into the Payroll table
	INSERT INTO Payroll (PayrollID, EmployeeID, PayPeriodID, NetPay) 
	VALUES				(1, 1, 1,	50000	),
						(2, 2, 1,	60000	),
						(3, 3, 1,	75000	),
						(4, 4, 1,	90000	),
						(5, 5, 1,	100000	),
						(6, 6, 1,	55000	),
						(7, 7, 1,	65000	),
						(8, 8, 1,	80000	),
						(9, 9, 1,	70000	),
						(10, 10, 1, 95000	),
						(11, 11, 2, 85000	),
						(12, 12, 2, 75000	),
						(13, 13, 2, 60000	),
						(14, 14, 2, 95000	),
						(15, 15, 2, 70000	),
						(16, 16, 2, 80000	),
						(17, 17, 2, 55000	),
						(18, 18, 2, 90000	),
						(19, 19, 2, 65000	),
						(20, 20, 2, 100000	),
						(21, 21, 3, 85000	),
						(22, 22, 3, 75000	),
						(23, 23, 3, 60000	),
						(24, 24, 3, 95000	),
						(25, 25, 3, 70000	),
						(26, 26, 3, 80000	),
						(27, 27, 3, 55000	),
						(28, 28, 3, 90000	),
						(29, 29, 3, 65000	),
						(30, 30, 3, 100000	),
						(31, 31, 4, 85000	),
						(32, 32, 4, 75000	),
						(33, 33, 4, 60000	),
						(34, 34, 4, 95000	),
						(35, 35, 4, 70000	),
						(36, 36, 4, 80000	),
						(37, 37, 4, 55000	),
						(38, 38, 4, 90000	),
						(39, 39, 4, 65000	),
						(40, 40, 4, 100000	);
