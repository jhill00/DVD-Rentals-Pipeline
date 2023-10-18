
    
    

select
    store_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.store
where store_id is not null
group by store_id
having count(*) > 1


