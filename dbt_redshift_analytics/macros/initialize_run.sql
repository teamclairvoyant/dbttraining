{% macro initialize_run() -%}

{% if execute %}
    {{ log("Running initialization steps", True) }}
{% endif %}

{% if execute %}
    {{ log("Creating status table if it does not exist.", True) }}
{% endif %}

{{ create_dbt_status_table() }}

{% if execute %}
    {{ log("Creating record metadata table if it does not exist.", True) }}
{% endif %}

{{ create_model_metadata_table() }}

{% if execute %}
    {{ log("Inserting new record into status table.", True) }}
{% endif %}

{{ insert_dbt_status() }}

{% endmacro %}