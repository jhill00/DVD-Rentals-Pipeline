
  
    

        create or replace transient table DVD_Rental.AIRBYTE_SCHEMA.dim_rental
         as
        (SELECT
	rental_id,
	rental_date,
	return_date,
	last_update
FROM
	dvd_rental.airbyte_schema.rental
        );
      
  