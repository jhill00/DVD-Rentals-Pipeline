select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select film_id
from DVD_Rental.AIRBYTE_SCHEMA.film_category
where film_id is null



      
    ) dbt_internal_test