SELECT 
    p.product_id,
    COALESCE(latest.new_price, 10) AS price
FROM
    (SELECT DISTINCT product_id FROM Products) p
    LEFT JOIN
    (
        SELECT 
            product_id,
            new_price,
            ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
        FROM Products
        WHERE change_date <= '2019-08-16'
    ) latest
    ON p.product_id = latest.product_id AND latest.rn = 1
ORDER BY
    p.product_id;
