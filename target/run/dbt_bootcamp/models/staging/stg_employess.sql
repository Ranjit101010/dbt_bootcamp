
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_stg_data`.`stg_employess`
      
    
    

    OPTIONS()
    as (
      with source as (
    select * from `ranjit-1610110`.`dbt_staging`.`employees`
)

select * from source
    );
  