SELECT
	s.store_id,
	a.country,
	a.city,
	a.address,
	SUM(f.sales) as sales
FROM
	fact_sales as f
INNER JOIN
	dim_store as s ON s.staff_id = f.staff_id
INNER JOIN
	dim_address as a ON a.address_id = f.store_address
GROUP BY
	1,2,3,4
ORDER BY
	SUM(f.sales) DESC
LIMIT
	1