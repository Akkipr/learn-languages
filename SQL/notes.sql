/*
What is SQL?
    Structured Query Language 
    Create, retrieve, delete and update a database 
    It is a relational type of database (looks like Excel, relationships with one another through keys)
    Non-relational is NOT table type. So JSON and what NOT 
    DBMS - workspace to work with SQL and work with a database
*/

CREATE DATABASE myDB;
    --this will make a new database 
DROP DATABASE myDB;
    --this will delete myDB

ALTER DATABASE myDB READ ONLY = 1;
    --keeps it at read only 
    --You can't delete it in READ ONLY. Change to normal, so do 
    ALTER DATABASE myDB READ ONLY = 0;



USE myDB;
CREATE TABLE workers (
	employee_id INT, 
    first_name VARCHAR(50),         -- String of size 50 characters
    pay DECIMAL(5, 2),              -- max 5 digits, and 2 decimal digits
    date_JOIN DATE
);

SELECT * FROM workers;
    --Now we can see our table in output, the asterisk means all

RENAME TABLE workers TO employees;
   --Refresh to see this different name

DROP TABLE workers;
    -- Drop it.

ALTER TABLE workers
ADD phone_number VARCHAR(15);

-- Rename an element 
ALTER TABLE workers
RENAME COLUMN phone_number TO email

-- Change the size 
ALTER TABLE workers
MODIFY COLUMN email VARCHAR(100);           -- Now email will have 100 characters

-- How can I move columns around?
ALTER TABLE workers 
MODIFY email VARCHAR(100)
AFTER first_name;                           -- This means email will be seen after last_name
SELECT * FROM workers;

-- How do I move it to the first column? - Same code as above but do
FIRST;          -- instead of AFTER first_name;

-- Drop a column
ALTER TABLE workers 
DROP COLUMN email;          -- This will delete email

-- Insert rows into the table
INSERT INTO workers                         -- weird syntax error here, do NOT put semi-colons
VALUES (1, "Mathan", "just@gmail.com", 15.10, "2022-01-02"); , 
        (2, "Mathan1", "just1@gmail.com", 15.10, "2021-01-02");,
        (3, "Mathan2", "just2@gmail.com", 15.10, "2020-01-02");         -- throws an error if you don't put all fields

SELECT * FROM workers;

-- To enter ONLY CERTAIN data into a table, you have to edit insert to be
INSERT INTO workers(employee_id, first_name, email)
VALUES (4, "Mathan3", "just3@gail.com");                    -- pay and date will be omitted

-- Query ALL data from a table
SELECT * FROM workers;

-- Select specific columns
SELECT email, first_name FROM workers;


-- Get data based on specific criteria
SELECT * FROM workers WHERE employee_id = 3;

-- You can even do
WHERE date_JOIN <= "2023-01-02"         -- this will show the employees joined before that date!
WHERE date_JOIN IS NULL;                -- Will give me Mathan3

-- Update specific data in the table
SET SQL_SAFE_UPDATES = 0;               -- Was getting an error where UPDATE was not allowed
UPDATE workers
SET pay = 10.25
WHERE first_name = "Mathan3"
SELECT * FROM workers;


-- To set a column to all have the same value 
UPDATE workers
SET pay = 10.25                 -- now everyone sad :brokenheart
SELECT * FROM workers;

-- Delete rows
DELETE FROM workers
WHERE employee_id = 2

-- How to undo changes
SET AUTOCOMMIT = OFF;   -- run this
COMMIT;                 -- this creates a safe point, this is kinda like CTRL+S in VSCode
-- do some stuff....
ROLLBACK;               -- Once we realize that we fricked up, put this command and it's back

-- Get current date, time, DATETIME
CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    datetime1 DATETIME
);
INSERT INTO test 
VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());
VALUES(CURRENT_DATE() + 1, CURRENT_TIME(), NOW());  -- this is tomorrow

-- Ensure data in a column is each unique
CREATE TABLE employee(
    employeeID INT UNIQUE,
    pay DECIMAL(5,2)
);

-- IF you forgot the unique constraint and already made the table
ALTER TABLE employee
ADD CONSTRAINT 
UNIQUE(employee_id);

-- Create a table with NOT NULL
CREATE TABLE test(
    my_date DATE,
    my_time TIME,
    datetime1 DATETIME NOT NULL
);

-- For an existing table:
ALTER TABLE workers
MODIFY pay DECIMAL(5,2) NOT NULL;

-- If you try to add a VALUE with a NULL values where you said it must be NOT NULL, you get error

-- Ensure certain values are only greater than something specific 
CREATE TABLE workers (
	employee_id INT, 
    first_name VARCHAR(50),         -- String of size 50 characters
    pay DECIMAL(5, 2),              -- max 5 digits, and 2 decimal digits
    date_JOIN DATE
    CONSTAINT hourly_pay CHECK (pay>=10.50)
);

-- put a constraint on existing table
ALTER TABLE workers
ADD CONSTAINT hourly_pay CHECK(pay >= 10.50)

ALTER TABLE workers
DROP CHECK hourly_pay           -- delete it

-- DEFAULT keyword
-- Instead of adding a bunch of free items with price 0.00 to a menu, you can set a default price
-- New table
CREATE TABLE products (
	product_id INT, 
    name VARCHAR(50),                          -- String of size 50 characters
    price DECIMAL(5, 2) DEFAULT 0              -- max 5 digits, and 2 decimal digits
);

-- For existing table
ALTER TABLE products
ALTER price SET DEFAULT 0

-- Now you can do 
INSERT INTO products(product_id, name)
VALUES (104, "fork");

--Whereas before
INSERT INTO products
VALUES (104, "fork", 0.00);             -- and so on...

-- Primary key - Unique and NOT NULL like a SIN. You can ONLY have 1 primary key per table. 
CREATE TABLE transactions (
    trans_id INT PRIMARY KEY,
    account DECIMAL(5,2)
);

-- For existing table
ALTER TABLE transactions
ADD CONSTRAINT
PRIMARY KEY(trans_id);

-- You can errors if the primary key is NULL or not unique


-- Instead of putting a new key with an increased ID by 1, use auto-incrementing. This can only happen to primary keys
CREATE TABLE transactions (
    trans_id INT PRIMARY KEY AUTO_INCREMENT,
    account DECIMAL(5,2)
);
INSERT INTO transactions(amount)
VALUES(5.99);                       -- we get 1 under trans_id and 5.99 for amount

ALTER TABLE transactions
AUTO_INCREMENT = 0;                 -- this will start ID at 1000 instead of 1 (default)


-- FOREIGN KEY - primary key in one table, seem in another table. Customer_ID in 2 tables
-- Linking tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);
INSERT INTO transactions(first_name)
VALUES ("FRED"), ("LARRY");

CREATE TABLE transactions (
    trans_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2),
    customer_id INT,
    FOREIGN_KEY(customer_id) REFERENCES customers(customer_id)
);

--Existing tables
ALTER TABLE transactions
ADD CONSTRAINT new_name                                         -- this will name the constaint
FOREIGN_KEY(customer_id) REFERENCES customers(customer_id);

-- You cannot delete a foreign key that has a link between two tables
DELETE FROM customers
WHERE customer_id == 3;                 -- error 

-- JOINS - combine two or more tables based on a common relationship, also known as a foreign key 
-- INNER JOIN - your average equal sign
SELECT * FROM transactions INNER JOIN customers             -- show duplicate customer_id, instead don't do * and select specific columns 
ON transactions.customer_id = customer.customer_id          -- join any match rows 

-- LEFT JOIN - display all data from the table on the left, but if there matches something on the right
SELECT * FROM transactions LEFT JOIN customers             -- show duplicate customer_id, instead don't do * and select specific columns 
ON transactions.customer_id = customer.customer_id          -- join any match rows 

-- RIGHT JOIN - display all data from the table on the right and if there are any matches, show other table data


-- BUILT-IN functions

-- COUNT - find how many of something
SELECT COUNT(amount) FROM transactions              -- returns 5 if there are 5 entries since there are 5 entries for amount
SELECT COUNT(amount) as count FROM transactions     -- this will return 5 under the column named "count"

-- MAX - return biggest value
SELECT MAX(amount) as maximum FROM transactions 
SELECT MIN(amount) as minimum FROM transactions 
SELECT SUM(amount) as sum FROM transactions 
SELECT AVG(amount) as average FROM transactions 

-- Combine columns into one 
SELECT CONCAT(first_name, " ", pay) as name_pay FROM employees     

-- Add column to an existing table
ALTER TABLE employees
ADD COLUMN job VARCHAR(25) AFTER pay;

-- Update somebody's job
UPDATE employees
SET job = "manager"
WHERE employee_id = 2;              -- WHERE date_JOIN BETWEEN "2023-01-02" AND "2023-01-05"
                                    -- WHERE job IN ("manager", "cook", "accountant");
                                    
-- WILD CARDS                  
WHERE first_name LIKE "s%";         -- will find any name starting with s
WHERE job LIKE "_ook";              -- jobs like cook

-- Ordering
SELECT * FROM employees
ORDER BY first_name                 -- will show data based on first_name in alphabetical order
ORDER BY first_name DESC            -- will show data based on first_name in reverse alphabetical order
ORDER BY first_name, trans_id       -- if there is a tie in first_name, they will be ordered by trans_id


-- Limit how much data is displayed 
SELECT * FROM transactions
LIMIT 1                             -- shows one row 
ORDER BY first_name DESC LIMIT 1    -- combination!
LIMIT 2,1;                          -- offset by 2, and print 1 row. This will not print 1 or 2, but 3.


-- UNION - combines two tables into one, renaming columns. This ONLY works if transactions and columns have the name number of columns
SELECT * FROM transactions
UNION                               -- UNION ALL to allow duplicates, UNION omits them 
SELECT * FROM workers               -- All the field names in workers will be renamed to transactions. New rows from workers will be added to transactions 
-- Just change SELECT same field to make both have the same number of columns

-- SELF-JOIN - you want to combine two elements of a specific table, for example, some customers refer other customers and you wanna show that
SELECT a.customer_id, a.first_name, a.last_name 
        CONCAT(b.first_name, " ", b.last_name) AS "referral"
FROM customers AS a                         -- a is our alias for another copy of the table  
INNER JOIN customers AS b                   -- b is our alias for another copy of the table        
ON a.referral_id = b.customer_id            -- this will join together a customer and their referral
