SELECT product_id,
       MIN(year) AS first_year,
       quantity,
       price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) AS min_year
    FROM Sales
    GROUP BY product_id
)
GROUP BY product_id, quantity, price;
