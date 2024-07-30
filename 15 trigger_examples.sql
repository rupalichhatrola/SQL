create database if not exists trigger1;
use trigger1;

 -- drop table trigger_ex;

create table if not exists trigger_ex(
`name` varchar(30),
mail_id varchar(30),
ph_no varchar(30),
address varchar(50),
users_sys varchar(30),
time_sys varchar(30),
salary decimal(10,2),
incentive decimal(10,2),
final_salary decimal(10,2)     
);

select * from trigger_ex;

drop trigger update_final_salary;

-- Then, create a trigger to calculate final_salary
DELIMITER //

CREATE TRIGGER calculate_final_salary
BEFORE INSERT ON trigger_ex
FOR EACH ROW
BEGIN
    SET NEW.final_salary = NEW.salary + NEW.incentive;
END; //
DELIMITER ;


INSERT INTO trigger_ex (`name`, mail_id, ph_no, address, users_sys, time_sys, salary, incentive)
VALUES ('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'sysuser1', '2024-07-22 12:00:00', 5000.00, 1000.00);


-- After insertion, final_salary will be automatically calculated based on salary + incentive
SELECT * FROM trigger_ex;


insert into trigger_ex(`name`,mail_id ,ph_no ,address,users_sys,time_sys,salary)
values('saurabh','saurabh@gmail.com','9722849872','Baroda','technical','8to5',30000);

insert into trigger_ex(`name`,mail_id ,ph_no ,address,users_sys,time_sys,salary,incentive)
values('saurabh','saurabh@gmail.com','9722849872','Baroda','technical','8to5',30000,5400),
('sanket','sanket@gmail.com','6678453215','Jamnagar','technical','8to5',35000,5600),
('shyam','shyam@gmail.com','6932587421','Rajkot','non-technical','9to6',20000,8000),
('sanket','sanket@gmail.com','1234567890','Ahmedabad','non-technical','9to6',32000,6000),
('shyam','shyam@gmail.com','6321586952','Anand','technical','8to5',40000,3000),
('ajay','ajay@gmail.com','9782564832','Junagadh','non-technical','9to6',25000,3500),
('ajay','ajay12@gmail.com','9998786545','Gandhinagar','technical','8to5',38000,4800),
('snehal','snehal@gmail.com','9987874512','Valsad','technical','8to5',29000,5640),
('manisha','manisha@gmail.com','9532701409','Bhavnagar','non-technical','9to6',18000,5550),
('rakesh','rakesh@gmail.com','9099194011','Surat','non-technical','9to6',22000,7000);

insert into trigger_ex values('saurabh','saurabh@gmail.com','9722849872','Baroda','technical','8to5',30000,5400,35400),
('sanket','sanket@gmail.com','6678453215','Jamnagar','technical','8to5',35000,5600,40600),
('shyam','shyam@gmail.com','6932587421','Rajkot','non-technical','9to6',20000,8000,28000),
('sanket','sanket@gmail.com','1234567890','Ahmedabad','non-technical','9to6',32000,6000,38000),
('shyam','shyam@gmail.com','6321586952','Anand','technical','8to5',40000,3000,43000),
('ajay','ajay@gmail.com','9782564832','Junagadh','non-technical','9to6',25000,3500,28500),
('ajay','ajay12@gmail.com','9998786545','Gandhinagar','technical','8to5',38000,4800,42800),
('snehal','snehal@gmail.com','9987874512','Valsad','technical','8to5',29000,5640,34640),
('manisha','manisha@gmail.com','9532701409','Bhavnagar','non-technical','9to6',18000,5550,23550),
('rakesh','rakesh@gmail.com','9099194011','Surat','non-technical','9to6',22000,7000,29000);

drop table trigger_ex;

select * from trigger_ex;
/*******************************************************************************************************************************/
/* 22/7/2024 */

-- CALCULATE SALARY + BONUS = FINAL_SALARY

-- SALARY > 20000 = 10% BONUS
-- SALARY < 20000 = 5% BONUS

CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    final_salary DECIMAL(10, 2)
);

DELIMITER //
CREATE TRIGGER update_final_salary
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    DECLARE bonus DECIMAL(10, 2);
    
    -- Determine bonus based on salary
    IF NEW.salary >= 20000 THEN
        SET bonus = NEW.salary * 0.1; -- 10% bonus for salary >= 20000
    ELSE
        SET bonus = NEW.salary * 0.05; -- 5% bonus for salary < 20000
    END IF;
    -- Calculate final salary
    SET NEW.final_salary = NEW.salary + bonus;
END; //
DELIMITER ;

SELECT * FROM EMPLOYEE;

INSERT INTO employee (name, salary) VALUES ('rupali chhatrola', 50000);

SELECT * FROM EMPLOYEE;


/*******************************************************************************************************************************/
-- CALCULATE FINAL SALARY OF EMPLOYEES
-- SALARY + INCENTIVE

create database tri_ex
use tri_ex;

-- First, create the table if it does not exist
CREATE TABLE IF NOT EXISTS trigger_ex (
    `name` varchar(30),
    mail_id varchar(30),
    ph_no varchar(30),
    address varchar(50),
    users_sys varchar(30),
    time_sys varchar(30),
    salary decimal(10,2),
    incentive decimal(10,2),
    final_salary decimal(10,2)
);

-- Then, create a trigger to calculate final_salary
DELIMITER //
CREATE TRIGGER calculate_final_salary
BEFORE INSERT ON trigger_ex
FOR EACH ROW
BEGIN
    SET NEW.final_salary = NEW.salary + NEW.incentive;
END;//
DELIMITER ;


-- Insert a row into trigger_ex
INSERT INTO trigger_ex (`name`, mail_id, ph_no, address, users_sys, time_sys, salary, incentive)
VALUES ('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'sysuser1', '2024-07-22 12:00:00', 5000.00, 1000.00);

INSERT INTO trigger_ex (`name`, mail_id, ph_no, address, users_sys, time_sys, salary, incentive)
VALUES ('rupali chhatrola', 'rupali@gmail.com', '5874569844', 'vadodara', 'user1', '2024-07-22', 96000.00, 1000.00);

INSERT INTO trigger_ex (`name`, mail_id, ph_no, address, users_sys, time_sys, salary, incentive)
VALUES ('ABC', 'abc@gmail.com', '2546584644', 'SURAT', 'USER2', '2024-07-23', 50000.00, 2000.00);


-- After insertion, final_salary will be automatically calculated based on salary + incentive
SELECT * FROM trigger_ex;

/***********************************************************************************************************************************/

-- LAST UPADATED RECORD SUMMERY

use tri_ex;

CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    last_updated TIMESTAMP
);

DELIMITER //
CREATE TRIGGER update_last_updated
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.last_updated = NOW();
END; //
DELIMITER ;

SELECT * FROM EMPLOYEES;

INSERT INTO EMPLOYEES(name, salary) VALUES('RUPALI',20000);
INSERT INTO EMPLOYEES(name, salary) VALUES('RUTIKA',25000);
INSERT INTO EMPLOYEES(name, salary) VALUES('SAKSHI',35000);

SELECT * FROM EMPLOYEES;

UPDATE employees SET salary = 40000 WHERE id = 3;

/*************************************************************************************************************************************/

-- Automatically Updating ORDERS Summary Table
use tri_ex;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    action VARCHAR(50),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_orders_change
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, action)
    VALUES (NEW.order_id, 'Inserted');
END//

CREATE TRIGGER after_orders_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, action)
    VALUES (NEW.order_id, 'Updated');
END//

CREATE TRIGGER after_orders_delete
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, action)
    VALUES (OLD.order_id, 'Deleted');
END//
DELIMITER ;

SELECT * FROM ORDERS;
SELECT * FROM ORDER_LOGS;

INSERT INTO orders (customer_id, order_date, total_amount) VALUES (1, '2024-07-23', 100.00);
-- This will trigger an insert into order_logs with action 'Inserted'.

UPDATE orders SET total_amount = 150.00 WHERE order_id = 1;
-- This will trigger an insert into order_logs with action 'Updated'.

DELETE FROM orders WHERE order_id = 1;
-- This will trigger an insert into order_logs with action 'Deleted'.

/***********************************************************************************************************************************/

-- Example 1: Automatically Updating Summary Table

use tri_ex;
-- Create the transactions table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2),
    transaction_date DATE
);

-- Create the transaction_summary table
CREATE TABLE transaction_summary (
    customer_id INT PRIMARY KEY,
    total_amount DECIMAL(10, 2)
);

-- Trigger to update transaction_summary on INSERT
DELIMITER //
CREATE TRIGGER after_insert_ transaction
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE current_total DECIMAL(10, 2);
    
    -- Retrieve the current total amount for the customer
    SELECT total_amount INTO current_total
    FROM transaction_summary
    WHERE customer_id = NEW.customer_id;
    
    -- Update or insert into transaction_summary
    IF current_total IS NULL THEN
        INSERT INTO transaction_summary (customer_id, total_amount)
        VALUES (NEW.customer_id, NEW.amount);
    ELSE
        UPDATE transaction_summary
        SET total_amount = current_total + NEW.amount
        WHERE customer_id = NEW.customer_id;
    END IF;
END//
DELIMITER ;

-- Trigger to update transaction_summary on UPDATE
DELIMITER //
CREATE TRIGGER after_update_transaction
AFTER UPDATE ON transactions
FOR EACH ROW
BEGIN
    DECLARE current_total DECIMAL(10, 2);
    
    -- Retrieve the current total amount for the customer
    SELECT total_amount INTO current_total
    FROM transaction_summary
    WHERE customer_id = NEW.customer_id;
    
    -- Update transaction_summary
    UPDATE transaction_summary
    SET total_amount = current_total - OLD.amount + NEW.amount
    WHERE customer_id = NEW.customer_id;
END//
DELIMITER ;

-- Trigger to update transaction_summary on DELETE
DELIMITER //
CREATE TRIGGER after_delete_transaction
AFTER DELETE ON transactions
FOR EACH ROW
BEGIN
    DECLARE current_total DECIMAL(10, 2);
    
    -- Retrieve the current total amount for the customer
    SELECT total_amount INTO current_total
    FROM transaction_summary
    WHERE customer_id = OLD.customer_id;
    
    -- Update transaction_summary
    UPDATE transaction_summary
    SET total_amount = current_total - OLD.amount
    WHERE customer_id = OLD.customer_id;
END//
DELIMITER ;

SELECT * FROM TRANSACTIONS;
SELECT * FROM transaction_summary;

-- Test the triggers
INSERT INTO transactions (customer_id, amount, transaction_date) VALUES (2, 200.00, '2024-07-22');
-- This will update transaction_summary for customer_id = 2.

UPDATE transactions SET amount = 200.00 WHERE transaction_id = 2;
-- This will update transaction_summary for customer_id = 2.

DELETE FROM transactions WHERE transaction_id = 2;
-- This will update transaction_summary for customer_id = 2.

/*************************************************************************************************************************************/

-- Example 2: Enforcing Business Rules
use tri_ex;

CREATE TABLE employees1 (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Trigger to enforce salary update rule
DELIMITER //
CREATE TRIGGER before_update_salary
BEFORE UPDATE ON employees1
FOR EACH ROW
BEGIN
    IF NEW.salary < OLD.salary THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot decrease salary for employee.';
    END IF;
END//
DELIMITER ;

SELECT * FROM EMPLOYEES1;

-- Test the trigger
INSERT INTO employees1 (employee_name, department, salary) VALUES ('RUPALI', 'IT', 50000.00);

UPDATE employees1 SET salary = 45000.00 WHERE employee_id = 1;
-- This will fail due to the trigger enforcing the rule.

UPDATE employees1 SET salary = 55000.00 WHERE employee_id = 1;
-- This will succeed.

/*******************************************************************************************************************************/

-- Example 3: Auditing Changes

use tri_ex;
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action VARCHAR(50),
    audit_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT
);

-- Trigger to audit changes in employees table
DELIMITER //
CREATE TRIGGER after_update_employee
AFTER UPDATE ON employees1
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, action, user_id)
    VALUES (NEW.employee_id, 'Updated', @current_user_id);
END//
DELIMITER ;

SELECT * FROM EMPLOYEES1;
SELECT * FROM employee_audit;

-- Set the current user id before updating employees table
SET @current_user_id = 1;

-- Test the trigger
UPDATE employees1 SET salary = 60000.00 WHERE employee_id = 1;
-- This will insert a record into employee_audit table indicating the update.

/***********************************************************************************************/

-- Example 4: Preventing Deletion of Important Records

use tri_ex;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    admin_flag TINYINT
);

-- Trigger to prevent deletion of admin users
DELIMITER //
CREATE TRIGGER before_delete_user
BEFORE DELETE ON users
FOR EACH ROW
BEGIN
    IF OLD.admin_flag = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete admin user.';
    END IF;
END//
DELIMITER ;

SELECT * FROM USERS;

-- Test the trigger
INSERT INTO users (username, admin_flag) VALUES ('rupali', 0);
INSERT INTO users (username, admin_flag) VALUES ('manya', 1);

SELECT * FROM USERS;

DELETE FROM users WHERE user_id = 1;
-- This will succeed.

DELETE FROM users WHERE user_id = 2;
-- This will fail due to the trigger preventing deletion of admin user.

/**************************************************************************************************/


-- Example 5: Automatic Timestamps

use tri_ex;
CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(100),
    task_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Trigger to update updated_at timestamp on UPDATE
DELIMITER //
CREATE TRIGGER before_update_task
BEFORE UPDATE ON tasks
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//
DELIMITER ;

SELECT * FROM TASKS;

-- Test the trigger
INSERT INTO tasks (task_name, task_description) 
VALUES ('Task 1', 'Description for Task 1');

-- Wait a moment to let the created_at and updated_at timestamps settle.

SELECT * FROM TASKS;

UPDATE tasks SET task_description = 'Updated description' WHERE task_id = 1;
-- This will update the updated_at timestamp to the current time.
SELECT * FROM TASKS;

/***********************************************************************************************/

-- Example 6: Generating Unique IDs

use tri_ex;
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_code VARCHAR(20)
);

-- Trigger to generate unique product_code
DELIMITER //
CREATE TRIGGER before_insert_product
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    DECLARE next_id INT;
        -- Find the next available product_code based on the 
        -- highest current value
    SELECT COALESCE(MAX(RIGHT(product_code, 4)), 0) + 1 INTO next_id
    FROM products;
    
    SET NEW.product_code = CONCAT('PRD-', LPAD(next_id, 4, '0'));
END//
DELIMITER ;

SELECT * FROM  PRODUCTS;

-- Test the trigger
INSERT INTO products (product_name) VALUES ('Product A');
-- This will automatically generate a product_code like 'PRD-0001'.

SELECT * FROM  PRODUCTS;

INSERT INTO products (product_name) VALUES ('Product B');
INSERT INTO products (product_name) VALUES ('Product C');
INSERT INTO products (product_name) VALUES ('Product D');
INSERT INTO products (product_name) VALUES ('Product E');

/*********************************************************************************************/

-- Example 7: Implementing Soft Deletes with History

use tri_ex;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    deleted_at TIMESTAMP NULL
);

CREATE TABLE customer_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    action VARCHAR(50),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger to soft delete and log deletion in customer_history
DELIMITER //
CREATE TRIGGER before_delete_customer
BEFORE DELETE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customer_history (customer_id, action)
    VALUES (OLD.customer_id, 'Deleted');
    
    UPDATE customers
    SET deleted_at = CURRENT_TIMESTAMP
    WHERE customer_id = OLD.customer_id;
    
    -- Cancel the actual delete operation
    SET NEW.customer_id = NULL;
END//
DELIMITER ;

-- Test the trigger
INSERT INTO customers (customer_name) VALUES ('rupali');
INSERT INTO customers (customer_name) VALUES ('manya');

DELETE FROM customers WHERE customer_id = 1;
-- This will soft delete the customer and log the deletion in customer_history.

SELECT * FROM customers;
-- The customer with customer_id = 1 will not be shown due to soft deletion.

SELECT * FROM customer_history;
-- This will show a record indicating that customer with customer_id = 1 was deleted.

/*******************************************************************************************/

-- Example 8: Enforcing Referential Integrity

use tri_ex;
CREATE TABLE orders1 (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2)
);

-- Trigger to update total_amount in orders table on order_items change
DELIMITER //
CREATE TRIGGER after_insert_order_item
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_amount = (SELECT SUM(quantity * price) FROM 
    order_items WHERE order_id = NEW.order_id)
    WHERE order_id = NEW.order_id;
END//
DELIMITER ;

-- Test the trigger
INSERT INTO orders1 (order_date) VALUES ('2024-07-25');
SELECT * FROM ORDERS1;
SELECT * FROM ORDER_ITEMS;

SET @order_id := LAST_INSERT_ID();

INSERT INTO order_items (order_id, item_name, quantity, price) 
VALUES (@order_id, 'Item A', 2, 10.00);
INSERT INTO order_items (order_id, item_name, quantity, price) 
VALUES (@order_id, 'Item B', 1, 20.00);
-- This will automatically update the total_amount in orders table after each insertion in order_items.

SELECT * FROM orders1 WHERE order_id = @order_id;
-- The total_amount will reflect the sum of prices multiplied by quantities of items in order_items.

/***********************************************************************************************/

-- Example 9: Validating Inserted Data

use tri_ex;
CREATE TABLE products1 (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Trigger to validate price before inserting into products
DELIMITER //
CREATE TRIGGER before_insert_product1
BEFORE INSERT ON products1
FOR EACH ROW
BEGIN
    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price must be greater than zero.';
    END IF;
END//
DELIMITER ;

/*SIGNAL SQLSTATE '45000': 
	This is used to raise a custom error when the condition (NEW.price <= 0) 
    is met. SQLSTATE '45000' represents a generic SQL state code for 
    an unhandled user-defined exception.*/

SELECT * FROM PRODUCTS1;

-- Test the trigger
INSERT INTO products1 (product_name, price) VALUES ('Product A', 50.00);
-- This will succeed.

INSERT INTO products1 (product_name, price) VALUES ('Product B', 0.00);
-- This will fail due to the trigger validating that price must be greater than zero.





