WITH w AS (
    SELECT 
        w.id,
        p.age,
        w.coins_needed,
        w.power,
        MIN(w.coins_needed) OVER (PARTITION BY p.age, w.power) AS min_coins
    FROM Wands w
    JOIN Wands_Property p
        ON w.code = p.code
    WHERE p.is_evil = 0
)

SELECT id, age, coins_needed, power
FROM w
WHERE coins_needed = min_coins
ORDER BY power DESC, age DESC;