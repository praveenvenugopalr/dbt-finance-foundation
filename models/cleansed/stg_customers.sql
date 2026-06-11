select
    customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    cast(date_of_birth as date) as date_of_birth,
    upper(trim(segment)) as segment,
    cast(onboarded_date as date) as onboarded_date
from {{ ref('raw_customers') }}
where customer_id is not null
