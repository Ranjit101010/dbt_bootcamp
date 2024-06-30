with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`purchase_order_details`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source