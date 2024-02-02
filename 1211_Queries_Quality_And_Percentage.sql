SELECT 
    query_name,
    ROUND(AVG(CAST(rating AS DECIMAL) / position), 2) AS quality,
    ROUND(CAST(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS DECIMAL) / COUNT(rating) * 100, 2) AS poor_query_percentage
FROM queries
WHERE query_name IS NOT NULL
GROUP BY query_name; 
