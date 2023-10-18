WITH

source_payment as
(
	SELECT * FROM {{ source('dvd_rental', 'payment') }}
),

source_rental as
(
	SELECT * FROM {{ source('dvd_rental', 'rental') }}
),

source_inventory as
(
	SELECT * FROM {{ source('dvd_rental', 'inventory') }}
),

source_staff as
(
	SELECT * FROM {{ source('dvd_rental', 'staff') }}
),

source_customer as
(
	SELECT * FROM {{ source('dvd_rental', 'customer') }}
)

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
	source_payment as p
INNER JOIN
	source_rental as r ON r.rental_id = p.rental_id
INNER JOIN
	source_inventory as i ON i.inventory_id = r.inventory_id
INNER JOIN
	source_staff as s ON s.staff_id = p.staff_id
INNER JOIN
	source_customer as c ON c.customer_id = p.customer_id