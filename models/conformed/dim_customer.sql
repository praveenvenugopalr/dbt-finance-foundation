select
    customer_id,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name,
    date_of_birth,
    date_diff('year', date_of_birth, current_date) as age,
    segment,
    onboarded_date,
    date_diff('month', onboarded_date, current_date) as tenure_months
from {{ ref('stg_customers') }}
