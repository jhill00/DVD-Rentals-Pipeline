-- What store grosses the highest sales?

{{
    config(
        schema='CURATED'
    )
}}

SELECT
	s.store_id,
	a.country,
	a.city,
	a.address,
	SUM(f.sales) as sales
FROM
	{{ref('fact_sales')}} as f
INNER JOIN
	{{ref('dim_store')}} as s ON s.staff_id = f.staff_id
INNER JOIN
	{{ref('dim_address')}} as a ON a.address_id = f.store_address
GROUP BY
	1,2,3,4
ORDER BY
	SUM(f.sales) DESC
LIMIT
	1