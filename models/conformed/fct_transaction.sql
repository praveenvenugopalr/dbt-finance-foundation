select
    transaction_id,
    account_id,
    transaction_date,
    amount,
    transaction_type,
    channel,
    case
        when amount > 0 then 'CREDIT'
        when amount < 0 then 'DEBIT'
        else 'ZERO'
    end as debit_credit_flag,
    abs(amount) as absolute_amount
from {{ ref('stg_transactions') }}
