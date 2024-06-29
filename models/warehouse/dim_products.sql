with source as (
    select 
        p.id as product_id,
        p.product_code,
        p.product_name,
        s.company as company_name,
        p.description,
        p.standard_cost,
        p.list_price,
        p.reorder_level,
        p.target_level,
        p.quantity_per_unit,
        p.discontinued,
        p.minimum_reorder_quantity,
        p.category,
        p.attachments,
        current_timestamp() as insertion_timestamp,
    from {{ ref('stg_products') }} p
    left join {{ ref('stg_suppliers') }} s
    ON s.id = p.id
),

unique_source as (
    select *,
    row_number() over (partition by product_id) as rn
    from source
)

select *
except(rn) 
from unique_source
where rn = 1
