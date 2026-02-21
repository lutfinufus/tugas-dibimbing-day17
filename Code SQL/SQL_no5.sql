WITH ms AS (
    -- max score per hacker per challenge
    SELECT hacker_id,
           challenge_id,
           MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
)

SELECT h.hacker_id,
       h.name,
       SUM(ms.max_score) AS score
FROM ms
JOIN Hackers h
  ON ms.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(ms.max_score) > 0
ORDER BY score DESC,
         h.hacker_id ASC;