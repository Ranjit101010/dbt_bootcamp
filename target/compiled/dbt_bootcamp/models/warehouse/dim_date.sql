with source as(
select * 
from 
unnest(GENERATE_DATE_ARRAY('2014-01-01', '2050-01-01', interval 1 day)) as d)

select
FORMAT_DATE('%F', d) as id,
d as full_date,
EXTRACT(YEAR from d) as year,
EXTRACT(MONTH from d) as month,
EXTRACT(DAY from d) as year_day,
EXTRACT(WEEK FROM d) AS year_week,
EXTRACT(YEAR FROM d) as fiscal_year,
FORMAT_DATE('%Q', d) as fiscal_qtr,
FORMAT_DATE('%B', d) as month_name,
FORMAT_DATE('%w', d) as week_day,
FORMAT_DATE('%A', d) as day_name,
(case when format_date('%A', d) in ('Sunday', 'Saturday') then 0 else 1 end) as day_is_weekday
from source