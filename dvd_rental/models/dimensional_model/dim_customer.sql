WITH

source_customer as
(
	SELECT * FROM {{ source('dvd_rental', 'customer') }}
)

SELECT
 	customer_id,
	(first_name || ' ' || last_name) as customer_name,
	email,
	activebool as active,
	create_date,
	last_update
FROM
	source_customer