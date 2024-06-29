with source as (

    select * from {{ source('staging', 'purchase_orders') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source