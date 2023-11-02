-- with Snowflake's columnar storage, one big table has been created as an alternative to querying the dimensional model
-- analytical queries are much more efficient on a columnar stored dataset than row-based systems like Postgres

select
	fs.payment_id,
	fs.date,
	fs.staff_id,
	ds.store_id,
	ds.employee_name,
	ds.email as employee_email,
	ds.active as employee_active,
	ds.manager_staff_id,
	ds.last_update as staff_last_update,
	fs.customer_id,
	dc.email as customer_email,
	dc.active as customer_active,
	dc.create_date as customer_create_date,
	dc.last_update as customer_last_update,
	fs.rental_id,
	dr.rental_date,
	dr.return_date,
	dr.last_update as rental_last_update,
	fs.store_address as store_address_id,
	das.country as store_country,
	das.district as store_district,
	das.city as store_city,
	das.postal_code as store_postal_code,
	das.phone as store_phone,
	das.last_update as store_last_address_update,
	fs.customer_address as customer_address_id,
	dac.country as customer_country,
	dac.district as customer_district,
	dac.city as customer_city,
	dac.postal_code as customer_postal_code,
	dac.phone as customer_phone,
	dac.last_update as customer_last_address_update,
	fs.film_id,
	df.title as film_title,
	df.description as film_description,
	df.release_year,
	df.category as film_category,
	df.rental_duration as permitted_duration,
	df.rental_rate,
	df.film_length,
	df.rating,
	df.special_features,
	df.film_language,
	df.last_update as film_last_update,
	fs.sales
from
	{{ref('fact_sales')}} as fs
inner join
	{{ref('dim_store')}} as ds on ds.staff_id = fs.staff_id
inner join
	{{ref('dim_customer')}} as dc on dc.customer_id = fs.customer_id
inner join
	{{ref('dim_rental')}} as dr on dr.rental_id = fs.rental_id
inner join
	{{ref('dim_address')}} as das on das.address_id = fs.store_address
inner join
	{{ref('dim_address')}} as dac on dac.address_id = fs.customer_address
inner join
	{{ref('dim_film')}} as df on df.film_id = fs.film_id