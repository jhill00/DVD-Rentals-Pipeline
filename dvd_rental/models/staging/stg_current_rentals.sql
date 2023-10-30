select
    rental_id,
	rental_date,
	return_date,
    (current_date - rental_date::date) as rental_duration
from
    {{ref('dim_rental')}}
where
    return_date is null