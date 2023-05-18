{% macro insert_model_metadata() -%}

merge into {{ target.schema }}.model_metadata ent
using (select '{{this.database}}' as db_name,
    '{{this.schema}}' as schema_name,
    '{{this.table}}' as table_name,
    count(1) as ct,
    current_timestamp() as modified_date
    from {{this}} ) tgt
    on ent.db_name = tgt.db_name
    and ent.schema_name = tgt.schema_name
    and ent.table_name = tgt.table_name
when not matched then insert (db_name, schema_name, table_name, record_count, modified_date)
values (db_name, schema_name, table_name, ct, modified_date)
when matched then update set modified_date = tgt.modified_date,
                            RECORD_COUNT = tgt.ct;

COMMIT;

{% endmacro %}