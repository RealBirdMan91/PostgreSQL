SELECT customer_name, 
    product_name, 
    price - (price * 0.25) AS discounted_price
FROM sales
WHERE (price > 100) AND (is_disputed IS FALSE) ;

