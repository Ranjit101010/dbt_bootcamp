with source as (

    select * from {{ source('staging', 'purchase_order_status') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source