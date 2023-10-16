SELECT
	p.payment_id,
	p.payment_date::DATE as date,
	p.staff_id,
	p.customer_id,
	r.rental_id,
	s.address_id,
	c.address_id,
	i.film_id,
	p.amount as sales
FROM
	payment as p
INNER JOIN
	rental as r ON r.rental_id = p.rental_id
INNER JOIN
	inventory as i ON i.inventory_id = r.inventory_id
INNER JOIN
	staff as s ON s.staff_id = p.staff_id
INNER JOIN
	customer as c ON c.customer_id = p.customer_id