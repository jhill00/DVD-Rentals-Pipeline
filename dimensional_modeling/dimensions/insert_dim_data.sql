INSERT INTO dim_date
(date_key, date, year, quarter, month, day, weekend) 
SELECT
	DISTINCT(TO_CHAR(payment_date, 'yyyymmdd')::INTEGER) as date_key,
	payment_date::date as date,
	EXTRACT(YEAR from payment_date)	as year,
	EXTRACT(QUARTER from payment_date) as quarter,
	EXTRACT(MONTH from payment_date) as month,
	EXTRACT(DAY from payment_date) as day,
	CASE
		WHEN EXTRACT(ISODOW FROM payment_date) IN(6,7) THEN TRUE
		ELSE FALSE
	END as weekend
FROM
	payment;

INSERT INTO dim_customer
(customer_id, customer_name, email, active, create_date, last_update)
 SELECT
 	customer_id,
	(first_name || ' ' || last_name) as customer_name,
	email,
	activebool as active,
	create_date,
	last_update
FROM
	customer
;

INSERT INTO dim_film
(film_id, title, description, release_year, category, rental_duration, 
rental_rate, film_length, rating, special_features, film_language, last_update)
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
	film as f
INNER JOIN
	film_category as fc ON f.film_id = fc.film_id
INNER JOIN
	category as c ON fc.category_id = c.category_id
INNER JOIN
	language as l ON f.language_id = l.language_id
;

INSERT INTO dim_store
(store_id, staff_id, employee_name, email, active, staff_username, staff_password, manager_staff_id, last_update)
SELECT
	sa.store_id,
	sa.staff_id,
	(sa.first_name || ' ' || last_name) as employee_name,
	sa.email,
	sa.active,
	sa.username as staff_username,
	sa.password as staff_password,
	so.manager_staff_id,
	sa.last_update
FROM
	staff as sa
INNER JOIN
	store as so ON sa.store_id = so.store_id
;

INSERT INTO dim_address
(address_id, country, district, city, postal_code, address, phone, last_update)
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
;

INSERT INTO dim_rental
(rental_id, rental_date, return_date, last_update)
SELECT
	rental_id,
	rental_date,
	return_date,
	last_update
FROM
	rental
;