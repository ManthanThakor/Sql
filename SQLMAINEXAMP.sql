--//=======================//
--//=======================//

CREATE DATABASE SQLTEST;

--//=======================//
--//=======================//

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job_name VARCHAR(50),
    manager_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2),
    dep_id INT
);

--//=======================//
--//=======================//

INSERT INTO Employees (emp_id, emp_name, job_name, manager_id, hire_date, salary, commission, dep_id)
VALUES
(68319, 'KAYLING', 'PRESIDENT', NULL, '1991-11-18', 6000.00, NULL, 1001),
(66928, 'BLAZE', 'MANAGER', 68319, '1991-05-01', 2750.00, NULL, 3001),
(67832, 'CLARE', 'MANAGER', 68319, '1991-06-09', 2750.00, NULL, 1001),
(65646, 'JONAS', 'MANAGER', 68319, '1991-04-02', 2957.00, NULL, 2001),
(67858, 'SCARLET', 'ANALYST', 65646, '1997-04-19', 3100.00, NULL, 2001),
(69062, 'FRANK', 'ANALYST', 65646, '1991-12-03', 3100.00, NULL, 2001),
(63679, 'SANDRINE', 'CLERK', 69062, '1990-12-18', 900.00, NULL, 2001),
(64989, 'ADEL YN', 'SALESMAN', 66928, '1991-02-20', 1700.00, 400.00, 3001),
(65271, 'WADE', 'SALESMAN', 66928, '1991-02-22', 1350.00, 600.00, 3001),
(66564, 'MADDEN', 'SALESMAN', 66928, '1991-09-28', 1350.00, 1500.00, 3001),
(68454, 'TUCKER', 'SALESMAN', 66928, '1991-09-08', 1600.00, 0.00, 3001),
(68736, 'ADNRES', 'CLERK', 67858, '1997-05-23', 1200.00, NULL, 2001),
(69000, 'JULIUS', 'CLERK', 66928, '1991-12-03', 1050.00, NULL, 3001),
(69324, 'MARKER', 'CLERK', 67832, '1992-01-23', 1400.00, NULL, 1001);

--//=======================//
--//=======================//

--1. From the following table return complete information about the employees. 

select * 
FROM Employees;

--2. write a SQL query to find the salaries of all employees. Return salary 

SELECT Employees.salary 
FROM Employees;

--3. write a SQL query to find the unique designations of the employees. Return job 
--name. 

SELECT DISTINCT Employees.job_name 
From Employees;

--4. write a SQL query to list the employees’ name, increased their salary by 15%, and 
--expressed as number of Dollars. 

select Employees.emp_name, salary * 1.15 AS salary_Dollars
from Employees

--5. write a SQL query to list the employee's name and job name as a format of 
--"Employee & Job" 

select CONCAT( Employees.emp_name,' & ',Employees.job_name) AS EMP_JOBS
FROM Employees;


--6. Write a query in SQL to produce the output of employees as follows. 
--Employee 
--JONAS(manager). 

SELECT CONCAT(Employees.emp_name, '(', lower(Employees.job_name), ')') AS Employee
FROM employees
WHERE Employees.emp_name = 'JONAS';

--7. write a SQL query to find those employees with hire date in the format like February 22, 1991. 
--Return employee ID, employee name, salary, hire date. 

SELECT 
Employees.emp_id, Employees.emp_name, Employees.salary, 
FORMAT(Employees.hire_date, 'MMMM-dd-yyyy') AS formatted_hire_date
FROM employees;

--8. write a SQL query to count the number of characters except the spaces for each 
--employee name. Return employee name length. 

SELECT 
REPLACE(Employees.emp_name, ' ', '') AS employee_name, 
LEN(REPLACE(Employees.emp_name, ' ', '')) AS name_length
FROM employees;

--9. write a SQL query to find the employee ID, salary, and commission of all the 
--employees. 

select Employees.emp_id, Employees.salary, Employees.commission
from Employees;

--10. write a SQL query to find the unique department with jobs. Return department ID, Job name. 

select DISTINCT Employees.dep_id ,Employees.job_name
from Employees;

--11. write a SQL query to find those employees who do not belong to the department 2001. 
-- Return complete information about the employees. 

SELECT *
FROM Employees
WHERE Employees.dep_id != 2001;

--12. write a SQL query to find those employees who joined before 1991. Return complete 
--information about the employees. 

select * 
from Employees
where Employees.hire_date < '1991-1-1'; 

--13. write a SQL query to calculate the average salary of employees who work as analysts. 
--Return average salary. 

SELECT AVG(salary)as avg_salary 
from Employees 
where  Employees.job_name = 'ANALYST';

--14. write a SQL query to find the details of the employee ‘BLAZE’. 

select * 
from Employees
where Employees.emp_name = 'BLAZE'; 

--15. write a SQL query to identify employees whose commissions exceed their salaries. 
--Return complete information about the employees. 

select * 
from Employees 
where Employees.commission > Employees.salary; 

--16. write a SQL query to identify those employees whose salaries exceed 3000 after 
--receiving a 25% salary increase. Return complete information about the employees. 

select * 
from Employees 
where Employees.salary * 1.25  > 3000; 

--17. write a SQL query to find the names of the employees whose length is six. '
--Return employee name. 

select Employees.emp_name 
from Employees 
where len(REPLACE(Employees.emp_name, ' ', '')) = 6;

--18. write a SQL query to find out which employees joined in the month of January. 
--Return complete information about the employees. 

select *
from Employees
where MONTH(Employees.hire_date) = 1;

--19. write a SQL query to separate the names of employees and their managers by the 
--string 'works for'. 

--SELECT CONCAT(Employees.emp_name, ' works for ', Employees. ) AS employee_manager
--FROM employees ;

--20. write a SQL query to find those employees whose designation is ‘CLERK’. Return 
--complete information about the employees. 

SELECT * FROM Employees 
WHERE Employees.job_name = 'CLERK';

--21. write a SQL query to identify employees with more than 27 years of experience. 
--Return complete information about the employees. 

SELECT * 
FROM Employees 
WHERE DATEDIFF(YEAR, Employees.hire_date, GETDATE()) > 27;

--22. write a SQL query to find those employees whose salaries are less than 3500. Return 
--complete information about the employees. 

SELECT * 
FROM Employees 
WHERE Employees.salary < 3500;

--23. write a SQL query to find the employee whose designation is ‘ANALYST’. Return 
--employee name, job name and salary. 

SELECT Employees.emp_name, Employees.job_name, Employees.salary 
FROM Employees 
WHERE Employees.job_name = 'ANALYST';

--24. write a SQL query to identify those employees who joined the company in 1991. 
--Return complete information about the employees. 

SELECT * 
FROM Employees 
WHERE YEAR(Employees.hire_date) = 1991;

--25. write a SQL query to find those employees who joined before 1st April 1991. 
--Return employee ID, employee name, hire date and salary. 

SELECT Employees.emp_id, Employees.emp_name, Employees.hire_date, Employees.salary 
FROM Employees 
WHERE Employees.hire_date < '1991-04-01';

--26. write a SQL query identify the employees who do not report to a manager. 
--Return employee name, job name. 

SELECT Employees.emp_name, Employees.job_name 
FROM Employees 
WHERE Employees.manager_id IS NULL;

--27. write a SQL query to find the employees who joined on the 1st of May 1991. Return 
--complete information about the employees. 

SELECT * 
FROM Employees 
WHERE Employees.hire_date = '1991-05-01';

--28. write a SQL query to identify the experience of the employees who work under the 
--manager whose ID number is 68319. Return employee ID, employee name, salary, experience. 

SELECT Employees.emp_id, Employees.emp_name, Employees.salary, DATEDIFF(YEAR, hire_date, GETDATE()) AS experience 
FROM Employees  
WHERE Employees.manager_id = 68319;

--29. write a SQL query to find out which employees earn more than 100 per day as a 
--salary. Return employee ID, employee name, salary, and experience. 

SELECT Employees.emp_id, Employees.emp_name, Employees.salary, 
       DATEDIFF(YEAR, hire_date, GETDATE()) AS experience
FROM Employees
WHERE (Employees.salary / 31) > 100;


--30. write a SQL query to identify those employees who retired after 31-Dec-99, 
--completing eight years of service. Return employee name. 

SELECT Employees.emp_name
FROM Employees
WHERE DATEADD(YEAR, 8, Employees.hire_date) > '1999-12-31';

--31. write a SQL query to identify the employees whose salaries are odd. Return complete 
--information about the employees. 

SELECT *
FROM Employees
WHERE Employees.salary % 2 != 0;

--32. write a SQL query to identify employees whose salaries contain only three digits. 
--Return complete information about the employees. 

SELECT *
FROM Employees
WHERE Employees.salary BETWEEN 100 AND 999;

--33. write a SQL query to find out which employees joined the company before the 19th of 
--the month. Return complete information about the employees. 

SELECT *
FROM Employees
WHERE DAY(Employees.hire_date) < 19;

--34. write a SQL query to identify those employees who have been working as a 
--SALESMAN and month portion of the experience is more than 10. 
--Return complete information about the employees. 

SELECT *
FROM Employees
WHERE Employees.job_name = 'SALESMAN' 
AND DATEDIFF(MONTH, Employees.hire_date, GETDATE()) > 10;

--35. write a SQL query to find those employees of department id 3001 or 1001 and joined 
--in the year 1991. Return complete information about the employees 

SELECT *
FROM Employees
WHERE Employees.dep_id IN (3001, 1001) 
AND YEAR(Employees.hire_date) = '1991';


--36. write a SQL query to find the employees who are working for the department ID 1001 
--or 2001. Return complete information about the employees. 

SELECT *
FROM Employees
WHERE Employees.dep_id IN (1001, 2001);

--37. write a SQL query to find those employees whose designation is ‘CLERK’ and work 
--in the department ID 2001. Return complete information about the employees. 

SELECT *
FROM Employees
WHERE Employees.job_name = 'CLERK'
AND Employees.dep_id = 2001;

--38. write a query in SQL to find those employees where - 
--1. the employees receive some commission which should not be more than the salary 
--and annual salary including commission is below 34000. 
--2. Designation is ‘SALESMAN’ and working in the department ‘3001’. Return 
--employee ID, employee name, salary and job name. 

-- 1
SELECT Employees.emp_id, Employees.emp_name, Employees.salary, Employees.job_name
FROM Employees
WHERE Employees.commission < Employees.salary 
AND 12*(Employees.salary + Employees.commission) < 34000;

-- 2
SELECT Employees.emp_id, Employees.emp_name, Employees.salary, Employees.job_name
FROM Employees
WHERE Employees.job_name = 'SALESMAN'
AND Employees.dep_id = 3001;

--39. write a SQL query to identify those employees who joined in any month other than 
--February. Return complete information about the employees. 

SELECT *
FROM Employees
WHERE MONTH(Employees.hire_date) != 2;

--40. write a SQL query to search for all employees with an annual salary between 24000 
--and 50000 (Begin and end values are included.). Return complete information about 
--the employees. 

SELECT *
FROM Employees
WHERE (Employees.salary * 12) BETWEEN 24000 AND 50000;

--41. write a SQL query to identify all employees who joined the company on 1st May, 
--20th February, and 3rd December 1991. Return complete information about the 
--employees. 

SELECT *
FROM Employees
WHERE Employees.hire_date IN ('1991-05-01', '1991-02-20', '1991-12-03');

--42. write a SQL query to find which employees joined the company after the month of June in 1991 and within this year. 
--Return complete information about the employees. 

SELECT *
FROM Employees
WHERE Employees.hire_date > '1991-06-30' 
AND YEAR(Employees.hire_date) = 1991;

--43. write a SQL query to find those employees who joined in 90's. Return complete 
--information about the employees. 

SELECT *
FROM Employees
WHERE YEAR(Employees.hire_date) BETWEEN 1990 AND 1999;


--44. write a SQL query to identify employees who joined in the month of FEBRUARY 
--with a salary range of 1001 to 2000 (Begin and end values are included.). Return 
--complete information about the employees. 

SELECT *
FROM Employees
WHERE MONTH(Employees.hire_date) = 2
AND Employees.salary BETWEEN 1001 AND 2000;

--45. write a SQL query to find those employees who joined before or after the year 1991. 
--Return complete information about the employees. 

SELECT *
FROM Employees
WHERE YEAR(Employees.hire_date) != 1991;
