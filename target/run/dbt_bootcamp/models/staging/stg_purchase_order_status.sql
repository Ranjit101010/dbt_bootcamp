
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_stg_data`.`stg_purchase_order_status`
      
    
    

    OPTIONS()
    as (
      with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`purchase_order_status`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
    );
  