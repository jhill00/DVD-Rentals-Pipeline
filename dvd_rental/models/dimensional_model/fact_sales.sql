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
	{{ source('dvd_rental', 'payment') }} as p
inner join
	{{ source('dvd_rental', 'rental') }} as r on r.rental_id = p.rental_id
inner join
	{{ source('dvd_rental', 'inventory') }} as i on i.inventory_id = r.inventory_id
inner join
	{{ source('dvd_rental', 'staff') }} as s on s.staff_id = p.staff_id
inner join
	{{ source('dvd_rental', 'customer') }} as c on c.customer_id = p.customer_id