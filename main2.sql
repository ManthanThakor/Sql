-- ==================================
-- ===== Create the database =====
-- This statement creates a new database named 'EmployeeDBQuery2'
CREATE DATABASE EmployeeDBQuery2;

-- ==================================
-- ===== Use the database =====
-- Switch to the newly created database for further operations
USE EmployeeDBQuery2;

-- ==================================
-- ===== CREATE SCHEMA database =====
-- This is commented out; it would create a schema called 'EmployeeManagement' for organizing tables.
--CREATE SCHEMA EmployeeManagement;

-- ==================================
-- ===== Delete database =====
-- This is commented out; it will drop (delete) the 'EmployeeDBQuery2' database.
--DROP DATABASE EmployeeDBQuery2;

-- ==================================
-- ===== Rename database =====
-- This command renames the database 'EmployeeDBQuery2' to 'EmployeeDBQuery22'
ALTER DATABASE EmployeeDBQuery2
MODIFY NAME = EmployeeDBQuery22;

-- ==================================
-- Create the EmployeeInfo table
-- This creates the 'EmployeeInfo' table with an EmpID (primary key), first name, last name, department, project, address, date of birth, and gender.
CREATE TABLE EmployeeManagement.EmployeeInfo(
    EmpID INT PRIMARY KEY IDENTITY(1,1),  -- Automatically increments the EmpID for each row (Primary Key)
    EmpFname NVARCHAR(50),                -- Employee's first name
    EmpLname NVARCHAR(50),                -- Employee's last name
    Department NVARCHAR(50),              -- Employee's department
    Project NVARCHAR(10),                 -- Employee's project code
    Address NVARCHAR(100),                -- Employee's address
    DOB DATE,                             -- Employee's date of birth
    Gender CHAR(1)                        -- Employee's gender (M/F)
);

-- ==================================
-- ===== DROP Table  =====
-- This command would delete the 'EmployeeInfo' table if uncommented.
--DROP Table EmployeeInfo;

-- ==================================
-- ===== Rename the table =====
-- This command renames the 'EmployeeInfo' table to 'EmployeeDetails'.
-- Uncomment and use this when you need to rename the table.
--EXEC sp_rename 'EmployeeManagement.EmployeeInfo', 'EmployeeDetails';

-- ==================================
-- Create the second table
-- This creates the 'EmployeePosition' table which stores position details for each employee.
CREATE TABLE EmployeeManagement.EmployeePosition(
    EmpID INT,                        -- Employee ID, links to EmployeeInfo table
    EmpPosition NVARCHAR(50),          -- Employee's position/title
    DateOfJoining DATE,                -- Date when the employee joined
    Salary INT                         -- Employee's salary
);

-- ==================================
-- Add a new column 'NewEmpId' to the EmployeePosition table
-- This column will be used to establish a relationship with the EmployeeInfo table.
ALTER TABLE EmployeeManagement.EmployeePosition
ADD NewEmpId INT;

-- ==================================
-- Add a foreign key constraint
-- This establishes a relationship between 'NewEmpId' in 'EmployeePosition' and 'EmpID' in 'EmployeeInfo'.
-- It ensures that 'NewEmpId' values must match a valid 'EmpID' in 'EmployeeInfo'.
ALTER TABLE EmployeeManagement.EmployeePosition
ADD CONSTRAINT FK_Employe_ID FOREIGN KEY (NewEmpId)
REFERENCES EmployeeManagement.EmployeeInfo(EmpID);

-- Insert data into the 'EmployeeInfo' table
INSERT INTO EmployeeManagement.EmployeeInfo(EmpFname,EmpLname,Department,Project,Address,DOB,Gender)
VALUES
('Sanjay','Mehra','HR','P1','Hyderabad(HYD)','1976-12-01','M'),
( 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '1968-05-02', 'F'),
( 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '1980-01-01', 'M'),
( 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '1992-05-02', 'F'),
( 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '1994-07-03', 'M');

-- Insert data into the 'EmployeePosition' table
INSERT INTO EmployeeManagement.EmployeePosition(EmpID,EmpPosition,DateOfJoining,Salary,NewEmpId)
VALUES 
(1,'Manager','2022-05-01',500000,1),  -- EmpID 1, Position: Manager
(2, 'Executive', '2022-05-02', 75000,2),  -- EmpID 2, Position: Executive
(3, 'Manager', '2022-05-01', 90000,3),  -- EmpID 3, Position: Manager
(1, 'Lead', '2022-05-02', 85000,4),  -- EmpID 1, Position: Lead
(2, 'Executive', '2022-05-01', 300000,5);  -- EmpID 2, Position: Executive

-- Select all data from the 'EmployeePosition' table to verify the entries
SELECT * FROM EmployeeManagement.EmployeePosition;

-- Update the 'NewEmpId' based on matching EmpID from 'EmployeeInfo' table.
UPDATE EmployeeManagement.EmployeePosition
SET NewEmpId = (SELECT TOP 1 EmpID 
                FROM EmployeeManagement.EmployeeInfo 
                WHERE EmployeeManagement.EmployeePosition.EmpID = EmployeeManagement.EmployeeInfo.EmpID);

-- Update 'NewEmpId' where 'EmpPosition' = 'Lead'
UPDATE EmployeeManagement.EmployeePosition
SET NewEmpId = 4
WHERE EmpPosition = 'Lead';

-- Update 'NewEmpId' where 'EmpPosition' = 'Executive'
UPDATE EmployeeManagement.EmployeePosition
SET NewEmpId = 5
WHERE EmpPosition = 'Executive';

-- Update 'NewEmpId' where 'EmpPosition' = 'Executive' and 'Salary' = '75000'
UPDATE EmployeeManagement.EmployeePosition
SET NewEmpId = 2
WHERE EmpPosition = 'Executive' AND Salary = 75000;

-- Select all data from the 'EmployeePosition' table again to verify the updates
SELECT * FROM EmployeeManagement.EmployeePosition;

--==========================================================================================
--==========================================================================================
--==========================================================================================
--==========================================================================================

-- Queries

-- 1. Find employees whose date of birth is between '1975-01-01' and '1990-12-31'.
SELECT EmpID, EmpFname, EmpLname, DOB
FROM EmployeeManagement.EmployeeInfo
WHERE DOB BETWEEN '1975-01-01' AND '1990-12-31';

-- 2. Find employees who work in either the 'HR' or 'Admin' department.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department IN ('HR', 'Admin');

-- 3. Find employees whose salary is greater than 100,000 and calculate the bonus (10% of their salary).
SELECT EmpID, EmpPosition, Salary, Salary * 0.01 AS Bonus
FROM EmployeeManagement.EmployeePosition
WHERE Salary > 100000;

-- 4. Find employees whose salary is greater than 80,000 but less than 150,000.
SELECT EmpID, EmpPosition, Salary
FROM EmployeeManagement.EmployeePosition
WHERE Salary > 80000 AND Salary < 150000;

-- 5. Find employees who do not have a 'NewEmpId' assigned in the EmployeePosition table.
SELECT EmpID, EmpPosition, NewEmpId
FROM EmployeeManagement.EmployeePosition
WHERE NewEmpId IS NULL;

-- 6. Find employees with a salary between 50,000 and 100,000.
SELECT EmpID, EmpPosition, Salary
FROM EmployeeManagement.EmployeePosition
WHERE Salary BETWEEN 50000 AND 100000;

-- 7. Find employees whose `EmpID` exists in the `EmployeePosition` table.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpID IN (SELECT EmpID FROM EmployeeManagement.EmployeePosition);

-- 8. Find employees whose date of joining is in 2022 and display their year of joining.
SELECT EmpID, EmpPosition, DateOfJoining, YEAR(DateOfJoining) AS YearOfJoining
FROM EmployeeManagement.EmployeePosition
WHERE YEAR(DateOfJoining) = 2022;

-- 9. Find employees who joined after '2022-01-01'.
SELECT EmpID, EmpPosition, DateOfJoining
FROM EmployeeManagement.EmployeePosition
WHERE DateOfJoining > '2022-01-01';

-- 10. Find employees who have an assigned `NewEmpId`.
SELECT EmpID, EmpPosition, NewEmpId
FROM EmployeeManagement.EmployeePosition
WHERE NewEmpId IS NOT NULL;

-- 11. Find employees whose names start with letters between 'A' and 'M'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname BETWEEN 'A' AND 'M';

-- 12. Find employees who have positions as either 'Manager' or 'Lead'.
SELECT EmpID, EmpPosition
FROM EmployeeManagement.EmployeePosition
WHERE EmpPosition IN ('Manager', 'Lead');

-- 13. Find employees whose salary is greater than 100,000 and calculate 20% tax.
SELECT EmpID, EmpPosition, Salary, Salary * 0.20 AS Tax
FROM EmployeeManagement.EmployeePosition
WHERE Salary > 100000;

-- 14. Find employees with 'NewEmpId' as NOT NULL and position 'Executive'.
SELECT EmpID, EmpPosition, NewEmpId
FROM EmployeeManagement.EmployeePosition
WHERE NewEmpId IS NOT NULL AND EmpPosition = 'Executive';

-- 15. Find employees whose first name is longer than 5 characters.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE LEN(EmpFname) > 5;

-- 16. Find employees whose date of joining is between '2022-01-01' and '2022-12-31'.
SELECT EmpID, EmpPosition, DateOfJoining
FROM EmployeeManagement.EmployeePosition
WHERE DateOfJoining BETWEEN '2022-01-01' AND '2022-12-31';

-- 18. Find the salary after a 15% tax deduction.
SELECT EmpID, EmpPosition, Salary, Salary - (Salary * 0.15) AS SalaryAfterTax
FROM EmployeeManagement.EmployeePosition;

-- 19. Find employees whose position is not 'Executive'.
SELECT EmpID, EmpPosition
FROM EmployeeManagement.EmployeePosition
WHERE EmpPosition != 'Executive';

-- 20. Find employees who do not have an assigned `NewEmpId` but have a salary greater than 100,000.
SELECT EmpID, EmpPosition, NewEmpId, Salary
FROM EmployeeManagement.EmployeePosition
WHERE NewEmpId IS NULL AND Salary > 100000;

-- 21. Find employees whose date of birth is between '1980-01-01' and '1990-12-31'.
SELECT EmpID, EmpFname, EmpLname, DOB
FROM EmployeeManagement.EmployeeInfo
WHERE DOB BETWEEN '1980-01-01' AND '1990-12-31';

-- 22. Find employees whose `EmpID` is within a specific range.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpID IN (2, 3, 5);

-- 23. Find employees who joined after a specific date and show the years of employment.
SELECT EmpID, EmpPosition, DateOfJoining, DATEDIFF(YEAR, DateOfJoining, GETDATE()) AS YearsOfEmployment
FROM EmployeeManagement.EmployeePosition
WHERE DateOfJoining > '2022-01-01';

-- 24. Find employees who have an assigned position that is either 'Manager' or 'Lead'.
SELECT EmpID, EmpPosition
FROM EmployeeManagement.EmployeePosition
WHERE EmpPosition IN ('Manager', 'Lead');

-- ==================================
-- ===== LIKE Query Examples =====

-- 25. Find employees whose first name starts with 'A' and any other character(s).
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE 'A%';  -- Starts with 'A'

-- 26. Find employees whose first name ends with 'y'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE '%y';  -- Ends with 'y'

-- 27. Find employees whose first name contains 'an'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE '%an%';  -- Contains 'an'

-- 28. Find employees whose last name starts with any letter between 'A' and 'M'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpLname LIKE '[A-M]%';  -- Starts with A to M

-- 29. Find employees whose first name starts with a vowel (A, E, I, O, U).
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE '[AEIOU]%';  -- Starts with A, E, I, O, or U

-- 30. Find employees whose department name starts with 'A' and is followed by any 3 characters.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department LIKE 'A____';  -- 'A' followed by any two characters

-- 31. Find employees whose first name has exactly 5 characters.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE '_____';  -- Exactly 5 characters

-- 32. Find employees whose department starts with 'A' and has any number of characters.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department LIKE 'A%';  -- Starts with 'A' and any number of characters

-- 33. Find employees whose first name contains 's' followed by any number of characters, ending with 'n'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE 's%n';  -- Contains 's' at the start and 'n' at the end

-- 34. Find employees whose department name is 'HR' or 'Admin'.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department LIKE 'HR' OR Department LIKE 'Admin';  -- Exact match 'HR' or 'Admin'

-- 35. Find employees whose first name starts with 'A' or 'R'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE '[AR]%';  -- Starts with A or R

-- 36. Find employees whose last name starts with a letter between 'N' and 'Z'.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpLname LIKE '[N-Z]%';  -- Starts with N to Z

-- 37. Find employees whose first name has a 3 character, followed by 'an' at the end.
SELECT EmpID, EmpFname, EmpLname
FROM EmployeeManagement.EmployeeInfo
WHERE EmpFname LIKE '___an';  -- Single character followed by 'an'

-- 38. Find employees whose department starts with any letter from 'C' to 'F' followed by any characters.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department LIKE '[C-F]%';  -- Starts with C to F

-- 39. Find employees whose department name contains the substring 'man'.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department LIKE '%man%';  -- Contains 'man' anywhere

-- 40. Find employees whose department name ends with 'ing'.
SELECT EmpID, EmpFname, EmpLname, Department
FROM EmployeeManagement.EmployeeInfo
WHERE Department LIKE '%ing';  -- Ends with 'ing'

--=============================================

-- ================================
-- 1. List distinct departments from EmployeeInfo table
SELECT DISTINCT Department
FROM EmployeeManagement.EmployeeInfo;

-- 2. Count of distinct genders in EmployeeInfo table
SELECT COUNT(DISTINCT Gender)AS UniqueGenders, Gender 
FROM EmployeeManagement.EmployeeInfo
GROUP BY Gender;

-- 3. Fetch all distinct addresses from EmployeeInfo table
SELECT DISTINCT Address
FROM EmployeeManagement.EmployeeInfo;

-- 4. List employees with distinct projects
SELECT DISTINCT Project
FROM EmployeeManagement.EmployeeInfo;

-- 5. Count of employees in each department
SELECT Department, COUNT(EmpID) AS EmployeeCount
FROM EmployeeManagement.EmployeeInfo
GROUP BY Department;

-- 6. Find departments with more than 2 employees
SELECT Department, COUNT(EmpID) AS EmployeeCount
FROM EmployeeManagement.EmployeeInfo
GROUP BY Department
HAVING COUNT(EmpID) > 2;

-- 7. List positions with total salary greater than 100,000
SELECT EmpPosition, SUM(Salary) AS TotalSalary
FROM EmployeeManagement.EmployeePosition
GROUP BY EmpPosition
HAVING SUM(Salary) > 100000;

-- 8. Fetch the oldest joining date for each position
SELECT EmpPosition, MIN(DateOfJoining) AS OldestJoiningDate
FROM EmployeeManagement.EmployeePosition
GROUP BY EmpPosition;

-- 9. Fetch top 3 highest salaries
SELECT TOP 3 Salary
FROM EmployeeManagement.EmployeePosition
ORDER BY Salary DESC;

-- 10. Fetch top 5 earliest joining dates
SELECT TOP 5 DateOfJoining
FROM EmployeeManagement.EmployeePosition
ORDER BY DateOfJoining ASC;

-- 11. Fetch top 10% employees with the highest salaries
SELECT TOP 10 PERCENT EmpID, Salary
FROM EmployeeManagement.EmployeePosition
ORDER BY Salary DESC;

-- 12. Fetch top 2 lowest salaries
SELECT TOP 2 Salary
FROM EmployeeManagement.EmployeePosition
ORDER BY Salary ASC;

-- 13. Skip the first 3 highest salaries and fetch the next 5
SELECT EmpID, Salary
FROM EmployeeManagement.EmployeePosition
ORDER BY Salary DESC
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY;

-- 14. Fetch rows 6 to 10 by salary
SELECT EmpID, Salary
FROM EmployeeManagement.EmployeePosition
ORDER BY Salary DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- 15. List the total salary paid per department
SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeManagement.EmployeeInfo ei
JOIN EmployeeManagement.EmployeePosition ep ON ei.EmpID = ep.EmpID
GROUP BY Department;

-- 16. Fetch average salary for each gender
SELECT Gender, AVG(Salary) AS AverageSalary
FROM EmployeeManagement.EmployeeInfo ei
JOIN EmployeeManagement.EmployeePosition ep ON ei.EmpID = ep.EmpID
GROUP BY Gender;

-- 17. Find the maximum salary for each position
SELECT EmpPosition, MAX(Salary) AS MaxSalary
FROM EmployeeManagement.EmployeePosition
GROUP BY EmpPosition;

-- 18. Fetch minimum salary grouped by joining date
SELECT DateOfJoining, MIN(Salary) AS MinSalary
FROM EmployeeManagement.EmployeePosition
GROUP BY DateOfJoining;

-- 19. List all projects with a count of employees working on them
SELECT Project, COUNT(EmpID) AS EmployeeCount
FROM EmployeeManagement.EmployeeInfo
GROUP BY Project;

-- 20. Fetch total number of employees by gender
SELECT Gender, COUNT(EmpID) AS TotalEmployees
FROM EmployeeManagement.EmployeeInfo
GROUP BY Gender;

-- 21. List total salary grouped by project
SELECT Project, SUM(Salary) AS TotalSalary
FROM EmployeeManagement.EmployeeInfo ei
JOIN EmployeeManagement.EmployeePosition ep ON ei.EmpID = ep.EmpID
GROUP BY Project;

-- 22. Fetch departments with minimum salary above 50,000
SELECT Department, MIN(Salary) AS MinSalary
FROM EmployeeManagement.EmployeeInfo ei
JOIN EmployeeManagement.EmployeePosition ep ON ei.EmpID = ep.EmpID
GROUP BY Department
HAVING MIN(Salary) > 50000;

-- 23. Fetch employees whose salary is greater than the average salary
SELECT EmpID, Salary
FROM EmployeeManagement.EmployeePosition
WHERE Salary > (SELECT AVG(Salary) FROM EmployeeManagement.EmployeePosition);

-- 24. Fetch positions having more than one employee
SELECT EmpPosition, COUNT(EmpID) AS PositionCount
FROM EmployeeManagement.EmployeePosition
GROUP BY EmpPosition
HAVING COUNT(EmpID) > 1;

-- 25. Fetch total employees joined on each joining date
SELECT DateOfJoining, COUNT(EmpID) AS EmployeeCount
FROM EmployeeManagement.EmployeePosition
GROUP BY DateOfJoining;

-- 26. Fetch distinct genders and their counts
SELECT Gender, COUNT(EmpID) AS GenderCount
FROM EmployeeManagement.EmployeeInfo
GROUP BY Gender;

-- 27. Fetch distinct departments and their total employees
SELECT Department, COUNT(EmpID) AS EmployeeCount
FROM EmployeeManagement.EmployeeInfo
GROUP BY Department;

-- 28. Fetch maximum salary for each department
SELECT Department, MAX(Salary) AS MaxSalary
FROM EmployeeManagement.EmployeeInfo ei
JOIN EmployeeManagement.EmployeePosition ep ON ei.EmpID = ep.EmpID
GROUP BY Department;

-- 29. Fetch distinct project codes and their counts
SELECT Project, COUNT(EmpID) AS ProjectCount
FROM EmployeeManagement.EmployeeInfo
GROUP BY Project;

-- 30. Fetch average salary grouped by gender and department
SELECT Gender, Department, AVG(Salary) AS AverageSalary
FROM EmployeeManagement.EmployeeInfo ei
JOIN EmployeeManagement.EmployeePosition ep ON ei.EmpID = ep.EmpID
GROUP BY Gender, Department;
