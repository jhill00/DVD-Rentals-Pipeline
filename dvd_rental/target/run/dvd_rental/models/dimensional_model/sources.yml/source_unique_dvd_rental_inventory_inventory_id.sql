select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    inventory_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.inventory
where inventory_id is not null
group by inventory_id
having count(*) > 1



      
    ) dbt_internal_test