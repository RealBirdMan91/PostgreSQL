--SELECT *
--FROM sales
--WHERE date_fulfilled IS NOT NULL
--ORDER BY date_fulfilled DESC;

--SELECT *
--FROM sales
--WHERE date_fulfilled IS NOT NULL
--ORDER BY customer_name;

--SELECT *
--FROM sales
--WHERE date_fulfilled IS NOT NULL
--ORDER BY date_fulfilled DESC
--LIMIT 3;

SELECT *
FROM sales
WHERE date_fulfilled IS NOT NULL
ORDER BY id
LIMIT 5 OFFSET 3