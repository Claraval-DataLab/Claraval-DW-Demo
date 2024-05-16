-- Macro goal: This macro infers the prod schema by the data model name 
-- Args: model_name: data model name
-- Returns: Inferred schema

{% macro get_inferred_schema(model_name) %}

  {%- set masterdata_schema = 'masterdata' -%}
  {%- set analytics_schema = 'analytics' -%}
  {%- set staging_schema = 'staging' -%}

  {%- if startswith(model_name, 'dim_') -%}
    {{ masterdata_schema }}
  {%- elif startswith(model_name, 'dtm_') -%}
    {{ analytics_schema }}
  {%- elif startswith(model_name, 'fct_') -%}
    {{ masterdata_schema }}
  {%- elif startswith(model_name, 'stg_') -%}
    {{ staging_schema }}
  {%- elif startswith(model_name, 'int_') -%}
    {{ staging_schema }}
  {%- elif startswith(model_name, 'cbo_') -%}
    {{ analytics_schema }}   
  {%- else -%}
    {{ staging_schema }}
  {%- endif -%}

{% endmacro %}
