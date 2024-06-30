
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_stg_data`.`stg_employee_privileges`
      
    
    

    OPTIONS()
    as (
      with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`employee_privileges`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
    );
  