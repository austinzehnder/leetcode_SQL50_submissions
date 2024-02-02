WITH cte AS (
  SELECT s.user_id, 
         COUNT(c.action) FILTER (WHERE c.action = 'confirmed') AS confirm_count,
         COUNT(c.action) AS total_count
  FROM Signups s
  LEFT JOIN Confirmations c
  ON s.user_id = c.user_id
  GROUP BY s.user_id
)
SELECT 
  user_id,
  CASE 
    WHEN total_count = 0 THEN 0
    ELSE ROUND(confirm_count::numeric / total_count, 2) 
  END AS confirmation_rate
FROM cte;
