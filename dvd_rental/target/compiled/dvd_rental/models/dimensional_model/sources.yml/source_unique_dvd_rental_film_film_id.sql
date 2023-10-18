
    
    

select
    film_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.film
where film_id is not null
group by film_id
having count(*) > 1


