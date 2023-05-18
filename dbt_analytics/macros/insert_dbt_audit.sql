{% macro insert_dbt_audit(status) -%}

insert into {{ target.database }}.{{ target.schema }}.dbt_audit (id, modified_date, execution_start, status, username) values
('{{ invocation_id }}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '{{status}}', '{{ env_var("USER") }}');

COMMIT;

{% endmacro %}