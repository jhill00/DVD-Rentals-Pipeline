select
	sa.store_id,
	sa.staff_id,
	(sa.first_name || ' ' || last_name) as employee_name,
	sa.email,
	sa.active,
	sa.username as staff_username,
	sa.password as staff_password,
	so.manager_staff_id,
	sa.last_update
from
	{{ source('dvd_rental', 'staff') }} as sa
inner join
	{{ source('dvd_rental', 'store') }} as so on sa.store_id = so.store_id