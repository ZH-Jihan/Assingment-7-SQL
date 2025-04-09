-- Active: 1744138351250@@127.0.0.1@5432@book_store

-- Establish new database
CREATE DATABASE book_store;

-- Define 'books' table structure
CREATE TABLE books (
    id serial PRIMARY KEY,
    title varchar(100) NOT NULL,
    author varchar(100) NOT NULL,
    price numeric(10,2) NOT NULL CHECK (price >= 0),
    stock integer NOT NULL CHECK (stock >= 0),
    published_year integer NOT NULL CHECK (
        published_year BETWEEN 1000 AND 
        EXTRACT(YEAR FROM current_date)
));

-- Define 'readers' table (equivalent to customers)
CREATE TABLE readers (
    user_id serial PRIMARY KEY,
    full_name varchar(100) NOT NULL,
    contact_email varchar(100) UNIQUE NOT NULL,
    membership_date date NOT NULL DEFAULT CURRENT_DATE
);

-- Define 'transactions' table (equivalent to orders)
CREATE TABLE transactions (
    order_id serial PRIMARY KEY,
    user_id integer REFERENCES readers(user_id) ON DELETE CASCADE,
    book_number integer REFERENCES books(id) ON DELETE CASCADE,
    items_ordered integer NOT NULL CHECK (items_ordered > 0),
    purchase_time timestamp NOT NULL DEFAULT NOW()
);

-- Populate book inventory
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

-- Add customer records
INSERT INTO readers (full_name, contact_email, membership_date) VALUES
('Alice', 'alice@email.com', '2023-01-10'),
('Bob', 'bob@email.com', '2022-05-15'),
('Charlie', 'charlie@email.com', '2023-06-20');

-- Record book purchases
INSERT INTO transactions (user_id, book_number, items_ordered, purchase_time) VALUES
(1, 2, 1, '2024-03-10 00:00:00'),
(2, 1, 1, '2024-02-20 00:00:00'),
(1, 3, 2, '2024-03-05 00:00:00');

SELECT * from books

-- 1.Get unavailable books
SELECT title FROM books WHERE stock < 1;

-- 2.Find premium priced books
SELECT id, title, price FROM books ORDER BY price DESC FETCH FIRST ROW ONLY;

-- 3.Show customer purchase counts
SELECT r.full_name, COUNT(t.order_id) AS purchase_count 
FROM readers r
INNER JOIN transactions t ON r.user_id = t.user_id 
GROUP BY r.full_name;

-- 4.Calculate total sales
SELECT SUM(b.price * t.items_ordered) AS earnings
FROM transactions t
JOIN books b ON t.book_number = b.id;

-- 5.Identify frequent buyers
SELECT r.full_name, COUNT(*) AS purchases
FROM readers r
JOIN transactions t ON r.user_id = t.user_id
GROUP BY r.full_name HAVING COUNT(*) > 1;

-- 6.Compute average book value
SELECT ROUND(AVG(price), 2) AS average_price FROM books;

-- 7.Adjust prices for classic editions
UPDATE books SET price = price * 1.1 
WHERE published_year < 2000;

-- 8.Remove inactive accounts
DELETE FROM readers 
WHERE NOT EXISTS (
    SELECT 1 FROM transactions 
    WHERE transactions.user_id = readers.user_id
);