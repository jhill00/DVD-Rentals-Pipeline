select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from DVD_Rental.AIRBYTE_SCHEMA.customer
where customer_id is null



      
    ) dbt_internal_test