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
	dvd_rental.airbyte_schema.staff as sa
INNER JOIN
	dvd_rental.airbyte_schema.store as so ON sa.store_id = so.store_id