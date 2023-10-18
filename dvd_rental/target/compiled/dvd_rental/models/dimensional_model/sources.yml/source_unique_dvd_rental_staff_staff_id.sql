
    
    

select
    staff_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.staff
where staff_id is not null
group by staff_id
having count(*) > 1


