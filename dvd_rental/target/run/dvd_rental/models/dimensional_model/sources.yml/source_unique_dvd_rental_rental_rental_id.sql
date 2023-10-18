select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    rental_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.rental
where rental_id is not null
group by rental_id
having count(*) > 1



      
    ) dbt_internal_test