SELECT
	a.address_id,
 	co.country,
	a.district,
	ct.city,
	a.postal_code,
	CASE
		WHEN a.address2 <> '' THEN concat(a.address, ', ', a.address2)
		ELSE a.address
	END as address,
	a.phone,
	a.last_update
FROM
	address as a
INNER JOIN
	city as ct ON ct.city_id = a.city_id
INNER JOIN
	country as co ON co.country_id = ct.country_id