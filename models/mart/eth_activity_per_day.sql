{{ config(materialized='table', tags=['daily']) }}

select
date,
transaction_category,
count(*) as tx_count, 
{{ ethereum_conversion('value') }} as sum_eth_value
--from DBT.DBT_DEEPAK.transactions_enriched
from {{ ref('stg_transactions_enriched') }}

group by 
date,
transaction_category


{{ random_macro() }}