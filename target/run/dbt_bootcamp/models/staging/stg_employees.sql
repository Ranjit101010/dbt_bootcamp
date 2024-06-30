
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_stg_data`.`stg_employees`
      
    
    

    OPTIONS()
    as (
      with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`employees`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
    );
  