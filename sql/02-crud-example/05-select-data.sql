--SELECT customer_name, 
--    product_name, 
--    price - (price * 0.25) AS discounted_price
--FROM sales
--WHERE (price > 100) AND (is_canceled IS TRUE);


SELECT *
FROM sales
WHERE 
    customer_name LIKE 'Bernd%' AND
    customer_email <>  'bernd@web.de'

