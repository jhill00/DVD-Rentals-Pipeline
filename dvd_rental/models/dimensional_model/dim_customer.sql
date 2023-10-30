select
 	customer_id,
	(first_name || ' ' || last_name) as customer_name,
	email,
	activebool as active,
	create_date,
	last_update
from
	{{ source('dvd_rental', 'customer') }}