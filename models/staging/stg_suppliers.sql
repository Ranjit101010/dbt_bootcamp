with source as (

    select * from {{ source('staging', 'suppliers') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source