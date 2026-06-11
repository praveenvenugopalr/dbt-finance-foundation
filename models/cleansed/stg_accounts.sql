select
    account_id,
    customer_id,
    upper(trim(account_type)) as account_type,
    open_date,
    upper(trim(status)) as status,
    upper(trim(branch_code)) as branch_code
from {{ ref('raw_accounts') }}
where account_id is not null
