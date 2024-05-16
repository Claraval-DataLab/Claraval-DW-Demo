-- Macro goal: This macro centralizes and manages variable descriptions
-- in dbt projects to eliminate inconsistencies and redundancies. 
-- Args: variable_name: descriptions

{% macro variables_descriptions(variable_name) %}
{% set descriptions = {
  'id_airbyte_raw': 'ID from Airbyte raw data',
  'dt_extracted_at': 'Extraction date and time',
  'js_airbyte_metadata': 'Metadata in JSON format from Airbyte',
  'js_new_tokens_data': 'New tokens data in JSON format',
  'js_new_tokens_status': 'Status of new tokens in JSON format'
} %}

{% set description = descriptions.get(variable_name) %}

{% if description %}
  {{ description }}
{% else %}
  "Description not found for variable: {{ variable_name }}"
{% endif %}
{% endmacro %}
