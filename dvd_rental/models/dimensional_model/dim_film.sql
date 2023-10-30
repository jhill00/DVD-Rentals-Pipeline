with flat_actors as
(
	select
		fa.film_id,
		array_agg(
			a.first_name || ' ' || a.last_name
		) within group (
			order by a.last_name, a.first_name
			) as actors
	from
		{{ source('dvd_rental', 'film_actor') }} as fa
	inner join
		{{ source('dvd_rental', 'actor') }} as a on a.actor_id = fa.actor_id
	group by
		fa.film_id
)

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
	fa.actors,
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
inner join
	flat_actors as fa on fa.film_id = f.film_id