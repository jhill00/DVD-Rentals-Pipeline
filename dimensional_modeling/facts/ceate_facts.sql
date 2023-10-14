CREATE TABLE IF NOT EXISTS fact_sales
(
	payment_id INTEGER PRIMARY KEY,
	date_key INTEGER REFERENCES dim_date(date_key),
	staff_id INTEGER REFERENCES dim_store(staff_id),
	customer_id SMALLINT REFERENCES dim_customer(customer_id),
	rental_id INTEGER REFERENCES dim_rental(rental_id),
	store_address INTEGER REFERENCES dim_address(address_id),
	customer_address INTEGER REFERENCES dim_address(address_id),
	film_id INTEGER REFERENCES dim_film(film_id),
	sales NUMERIC
);