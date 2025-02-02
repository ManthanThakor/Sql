--======================================================

CREATE DATABASE OrderManagementDBSQLTEST2;

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


CREATE TABLE Tbl_ItemMaster (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);

CREATE TABLE Tbl_Department (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT DECIMAL(10, 2)
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

INSERT INTO Tbl_ItemMaster (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
(101, 'Mother Board', 3200, 15),
(102, 'Key Board', 450, 16),
(103, 'ZIP drive', 250, 14),
(104, 'Speaker', 550, 16),
(105, 'Monitor', 5000, 11),
(106, 'DVD drive', 900, 12),
(107, 'CD drive', 800, 12),
(108, 'Printer', 2600, 13),
(109, 'Refill cartridge', 350, 13),
(110, 'Mouse', 250, 12);

INSERT INTO Tbl_Department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);



--======================================================
--======================================================

---===== Queries =======

--======================================================
--======================================================

--Q-1. write a SQL query to calculate total purchase amount of all orders. 
--Return total purchase amount.

SELECT SUM(purch_amt) AS total_purchase_amount
FROM Tbl_Orders;

--Q-2. write a SQL query to calculate the average purchase amount of all orders. 
--Return average purchase amount.

SELECT AVG(purch_amt) AS average_purchase_amount
FROM Tbl_Orders;

--Q-3. write a SQL query that counts the number of unique salespeople. 
--Return number of salespeople.

SELECT COUNT(DISTINCT salesman_id) AS number_of_salespeople
FROM Tbl_Salesman;

--Q-4. write a SQL query to count the number of customers. Return number of customers.

SELECT COUNT(customer_id) AS number_of_customers
FROM Tbl_Customer;

--Q-5. write a SQL query to determine the number of customers who received at least one grade for their activity.

SELECT COUNT(DISTINCT customer_id) AS customers_with_grade
FROM Tbl_Customer
WHERE grade IS NOT NULL; 

--Q-6. write a SQL query to find the maximum purchase amount.

SELECT MAX(purch_amt) AS maximum_purchase_amount
FROM Tbl_Orders;

--Q-7. write a SQL query to find the minimum purchase amount.

SELECT MIN(purch_amt) AS minimum_purchase_amount
FROM Tbl_Orders;

--Q-8. write a SQL query to find the highest grade of the customers in each city. 
--Return city, maximum grade.

SELECT city, MAX(grade) AS highest_grade
FROM Tbl_Customer
GROUP BY city;

--Q-9. write a SQL query to find the highest purchase amount ordered by each customer. 
--Return customer ID, maximum purchase amount.

SELECT  customer_id,  MAX(purch_amt)  AS max_purchase_amount
FROM Tbl_Orders
GROUP BY customer_id; 

--Q-10. write a SQL query to find the highest purchase amount ordered by each customer on a particular date. 
--Return, order date and highest purchase amount.

SELECT  ord_date,  MAX(purch_amt)  AS max_purchase_amount
FROM Tbl_Orders
GROUP BY ord_date; 

--Q-11. write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. 
--Return salesperson ID, purchase amount.

SELECT salesman_id , MAX(purch_amt) AS max_purchase_amount
FROM Tbl_Orders
WHERE ord_date = '2012-08-17'
GROUP BY salesman_id;

--Q-12. write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. 
--Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.

SELECT customer_id , ord_date , MAX(purch_amt) AS max_purchase_amount  
FROM Tbl_Orders
GROUP BY ord_date,customer_id
HAVING MAX(purch_amt) > 2000.00;

--Q-13. write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) 
--by combination of each customer and order date. Return customer id, order date and maximum purchase amount.

SELECT customer_id , ord_date , MAX(purch_amt) AS max_purchase_amount  
FROM Tbl_Orders
WHERE purch_amt BETWEEN 2000 AND 6000
GROUP BY customer_id ,ord_date;

--Q-14. write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. 
--Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. 
--Return customer id, order date and maximum purchase amount.

SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM Tbl_Orders
WHERE purch_amt IN (2000, 3000, 5760, 6000)
GROUP BY customer_id, ord_date;

--Q-15. write a SQL query to determine the maximum order amount for each customer. 
--The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
--Return customer id and maximum purchase amount.

SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM Tbl_Orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id;

--Q-16. write a SQL query to find the maximum order (purchase) amount for each customer. 
--The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
--Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.

SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM Tbl_Orders
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id
HAVING MAX(purch_amt) > 1000;

--Q-17. write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. 
--Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). 
--Return salesperson id and maximum purchase amount.

SELECT salesman_id, MAX(purch_amt) AS max_purchase_amount
FROM Tbl_Orders
WHERE salesman_id BETWEEN 5003 AND 5008
GROUP BY salesman_id;

--Q-18. write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.

SELECT COUNT(*) AS number_of_orders
FROM Tbl_Orders
WHERE ord_date = '2012-08-17';

--Q-19. write a SQL query to count the number of salespeople in a city. Return number of salespeople.

SELECT COUNT(salesman_id) AS number_of_salespeople , city
FROM Tbl_Salesman
GROUP BY city; -- // IF EACH CITY

SELECT COUNT(salesman_id) AS number_of_salespeople
FROM Tbl_Salesman
WHERE city = 'Paris';-- // IF SINGLE CITY

--Q-20. write a SQL query to count the number of orders based on the combination of each order date and salesperson. 
--Return order date, salesperson id.

SELECT ord_date, salesman_id, COUNT(*) AS number_of_orders
FROM Tbl_Orders
GROUP BY ord_date, salesman_id;

--Q-21. write a SQL query to calculate the average product price. Return average product price.

SELECT AVG(PRO_PRICE) AS average_product_price
FROM Tbl_ItemMaster;

--Q-22. write a SQL query to count the number of products whose price are higher than or equal to 350. 
--Return number of products.

SELECT COUNT(*) AS number_of_products
FROM Tbl_ItemMaster
WHERE PRO_PRICE >= 350;

--Q-23. write a SQL query to compute the average price for unique companies. 
--Return average price and company id.

SELECT AVG(PRO_PRICE) AS average_price, PRO_COM
FROM Tbl_ItemMaster
GROUP BY PRO_COM;

--Q-24. write a SQL query to compute the sum of the allotment amount of all departments. 
--Return sum of the allotment amount.

SELECT SUM(DPT_ALLOTMENT) AS total_allotment
FROM Tbl_Department;

--Q-25. write a SQL query to count the number of employees in each department. 
--Return department code and number of employees.

SELECT EMP_DEPT, COUNT(*) AS number_of_employees
FROM Tbl_EmpDetails
GROUP BY EMP_DEPT;

--================================= END ===========================================