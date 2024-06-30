with source as (

    select * from `ranjit-1610110`.`dbt_staging`.`employee_privileges`
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source