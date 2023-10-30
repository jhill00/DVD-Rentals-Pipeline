-- What film category generates the most revenue by country? What percentage of the country's market does it make up?

with country_film_interest as
(
	select
		distinct(a.country),
		df.category as film_category,
		sum(fs.sales) over (partition by a.country) as country_sales,
		sum(fs.sales) over (partition by a.country, df.category) as category_sales
	from
		{{ref('fact_sales')}} as fs
	inner join
		{{ref('dim_address')}} as a on a.address_id = fs.customer_address
	inner join
		{{ref('dim_film')}} as df on df.film_id = fs.film_id
),
category_rank as
(
	select
		country,
		film_category,
		country_sales,
		category_sales,
		row_number() over (partition by country order by category_sales desc) as category_rank
	from
		country_film_interest
)

select
	country,
	film_category,
	country_sales,
	category_sales,
	round((category_sales / country_sales), 2) as category_market
from
	category_rank
where
	category_rank = 1