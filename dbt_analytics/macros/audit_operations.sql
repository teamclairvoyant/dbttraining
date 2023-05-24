{% macro insert_dbt_audits(action_name) -%}

insert into {{ target.database }}.{{ target.schema }}.dbt_audits (audit_type) 
values ('{{ action_name }}');

COMMIT;

{% endmacro %}