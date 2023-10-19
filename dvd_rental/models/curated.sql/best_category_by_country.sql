-- What film category generates the most revenue by country? What percentage of the country's market does it make up?

{{
    config(
        schema='CURATED'
    )
}}

WITH category_rank as
(
	SELECT
		country,
		film_category,
		country_sales,
		category_sales,
		ROW_NUMBER() OVER (PARTITION BY country ORDER BY category_sales DESC) as category_rank
	FROM
		{{ref('stg_country_film_interest')}}
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