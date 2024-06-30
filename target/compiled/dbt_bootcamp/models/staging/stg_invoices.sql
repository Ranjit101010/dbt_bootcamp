with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`invoices`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source