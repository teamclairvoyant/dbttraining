
{{
config(
materialized = 'view', bind=False
)
}}


SELECT
DATE,
GROUND_LOCATION,
LPAD(LEFT(MATCH_NUMBER,1),4,0) AS MATCH_NUMBER,
CASE TRIM(TEAM_A) WHEN  'Chennai Super Kings' then 'CSK'
WHEN 'Sunrisers Hyderabad' then 'SRH'
WHEN 'Delhi Capitals' then 'DC'
WHEN 'Kings XI Punjab' then 'KXP'
WHEN 'Mumbai Indians' then 'MI'
WHEN 'Rajasthan Royals' then 'RR'
WHEN 'Kolkata Knight Riders' then 'KKR'
WHEN 'Royal Challengers Bangalore' then 'RCB'
ELSE 'Not Available' END AS TEAM_A,
CASE TRIM(TEAM_B) WHEN 'Chennai Super Kings' then 'CSK'
WHEN 'Sunrisers Hyderabad' then 'SRH'
WHEN 'Delhi Capitals' then 'DC'
WHEN 'Kings XI Punjab' then 'KXP'
WHEN 'Mumbai Indians' then 'MI'
WHEN 'Rajasthan Royals' then 'RR'
WHEN 'Kolkata Knight Riders' then 'KKR'
WHEN 'Royal Challengers Bangalore' then 'RCB'
ELSE 'Not Available' END AS TEAM_B,
CASE TRIM(WINNER) WHEN 'Chennai Super Kings' then 'CSK'
WHEN 'Sunrisers Hyderabad' then 'SRH'
WHEN 'Delhi Capitals' then 'DC'
WHEN 'Kings XI Punjab' then 'KXP'
WHEN 'Mumbai Indians' then 'MI'
WHEN 'Rajasthan Royals' then 'RR'
WHEN 'Kolkata Knight Riders' then 'KKR'
WHEN 'Royal Challengers Bangalore' then 'RCB'
ELSE 'Not Available' END AS WINNER,
WINS_BY_RUNS,
WINS_BY_WICKETS,
SEASON
FROM {{ ref('series_matches') }}
