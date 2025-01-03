
-- Q1 Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.

select UPPER(EmpFname) AS  EmpName 
FROM EmployeeInfo;

-- Q2 Write a query to fetch the number of employees working in the department 'HR'

SELECT COUNT(*) AS NumberOfEmployees
FROM EmployeeInfo
WHERE Department = 'HR';

-- Q3 Write a query to get the current date.

SELECT GETDATE() as CurrentDate; -- 2024-12-31 15:55:37.733
--This query will return the current date and time from the SQL Server. If you need only the date without the time, you can use:
SELECT CAST(GETDATE() AS DATE) AS CurrentDate; -- 2024-12-31

-- Q* Write a query to get the DOB of all employee.

SELECT EmployeeInfo.DOB FROM EmployeeInfo;

-- Q* Write a query to get the Fullnambe of all employee (comibine fname and lname).

SELECT CONCAT(EmpFname, ' ', EmpLname) AS FULLNAME
FROM EmployeeInfo;


-- Q4 Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table.

SELECT LEFT(EmpLname,4) AS FirstFourCharacters
FROM EmployeeInfo;

/*
LEFT(EmpLname, 4):
The LEFT function extracts a specified number of characters from the left side of a string.
In this case, it extracts the first 4 characters from the EmpLname column.
AS FirstFourCharacters: Assigns the alias FirstFourCharacters to the resulting column.
*/

--------------------- or -----------------------

SELECT SUBSTRING(EmpLname, 1, 4) AS FirstFourCharacters
FROM EmployeeInfo;


-- Q5 Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table

SELECT SUBSTRING(Address,1,CHARINDEX('(',Address)-1) As PlaceName
FROM EmployeeInfo;

-- Q6 Write a query to create a new table which consists of data and structure copied from the other table.

--SELECT * 
--INTO NewEmployeeInfo
--FROM EmployeeInfo;

-- =================================== with out (INTO) =================================== -- 

--CREATE TABLE NewEmployeeInfotwo (
--    EmpID INT,
--    EmpFname VARCHAR(50),
--    EmpLname VARCHAR(50),
--    Department VARCHAR(50),
--    Project VARCHAR(50),
--    Address VARCHAR(100),
--    DOB DATE,
--    Gender CHAR(1)
--);
--INSERT INTO NewEmployeeInfo (EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender)
--SELECT EmpID, EmpFname, EmpLname, Department, Project, Address, DOB, Gender
--FROM EmployeeInfo;

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

-- =================================== OR =================================== -- 

SELECT E.EmpFname, E.EmpLname, P.Salary
FROM EmployeeInfo E, EmployeePosition AS P
WHERE E.EmpID = P.EmpID
AND P.Salary BETWEEN 50000 AND 100000;

-- =================================== OR =================================== -- 

SELECT EmpFname, EmpLname
FROM EmployeeInfo E 
WHERE E.EmpID IN (
    SELECT EmpID
    FROM EmployeePosition
    WHERE Salary BETWEEN 50000 AND 100000
);

-- Q8 Write a query to find all the employees whose salary is between 50000 to 100000

