with source as (

    select * from {{ source('staging', 'privileges') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source