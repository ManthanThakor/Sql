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

CREATE TABLE Tbl_CompanyMaster (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(50)
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

INSERT INTO Tbl_CompanyMaster (COM_ID, COM_NAME) 
VALUES
	(11, 'Samsung'),
	(12, 'iBall'),
	(13, 'Epsion'),
	(14, 'Zebronics'),
	(15, 'Asus'),
	(16, 'Frontech');

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
--================================= END ===========================================


----Q-1. write a SQL query to find the salesperson and customer who reside in the same city. 
--Return Salesman, cust_name and city AND ORDER BY SALESMAN NAME.

SELECT S.name AS Salesman, C.cust_name, C.city
FROM Tbl_Salesman S
JOIN Tbl_Customer C 
ON S.city = C.city
ORDER BY Salesman;

----Q-2. write a SQL query to find those orders where the order amount exists between 500 and 2000. 
--Return ord_no, purch_amt, cust_name, city.

SELECT O.ord_no , O.purch_amt, c.cust_name, C.city
FROM Tbl_Orders O
JOIN Tbl_Customer C 
ON O.customer_id = C.customer_id
WHERE purch_amt BETWEEN 500 AND 2000;

----Q-3. write a SQL query to find the salesperson(s) and the customer(s) he represents. 
--Return Customer Name, city, Salesman, commission.

SELECT C.cust_name, C.city, S.name AS Salesman, S.commission
FROM Tbl_Salesman S
JOIN Tbl_Customer C 
ON S.salesman_id = C.salesman_id;

----Q-4. write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
--Return Customer Name, customer city, Salesman, commission.

SELECT C.cust_name, C.city, S.name AS Salesman, S.commission
FROM Tbl_Salesman S
JOIN Tbl_Customer C ON S.salesman_id = C.salesman_id
WHERE S.commission > 0.12;

----Q-5. write a SQL query to locate those salespeople who do not live in the same city where their customers 
--live and have received a commission of more than 12% from the company. Return Customer Name, customer city, 
--Salesman, salesman city, commission.

SELECT C.cust_name, C.city, S.name AS Salesman, S.city AS salesman_city, S.commission
FROM Tbl_Salesman S
JOIN Tbl_Customer C ON S.salesman_id = C.salesman_id
WHERE S.city != C.city AND S.commission > 0.12;

----Q-6. write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, 
--grade, Salesman, commission.

SELECT O.ord_no, O.ord_date, O.purch_amt, C.cust_name, C.grade, S.name AS Salesman, S.commission
FROM Tbl_Orders O
JOIN Tbl_Customer C ON O.customer_id = C.customer_id
JOIN Tbl_Salesman S ON O.salesman_id = S.salesman_id;


----Q-7. Write a SQL statement to join the tables salesman, customer and orders so that the same column 
--of each table appears once and only the relational rows are returned.

SELECT O.ord_no, O.purch_amt, O.ord_date, C.cust_name, C.city, S.name AS Salesman
FROM Tbl_Orders O
JOIN Tbl_Customer C ON O.customer_id = C.customer_id
JOIN Tbl_Salesman S ON O.salesman_id = S.salesman_id;

----Q-8. write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 
--The results should be sorted by ascending customer_id.

SELECT C.cust_name, C.city, C.grade, S.name AS Salesman, S.city AS salesman_city
FROM Tbl_Customer C
JOIN Tbl_Salesman S ON C.salesman_id = S.salesman_id
ORDER BY C.customer_id ASC;

----Q-9. write a SQL query to find those customers with a grade less than 300. Return cust_name, customer 
--city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.

SELECT C.cust_name, C.city, C.grade, S.name AS Salesman, S.city AS salesman_city
FROM Tbl_Customer C
JOIN Tbl_Salesman S ON C.salesman_id = S.salesman_id
WHERE C.grade < 300
ORDER BY C.customer_id ASC;

----Q-10. Write a SQL statement to make a report with customer name, city, order number, order date, and 
--order amount in ascending order according to the order date to determine whether any of the existing 
--customers have placed an order or not.

SELECT C.cust_name, C.city, O.ord_no, O.ord_date, O.purch_amt
FROM Tbl_Customer C
LEFT JOIN Tbl_Orders O ON C.customer_id = O.customer_id
ORDER BY O.ord_date ASC;

----Q-11. SQL statement to generate a report with customer name, city, order number, order date, order 
--amount, salesperson name, and commission to determine if any of the existing customers have not 
--placed orders or if they have placed orders through their salesman or by themselves.

SELECT C.cust_name, C.city, O.ord_no, O.ord_date, O.purch_amt, S.name AS Salesman, S.commission
FROM Tbl_Customer C
LEFT JOIN Tbl_Orders O ON C.customer_id = O.customer_id
LEFT JOIN Tbl_Salesman S ON C.salesman_id = S.salesman_id;

----Q-12. Write a SQL statement to generate a list in ascending order of salespersons who work either for 
--one or more customers or have not yet joined any of the customers.

SELECT S.name AS Salesman
FROM Tbl_Salesman S
LEFT JOIN Tbl_Customer C ON S.salesman_id = C.salesman_id
GROUP BY S.name
HAVING COUNT(C.customer_id) > 0 OR COUNT(C.customer_id) = 0
ORDER BY S.name ASC;


----Q-13. write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.

SELECT S.name AS Salesman, C.cust_name, C.city, C.grade, O.ord_no, O.ord_date, O.purch_amt
FROM Tbl_Salesman S
JOIN Tbl_Customer C ON S.salesman_id = C.salesman_id
JOIN Tbl_Orders O ON C.customer_id = O.customer_id;

----Q-14. Write a SQL statement to make a list for the salesmen who either work for one or more customers 
--or yet to join any of the customer. The customer may have placed, either one or more orders on or above 
--order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

----Q-15. Write a SQL statement to generate a list of all the salesmen who either work for one or more 
--customers or have yet to join any of them. The customer may have placed one or more orders at or above 
--order amount 2000, and must have a grade, or he may not have placed any orders to the associated supplier.

SELECT s.name AS Salesman, c.cust_name, c.city, c.grade, 
       o.ord_no, o.ord_date, o.purch_amt
FROM Tbl_Salesman s
LEFT JOIN Tbl_Customer c ON s.salesman_id = c.salesman_id
LEFT JOIN Tbl_Orders o ON c.customer_id = o.customer_id
WHERE (o.purch_amt >= 2000 AND c.grade IS NOT NULL) 
   OR c.customer_id IS NULL;


----Q-16. Write a SQL statement to generate a report with the customer name, city, order no. order date, 
--purchase amount for only those customers on the list who must have a grade and placed one or more orders or 
--which order(s) have been placed by the customer who neither is on the list nor has a grade.

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM Tbl_Customer c
LEFT JOIN Tbl_Orders o ON c.customer_id = o.customer_id
WHERE c.grade IS NOT NULL;

----Q-17. Write a SQL query to combine each row of the salesman table with each row of the customer table.

SELECT s.*, c.*
FROM Tbl_Salesman s
CROSS JOIN Tbl_Customer c;

----Q-18. Write a SQL statement to create a Cartesian product between salesperson and customer, 
--i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

SELECT s.*, c.*
FROM Tbl_Salesman s
CROSS JOIN Tbl_Customer c
WHERE s.city = c.city;

----Q-19. Write a SQL statement to create a Cartesian product between salesperson and customer, 
--i.e. each salesperson will appear for every customer and vice versa for those 
--salesmen who belong to a city and customers who require a grade.

SELECT s.*, c.*
FROM Tbl_Salesman s
CROSS JOIN Tbl_Customer c
WHERE c.grade IS NOT NULL;


----Q-20. Write a SQL statement to make a Cartesian product between salesman and customer 
--i.e. each salesman will appear for all customers and vice versa for those salesmen who must 
--belong to a city which is not the same as his customer and the customers should have their own grade.

SELECT s.*, c.*
FROM Tbl_Salesman s
CROSS JOIN Tbl_Customer c
WHERE s.city <> c.city AND c.grade IS NOT NULL;

----Q-21. write a SQL query to select all rows from both participating tables as long as there is a 
--match between pro_com and com_id.

SELECT *
FROM Tbl_ItemMaster i
LEFT JOIN Tbl_CompanyMaster c ON i.PRO_COM = c.COM_ID;


----Q-22. Write a SQL query to display the item name, price, and company name of all the products.

SELECT i.PRO_NAME, i.PRO_PRICE, c.COM_NAME
FROM Tbl_ItemMaster i
JOIN Tbl_CompanyMaster c ON i.PRO_COM = c.COM_ID;

----Q-23. write a SQL query to calculate the average price of items of each company. Return average value and company name.

SELECT c.COM_NAME, AVG(i.PRO_PRICE) AS average_price
FROM Tbl_ItemMaster i
JOIN Tbl_CompanyMaster c ON i.PRO_COM = c.COM_ID
GROUP BY c.COM_NAME;

----Q-24. write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. 
--Return average value and company name.

SELECT c.COM_NAME, AVG(i.PRO_PRICE) AS average_price
FROM Tbl_ItemMaster i
JOIN Tbl_CompanyMaster c ON i.PRO_COM = c.COM_ID
WHERE i.PRO_PRICE >= 350
GROUP BY c.COM_NAME;

----Q-25. write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.

SELECT i.PRO_NAME, i.PRO_PRICE, c.COM_NAME
FROM Tbl_ItemMaster i
JOIN Tbl_CompanyMaster c ON i.PRO_COM = c.COM_ID
WHERE i.PRO_PRICE = (
    SELECT MAX(PRO_PRICE)
    FROM Tbl_ItemMaster
    WHERE PRO_COM = i.PRO_COM
)
ORDER BY c.COM_NAME;

----Q-26. write a SQL query to display all the data of employees including their department.

SELECT e.*, d.DPT_NAME
FROM Tbl_EmpDetails e
JOIN Tbl_Department d ON e.EMP_DEPT = d.DPT_CODE;

----Q-27. write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.

SELECT e.EMP_FNAME, e.EMP_LNAME, d.DPT_NAME, d.DPT_ALLOTMENT
FROM Tbl_EmpDetails e
JOIN Tbl_Department d ON e.EMP_DEPT = d.DPT_CODE;

----Q-28. write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.

SELECT e.EMP_FNAME, e.EMP_LNAME, d.DPT_NAME
FROM Tbl_EmpDetails e
JOIN Tbl_Department d ON e.EMP_DEPT = d.DPT_CODE
WHERE d.DPT_ALLOTMENT > 50000;

----Q-29. write a SQL query to find the names of departments where more than two employees are employed. 
--Return dpt_name

SELECT d.DPT_NAME
FROM Tbl_Department d
JOIN Tbl_EmpDetails e ON d.DPT_CODE = e.EMP_DEPT
GROUP BY d.DPT_NAME
HAVING COUNT(e.EMP_IDNO) > 2;

--//===================================

-- Q-1. Write a SQL query to find all the orders issued by the salesman 'Paul Adam'. 
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE salesman_id = (SELECT salesman_id FROM Tbl_Salesman WHERE name = 'Paul Adam');

-- Q-2. Write a SQL query to find all orders generated by London-based salespeople.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE salesman_id IN (SELECT salesman_id FROM Tbl_Salesman WHERE city = 'London');


-- Q-3. Write a SQL query to find all orders generated by the salespeople who may work for customers whose ID is 3007.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE salesman_id IN (SELECT salesman_id FROM Tbl_Customer WHERE customer_id = 3007);

-- Q-4. Write a SQL query to find the order values greater than the average order value of 10th October 2012.
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE ord_date = '2012-10-10' AND purch_amt > (SELECT AVG(purch_amt) FROM Tbl_Orders WHERE ord_date = '2012-10-10');

-- Q-5. Write a SQL query to find all the orders generated in New York city.
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE customer_id IN (SELECT customer_id FROM Tbl_Customer WHERE city = 'New York');

-- Q-6. Write a SQL query to determine the commission of the salespeople in Paris.
-- Return commission.

SELECT commission
FROM Tbl_Salesman
WHERE city = 'Paris';


-- Q-7. Write a query to display all the customers whose ID is 2001 below the salesperson ID of Mc Lyon.

SELECT cust_name
FROM Tbl_Customer
WHERE customer_id = 2001 AND salesman_id < (SELECT salesman_id FROM Tbl_Salesman WHERE name = 'Mc Lyon');


-- Q-8. Write a SQL query to count the number of customers with grades above the average in New York City.
-- Return grade and count.

SELECT grade, COUNT(*)
FROM Tbl_Customer
WHERE city = 'New York' AND grade > (SELECT AVG(grade) FROM Tbl_Customer WHERE city = 'New York')
GROUP BY grade;

-- Q-9. Write a SQL query to find those salespeople who earned the maximum commission.
-- Return ord_no, purch_amt, ord_date, and salesman_id.

SELECT o.ord_no, o.purch_amt, o.ord_date, o.salesman_id
FROM Tbl_Orders o
JOIN Tbl_Salesman s ON o.salesman_id = s.salesman_id
WHERE s.commission = (SELECT MAX(commission) FROM Tbl_Salesman);

-- Q-10. Write SQL query to find the customers who placed orders on 17th August 2012.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id, and cust_name.

SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id, c.cust_name
FROM Tbl_Orders o
JOIN Tbl_Customer c ON o.customer_id = c.customer_id
WHERE o.ord_date = '2012-08-17';

-- Q-11. Write a SQL query to find salespeople who had more than one customer.
-- Return salesman_id and name.

SELECT salesman_id, name
FROM Tbl_Salesman
WHERE salesman_id IN (
    SELECT salesman_id
    FROM Tbl_Customer
    GROUP BY salesman_id
    HAVING COUNT(customer_id) > 1
);



-- Q-12. Write a SQL query to find those orders, which are higher than the average amount of the orders.
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE purch_amt > (SELECT AVG(purch_amt) FROM Tbl_Orders);


-- Q-13. Write a SQL query to find those orders that are equal or higher than the average amount of the orders.
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE purch_amt >= (SELECT AVG(purch_amt) FROM Tbl_Orders);


-- Q-14. Write a query to find the sums of the amounts from the orders table, grouped by date,
-- and eliminate all dates where the sum was not at least 1000.00 above the maximum order amount for that date.

SELECT ord_date, SUM(purch_amt) AS total_amount
FROM Tbl_Orders
GROUP BY ord_date
HAVING SUM(purch_amt) > (SELECT MAX(purch_amt) + 1000
                         FROM Tbl_Orders AS o2
                         WHERE o2.ord_date = Tbl_Orders.ord_date);

-- Q-15. Write a query to extract all data from the customer table if and only if one or 
-- more of the customers in the customer table are located in London.

SELECT *
FROM Tbl_Customer
WHERE city = 'London';


-- Q-16. Write a SQL query to find salespeople who deal with multiple customers.
-- Return salesman_id, name, city, and commission.

SELECT s.salesman_id, s.name, s.city, s.commission
FROM Tbl_Salesman s
JOIN Tbl_Customer c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name, s.city, s.commission
HAVING COUNT(c.customer_id) > 1;


-- Q-17. Write a SQL query to find salespeople who deal with a single customer.
-- Return salesman_id, name, city, and commission.

SELECT s.salesman_id, s.name, s.city, s.commission
FROM Tbl_Salesman s
JOIN Tbl_Customer c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name, s.city, s.commission
HAVING COUNT(c.customer_id) = 1;


-- Q-18. Write a SQL query to find the salespeople who deal with customers who have more than one order.
-- Return salesman_id, name, city, and commission.

SELECT s.salesman_id, s.name, s.city, s.commission
FROM Tbl_Salesman s
JOIN Tbl_Customer c ON s.salesman_id = c.salesman_id
JOIN Tbl_Orders o ON c.customer_id = o.customer_id
GROUP BY s.salesman_id, s.name, s.city, s.commission
HAVING COUNT(o.ord_no) > 1;


-- Q-19. Write a SQL query to find the salespeople who deal with customers who live in the same city.
-- Return salesman_id, name, city, and commission.

SELECT s.salesman_id, s.name, s.city, s.commission
FROM Tbl_Salesman s
JOIN Tbl_Customer c ON s.salesman_id = c.salesman_id
WHERE s.city = c.city;	

-- Q-20. Write a SQL query to find salespeople whose place of residence matches any city where customers live.
-- Return salesman_id, name, city, and commission.

SELECT s.salesman_id, s.name, s.city, s.commission
FROM Tbl_Salesman s
JOIN Tbl_Customer c ON s.city = c.city;

-- Q-21. Write a SQL query to find all those salespeople whose names appear alphabetically after the customer’s name.
-- Return salesman_id, name, city, commission.

SELECT s.salesman_id, s.name, s.city, s.commission
FROM Tbl_Salesman s
JOIN Tbl_Customer c ON s.salesman_id = c.salesman_id
WHERE s.name > c.cust_name;


-- Q-22. Write a SQL query to find all those customers with a higher grade than all the customers alphabetically below the city of New York. 
-- Return customer_id, cust_name, city, grade, and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade >= ALL (
    SELECT grade
    FROM Tbl_Customer 
    WHERE city < 'New York'
);

-- Q-23. Write a SQL query to find all those orders whose order amount exceeds at 
-- least one of the orders placed on September 10th 2012. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE purch_amt > ANY (
    SELECT purch_amt
    FROM Tbl_Orders
    WHERE ord_date = '2012-09-10'
);
	
----Q-24. write a SQL query to find orders where the order amount is less than the order amount of a customer residing in London City. 
--Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE purch_amt < ANY (
    SELECT purch_amt
    FROM Tbl_Customer
    JOIN Tbl_Orders ON Tbl_Customer.customer_id = Tbl_Orders.customer_id
    WHERE Tbl_Customer.city = 'London'
);

----Q-25. write a SQL query to find those orders where every order amount is less than the maximum order amount of a 
--customer who lives in London City. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM Tbl_Orders
WHERE purch_amt < ALL (
    SELECT MAX(purch_amt)
    FROM Tbl_Orders
    JOIN Tbl_Customer ON Tbl_Orders.customer_id = Tbl_Customer.customer_id
    WHERE Tbl_Customer.city = 'London'
    GROUP BY Tbl_Customer.customer_id
);

----Q-26. write a SQL query to find those customers whose grades are higher than those living in New York City. 
--Return customer_id, cust_name, city, grade and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade > ALL (
    SELECT grade
    FROM Tbl_Customer
    WHERE city = 'New York'
);

----Q-27. write a SQL query to calculate the total order amount generated by a salesperson. Salespersons should be 
--from the cities where the customers reside. Return salesperson name, city and total order amount.

SELECT s.name AS salesperson_name, s.city, SUM(o.purch_amt) AS total_order_amount
FROM Tbl_Salesman s
JOIN Tbl_Orders o ON s.salesman_id = o.salesman_id
JOIN Tbl_Customer c ON o.customer_id = c.customer_id
WHERE s.city = c.city
GROUP BY s.salesman_id;

----Q-28. write a SQL query to find those customers whose grades are not the same as those who live in London City. 
--Return customer_id, cust_name, city, grade and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade != ANY (
    SELECT grade
    FROM Tbl_Customer
    WHERE city = 'London'
);

----Q-29. write a SQL query to find those customers whose grades are different from those living in Paris. 
--Return customer_id, cust_name, city, grade and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade != ANY (
    SELECT grade
    FROM Tbl_Customer
    WHERE city = 'Paris'
);

----Q-30. write a SQL query to find all those customers who have different grades than any customer who lives in Dallas City. 
--Return customer_id, cust_name,city, grade and salesman_id.

SELECT customer_id, cust_name, city, grade, salesman_id
FROM Tbl_Customer
WHERE grade != ANY (
    SELECT grade
    FROM Tbl_Customer
    WHERE city = 'Dallas'
);

----Q-31. write a SQL query to calculate the average price of each manufacturer's product along with their name. 
--Return Average Price and Company.

SELECT tm.PRO_NAME AS Product_Name, AVG(tm.PRO_PRICE) AS Average_Price, cm.COM_NAME AS Company
FROM Tbl_ItemMaster tm
JOIN Tbl_CompanyMaster cm ON tm.PRO_COM = cm.COM_ID
GROUP BY cm.COM_NAME;

----Q-32. write a SQL query to calculate the average price of each manufacturer's product of 350 or more. 
--Return Average Price and Company.

SELECT tm.PRO_NAME AS Product_Name, AVG(tm.PRO_PRICE) AS Average_Price, cm.COM_NAME AS Company
FROM Tbl_ItemMaster tm
JOIN Tbl_CompanyMaster cm ON tm.PRO_COM = cm.COM_ID
WHERE tm.PRO_PRICE >= 350
GROUP BY cm.COM_NAME;

----Q-33. write a SQL query to find the most expensive product of each company. Return Product Name, Price and Company.

SELECT tm.PRO_NAME AS Product_Name, tm.PRO_PRICE AS Price, cm.COM_NAME AS Company
FROM Tbl_ItemMaster tm
JOIN Tbl_CompanyMaster cm ON tm.PRO_COM = cm.COM_ID
WHERE tm.PRO_PRICE = (
    SELECT MAX(PRO_PRICE)
    FROM Tbl_ItemMaster
    WHERE PRO_COM = tm.PRO_COM
);

----Q-34. write a SQL query to find employees whose last name is Gabriel or Dosio. Return emp_idno, emp_fname, emp_lname and emp_dept.

SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
FROM Tbl_EmpDetails
WHERE EMP_LNAME IN ('Gabriel', 'Dosio');

----Q-35. write a SQL query to find the employees who work in department 89 or 63. Return emp_idno, emp_fname, emp_lname and emp_dept.

SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
FROM Tbl_EmpDetails
WHERE EMP_DEPT IN (89, 63);

----Q-36. write a SQL query to find those employees who work for the department where the departmental allotment 
--amount is more than Rs. 50000. Return emp_fname and emp_lname.

SELECT EMP_FNAME, EMP_LNAME
FROM Tbl_EmpDetails
WHERE EMP_DEPT IN (
    SELECT DPT_CODE
    FROM Tbl_Department
    WHERE DPT_ALLOTMENT > 50000
);

----Q-37. write a SQL query to find the departments whose sanction amount is higher than the average 
--sanction amount for all departments. Return dpt_code, dpt_name and dpt_allotment.

SELECT DPT_CODE, DPT_NAME, DPT_ALLOTMENT
FROM Tbl_Department
WHERE DPT_ALLOTMENT > (
    SELECT AVG(DPT_ALLOTMENT)
    FROM Tbl_Department
);

----Q-38. write a SQL query to find which departments have more than two employees. Return dpt_name.

SELECT DPT_NAME
FROM Tbl_Department
WHERE DPT_CODE IN (
    SELECT EMP_DEPT
    FROM Tbl_EmpDetails
    GROUP BY EMP_DEPT
    HAVING COUNT(EMP_IDNO) > 2
);

----Q-39. write a SQL query to find the departments with the second lowest sanction amount. Return emp_fname and emp_lname

SELECT EMP_FNAME, EMP_LNAME
FROM Tbl_EmpDetails
WHERE EMP_DEPT IN (
    SELECT DPT_CODE
    FROM Tbl_Department
    WHERE DPT_ALLOTMENT = (
        SELECT MIN(DPT_ALLOTMENT)
        FROM Tbl_Department
        WHERE DPT_ALLOTMENT > (
            SELECT MIN(DPT_ALLOTMENT)
            FROM Tbl_Department
        )
    )
);
