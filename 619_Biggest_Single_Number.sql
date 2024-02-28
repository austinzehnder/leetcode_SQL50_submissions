WITH NumberCounts AS (
    SELECT num, COUNT(*) AS count
    FROM MyNumbers
    GROUP BY num
)
SELECT MAX(num) AS num
FROM NumberCounts
WHERE count = 1;
