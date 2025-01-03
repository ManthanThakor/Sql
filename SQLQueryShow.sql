
-- Create the database
CREATE DATABASE EmployeeDBQuery;

-- Use the database
USE EmployeeDBQuery;

-- Create the first table
CREATE TABLE EmployeeInfo(
	EmpID INT PRIMARY KEY,
    EmpFname NVARCHAR(50),
    EmpLname NVARCHAR(50),
    Department NVARCHAR(50),
	Project NVARCHAR(10),
	Address NVARCHAR(100),
	DOB DATE,
	Gender CHAR(1),
);

-- Insert data into the first table
INSERT INTO EmployeeInfo(EmpID,EmpFname,EmpLname,Department,Project,Address,DOB,Gender)
VALUES
(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M'),
(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-05-02', 'F'),
(3, 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', 'M'),
(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-05-02', 'F'),
(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '1994-07-03', 'M');

-- Create the second table

CREATE TABLE EmployeePosition(
EmpID INT,
EmpPosition NVARCHAR(50),
DateOfJoining DATE,
Salary INT,
FOREIGN KEY (EmpID) REFERENCES EmployeeInfo(EmpID)
);

-- Insert data into the second table
INSERT INTO EmployeePosition(EmpID,EmpPosition,DateOfJoining,Salary)
VALUES 
(1,'Manager','2022-05-01',500000),
(2, 'Executive', '2022-05-02', 75000),
(3, 'Manager', '2022-05-01', 90000),
(1, 'Lead', '2022-05-02', 85000),
(2, 'Executive', '2022-05-01', 300000);

USE EmployeeDBQuery;

-- Q1 Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.

select UPPER(EmpFname) AS  EmpName 
FROM EmployeeInfo;

-- Q2 Write a query to fetch the number of employees working in the department 'HR'

SELECT COUNT(*) AS NumberOfEmployees
FROM EmployeeInfo
WHERE Department = 'HR';

-- Q3 Write a query to get the current date.

SELECT GETDATE() as CurrentDate; -- 2024-12-31 15:55:37.733

-- Q4 Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table.


SELECT SUBSTRING(EmpLname, 1, 4) AS FirstFourCharacters
FROM EmployeeInfo;


-- Q5 Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table

SELECT SUBSTRING(Address,1,CHARINDEX('(',Address)-1) As PlaceName
FROM EmployeeInfo;

-- Q6 Write a query to create a new table which consists of data and structure copied from the other table.

SELECT * 
INTO NewEmployeeInfo
FROM EmployeeInfo;


-- Q7 Write a query to find all the employees whose salary is between 50000 to 100000

SELECT * 
FROM EmployeePosition
WHERE Salary BETWEEN 50000 AND 100000;

-- =================================== IF NAME Need =================================== -- 

SELECT EmpInfo.EmpFname, EmpInfo.EmpLname , EmpPosi.Salary
FROM EmployeeInfo EmpInfo
INNER JOIN EmployeePosition EmpPosi
ON EmpInfo.EmpID = EmpPosi.EmpID
WHERE EmpPosi.Salary BETWEEN 50000 AND 100000;


-- Q8 Write a query to find the names of employees that begin with 'S'
SELECT  EmpFname, EmpLname
FROM EmployeeInfo
WHERE EmpFname Like 'S%';

-- Q9 Write a query to fetch top N records.

SELECT TOP 3 *
FROM EmployeeInfo;

-- Q10 Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. 
--The first name and the last name must be separated with space

SELECT CONCAT(EmployeeInfo.EmpFname,' ',EmployeeInfo.EmpLname) as FullName
FROM EmployeeInfo;

-- Q11 Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender

SELECT Gender, COUNT(*) AS EmployeeCount
FROM EmployeeInfo
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31'
GROUP BY Gender;


--Q12 Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order 
--and Department in the ascending order.

SELECT *
FROM EmployeeInfo
ORDER BY EmpLname DESC, Department ASC;

-- Q13 Write a query to fetch details of employees whose EmpLname ends with an alphabet 'A' and contains five alphabets.

SELECT * 
FROM EmployeeInfo 
WHERE EmpLname LIKE '____A';


--Q14 Write a query to fetch details of all employees excluding the employees with first names, 
--“Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT *
FROM EmployeeInfo
WHERE EmpFname NOT IN ('Sanjay','Sonia');


-- Q15 Write a query to fetch details of employees with the address as “DELHI(DEL)”.

SELECT *
FROM EmployeeInfo
WHERE Address = 'DELHI(DEL)';

-- Q16 Write a query to fetch all employees who also hold the managerial position.

SELECT E.* ,EP.EmpPosition
FROM EmployeeInfo E
INNER JOIN EmployeePosition EP
ON E.EmpID = EP.EmpID
WHERE EP.EmpPosition = 'Manager';


-- Q17 Write a query to fetch the department-wise count of employees sorted by department's count in ascending order.

SELECT Department , COUNT(*) AS EmployeeCount
FROM EmployeeInfo
GROUP BY Department
ORDER BY EmployeeCount ASC;

-- Q18 Write a query to calculate the even and odd records from a table.-- EmpID is evenSELECT *
FROM EmployeeInfo
WHERE EmpID % 2 = 0;  

-- EmpID is odd
SELECT *
FROM EmployeeInfo
WHERE EmpID % 2 != 0;  

-- Q19 Write a SQL query to retrieve employee details from EmployeeInfo table who have a 
-- date of joining in the EmployeePosition table.

SELECT EmpInfo.*
FROM EmployeeInfo EmpInfo
LEFT JOIN EmployeePosition EmpPosi
ON EmpInfo.EmpID = EmpPosi.EmpID
WHERE EmpPosi.DateOfJoining IS NOT NULL;

-- Q20 Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.-- Two Minimum Salaries
SELECT TOP 2 Salary
FROM EmployeePosition
ORDER BY Salary ASC;

-- Two Maximum Salaries
SELECT TOP 2 Salary
FROM EmployeePosition
ORDER BY Salary DESC;

 -- Q21 Write a query to find the Nth highest salary from the table without using TOP/limit keyword.

SELECT MAX(Salary) AS Highest  
From EmployeePosition;


--Q22 Write a query to retrieve duplicate records from a table.

SELECT EmpFname, EmpLname, COUNT(*) As Duplicate
FROM EmployeeInfo
GROUP BY EmpFname, EmpLname
HAVING COUNT(*) > 1;

--Q23 Write a query to retrieve the list of employees working in the same department.

SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeInfo
WHERE Department IN (
    SELECT Department
    FROM EmployeeInfo
    GROUP BY Department
    HAVING COUNT(EmpID) > 1
)

--Q24 Write a query to retrieve the last 3 records from the EmployeeInfo table.

SELECT TOP 3 *
FROM EmployeeInfo
ORDER BY EmpID DESC;

--Q25 Write a query to find the third-highest salary from the EmpPosition table.
SELECT MAX(Salary) AS ThirdHighestSalary
FROM EmployeePosition
WHERE Salary < (
    SELECT MAX(Salary)
    FROM EmployeePosition
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM EmployeePosition
    )
);

--Q* Write a query to find the highest salary from the EmpPosition table.
SELECT MAX(Salary) AS Heighest
FROM EmployeePosition;


--Q* Write a query to find the Second highest salary from the EmpPosition table.
SELECT MAX(Salary) AS secHighest
FROM EmployeePosition
WHERE Salary < (
    SELECT MAX(Salary)
    FROM EmployeePosition);-- Q26 Write a query to display the first and the last record from the EmployeeInfo table-- Query to display the first and last record

SELECT TOP 1 * FROM EmployeeInfo ORDER BY EmpID ASC;  -- First record

SELECT TOP 1 * FROM EmployeeInfo ORDER BY EmpID DESC;  -- Last record


-- Q27 Write a query to add email validation to your database



-- Q28 Write a query to retrieve Departments who have less than 2 employees working in it.

SELECT Department
FROM EmployeeInfo
GROUP BY Department
HAVING COUNT(*) < 2;

-- Q29 Write a query to retrieve EmpPostion along with total salaries paid for each of them.
SELECT EmpPosition, SUM(Salary) AS TotalSalaries
FROM EmployeePosition
GROUP BY EmpPosition;

-- Q30 Write a query to fetch 50% records from the EmployeeInfo table.

SELECT TOP 50 PERCENT *
FROM EmployeeInfo;
