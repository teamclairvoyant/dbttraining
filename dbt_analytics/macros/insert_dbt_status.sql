{% macro insert_dbt_status() -%}

insert into {{ target.database }}.{{ target.schema }}.dbt_status (id, modified_date, execution_start, status, username) values
('{{ invocation_id }}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'started', '{{ env_var("USER") }}');

COMMIT;

{% endmacro %}