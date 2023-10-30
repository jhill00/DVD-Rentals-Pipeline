select
	a.address_id,
 	co.country,
	a.district,
	ct.city,
	a.postal_code,
	case
		when a.address2 <> '' then concat(a.address, ', ', a.address2)
		else a.address
	end as address,
	a.phone,
	a.last_update
from
	{{ source('dvd_rental', 'address') }} as a
inner join
	{{ source('dvd_rental', 'city') }} as ct on ct.city_id = a.city_id
inner join
	{{ source('dvd_rental', 'country') }} as co on co.country_id = ct.country_id