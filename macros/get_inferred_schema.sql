-- Macro goal: This macro infers the prod schema by the data model name 
-- Args: model_name: data model name
-- Returns: Inferred schema

{% macro get_inferred_schema(model_name) %}

    {%- set masterdata_schema = 'masterdata' -%}
    {%- set analytics_schema = 'analytics' -%}
    {%- set staging_schema = 'staging' -%}

    {%- if 'dim_' in model_name -%}
        {{ masterdata_schema }}
    {%- elif 'dtm_' in model_name -%}
        {{ analytics_schema }}
    {%- elif 'fct_' in model_name -%}
        {{ masterdata_schema }}
    {%- elif 'stg_' in model_name -%}
        {{ staging_schema }}
    {%- elif 'int_' in model_name -%}
        {{ staging_schema }}
    {%- elif 'cbo_' in model_name -%}
        {{ analytics_schema }}   
    {%- else -%}
        {{ staging_schema }}
    {%- endif -%}

{% endmacro %}