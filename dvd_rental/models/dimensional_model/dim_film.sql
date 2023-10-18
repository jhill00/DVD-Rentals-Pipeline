WITH 

source_film as
(
	SELECT * FROM {{ source('dvd_rental', 'film') }}
),

source_film_category as
(
	SELECT * FROM {{ source('dvd_rental', 'film_category') }}
),

source_category as
(
	SELECT * FROM {{ source('dvd_rental', 'category') }}
),

source_language as
(
	SELECT * FROM {{ source('dvd_rental', 'language') }}
)

SELECT
	f.film_id,
	f.title,
	f.description,
	f.release_year,
	c.name as category,
	f.rental_duration,
	f.rental_rate,
	f.length as film_length,
	f.rating,
	f.special_features,
	l.name as film_language,
	f.last_update
FROM
	source_film as f
INNER JOIN
	source_film_category as fc ON f.film_id = fc.film_id
INNER JOIN
	source_category as c ON fc.category_id = c.category_id
INNER JOIN
	source_language as l ON f.language_id = l.language_id