with source as (

    select * from {{ source('staging', 'employee_privileges') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source