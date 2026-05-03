{{ config(materialized='table', tags = ['daily'])}}

select
date,
count(*) as tx_count,
{{ conversion('value', '18') }} as sum_value_ethereum

from {{ ref('stg_transactions_enriched') }}

group by 
date
