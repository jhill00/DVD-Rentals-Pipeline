source_rental as
(
	SELECT * FROM {{ source('dvd_rental', 'rental') }}
)

SELECT
	rental_id,
	rental_date,
	return_date,
	last_update
FROM
	source_rental