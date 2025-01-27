--======================================================

CREATE DATABASE OrderManagementDB;

--======================================================

ALTER DATABASE OrderManagementDB
MODIFY Name = OrderManagementDBSQLTEST;

--======================================================

USE OrderManagementDBSQLTEST;

--======================================================

--CREATE SCHEMA Sales;

--======================================================

---===== ALL Tables =======

CREATE TABLE Tbl_Salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(5, 2)
);

CREATE TABLE Tbl_Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

CREATE TABLE Tbl_Orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

CREATE TABLE Tbl_EmpDetails (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(100),
    EMP_LNAME VARCHAR(100),
    EMP_DEPT INT
);

CREATE TABLE Tbl_UniqueIdentification (
    col1 VARCHAR(100) PRIMARY KEY
);


--======================================================

---===== Relationship =======

ALTER TABLE Tbl_Customer
ADD CONSTRAINT FK_Customer_Salesman
FOREIGN KEY (salesman_id) REFERENCES Tbl_Salesman(salesman_id);

ALTER TABLE Tbl_Orders
ADD CONSTRAINT FK_Order_Customer
FOREIGN KEY (customer_id) REFERENCES Tbl_Customer(customer_id);

ALTER TABLE Tbl_Orders
ADD CONSTRAINT FK_Order_Salesman
FOREIGN KEY (salesman_id) REFERENCES Tbl_Salesman(salesman_id);

--======================================================

---===== Insert Data =======

INSERT INTO Tbl_Salesman (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

INSERT INTO Tbl_Customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);

INSERT INTO Tbl_Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-05-10', 3005, 5002),
    (70009, 270.65, '2012-10-09', 3001, 5005),
    (70002, 65.26, '2012-05-10', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-10-09', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-10-09', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);

INSERT INTO Tbl_EmpDetails (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
    (127323, 'Michale', 'Robbin', 57),
    (526689, 'Carlos', 'Snares', 63),
    (843795, 'Enric', 'Dosio', 57),
    (328717, 'Jhon', 'Snares', 63),
    (444527, 'Joseph', 'Dosni', 47),
    (659831, 'Zanifer', 'Emily', 47),
    (847674, 'Kuleswar', 'Sitaraman', 57),
    (748681, 'Henrey', 'Gabriel', 47),
    (555935, 'Alex', 'Manuel', 57),
    (539569, 'George', 'Mardy', 27),
    (733843, 'Mario', 'Saule', 63),
    (631548, 'Alan', 'Snappy', 27),
    (839139, 'Maria', 'Foster', 57);

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

--======================================================
--======================================================

---===== Queries =======

--======================================================
--======================================================

-- *: Fetch all salesmen details
SELECT * 
FROM Tbl_Salesman;

-- *: Fetch all customers details
SELECT * 
FROM Tbl_Customer;

-- *: Fetch all orders details
SELECT * 
FROM Tbl_Orders;

-- *: Fetch all employee details
SELECT * 
FROM Tbl_EmpDetails;

-- *: Fetch all unique identification details
SELECT * 
FROM Tbl_UniqueIdentification;

--======================================================

--Q-1. write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. 
--Return salesman_id, name, city, commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE city IN ('Paris', 'Rome');

--======================================================

--Q-2. write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. 
--Return salesman_id, name, city, commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE city = 'Paris' OR city = 'Rome';

--======================================================

--Q-3. write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. 
--Return salesman_id, name, city, commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE city NOT IN ('Paris', 'Rome');

--======================================================

--Q-4. write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. 
--Return customer_id, cust_name, city, grade, and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE customer_id IN (3007, 3008, 3009);

--======================================================

--Q-5. write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included).
--Return salesman_id, name, city, and commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE commission BETWEEN 0.12 AND 0.14;	

--======================================================

--Q-6. write a SQL query to select orders between 500 and 4000 (begin and end values are included). 
--"Exclude" orders amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE purch_amt 
BETWEEN 500 AND 4000 
AND 
purch_amt NOT IN (948.50, 1983.43);

--======================================================

--Q-7. write a SQL query to retrieve the details of the salespeople whose names begin 
--with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE name LIKE '[B-K]%'; 

--======================================================

--Q-8. write a SQL query to find the details of all salespeople except those whose names begin 
--with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE name NOT LIKE '[A-L]%';

--or--

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE name  LIKE '[^A-L]%';

--or--

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE name  LIKE '[M-Z]%';

--======================================================

--Q-9. write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. 
--Return customer_id, cust_name, city, grade, salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE cust_name LIKE 'B%';

--======================================================

--Q-10. write a SQL query to find the details of the customers whose names end with the letter 'n'. 
--Return customer_id, cust_name, city, grade, salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE cust_name LIKE '%n';

--======================================================

--Q-11. write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. 
--Rests may be any character. Return salesman_id, name, city, commission.

SELECT salesman_id, name, city, commission
FROM Tbl_Salesman
WHERE name LIKE 'N__l%';

--======================================================

--Q-12. write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 LIKE '%\_%' ESCAPE '\';

-- -----------------------
SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 LIKE '%_%';  -- !!!!!!!!!!!! WRONG (DON'T USE THIS) !!!!!!!!!!!!
-- -----------------------

--https://docs.progress.com/bundle/datadirect-openaccess/page/topics/sqlref/escape-clause-in-like-operator.html

--======================================================

--Q-13. write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 NOT LIKE '%\_%' ESCAPE '\';

--======================================================

--Q-14. write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 LIKE '%/%';

--======================================================

--Q-15. write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 NOT LIKE '%/%';	

--======================================================

--Q-16. write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 LIKE '%\_/%' ESCAPE '\';

--======================================================

--Q-17. write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 NOT LIKE '%\_/%' ESCAPE '\';

--======================================================

--Q-18. write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 LIKE '%\%%' ESCAPE '\';

--======================================================

--Q-19. write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.

SELECT col1
FROM Tbl_UniqueIdentification
WHERE col1 NOT LIKE '%\%%' ESCAPE '\';

--======================================================

--Q-20. write a SQL query to find all those customers who does not have any grade. 
--Return customer_id, cust_name, city, grade, salesman_id.

--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Tbl_Customer
--WHERE grade IS NULL;

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade = '';

--======================================================

--Q-21. write a SQL query to locate all customers with a grade value. 
--Return customer_id, cust_name,city, grade, salesman_id.

--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Tbl_Customer
--WHERE grade IS NOT NULL;

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade != '';


--======================================================

--Q-22. write a SQL query to locate the employees whose last name begins with the letter 'D'. 
--Return emp_idno, emp_fname, emp_lname and emp_dept

SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
FROM Tbl_EmpDetails
WHERE EMP_LNAME LIKE 'D%';

--======================================================
--======================================================
--======================================================

