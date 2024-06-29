with source as (

    select * from {{ source('staging', 'inventory_transactions') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source