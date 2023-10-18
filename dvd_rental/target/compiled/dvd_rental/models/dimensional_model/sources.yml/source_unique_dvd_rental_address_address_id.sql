
    
    

select
    address_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.address
where address_id is not null
group by address_id
having count(*) > 1


