WITH cm AS (
    -- challenge max_score
    SELECT c.challenge_id,
           d.score AS max_score
    FROM Challenges c
    JOIN Difficulty d
      ON c.difficulty_level = d.difficulty_level
),

fs AS (
    -- hitung full score per hacker
    SELECT s.hacker_id,
           COUNT(*) AS cnt
    FROM Submissions s
    JOIN cm
      ON s.challenge_id = cm.challenge_id
    WHERE s.score = cm.max_score
    GROUP BY s.hacker_id
    HAVING COUNT(*) > 1
)

SELECT fs.hacker_id,
       h.name
FROM fs
JOIN Hackers h
  ON fs.hacker_id = h.hacker_id
ORDER BY fs.cnt DESC,
         fs.hacker_id ASC;