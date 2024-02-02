1SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(id) as trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) as approved_total_amount
FROM transactions
GROUP BY month, country;
