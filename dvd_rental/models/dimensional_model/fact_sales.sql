-- handle potential rental_id duplicates
with payment_rental_id_dups as
(
	select
		*,
		row_number() over(partition by rental_id order by payment_date desc) as rental_num
	from
		{{ source('dvd_rental', 'payment') }}
)

select
	p.payment_id,
	p.payment_date::date as date,
	p.staff_id,
	p.customer_id,
	r.rental_id,
	s.address_id as store_address,
	c.address_id as customer_address,
	i.film_id,
	p.amount as sales
from
	payment_rental_id_dups as p
inner join
	{{ source('dvd_rental', 'rental') }} as r on r.rental_id = p.rental_id
inner join
	{{ source('dvd_rental', 'inventory') }} as i on i.inventory_id = r.inventory_id
inner join
	{{ source('dvd_rental', 'staff') }} as s on s.staff_id = p.staff_id
inner join
	{{ source('dvd_rental', 'customer') }} as c on c.customer_id = p.customer_id
where
	p.rental_num = 1