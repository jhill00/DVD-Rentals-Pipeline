select
	distinct(payment_date::date) as date,
	extract(year from payment_date)	as year,
	extract(quarter from payment_date) as quarter,
	extract(month from payment_date) as month,
	extract(day from payment_date) as day,
	extract(dow from payment_date) as day_of_week
from
	{{ source('dvd_rental', 'payment') }}