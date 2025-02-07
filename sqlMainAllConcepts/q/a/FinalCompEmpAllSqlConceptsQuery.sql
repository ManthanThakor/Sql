--============================================================
------------------------FINAL PRACTICE------------------------ 
--============================================================

-- Create the database
--CREATE DATABASE CompanyDBFinalPractice;

-- Use the database
USE CompanyDBFinalPractice;


--===================================

-- Create the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Position VARCHAR(100),
    Email VARCHAR(100) UNIQUE,  -- Unique email for each employee
    Phone VARCHAR(15),          -- Employee phone number
    HireDate DATE,              -- Date the employee was hired
    Salary DECIMAL(10, 2),      -- Employee salary
    Status VARCHAR(50),         -- Active or Inactive status
    DateOfBirth DATE,           -- Employee date of birth
    Address VARCHAR(255)        -- Employee address
);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100),
    ManagerID INT,  -- Manager of the department (references EmployeeID)
    Budget DECIMAL(15, 2),  -- Budget allocated to the department
    EstablishedYear INT,    -- Year the department was established
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)  -- References the manager from Employees table
);

-- Create the EmployeeDepartments table
CREATE TABLE EmployeeDepartments (
    EmployeeID INT,
    DepartmentID INT,
    DateAssigned DATETIME,  -- Date when the employee was assigned to the department
    Role VARCHAR(100),      -- Role of the employee within the department
    Salary DECIMAL(10, 2),  -- Employee's salary in the department
    PRIMARY KEY (EmployeeID, DepartmentID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Creating the table 
CREATE TABLE Tbl_UniqueIdentification (
    col1 NVARCHAR(255)
);

--============================================================

INSERT INTO Employees (FirstName, LastName, Position, Email, Phone, HireDate, Salary, Status, DateOfBirth, Address)
VALUES 
('John', 'Doe', 'Software Engineer', 'john.doe@example.com', '1234567890', '2020-01-15', 75000, 'Active', '1990-05-10', '123 Main St'),
('Jane', 'Smith', 'Data Analyst', 'jane.smith@example.com', '1234567891', '2018-07-20', 65000, 'Active', '1992-03-12', '456 Oak St'),
('Emily', 'Johnson', 'Product Manager', 'emily.johnson@example.com', '1234567892', '2017-09-10', 90000, 'Active', '1988-11-22', '789 Pine St'),
('Michael', 'Brown', 'Software Engineer', 'michael.brown@example.com', '1234567893', '2021-02-05', 72000, 'Active', '1994-08-15', '101 Maple St'),
('Sarah', 'Davis', 'HR Manager', 'sarah.davis@example.com', '1234567894', '2016-04-25', 85000, 'Active', '1985-01-30', '202 Birch St'),
('David', 'Martinez', 'Quality Assurance', 'david.martinez@example.com', '1234567895', '2019-10-18', 60000, 'Active', '1991-06-05', '303 Cedar St'),
('Anna', 'Garcia', 'Marketing Manager', 'anna.garcia@example.com', '1234567896', '2015-03-12', 95000, 'Active', '1987-07-20', '404 Elm St'),
('James', 'Miller', 'Software Engineer', 'james.miller@example.com', '1234567897', '2022-06-01', 73000, 'Active', '1995-09-14', '505 Willow St'),
('Linda', 'Wilson', 'Business Analyst', 'linda.wilson@example.com', '1234567898', '2020-01-30', 68000, 'Active', '1993-04-05', '606 Fir St'),
('Robert', 'Moore', 'Database Administrator', 'robert.moore@example.com', '1234567899', '2014-12-10', 105000, 'Active', '1983-11-25', '707 Ash St');


INSERT INTO Departments (DepartmentName, Location, ManagerID, Budget, EstablishedYear)
VALUES 
('Engineering', 'New York', 1, 500000, 2015),
('Marketing', 'San Francisco', 7, 400000, 2010),
('HR', 'Chicago', 5, 300000, 2005),
('Sales', 'Los Angeles', 4, 450000, 2012),
('Product Management', 'Austin', 3, 600000, 2017),
('Quality Assurance', 'Boston', 6, 350000, 2013),
('Business Analysis', 'Seattle', 9, 250000, 2018),
('IT Support', 'Miami', 10, 200000, 2010),
('Customer Service', 'Denver', 8, 150000, 2015),
('Finance', 'Dallas', 2, 550000, 2008);


INSERT INTO EmployeeDepartments (EmployeeID, DepartmentID, DateAssigned, Role, Salary)
VALUES 
(1, 1, '2020-01-15', 'Lead Developer', 75000),
(2, 1, '2018-07-20', 'Junior Data Analyst', 65000),
(3, 2, '2017-09-10', 'Senior Product Manager', 90000),
(4, 1, '2021-02-05', 'Junior Developer', 72000),
(5, 3, '2016-04-25', 'HR Manager', 85000),
(6, 6, '2019-10-18', 'QA Specialist', 60000),
(7, 2, '2015-03-12', 'Marketing Manager', 95000),
(8, 1, '2022-06-01', 'Junior Software Engineer', 73000),
(9, 7, '2020-01-30', 'Business Analyst', 68000),
(10, 4, '2014-12-10', 'Database Administrator', 105000);


INSERT INTO Tbl_UniqueIdentification (col1)
VALUES 
    ('A001/DJ-402\44_/100/2015'),
    ('A001_\DJ-402\44_/100/2015'),
    ('A001_DJ-402-2014-2015'),
    ('A002_DJ-401-2014-2015'),
    ('A001/DJ_401'),
    ('A001/DJ_402\44'),
    ('A001/DJ_402\44\2015'),
    ('A001/DJ-402%45\2015/200'),
    ('A001/DJ_402\45\2015%100'),
    ('A001/DJ_402%45\2015/300'),
    ('A001/DJ-402\44');

--============================================================
--============================================================

--SQL Operations

--============================================================
--============================================================

--1. Insert Data in tables 

---- Insert employees
--INSERT INTO Employees (FirstName, LastName, Position, Email, Phone, HireDate, Salary, Status, DateOfBirth, Address)
--VALUES ('John', 'Doe', 'Software Engineer', 'john.doe@example.com', '1234567890', '2020-01-15', 75000, 'Active', '1990-05-10', '123 Main St');

---- Insert departments
--INSERT INTO Departments (DepartmentName, Location, ManagerID, Budget, EstablishedYear)
--VALUES ('Engineering', 'New York', 1, 500000, 2015);

---- Assign employee to department
--INSERT INTO EmployeeDepartments (EmployeeID, DepartmentID, DateAssigned, Role, Salary)
--VALUES (1, 1, '2020-01-15', 'Lead Developer', 75000);

--============================================================

--2.Fetch all records from the Employees table:

SELECT * FROM Employees;

--============================================================

--3. Fetch all records from the Departments table:

SELECT * FROM Departments;

--============================================================

--4. Fetch all records from the EmployeeDepartments table:

SELECT * FROM EmployeeDepartments;

--============================================================

--5. Fetch all records from the Tbl_UniqueIdentification table:

SELECT * FROM Tbl_UniqueIdentification;

--============================================================

--6. Fetch all records with details from the Employees, Departments, and EmployeeDepartments tables using JOIN:
--If you want to fetch all employee details along with their department information, you can use a JOIN to combine data from multiple tables. Here's an example:

SELECT 
    e.EmployeeID, e.FirstName, e.LastName, e.Position, e.Email, 
    d.DepartmentName, d.Location, ed.Role, ed.Salary
FROM Employees e
JOIN EmployeeDepartments ed ON e.EmployeeID = ed.EmployeeID
JOIN Departments d ON ed.DepartmentID = d.DepartmentID;

--============================================================

-- Add a 5000 bonus to the salary

SELECT FirstName, LastName, Salary + 5000 AS TotalSalary
FROM Employees;

--============================================================

-- Calculate the difference between highest and lowest salary

SELECT MAX(Salary) - MIN(Salary) AS SalaryDifference
FROM Employees;

--============================================================

-- Calculate the highest salary from employess 

SELECT MAX(Salary) AS HighSalary
FROM Employees;

--============================================================

-- Calculate the lowest salary from employess 

SELECT MIN(Salary) AS LowSalary
FROM Employees;

--============================================================

-- Calculate annual salary from monthly salary

SELECT FirstName, LastName, Salary * 12 AS AnnualSalary
FROM Employees;

--============================================================

-- Calculate monthly salary from annual salary

SELECT FirstName, LastName, Salary / 12 AS MonthlySalary
FROM Employees;

--============================================================

-- Find employees who either have a salary greater than 80000 or have the position 'Software Engineer'

SELECT FirstName, LastName, Position, Salary
FROM Employees
WHERE Salary > 80000 OR Position = 'Software Engineer';

--============================================================


-- Find employees who are not assigned a position

SELECT FirstName, LastName
FROM Employees
WHERE Position IS NULL;

--============================================================

-- Find employees who are assigned a position

SELECT FirstName, LastName
FROM Employees
WHERE Position IS NOT NULL;

--============================================================

-- Find employees who have a position 'Data Analyst' or 'Software Engineer'

SELECT FirstName, LastName, Position
FROM Employees
WHERE Position IN ('Data Analyst', 'Software Engineer');

--============================================================

-- Find employees with a salary less than 73000 and the position 'Software Engineer'

SELECT FirstName, LastName, Position, Salary
FROM Employees
WHERE Salary < 73000 AND Position = 'Software Engineer';

--============================================================

-- Find employees who either have a salary greater than 100000 or work as 'Marketing Manager'

SELECT FirstName, LastName, Salary, Position
FROM Employees
WHERE Salary > 100000 OR Position = 'Marketing Manager';

--============================================================

-- Find employees with salary greater than 50000 who are 'HR Managers'

SELECT FirstName, LastName, Position, Salary
FROM Employees
WHERE Salary > 50000 AND Position = 'HR Manager';

--============================================================

-- Find employees whose salary is either 75000 or 85000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary IN (75000, 85000);

--============================================================

-- Find employees whose salary is not 60000 or 70000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary NOT IN (60000, 70000);

--============================================================

-- Special Operator (IS NULL): Find employees who have no email address assigned
SELECT FirstName, LastName
FROM Employees
WHERE Email IS NULL;

--============================================================

-- Find the remainder when salary is divided by 10000

SELECT FirstName, LastName, Salary % 10000 AS SalaryRemainder
FROM Employees;

--============================================================

-- Find employees with salary exactly equal to 75000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary = 75000;

--============================================================

-- Find employees with a position other than 'Software Engineer'

SELECT FirstName, LastName, Position
FROM Employees
WHERE Position != 'Software Engineer';

--============================================================

-- Find employees with salary greater than 80000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 80000;

--============================================================

-- Comparison Operator: Find departments with budget less than 300000

SELECT DepartmentName, Budget
FROM Departments
WHERE Budget < 300000;

--============================================================

-- Find employees with salary greater than 70000 and hired after 2020

SELECT FirstName, LastName, HireDate, Salary
FROM Employees
WHERE HireDate >= '2020-01-01' 
AND Salary >= 70000;

--============================================================

-- Find employees with salary between 60000 and 80000 and hired after 2015

SELECT FirstName, LastName, Salary, HireDate
FROM Employees
WHERE Salary BETWEEN 60000 AND 80000 
AND HireDate > '2015-01-01';

--============================================================

-- Find employees with either phone or address missing

SELECT FirstName, LastName, Phone, Address
FROM Employees
WHERE Phone IS NULL OR Address IS NULL;

--============================================================

-- Find employees with salary between 70000 and 90000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 70000 AND 90000;

--============================================================

-- Find employees with phone numbers 

SELECT FirstName, LastName, Phone
FROM Employees
WHERE Phone IS NOT NULL;

--============================================================

-- Find employees whose last name starts with 'S'

SELECT FirstName, LastName
FROM Employees
WHERE LastName LIKE 'S%';

--============================================================

-- Find employees hired between 2017 and 2020

SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate BETWEEN '2017-01-01' AND '2020-12-31';

--============================================================

--  Find departments not located in San Francisco or Chicago

SELECT DepartmentName, Location
FROM Departments
WHERE Location NOT IN ('San Francisco', 'Chicago');

--============================================================

-- Special Operator (IS NOT NULL): Find employees with both phone and address filled

SELECT FirstName, LastName, Phone, Address
FROM Employees
WHERE Phone IS NOT NULL AND Address IS NOT NULL;

--============================================================

-- Arithmetic Operator: Find employees with annual salary greater than 1000000

SELECT FirstName, LastName, Salary * 12 AS AnnualSalary
FROM Employees
WHERE Salary * 12 > 1000000;

--============================================================

-- Find employees with 'Engineer' in their position

SELECT FirstName, LastName, Position
FROM Employees
WHERE Position LIKE '%Engineer%';

--============================================================

-- Find employees whose salary is not between 60000 and 80000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE NOT Salary BETWEEN 60000 AND 80000;

--============================================================

-- Find employees with salary above 70000 and hired before 2018

SELECT FirstName, LastName, Salary, HireDate
FROM Employees
WHERE Salary > 70000 AND HireDate < '2018-01-01';

--============================================================

-- Find employees with no address

SELECT FirstName, LastName, Address
FROM Employees
WHERE Address IS NULL;

--============================================================

-- Find the average salary

SELECT AVG(Salary) AS Average_salary
FROM Employees;

--============================================================

-- Find employees whose salary is below the average salary

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary < (SELECT AVG(Salary) FROM Employees);

--============================================================

-- Find employees with no email or phone

SELECT FirstName, LastName
FROM Employees
WHERE Email IS NULL AND Phone IS NULL;

--============================================================

-- Find employees whose last name doesn't start with 'D'

SELECT FirstName, LastName
FROM Employees
WHERE LastName NOT LIKE 'D%';

--============================================================

-- Find employees born between 1990 and 1995

SELECT FirstName, LastName, DateOfBirth
FROM Employees
WHERE DateOfBirth BETWEEN '1990-01-01' AND '1995-12-31';

--============================================================

--  Find employees with no phone

SELECT FirstName, LastName, Phone
FROM Employees
WHERE Phone IS NULL;

--============================================================

-- Find employees with annual salary greater than 900000

SELECT FirstName, LastName, Salary * 12 AS AnnualSalary
FROM Employees
WHERE Salary * 12 > 900000;

--============================================================

-- Find employees with salary greater than 75000 or less than 60000

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > 75000 OR Salary < 60000;

--============================================================

-- Find employees with salary greater than 75000 or less than 60000 (60000 AND 75000 ALSO INCLUDE)

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 60000 AND 75000; 

--OR--

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary >= 60000 AND Salary <= 75000;

--============================================================

-- 1. Find employees whose first name starts with 'J'

SELECT * FROM Employees 
WHERE FirstName LIKE 'J%';

-- 2. Find employees whose last name ends with 'n'

SELECT * FROM Employees 
WHERE LastName LIKE '%n';

-- 3. Find employees whose email contains 'john' anywhere
SELECT * FROM Employees 
WHERE Email LIKE '%john%';

-- 4. Find employees whose position starts with 'S' and ends with 'r'

SELECT * FROM Employees 
WHERE Position LIKE 'S%r';

-- 5. Find employees with a phone number that contains '1234' anywhere

SELECT * FROM Employees 
WHERE Phone LIKE '%1234%';

-- 6. Find employees whose email starts with 'jane'

SELECT * FROM Employees
WHERE Email LIKE 'jane%';

-- 7. Find employees whose address contains 'St' anywhere

SELECT * FROM Employees 
WHERE Address LIKE '%St%';

-- 8. Find employees whose last name starts with 'B' and has exactly 5 letters

SELECT * FROM Employees 
WHERE LastName LIKE 'B____';

-- 9. Find employees whose first name has 'a' as the second letter

SELECT * FROM Employees 
WHERE FirstName LIKE '_a%';

-- *. Find employees whose first name has 'a' as the second LAST letter

SELECT * FROM Employees 
WHERE FirstName LIKE '%a_';

-- 10. Find employees whose email ends with '.com'

SELECT * FROM Employees 
WHERE Email LIKE '%.com';

-- 11. Find employees whose first name starts with 'A' or 'M'

SELECT * FROM Employees 
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'M%';

-- 12. Find employees whose last name starts with 'M' and ends with 'r'

SELECT * FROM Employees 
WHERE LastName LIKE 'M%r';

-- 13. Find employees with email addresses ending in 'example.com'

SELECT * FROM Employees 
WHERE Email LIKE '%@example.com';

-- 14. Find employees whose last name contains either 'a' or 'e'

SELECT * FROM Employees 
WHERE LastName LIKE '%a%' OR LastName LIKE '%e%';

-- 15. Find employees whose phone numbers start with '123'

SELECT * FROM Employees 
WHERE Phone LIKE '123%';

-- 16. Find employees whose position starts with 'D' or 'M'

SELECT * FROM Employees 
WHERE Position LIKE 'D%' OR Position LIKE 'M%';

-- 17. Find employees whose first name starts with any letter between A and D

SELECT * FROM Employees 
WHERE FirstName LIKE '[A-D]%';

-- *. Find employees whose first name starts with any letter between A and M (not include a and d)

SELECT * FROM Employees 
WHERE FirstName LIKE '[B-L]%';

-- 18. Find employees whose last name does not start with A, B, or C

SELECT * FROM Employees 
WHERE LastName LIKE '[^A-C]%';

-- 19. Find employees whose address contains either 'MAIN' or 'OAK'

SELECT * FROM Employees 
WHERE Address LIKE '%MAIN%' OR Address LIKE '%OAK%';

-- 20. Find employees whose salary contains '5' anywhere in the number

SELECT * FROM Employees 
WHERE Salary LIKE '%5%';

-- 21. Find employees whose department name contains 'Sales'

SELECT * FROM Departments 
WHERE DepartmentName LIKE '%Sales%';

-- 22. Find employees whose role starts with 'Senior'

SELECT * FROM EmployeeDepartments 
WHERE Role LIKE 'Senior%';

-- 23. Find employees whose date of birth is in the 1990s

SELECT * FROM Employees 
WHERE DateOfBirth LIKE '199%';

-- 24. Find employees whose phone number has '789' in the middle

SELECT * FROM Employees
WHERE Phone LIKE '%789%';

-- 25. Find employees whose last name has 'o' as the third letter

SELECT * FROM Employees 
WHERE LastName LIKE '__o%';

-- 26. Find employees whose email contains '@gmail'

SELECT * FROM Employees 
WHERE Email LIKE '%@gmail%';

-- 27. Find employees whose department name starts with 'H' and ends with 'R'

SELECT * FROM Departments 
WHERE DepartmentName LIKE 'H%R';

-- 28. Find employees whose role has exactly 10 characters

SELECT * FROM EmployeeDepartments 
WHERE Role LIKE '__________';

-- 29. Find employees whose email starts with either 'david' or 'anna'

SELECT * FROM Employees 
WHERE Email LIKE 'david%' OR Email LIKE 'anna%';

-- 30. Find employees whose department location starts with 'S' and contains 'anc' anywhere

SELECT * FROM Departments 
WHERE Location LIKE 'S%anc%';

--============================================================
--============================================================

-- 1. Find records where `col1` contains a literal underscore `_` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%\_%' ESCAPE '\';

-- 2. Find records where `col1` contains a literal backslash `\` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%\\%' ESCAPE '\';

-- 3. Find records where `col1` contains the string `%45` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%\%45%' ESCAPE '\';

-- 4. Find records where `col1` contains the string `/100/` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%//100//%' ESCAPE '/';

-- 5. Find records where `col1` ends with `2015` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%2015' ESCAPE '\\';

-- 6. Find records where `col1` starts with `A001_` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE 'A001\_%' ESCAPE '\';

-- 7. Find records where `col1` contains `DJ-402\44` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ-402\\44%' ESCAPE '\';

-- 8. Find records where `col1` contains `DJ_401` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ\_401%' ESCAPE '\';

-- 9. Find records where `col1` contains `DJ_402%` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ\_402\%%' ESCAPE '\\';

-- 10. Find records where `col1` contains `DJ-402%45\2015` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ-402\%45\2015%' ESCAPE '\\';

-- 11. Find records where `col1` contains `DJ_402%45` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ\_402\%45%' ESCAPE '\\';

-- 12. Find records where `col1` contains `A001/DJ_402%45` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%A001/DJ\_402\%45%' ESCAPE '\\';

-- 13. Find records where `col1` contains `DJ-402\44/100` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ-402\44/100%' ESCAPE '\\';

-- 14. Find records where `col1` contains `DJ_402-2014` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%DJ\_402-2014%' ESCAPE '\\';

-- 15. Find records where `col1` contains `A001\DJ-402%` (escaped)

SELECT * FROM Tbl_UniqueIdentification 
WHERE col1 LIKE '%A001\\DJ-402\%%' ESCAPE '\\';

--============================================================
--============================================================

-- 1. Get the total number of employees in each department

SELECT DepartmentID, COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
GROUP BY DepartmentID;

--============================================================

-- 2. Get the average salary of employees in each department

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM EmployeeDepartments
GROUP BY DepartmentID;

--============================================================

-- 3. Find the highest salary in each department

SELECT DepartmentID, MAX(Salary) AS HighestSalary
FROM EmployeeDepartments
GROUP BY DepartmentID;

--============================================================

-- 4. Get the lowest salary in each department

SELECT DepartmentID, MIN(Salary) AS LowestSalary
FROM EmployeeDepartments
GROUP BY DepartmentID;

--============================================================

-- 5. Find the total salary paid to employees in each department

SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM EmployeeDepartments
GROUP BY DepartmentID;

--============================================================

-- 6. Get the number of employees in each department where the salary is greater than 70,000

SELECT DepartmentID, COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE Salary > 70000
GROUP BY DepartmentID;

--============================================================

-- 8. Get the average salary of employees in departments established after 2010

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM EmployeeDepartments
WHERE DepartmentID IN (
						SELECT DepartmentID 
						FROM Departments 
						WHERE EstablishedYear > 2010
						)
GROUP BY DepartmentID;

--============================================================

-- 9. Count the number of employees with salary greater than 80,000

SELECT COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE Salary > 80000;

--============================================================

-- 10. Get the total salary for employees with the 'Software Engineer' position

SELECT SUM(Salary) AS TotalSalary
FROM Employees
WHERE Position = 'Software Engineer';

--============================================================

-- 11. Find the total salary for each department where the manager is assigned

SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM EmployeeDepartments
WHERE DepartmentID IN (
						SELECT DepartmentID 
						FROM Departments 
						WHERE ManagerID IS NOT NULL
					  )
GROUP BY DepartmentID;

--============================================================

-- 12. Get the average salary of employees where the status is 'Active'

SELECT AVG(Salary) AS AverageSalary
FROM Employees
WHERE Status = 'Active';

--============================================================

-- 13. Get the total number of employees in each department where the salary is less than 60,000

SELECT DepartmentID, COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE Salary < 60000
GROUP BY DepartmentID;

--============================================================

-- 15. Get the number of employees in each department where the position is 'Software Engineer'
SELECT DepartmentID, COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE Role = 'Software Engineer'
GROUP BY DepartmentID;

--============================================================

-- 16. Get the total number of employees who have 'Manager' in their position

SELECT COUNT(EmployeeID) AS TotalEmployees
FROM Employees
WHERE Position LIKE '%Manager%';

--============================================================

-- 17. Get the average salary of employees in each department with a budget greater than 400,000

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM EmployeeDepartments
WHERE DepartmentID IN (
						SELECT DepartmentID 
						FROM Departments 
						WHERE Budget > 400000
						)
GROUP BY DepartmentID;

--============================================================

-- 18. Find the total salary of employees with the role 'HR Manager'

SELECT SUM(Salary) AS TotalSalary
FROM EmployeeDepartments
WHERE Role = 'HR Manager';

--============================================================

-- 20. Get the average salary for employees who joined after 2018

SELECT AVG(Salary) AS AverageSalary
FROM Employees
WHERE HireDate > '2018-01-01';

--============================================================

-- 21. Get the highest salary for employees who joined before 2015

SELECT MAX(Salary) AS HighestSalary
FROM Employees
WHERE HireDate < '2015-01-01';

--============================================================

-- 22. Get the number of employees who are older than 30

SELECT COUNT(EmployeeID) AS TotalEmployees
FROM Employees
WHERE DATEDIFF(YEAR, DateOfBirth, GETDATE()) > 30;

--============================================================

-- 23. Get the average salary of employees where the position is 'Product Manager'

SELECT AVG(Salary) AS AverageSalary
FROM Employees
WHERE Position = 'Product Manager';

--============================================================

-- 27. Get the average salary of employees who have been hired after '2020-01-01'

SELECT AVG(Salary) AS AverageSalary
FROM Employees
WHERE HireDate > '2020-01-01';

--============================================================

-- 28. Find the highest salary of employees who are older than 40

SELECT MAX(Salary) AS HighestSalary
FROM Employees
WHERE DATEDIFF(YEAR, DateOfBirth, GETDATE()) > 40;

--============================================================

-- 29. Get the total number of employees for each role in the 'HR' department
SELECT Role, COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE DepartmentID = 3
GROUP BY Role;

--============================================================

-- 30. Get the number of employees who have the role 'Marketing Manager'

SELECT COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE Role = 'Marketing Manager';

--============================================================

-- 34. Get the average salary of employees in departments with more than 1 employees

SELECT DepartmentID, AVG(Salary) AS AverageSalary , COUNT(EmployeeID) AS Employee
FROM EmployeeDepartments
GROUP BY DepartmentID
HAVING COUNT(EmployeeID) > 1;	

--============================================================

-- 35. Find the highest salary for each department where the total salary is greater than 200,000

SELECT DepartmentID, MAX(Salary) AS HighestSalary
FROM EmployeeDepartments
GROUP BY DepartmentID
HAVING SUM(Salary) > 200000;
	
--============================================================

-- 36. Get the total salary of employees in departments that were established before 2010

SELECT SUM(Salary) AS TotalSalary
FROM EmployeeDepartments
WHERE DepartmentID IN (
						SELECT DepartmentID 
						FROM Departments 
						WHERE EstablishedYear < 2010
						);

--============================================================

-- 37. Get the number of employees in departments established after 2015

SELECT DepartmentID, COUNT(EmployeeID) AS TotalEmployees
FROM EmployeeDepartments
WHERE DepartmentID IN (
						SELECT DepartmentID 
						FROM Departments 
						WHERE EstablishedYear > 2015
						)
GROUP BY DepartmentID;

--============================================================

-- 38. Find the total salary of employees who are in the 'Product Management' department

SELECT SUM(Salary) AS TotalSalary
FROM EmployeeDepartments
WHERE DepartmentID = 5;

--============================================================

-- 39. Get the average salary of employees whose first name starts with 'J'

SELECT AVG(Salary) AS AverageSalary
FROM Employees
WHERE FirstName LIKE 'J%';

--============================================================

-- 40. Get the number of employees with the last name 'Smith' and a salary greater than 60,000

SELECT COUNT(EmployeeID) AS TotalEmployees
FROM Employees
WHERE LastName = 'Smith' AND Salary > 60000;

--============================================================

