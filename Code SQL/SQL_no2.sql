/* Soal 2 */
-- Menghimpun nilai agg
with peta as (SELECT 
min(LAT_N) AS min_latn, 
MIN(LONG_W)AS min_longw,
MAX(LAT_N)AS max_latn,
MAX(LONG_W) AS max_longw
FROM station)


-- Final hasil
SELECT 
CAST(
    ABS(max_latn - min_latn) +
    ABS(max_longw - min_longw)
AS DECIMAL(10,4))
FROM peta