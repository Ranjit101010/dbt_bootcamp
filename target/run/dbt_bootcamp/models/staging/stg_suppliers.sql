
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_stg_data`.`stg_suppliers`
      
    
    

    OPTIONS()
    as (
      with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`suppliers`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
    );
  