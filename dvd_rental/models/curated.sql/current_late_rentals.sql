{{
    config(
        schema="{{ env_var('CURATED_SCHEMA') }}"
    )
}}

SELECT
	customer_id,
    customer_name,
    email,
    title,
    rental_date,
    return_date,
    permitted_duration,
    rental_duration,
	(0.5 * (rental_duration - permitted_duration)) as late_fee
FROM
	{{ref('current_rentals')}}
WHERE
	rental_duration > permitted_duration