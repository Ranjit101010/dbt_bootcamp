select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customer_id
from `ranjit-1610110`.`dbt_staging_dwh_data`.`dim_customer`
where customer_id is null



      
    ) dbt_internal_test