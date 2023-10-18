
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.customer
where customer_id is not null
group by customer_id
having count(*) > 1


