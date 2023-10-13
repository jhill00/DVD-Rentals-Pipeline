INSERT INTO fact_sales
(date_key, store_id, customer_id, film_id, film_actor_id, sales)
SELECT
	DISTINCT(TO_CHAR(p.payment_date, 'yyyymmdd')::INTEGER) as date_key,
	s.store_id,
	p.customer_id,
	i.film_id,
	CONCAT(fa.film_id, '_', fa.actor_id) as film_actor_id,
	p.amount as sales
FROM
	payment as p
INNER JOIN
	rental as r ON r.rental_id = p.rental_id
INNER JOIN
	inventory as i ON i.inventory_id = r.inventory_id
INNER JOIN
	film_actor as fa ON fa.film_id = i.film_id
INNER JOIN
	staff as s ON s.staff_id = p.staff_id
;