/* 
Soal 1.
*/

-- Mapping strudent ke grade
With nilai as (SELECT s.name, s.Marks, g.Grade
from Students as s
JOIN Grades as g 
ON s.Marks BETWEEN g.Min_Mark AND Max_Mark)

-- Select final jawaban (menggunakan case dan urutkan)
-- Ketty tidak ingin siswa menerima grade < 8

SELECT 
CASE WHEN Grade < 8 THEN NULL
ELSE Name
END AS Name,
Grade,
Marks
FROM nilai
ORDER BY 
Grade DESC,
Name ASC,
Marks ASC;
