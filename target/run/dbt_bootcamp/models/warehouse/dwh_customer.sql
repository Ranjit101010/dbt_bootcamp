
  
    

    create or replace table `ranjit-1610110`.`dbt_staging_dwh_data`.`dwh_customer`
      
    
    

    OPTIONS()
    as (
      select
id
company
last_name
first_name
email_address
job_title
business_phone
home_phone
mobile_phone
fax_number
address
city
state_province
zip_postal_code
country_region
web_page
notes
attachments
insertion_timestamp
from `ranjit-1610110`.`dbt_staging_stg_data`.`stg_customer`
    );
  