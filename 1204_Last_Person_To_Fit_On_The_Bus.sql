SELECT person_name
FROM (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight,
        turn
    FROM Queue
) AS cum_sum
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
