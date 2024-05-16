-- Business Goal: Get CoinMarketCap new tokens from https://coinmarketcap.com/new/
-- Creator: Diego Garcia
-- Created at: 2024-05-15

WITH src_coinmarketcap__new_tokens AS (
    SELECT * FROM {{ source('coinmarketcap','new_tokens') }}
),


final AS (
    SELECT
        _airbyte_raw_id AS id_airbyte_raw,
        DATETIME(_airbyte_extracted_at) AS dt_extracted_at,
        _airbyte_meta AS js_airbyte_metadata,
        data AS js_new_tokens_data,
        status AS js_new_tokens_status

    FROM src_coinmarketcap__new_tokens
)

SELECT * FROM final
