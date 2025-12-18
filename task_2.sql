-- task_2.sql
-- Task 2: Create Magical Tables

-- Select the database to ensure tables are created in the correct location
USE alx_book_store;

-- 1. Create the Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    -- Define Foreign Key constraint
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. Create the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE, -- Email should typically be unique
    address TEXT
);

-- 4. Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    -- Define Foreign Key constraint
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    -- Define Foreign Key constraints
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);