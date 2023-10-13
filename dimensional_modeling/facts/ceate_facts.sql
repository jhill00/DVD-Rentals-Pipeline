CREATE TABLE IF NOT EXISTS fact_sales
(
	date_key INTEGER REFERENCES dim_date(date_key),
	store_id INTEGER REFERENCES dim_store(store_id),
	customer_id SMALLINT REFERENCES dim_customer(customer_id),
	film_id INTEGER REFERENCES dim_film(film_id),
	film_actor_id VARCHAR(50) REFERENCES dim_actor(film_actor_id),
	sales NUMERIC
);