
{{ config(
        tags=['every_hour'],
        materialized='table',
        schema='staging',
        labels = {'every_hour': 'every_hour'})
}}


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