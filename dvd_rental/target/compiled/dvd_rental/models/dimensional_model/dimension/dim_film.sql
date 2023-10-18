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
	dvd_rental.airbyte_schema.film as f
INNER JOIN
	dvd_rental.airbyte_schema.film_category as fc ON f.film_id = fc.film_id
INNER JOIN
	dvd_rental.airbyte_schema.category as c ON fc.category_id = c.category_id
INNER JOIN
	dvd_rental.airbyte_schema.language as l ON f.language_id = l.language_id