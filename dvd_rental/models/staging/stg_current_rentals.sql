{{
    config(
        schema='STAGING'
    )
}}

SELECT
    fs.customer_id,
    c.customer_name,
    c.email,
    df.title,
    r.rental_date,
    r.return_date,
    df.rental_duration as permitted_duration,
    (CURRENT_DATE - r.rental_date::DATE) as rental_duration
FROM
    {{ref('fact_sales')}} as fs
INNER JOIN
    {{ref('dim_customer')}} as c ON c.customer_id = fs.customer_id
INNER JOIN
    {{ref('dim_film')}} as df ON df.film_id = fs.film_id
INNER JOIN
    {{ref('dim_rental')}} as r ON r.rental_id = fs.rental_id
WHERE
    r.return_date IS NULL