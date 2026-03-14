-- week3-sqlserver/practice_basic.sql
-- Latihan SQL dasar di SQL Server: database supermarket (DEC SQL Practice)

-- 1. Select dari tabel utama
SELECT *
FROM supermarket.dbo.supermarket_table;

-- 2. Select 100 baris pertama
SELECT TOP 100 *
FROM supermarket.dbo.supermarket_table;

-- 3. Distinct Customer_type
SELECT DISTINCT Customer_type
FROM supermarket.dbo.supermarket_table;

-- 4. Group by City: total sales
SELECT City,
       AVG(Quantity) AS avg_qty,
       SUM(Total) AS total_sales
FROM supermarket.dbo.supermarket_table
GROUP BY City
ORDER BY total_sales DESC;

-- 5. Group by City dan Customer_type
SELECT City,
       Customer_type,
       COUNT(*) AS transaction_count,
       SUM(Total) AS total_sales
FROM supermarket.dbo.supermarket_table
GROUP BY City, Customer_type;

-- 6. Group by Product_line
SELECT Product_line,
       SUM(Total) AS total_sales
FROM supermarket.dbo.supermarket_table
GROUP BY Product_line
ORDER BY total_sales DESC;
