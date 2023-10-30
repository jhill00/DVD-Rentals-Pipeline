select
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
from
	{{ source('dvd_rental', 'film') }} as f
inner join
	{{ source('dvd_rental', 'film_category') }} as fc on f.film_id = fc.film_id
inner join
	{{ source('dvd_rental', 'category') }} as c on fc.category_id = c.category_id
inner join
	{{ source('dvd_rental', 'language') }} as l on f.language_id = l.language_id