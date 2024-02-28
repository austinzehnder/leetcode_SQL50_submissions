WITH DateRange AS (
    SELECT
        DISTINCT activity_date
    FROM
        Activity
    WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
), ActiveUsers AS (
    SELECT
        DISTINCT user_id,
        activity_date
    FROM
        Activity
)

SELECT 
    dr.activity_date AS day,
    COUNT(au.user_id) AS active_users
FROM
    DateRange dr
LEFT JOIN
    ActiveUsers au ON dr.activity_date = au.activity_date
GROUP BY
    dr.activity_date
HAVING 
    active_users > 0
ORDER BY
    dr.activity_date;
