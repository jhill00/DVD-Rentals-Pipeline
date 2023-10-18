select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    film_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.film
where film_id is not null
group by film_id
having count(*) > 1



      
    ) dbt_internal_test