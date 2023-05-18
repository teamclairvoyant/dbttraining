{{
config(
materialized = "incremental",
unique_key='primary_key',
incremental_strategy='append',
)
}}

SELECT
match_date,
TEAM,
SEASON,
ELO_PRE,
ELO_PROB,
ELO_POST,
SCORE,
WIN,
DRAW
FROM {{ ref('required_nfl_elo_data') }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where match_date > (select max(match_date) from {{ this }})

{% endif %}