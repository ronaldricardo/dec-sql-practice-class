-- practice_advanced.sql
-- Latihan SQL lanjutan di fitness_trackers & trackers_detail (DEC SQL Practice)

-- 1. Case when untuk status baterai
SELECT brand_name, model_name, average_battery_life_days,
       CASE 
           WHEN average_battery_life_days >= 30 THEN 'tahan lama'
           WHEN average_battery_life_days >= 20 THEN 'daya sedang'
           WHEN average_battery_life_days >= 0 THEN 'daya kurang'
       END AS battere_status
FROM fitness_trackers;

-- 2. Inner join fitness_trackers dan trackers_detail
SELECT a.id, a.brand_name, a.color,
       b.id_model, b.sold
FROM fitness_trackers a
JOIN trackers_detail b
ON a.id = b.id_model;

-- 3. Tracker yang sold di atas rata‑rata
SELECT id_model, brand_name, color, sold
FROM (
    SELECT a.id_model,
           b.brand_name,
           b.color,
           a.sold
    FROM trackers_detail a
    JOIN fitness_trackers b
    ON a.id_model = b.id
) t
ORDER BY sold DESC
WHERE sold > (SELECT AVG(sold) FROM trackers_detail);

-- Alternatif tanpa subquery di FROM (lebih langsung)
SELECT b.id_model, b.brand_name, b.color, a.sold
FROM trackers_detail a
JOIN fitness_trackers b
ON a.id_model = b.id
WHERE a.sold > (SELECT AVG(sold) FROM trackers_detail)
ORDER BY a.sold DESC;

-- 4. Fitness tracker dengan harga asli di atas rata‑rata
SELECT brand_name, model_name, original_price
FROM fitness_trackers
WHERE original_price > (SELECT AVG(original_price) FROM fitness_trackers)
ORDER BY original_price ASC;

-- 5. Contoh CTE untuk join dan ranking
WITH cte_1 AS (
    SELECT a.id,
           a.brand_name,
           a.model_name,
           a.color,
           b.sold
    FROM fitness_trackers a
    JOIN trackers_detail b
    ON a.id = b.id_model
)
SELECT brand_name, model_name, sold
FROM cte_1
ORDER BY sold DESC;

-- 6. ROW_NUMBER() ranking per brand
SELECT brand_name, model_name, original_price,
       ROW_NUMBER() OVER (PARTITION BY brand_name ORDER BY original_price DESC) AS rank_price
FROM fitness_trackers;

-- 7. RANK() ranking per brand
SELECT brand_name, model_name, original_price,
       RANK() OVER (PARTITION BY brand_name ORDER BY original_price DESC) AS rank_price
FROM fitness_trackers;

-- 8. DENSE_RANK() ranking per brand
SELECT brand_name, model_name, original_price,
       DENSE_RANK() OVER (PARTITION BY brand_name ORDER BY original_price DESC) AS rank_price
FROM fitness_trackers;
