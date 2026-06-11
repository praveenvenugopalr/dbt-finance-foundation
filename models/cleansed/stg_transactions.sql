select
    transaction_id,
    account_id,
    cast(transaction_date as date) as transaction_date,
    cast(amount as decimal(18,2)) as amount,
    upper(trim(transaction_type)) as transaction_type,
    upper(trim(channel)) as channel
from {{ ref('raw_transactions') }}
where transaction_id is not null
  and amount is not null
