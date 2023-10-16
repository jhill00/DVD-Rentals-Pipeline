SELECT
	DISTINCT(payment_date::DATE) as date,
	EXTRACT(YEAR from payment_date)	as year,
	EXTRACT(QUARTER from payment_date) as quarter,
	EXTRACT(MONTH from payment_date) as month,
	EXTRACT(DAY from payment_date) as day,
	CASE
		WHEN EXTRACT(ISODOW FROM payment_date) IN(6,7) THEN TRUE
		ELSE FALSE
	END as weekend
FROM
	payment