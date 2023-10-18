WITH 

source_address as
(
	SELECT * FROM {{ source('dvd_rental', 'address') }}
),

source_city as
(
	SELECT * FROM {{ source('dvd_rental', 'city') }}
),

source_country as
(
	SELECT * FROM {{ source('dvd_rental', 'country') }}
)

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
	source_address as a
INNER JOIN
	source_city as ct ON ct.city_id = a.city_id
INNER JOIN
	source_country as co ON co.country_id = ct.country_id