-- The DVD store charges a late fee of $0.50 a day for every day a rental is passed its due date. 
-- What customers are currently late on their return(s) and how much do they owe?

with current_rentals as
(
	select
		fs.customer_id,
		c.customer_name,
		c.email,
		df.title,
		r.rental_date,
		r.return_date,
		df.rental_duration as permitted_duration,
		r.rental_duration
	from
		{{ref('fact_sales')}} as fs
	inner join
		{{ref('dim_customer')}} as c on c.customer_id = fs.customer_id
	inner join
		{{ref('dim_film')}} as df on df.film_id = fs.film_id
	inner join
		{{ref('stg_current_rentals')}} as r on r.rental_id = fs.rental_id
)

select
	customer_id,
    customer_name,
    email,
    title,
    rental_date,
    return_date,
    permitted_duration,
    rental_duration,
	(0.5 * (rental_duration - permitted_duration)) as late_fee
from
	current_rentals
where
	rental_duration > permitted_duration