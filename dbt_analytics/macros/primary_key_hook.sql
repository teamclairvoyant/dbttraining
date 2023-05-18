{% macro primary_key_hook(tablename) -%}

{% set sql_post_hook_seed %}

--INSERT OVERWRITE INTO {{ tablename }} (SELECT *, concat(season,'_',team1,'_',team2) AS primary_key from {{tablename}} );
ALTER TABLE {{ tablename }} ADD COLUMN "PRIMARY_KEY" Varchar(20) as (concat(season,'_',team1,'_',team2));
commit;

{% endset %}

{% do run_query(sql_post_hook_seed) %}

{% endmacro %}