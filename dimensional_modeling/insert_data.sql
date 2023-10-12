-- add data to dimension tables

INSERT INTO dim_date
(date_key, date, year, quarter, month, day, weekend) 
SELECT
	DISTINCT(TO_CHAR(payment_date, 'yyyymmdd')::INTEGER) as date_key,
	payment_date::date 					 				 as date,
	EXTRACT(YEAR from payment_date)		 				 as year,
	EXTRACT(QUARTER from payment_date)	 				 as quarter,
	EXTRACT(MONTH from payment_date)	 				 as month,
	EXTRACT(DAY from payment_date)		 				 as day,
	CASE
		WHEN EXTRACT(ISODOW FROM payment_date) IN(6,7) THEN TRUE
		ELSE FALSE
	END 								 				 as weekend
FROM
	payment;

INSERT INTO dim_customer
(customer_id, customer_name, email, country, district, city, 
 postal_code, address, phone, active, create_date, last_update)
 SELECT
 	c.customer_id,
	(c.first_name || ' ' || c.last_name) 	as customer_name,
	c.email,
	co.country,
	a.district,
	ct.city,
	a.postal_code,
	CASE
	WHEN a.address2 <> '' THEN concat(a.address, ', ', a.address2)
	ELSE a.address
	END 									as address,
	a.phone,
	c.activebool							as active,
	c.create_date,
	c.last_update
FROM
	customer 	as c
INNER JOIN
	address 	as a 	ON c.address_id = a.address_id
INNER JOIN
	city 		as ct 	ON a.city_id = ct.city_id
INNER JOIN
	country 	as co	ON ct.country_id = co.country_id
;

INSERT INTO dim_film
(film_actor_id, title, description, release_year, category, actor, rental_duration, 
rental_rate, film_length, rating, special_features, film_language)
SELECT
	CONCAT(f.title, '_', f.film_id, a.actor_id)			as film_actor_id,
	f.title,
	f.description,
	f.release_year,
	c.name 												as category,
	(a.first_name || ' ' || a.last_name) 				as actor,
	f.rental_duration,
	f.rental_rate,
	f.length 											as film_length,
	f.rating,
	f.last_update,
	f.special_features,
	l.name 												as film_language
FROM
	film as f
INNER JOIN
	film_category 	as fc 	ON f.film_id = fc.film_id
INNER JOIN
	category 		as c 	ON fc.category_id = c.category_id
INNER JOIN
	language 		as l 	ON f.language_id = l.language_id
INNER JOIN
	film_actor 		as fa 	ON f.film_id = fa.film_id
INNER JOIN
	actor 			as a 	ON fa.actor_id = a.actor_id
;

INSERT INTO dim_store
(store_staff_id, employee_name, email, active, staff_username, staff_password, manager_staff_id)
SELECT
	CONCAT(so.store_id, sa.staff_id)::INTEGER 		as store_staff_id,
	(sa.first_name || ' ' || last_name) 			as employee_name,
	sa.email,
	sa.active,
	sa.username 									as staff_username,
	sa.password 									as staff_password,
	so.manager_staff_id
FROM
	staff as sa
INNER JOIN
	store as so ON sa.store_id = so.store_id
;