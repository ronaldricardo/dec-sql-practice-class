-- week2-bigquery/bqsimple_query.sql
-- Versi simple dari query BigQuery (DEC SQL Practice)

-- 1. Select 100 baris pertama
SELECT *
FROM `latihan-dec.supermarket.supermarket`
LIMIT 100;

-- 2. Distinct Customer type
SELECT DISTINCT `Customer type`
FROM `latihan-dec.supermarket.supermarket`;

-- 3. Group by City: total sales
SELECT City,
       AVG(Quantity) AS avg_qty,
       SUM(Total) AS total_sales
FROM `latihan-dec.supermarket.supermarket`
GROUP BY City
ORDER BY total_sales DESC;

-- 4. Group by City dan Customer type
SELECT City,
       `Customer type`,
       COUNT(*) AS transaction_count,
       SUM(Total) AS total_sales
FROM `latihan-dec.supermarket.supermarket`
GROUP BY City, `Customer type`;

-- 5. Group by Product line
SELECT `Product line`,
       SUM(Total) AS total_sales
FROM `latihan-dec.supermarket.supermarket`
GROUP BY `Product line`
ORDER BY total_sales DESC;

-- 6. Case rating + total sales
SELECT City,
       `Customer type`,
       Gender,
       Rating,
       CASE
           WHEN Rating BETWEEN 8 AND 10 THEN 'High Product Rate'
           WHEN Rating BETWEEN 5 AND 7 THEN 'Good Product Rate'
           WHEN Rating BETWEEN 2 AND 4 THEN 'Low Product Rate'
           ELSE 'Poor Product Rate'
       END AS `Product Rate`,
       SUM(Total) AS total_sales
FROM `latihan-dec.supermarket.supermarket`
GROUP BY City, `Customer type`, Gender, Rating;
