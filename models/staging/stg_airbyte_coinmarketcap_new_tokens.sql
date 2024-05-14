-- Business Goal: Get CoinMarketCap new tokens
-- Creator: Diego Garcia
-- Created at: 2024-05-14

WITH stg_airbyte_coinmarketcap_new_tokens AS (
    SELECT * FROM {{ source('airbyte', 'coinmarketcap_new_tokens') }}
),


final AS (
    SELECT
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        data,
        status

    FROM stg_airbyte_coinmarketcap_new_tokens
)

SELECT * FROM final
