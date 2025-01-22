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

