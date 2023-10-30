-- What store grosses the highest sales?

select
	s.store_id,
	a.country,
	a.city,
	a.address,
	sum(f.sales) as sales
from
	{{ref('fact_sales')}} as f
inner join
	{{ref('dim_store')}} as s on s.staff_id = f.staff_id
inner join
	{{ref('dim_address')}} as a on a.address_id = f.store_address
group by
	1,2,3,4
order by
	sum(f.sales) desc
limit
	1