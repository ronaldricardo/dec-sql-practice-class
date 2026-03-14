-- week3-sqlserver/practice_advanced.sql
-- Latihan SQL lanjutan di SQL Server: supermarket + view_market1 (adaptasi BigQuery)

-- 1. CREATE VIEW untuk Credit Card transactions
CREATE OR ALTER VIEW dbo.view_market1 AS
    SELECT *
    FROM supermarket.dbo.supermarket_table
    WHERE Payment = 'Credit Card';

-- 2. Test view
SELECT * FROM dbo.view_market1;

-- 3. Analisa Customer_type = 'Normal' dengan Total >= AVG(Total)
SELECT
    City,
    Customer_type,
    Gender,
    Quantity,
    SUM(Total) AS Total_Sales,
    Product_line,
    CASE
        WHEN Rating BETWEEN 8 AND 10 THEN 'High Product Rate'
        WHEN Rating BETWEEN 5 AND 7  THEN 'Good Product Rate'
        WHEN Rating BETWEEN 2 AND 4  THEN 'Low Product Rate'
        ELSE 'Poor Product Rate'
    END AS Product_Rate,
    ROW_NUMBER() OVER (
        PARTITION BY City
        ORDER BY AVG(Total)
    ) AS Average_Total_per_City
FROM supermarket.dbo.supermarket_table
WHERE
    Customer_type = 'Normal'
    AND Total >= (
        SELECT AVG(Total)
        FROM supermarket.dbo.supermarket_table
    )
GROUP BY
    City,
    Customer_type,
    Gender,
    Quantity,
    Product_line,
    Rating
HAVING
    Quantity > 3
ORDER BY
    Total_Sales DESC;

-- 4. CTE: analisa_satu + agregasi ulang per City (adaptasi BigQuery)
WITH analisa_satu AS (
    SELECT
        City,
        Customer_type,
        Gender,
        Quantity,
        Total,
        Product_line,
        CASE
            WHEN Rating BETWEEN 8 AND 10 THEN 'High Product Rate'
            WHEN Rating BETWEEN 5 AND 7  THEN 'Good Product Rate'
            WHEN Rating BETWEEN 2 AND 4  THEN 'Low Product Rate'
            ELSE 'Poor Product Rate'
        END AS Product_Rate,
        ROW_NUMBER() OVER (
            PARTITION BY City
            ORDER BY AVG(Total)
        ) AS Average_Total_per_City
    FROM supermarket.dbo.supermarket_table
    WHERE
        Customer_type = 'Normal'
        AND Total >= (
            SELECT AVG(Total)
            FROM supermarket.dbo.supermarket_table
        )
    GROUP BY
        City,
        Customer_type,
        Gender,
        Quantity,
        Total,
        Product_line,
        Rating
    HAVING
        Quantity > 3
)
SELECT
    City,
    SUM(Total) AS total_sales
FROM analisa_satu
GROUP BY City;

-- 5. Analisa Customer_type = 'Member', Total >= AVG(Total)
SELECT
    City,
    AVG(Quantity) AS avg_qty,
    SUM(Total) AS Total_Sales
FROM supermarket.dbo.supermarket_table
WHERE
    Customer_type = 'Member'
    AND Total >= (
        SELECT AVG(Total)
        FROM supermarket.dbo.supermarket_table
    )
GROUP BY City
HAVING
    AVG(Quantity) > 3
ORDER BY
    City ASC;

-- 6. CTE: total sales per kota (Member) - adaptasi BigQuery
WITH Product_Total_Sales_each_City AS (
    SELECT
        City,
        AVG(Quantity) AS avg_qty,
        SUM(Total) AS Total_Sales
    FROM supermarket.dbo.supermarket_table
    WHERE
        Customer_type = 'Member'
        AND Total >= (
            SELECT AVG(Total)
            FROM supermarket.dbo.supermarket_table
        )
    GROUP BY City
    HAVING
        AVG(Quantity) > 3
)
SELECT
    City,
    Total_Sales
FROM Product_Total_Sales_each_City
ORDER BY City ASC;
