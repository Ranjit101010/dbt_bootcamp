with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`inventory_transactions`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source