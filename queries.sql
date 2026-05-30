-- ==========================================
-- Online Bookstore SQL Project
-- Author: Navneet Pratap
-- ==========================================

-- Query 1: Retrieve all books in the "Fiction" genre
SELECT *
FROM books
WHERE "Genre" = 'Fiction';

-- Query 2: Find books published after the year 1950
SELECT * FROM books
WHERE "Published_Year">1950

-- Query 3: List all customers from Canada
SELECT * FROM customers
WHERE "Country"= 'Canada'

-- Query 4: Show orders placed in November
SELECT * FROM orders
WHERE "Order_Date" BETWEEN '2023-11-01' AND '2023-11-30'

-- Query 5: Retrieve the total stock of books available

-- SUM() adds all values in the Stock column
SELECT SUM("Stock") AS total_stock
FROM books;

-- COUNT() counts the number of non-NULL rows
SELECT COUNT("Stock")
FROM books;

-- Query 6: Find the most expensive book
-- ORDER BY DESC sorts from highest to lowest
-- LIMIT 1 returns only the first row
SELECT *
FROM books
ORDER BY "Price" DESC
LIMIT 1;

-- Query 7: Find customers who ordered more than 1 quantity of a book
-- JOIN combines data from multiple tables
-- WHERE filters records based on a condition

SELECT customers."Name",
       books."Title",
       orders."Quantity"
FROM orders
JOIN customers
ON orders."Customer_ID" = customers."Customer_ID"
JOIN books
ON orders."Book_ID" = books."Book_ID";

--OTHER WAY TO WRITE
SELECT c."Name",
       b."Title",
       o."Quantity"
FROM orders o
JOIN customers c
ON o."Customer_ID" = c."Customer_ID"
JOIN books b
ON o."Book_ID" = b."Book_ID"
WHERE o."Quantity" > 1;

-- Query 9: List all unique genres available in the books table
-- DISTINCT removes duplicate values

SELECT DISTINCT "Genre"
FROM books;
-- Query 11: Calculate the total revenue generated from all orders
-- SUM() adds all values in the Total_Amount column

SELECT SUM("Total_Amount") AS total_revenue
FROM orders;
