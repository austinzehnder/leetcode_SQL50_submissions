-- Postgresql code
-- CTE
WITH first_login AS (
  SELECT player_id, MIN(event_date) AS first_login_date
  FROM activity
  GROUP BY player_id
)

SELECT 
  ROUND(COUNT(DISTINCT activity.player_id)::numeric/COUNT(DISTINCT first_login.player_id), 2) AS fraction
FROM first_login
LEFT JOIN activity ON 
  first_login.player_id = Activity.player_id
  AND event_date = first_login_date + INTERVAL '1 day'
