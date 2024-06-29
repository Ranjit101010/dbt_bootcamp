with source as (

    select * from {{ source('staging', 'orders_tax_status') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source