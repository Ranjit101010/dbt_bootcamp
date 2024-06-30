
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_dwh_data`.`dim_employee`
      
    
    

    OPTIONS()
    as (
      with source as (
    select 
    id as employee_id,
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
    attachments 
    from `ranjit-1610110`.`dbt_staging_stg_data`.`stg_employees`
),

unique_source as (
    select *,
    row_number() over (partition by employee_id) as rn 
    from source
)

select *
except(rn) from unique_source
where rn = 1
    );
  