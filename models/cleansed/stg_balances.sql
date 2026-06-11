select
    account_id,
    cast(balance_date as date) as balance_date,
    cast(closing_balance as decimal(18,2)) as closing_balance,
    cast(available_balance as decimal(18,2)) as available_balance
from {{ ref('raw_balances') }}
where account_id is not null
