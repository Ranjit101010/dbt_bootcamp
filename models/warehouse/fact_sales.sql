with source as (
    select 
        od.order_id,
        od.product_id,
        o.customer_id,
        o.employee_id,
        o.shipper_id,
        od.quantity,
        od.unit_price,
        od.discount,
        od.status_id,
        od.date_allocated,
        od.purchase_order_id,
        od.inventory_id,
        o.order_date,
        o.shipped_date,
        o.paid_date,
    from {{ ref('stg_orders') }} o
    left join {{ ref('stg_order_details') }} od
    on o.id = od.id
    where od.order_id is not null
),

unique_source as (
    select *,
    row_number() over( partition by order_id, product_id, \
    customer_id, employee_id, shipper_id, purchase_order_id, shipper_id, order_date) as rn
    from source
)

select 
* except(rn) 
from unique_source
where rn = 1