with source as (

    select * from {{ source('staging', 'strings') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source