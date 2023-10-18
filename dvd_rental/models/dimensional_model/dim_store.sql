WITH

source_staff as
(
	SELECT * FROM {{ source('dvd_rental', 'staff') }}
),

source_store as
(
	SELECT * FROM {{ source('dvd_rental', 'store') }}
)

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
	source_staff as sa
INNER JOIN
	source_store as so ON sa.store_id = so.store_id