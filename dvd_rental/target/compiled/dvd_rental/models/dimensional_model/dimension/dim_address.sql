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
	dvd_rental.airbyte_schema.address as a
INNER JOIN
	dvd_rental.airbyte_schema.city as ct ON ct.city_id = a.city_id
INNER JOIN
	dvd_rental.airbyte_schema.country as co ON co.country_id = ct.country_id