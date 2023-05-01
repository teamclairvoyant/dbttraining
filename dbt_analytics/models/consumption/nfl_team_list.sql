
SELECT
TEAM1 AS TEAM
FROM {{ ref('v_nfl_elo') }}
UNION
SELECT
TEAM2 AS TEAM
FROM {{ ref('v_nfl_elo') }}