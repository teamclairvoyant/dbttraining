{% macro update_dbt_status() -%}

update {{ target.database }}.{{ target.schema}}.dbt_status
set execution_end = CURRENT_TIMESTAMP,
    status = 'complete',
    duration_in_minutes = datediff(minutes, execution_start, CURRENT_TIMESTAMP )
where id = '{{ invocation_id }}';

COMMIT;

{% endmacro %}