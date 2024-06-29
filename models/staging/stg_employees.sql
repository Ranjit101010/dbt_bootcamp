with source as (

    select * from {{ source('staging', 'employees') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source