select
		{{ dbt_utils.star(from = ref('stg_transactions_enriched'), except =['new_field'], quote_identifiers = False) }}

from {{ ref('stg_transactions_enriched') }}
