{{
    config(
        materialized='incremental',
        unique_key="team||'-'||game_date",
        incremental_strategy='delete+insert',
    )
}}

SELECT
TEAM,
SEASON,
GAME_DATE,
ELO_PRE,
ELO_PROB,
ELO_POST,
SCORE,
WIN,
DRAW
FROM {{ ref('team_elo_by_game') }}

{% if is_incremental() %}

-- incremental logic
where
  GAME_DATE > (select max(GAME_DATE) from {{ this }})

{% endif %}