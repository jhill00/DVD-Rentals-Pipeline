select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    language_id as unique_field,
    count(*) as n_records

from DVD_Rental.AIRBYTE_SCHEMA.language
where language_id is not null
group by language_id
having count(*) > 1



      
    ) dbt_internal_test