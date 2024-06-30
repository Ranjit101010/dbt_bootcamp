
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_dwh_data`.`dim_customer`
      
    
    

    OPTIONS()
    as (
      with source as (
select
id as customer_id,
company,
last_name,
first_name,
email_address,
job_title,
business_phone,
home_phone,
mobile_phone,
fax_number,
address,
city,
state_province,
zip_postal_code,
country_region,
web_page,
notes,
attachments,
current_timestamp() as insertion_timestamp
from `ranjit-1610110`.`dbt_staging_stg_data`.`stg_customer`
),

unique_source as (
    select *,
    ROW_NUMBER() OVER (PARTITION BY customer_id) as rn 
    from source
)

select *
except(rn), from unique_source
where rn = 1
    );
  