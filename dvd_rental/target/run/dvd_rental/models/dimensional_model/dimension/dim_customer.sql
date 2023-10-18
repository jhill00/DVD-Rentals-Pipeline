
  
    

        create or replace transient table DVD_Rental.AIRBYTE_SCHEMA.dim_customer
         as
        (SELECT
 	customer_id,
	(first_name || ' ' || last_name) as customer_name,
	email,
	activebool as active,
	create_date,
	last_update
FROM
	dvd_rental.airbyte_schema.customer
        );
      
  