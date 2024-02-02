-- Uses a common table expression first_orders
WITH first_orders AS (
  SELECT customer_id, MIN(order_date) AS first_order_date
  FROM Delivery
  GROUP BY customer_id
)
SELECT ROUND(100.0 * 
  (SELECT COUNT(*) FROM first_orders f
  JOIN Delivery d ON f.customer_id = d.customer_id AND f.first_order_date = d.order_date
                 WHERE d.customer_pref_delivery_date = d.order_date) /
  (SELECT COUNT(*) FROM first_orders), 2) AS immediate_percentage;
