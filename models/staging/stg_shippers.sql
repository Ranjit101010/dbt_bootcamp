with source as (

    select * from {{ source('staging', 'shippers') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source