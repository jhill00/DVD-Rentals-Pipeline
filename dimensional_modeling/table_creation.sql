-- create dimension tables

 CREATE TABLE IF NOT EXISTS dim_date 
(
	date_key integer NOT NULL PRIMARY KEY,
	date DATE NOT NULL,
	year SMALLINT NOT NULL,
	quarter SMALLINT NOT NULL,
	month SMALLINT NOT NULL,
	day SMALLINT NOT NULL,
	weekend BOOLEAN
);

CREATE TABLE IF NOT EXISTS dim_customer
(
	customer_id SMALLINT PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	email VARCHAR(50),
	country VARCHAR(40) NOT NULL,
	district VARCHAR(30) NOT NULL,
	city VARCHAR(30) NOT NULL,
	postal_code VARCHAR(30),
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(20),
	active BOOLEAN NOT NULL,
	create_date DATE NOT NULL,
	last_update TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_film
(
	film_actor_id VARCHAR(50) PRIMARY KEY,
	title VARCHAR(200) NOT NULL,
	description VARCHAR(200),
	release_year SMALLINT,
	category VARCHAR(25),
	actor VARCHAR(50),
	rental_duration SMALLINT NOT NULL,
	rental_rate FLOAT4 NOT NULL,
	film_length SMALLINT NOT NULL,
	rating VARCHAR(10) NOT NULL,
	special_features VARCHAR(100) NOT NULL,
	film_language VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_store
(
	store_staff_id INTEGER PRIMARY KEY,
	employee_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	active BOOLEAN, 
	staff_username VARCHAR(20) NOT NULL,
	staff_password VARCHAR(50)NOT NULL,
	manager_staff_id INTEGER,
);