select
    account_id,
    balance_date,
    closing_balance,
    available_balance,
    closing_balance - available_balance as hold_amount
from {{ ref('stg_balances') }}
