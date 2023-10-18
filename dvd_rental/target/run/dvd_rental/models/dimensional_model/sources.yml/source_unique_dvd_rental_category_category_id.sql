select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    category_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.category
where category_id is not null
group by category_id
having count(*) > 1



      
    ) dbt_internal_test