-- practice_basic.sql
-- Latihan SELECT dasar di Fitness_trackers (DEC SQL Practice)

-- 1. Select semua dari tabel Fitness_trackers
SELECT * FROM "Fitness_trackers" ft;

-- 2. Select id, brand_name, color, selling_price dari Fitness_trackers
SELECT id, brand_name, color, selling_price FROM "Fitness_trackers" ft;

-- 3. Fitness_trackers dengan rating < 4
SELECT * FROM "Fitness_trackers" ft
WHERE rating < 4;

-- 4. Fitness_trackers dengan warna 'Red'
SELECT * FROM "Fitness_trackers" ft
WHERE color = 'Red';

-- 5. Brand dengan rating < 4 dan color = 'Red'
SELECT id, brand_name, model_name, color, rating FROM "Fitness_trackers" ft
WHERE rating < 4 AND color = 'Red';

-- 6. Brand dengan rating > 3 OR warna = 'Red'
SELECT id, brand_name, model_name, color, rating FROM "Fitness_trackers" ft
WHERE rating > 3 OR color = 'Red';

-- 7. Fitness_trackers dengan id > 1 dan id < 20
SELECT * FROM "Fitness_trackers" ft
WHERE id > 1 AND id < 20;

-- 8. Brand dengan color = 'Red', 'Pink', 'Blue'
SELECT brand_name, model_name, color FROM "Fitness_trackers" ft
WHERE color IN ('Red', 'Pink', 'Blue');

-- 9. Brand_name yang berakhir dengan 'IN'
SELECT * FROM "Fitness_trackers" ft
WHERE brand_name LIKE '%IN';

-- 10. Brand_name yang mengandung 'S'
SELECT * FROM "Fitness_trackers" ft
WHERE brand_name LIKE '%S%';

-- 11. Rata‑rata selling_price per brand dan model (SAMSUNG > 30.000)
SELECT brand_name, model_name, AVG(selling_price) AS avg_sp
FROM "Fitness_trackers" ft
WHERE brand_name = 'SAMSUNG'
GROUP BY brand_name, model_name
HAVING AVG(selling_price) > 30000
ORDER BY avg_sp DESC;

-- 12. Hitung total baris di Fitness_trackers
SELECT COUNT(*) FROM "Fitness_trackers" ft;

-- 13. Daftar brand_name unik
SELECT DISTINCT brand_name FROM "Fitness_trackers" ft;

-- 14. Hitung jumlah brand_name unik
SELECT COUNT(DISTINCT brand_name) FROM "Fitness_trackers" ft;
