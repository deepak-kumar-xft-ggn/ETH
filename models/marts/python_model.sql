{{ config(tags=['python_model'], enabled=false) }}

-- This is a placeholder SQL version
-- Original Python model disabled due to Snowpark ref() compatibility issues

SELECT
    DATE,
    token_address,
    type,
    symbol,
    total_usd_value
FROM {{ ref('stablecoin_activity_per_day') }}
