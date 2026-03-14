-- week2-bigquery/bqadvance_query.sql
-- Latihan SQL advance di BigQuery: tabel supermarket (latihan-dec.supermarket.supermarket)

-- 1. Select 100 baris pertama
SELECT *
FROM `latihan-dec.supermarket.supermarket`
LIMIT 100;

-- 2. Distinct `Customer type`
SELECT DISTINCT `Customer type`
FROM `latihan-dec.supermarket.supermarket`;


-- 3. Analisa Customer type = "Normal" dengan Total >= AVG(Total)
SELECT
    City,
    `Customer type`,
    Gender,
    Quantity,
    SUM(Total) AS Total_Sales,
    `Product line`,
    CASE
        WHEN Rating BETWEEN 8 AND 10 THEN 'High Product Rate'
        WHEN Rating BETWEEN 5 AND 7  THEN 'Good Product Rate'
        WHEN Rating BETWEEN 2 AND 4  THEN 'Low Product Rate'
        ELSE 'Poor Product Rate'
    END AS `Product Rate`,
    ROW_NUMBER() OVER (
        PARTITION BY City
        ORDER BY AVG(Total)
    ) AS `Average Total per City`
FROM `latihan-dec.supermarket.supermarket`
WHERE
    `Customer type` = 'Normal'
    AND Total >= (
        SELECT AVG(Total)
        FROM `latihan-dec.supermarket.supermarket`
    )
GROUP BY
    City,
    `Customer type`,
    Gender,
    Quantity,
    Total,
    `Product line`
HAVING
    Quantity > 3
ORDER BY
    Total DESC
LIMIT 20;


-- 4. CTE: analisa_satu + agregasi ulang per City
WITH analisa_satu AS (
    SELECT
        City,
        `Customer type`,
        Gender,
        Quantity,
        Total,
        `Product line`,
        CASE
            WHEN Rating BETWEEN 8 AND 10 THEN 'High Product Rate'
            WHEN Rating BETWEEN 5 AND 7  THEN 'Good Product Rate'
            WHEN Rating BETWEEN 2 AND 4  THEN 'Low Product Rate'
            ELSE 'Poor Product Rate'
        END AS `Product Rate`,
        ROW_NUMBER() OVER (
            PARTITION BY City
            ORDER BY AVG(Total)
        ) AS `Average Total per City`
    FROM `latihan-dec.supermarket.supermarket`
    WHERE
        `Customer type` = 'Normal'
        AND Total >= (
            SELECT AVG(Total)
            FROM `latihan-dec.supermarket.supermarket`
        )
    GROUP BY
        City,
        `Customer type`,
        Gender,
        Quantity,
        Total,
        `Product line`
    HAVING
        Quantity > 3
    ORDER BY
        Total DESC
    LIMIT 20
)
SELECT
    City,
    SUM(Total) AS total_sales
FROM analisa_satu
GROUP BY City;


-- 5. Analisa Customer type = "Member", Total >= AVG(Total)
SELECT
    City,
    AVG(Quantity)   AS avg_qty,
    SUM(Total)      AS `Total Sales`
FROM `latihan-dec.supermarket.supermarket`
WHERE
    `Customer type` = 'Member'
    AND Total >= (
        SELECT AVG(Total)
        FROM `latihan-dec.supermarket.supermarket`
    )
GROUP BY City
HAVING
    AVG(Quantity) > 3
ORDER BY
    City ASC
LIMIT 20;


-- 6. CTE: total sales per kota (Member)
WITH `Product Total Sales each City` AS (
    SELECT
        City,
        AVG(Quantity)   AS avg_qty,
        SUM(Total)      AS `Total Sales`
    FROM `latihan-dec.supermarket.supermarket`
    WHERE
        `Customer type` = 'Member'
        AND Total >= (
            SELECT AVG(Total)
            FROM `latihan-dec.supermarket.supermarket`
        )
    GROUP BY City
    HAVING
        AVG(Quantity) > 3
    ORDER BY
        City ASC
    LIMIT 20
)
SELECT
    City,
    `Total Sales`
FROM `Product Total Sales each City`;
