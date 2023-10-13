-- where are our top 10 customers from?

-- unique customer sales
WITH customer_sales as
(
	SELECT
		DISTINCT(customer_id),
		date_key,
		store_id,
		sales
	FROM
		fact_sales
)

SELECT
	cs.customer_id,
	dc.customer_name,
	dc.country,
	dc.city,
	SUM(cs.sales) as sales
FROM
	customer_sales as cs
INNER JOIN
	dim_customer as dc ON dc.customer_id = cs.customer_id
GROUP BY
	1, 2, 3, 4
ORDER BY
	SUM(cs.sales) DESC
LIMIT
	10
;