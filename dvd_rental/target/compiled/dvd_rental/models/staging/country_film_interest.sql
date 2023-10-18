

SELECT
    DISTINCT(a.country),
    df.category as film_category,
    SUM(fs.sales) OVER (PARTITION BY a.country) as country_sales,
    SUM(fs.sales) OVER (PARTITION BY a.country, df.category) as category_sales
FROM
    fact_sales as fs
INNER JOIN
    dim_address as a ON a.address_id = fs.customer_address
INNER JOIN
    dim_film as df ON df.film_id = fs.film_id