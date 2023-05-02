{% macro create_model_metadata_table() -%}

create table if not exists {{ target.database }}.{{ target.schema }}.model_metadata (
    id varchar(60) default UUID_STRING(),
    created_date timestamp_ntz(4) default cast(CURRENT_TIMESTAMP as timestamp_ntz(4)),
    modified_date timestamp_ntz(4),
    db_name string,
    schema_name string,
    table_name string,
    record_count int
);

{%- endmacro %}