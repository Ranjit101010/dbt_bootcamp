with source as (

    select * from {{ source('staging', 'customer') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
