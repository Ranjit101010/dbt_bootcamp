with source as (

    select * from {{ source('staging', 'order_details_status') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source
