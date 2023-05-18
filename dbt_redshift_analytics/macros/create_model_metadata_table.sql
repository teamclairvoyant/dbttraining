{% macro create_model_metadata_table() -%}


create table if not exists {{ target.database }}.{{ target.schema }}.model_metadata (
    id varchar(60) default fn_uuid(),
    created_date timestamptz default cast(CURRENT_TIMESTAMP as timestamptz),
    modified_date timestamptz,
    db_name VARCHAR(20),
    schema_name VARCHAR(20),
    table_name VARCHAR(20),
    record_count int
);

{%- endmacro %}