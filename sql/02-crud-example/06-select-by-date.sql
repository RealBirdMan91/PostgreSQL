--SELECT customer_name, 
--    product_name, 
--    price - (price * 0.25) AS discounted_price,
--    date_created,
--    date_fulfilled
--FROM sales
--WHERE date_fulfilled BETWEEN date_created AND '2023-05-01';


SELECT customer_name, 
    product_name, 
    price - (price * 0.25) AS discounted_price,
    date_created,
    date_fulfilled
FROM sales
WHERE (date_fulfilled - date_created )<= 5