{{
    config(
        schema="{{ env_var('CURATED_SCHEMA') }}"
    )
}}

WITH category_rank as
(
	SELECT
		country,
		film_category,
		country_sales,
		category_sales,
		DENSE_RANK() OVER (PARTITION BY country ORDER BY category_sales DESC) as category_rank
	FROM
		{{ref('country_film_interest')}}
)

SELECT
	country,
	film_category,
	country_sales,
	category_sales,
	ROUND((category_sales / country_sales),2) as category_market
FROM
	category_rank
WHERE
	category_rank = 1