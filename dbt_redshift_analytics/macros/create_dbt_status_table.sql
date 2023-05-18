{% macro create_dbt_status_table() -%}

create table if not exists {{ target.database }}.{{ target.schema }}.dbt_status (
    id varchar(60),
    modified_date timestamptz default cast(CURRENT_TIMESTAMP as timestamptz),
    execution_start timestamptz default cast(CURRENT_TIMESTAMP as timestamptz),
    execution_end timestamptz,
    duration_in_minutes int,
    status varchar(10),
    username varchar(60),
    manifest VARCHAR(20),
    run_results VARCHAR(60)
);

{%- endmacro %}