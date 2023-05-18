{% macro create_dbt_audit_table() -%}

create table if not exists {{ target.database }}.{{ target.schema }}.dbt_audit (
    id varchar(60),
    modified_date timestamp_ntz(4) default cast(CURRENT_TIMESTAMP as timestamp_ntz(4)),
    execution_start timestamp_ntz(4) default cast(CURRENT_TIMESTAMP as timestamp_ntz(4)),
    execution_end timestamp_ntz(4),
    duration_in_minutes int,
    status varchar(20),
    username varchar(60),
    manifest string,
    run_results string
);

{%- endmacro %}