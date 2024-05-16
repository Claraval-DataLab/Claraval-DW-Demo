-- Business Goal: Get CoinMarketCap map all tokens from https://coinmarketcap.com/pt-br/
-- Creator: Diego Garcia
-- Created at: 2024-05-14

WITH src_coinmarketcap__map_tokens AS (
    SELECT * FROM {{ source('coinmarketcap','map_tokens') }}
),


final AS (
    SELECT
        _airbyte_raw_id AS id_airbyte_raw,
        DATETIME(_airbyte_extracted_at) AS dt_extracted_at,
        _airbyte_meta AS js_airbyte_metadata,
        data AS js_new_tokens_data,
        status AS js_new_tokens_status

    FROM src_coinmarketcap__map_tokens
)

SELECT * FROM final