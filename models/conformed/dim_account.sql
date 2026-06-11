select
    account_id,
    customer_id,
    account_type,
    cast(open_date as date) as open_date,
    status,
    branch_code,
    date_diff('day', cast(open_date as date), current_date) as days_since_opening
from {{ ref('stg_accounts') }}
