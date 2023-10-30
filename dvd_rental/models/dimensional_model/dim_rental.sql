select
	rental_id,
	rental_date,
	return_date,
	last_update
from
	{{ source('dvd_rental', 'rental') }}