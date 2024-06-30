
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_dwh_data`.`fact_sales`
      
    partition by order_date
    

    OPTIONS()
    as (
      

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
        date(o.order_date) as order_date,
        o.shipped_date,
        o.paid_date,
    from `ranjit-1610110`.`dbt_staging_stg_data`.`stg_orders` o
    left join `ranjit-1610110`.`dbt_staging_stg_data`.`stg_order_details` od
    on o.id = od.id
    where od.order_id is not null
),

unique_source as (
    select *,
    row_number() over( partition by order_id, product_id,customer_id, employee_id, shipper_id, purchase_order_id, shipper_id, order_date) as rn
    from source
)

select 
* except(rn) 
from unique_source
where rn = 1
    );
  