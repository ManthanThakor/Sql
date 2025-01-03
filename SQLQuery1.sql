/*
-- Create the database
CREATE DATABASE EmployeeDBQuery;
GO

-- Use the database
USE EmployeeDBQuery;
GO

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

*/

USE EmployeeDBQuery;

-- Q1 Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName.

select UPPER(EmpFname) AS  EmpName FROM EmployeeInfo;
