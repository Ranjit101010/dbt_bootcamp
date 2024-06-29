with source as (

    select * from {{ source('staging', 'orders') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source