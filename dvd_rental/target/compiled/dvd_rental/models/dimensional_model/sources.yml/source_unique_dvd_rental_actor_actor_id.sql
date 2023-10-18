
    
    

select
    actor_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.actor
where actor_id is not null
group by actor_id
having count(*) > 1


