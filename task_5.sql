-- task_5.sql
-- Task 5: Populating Your Database with Your Very First Data

-- Ensure we are using the correct database
USE alx_book_store;

-- Insert the single customer record
INSERT INTO Customers (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');