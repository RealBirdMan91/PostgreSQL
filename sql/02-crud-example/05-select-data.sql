--SELECT customer_name, 
--    product_name, 
--    price - (price * 0.25) AS discounted_price
--FROM sales
--WHERE (price > 100) AND (is_canceled IS TRUE);

SELECT *
FROM sales
WHERE product_name LIKE '%Book';
