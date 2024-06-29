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
from {{ref('stg_customer')}}
),

unique_source as (
    select *,
    ROW_NUMBER() OVER (PARTITION BY customer_id) as rn 
    from source
)

select *
except(rn), from unique_source
where rn = 1