{{
config(matirialized='view', blind=false)
}}

SELECT
CASE TRIM(TEAM) WHEN  'Chennai Super Kings' then 'CSK'
WHEN 'Sunrisers Hyderabad' then 'SRH'
WHEN 'Delhi Capitals' then 'DC'
WHEN 'Kings XI Punjab' then 'KXP'
WHEN 'Mumbai Indians' then 'MI'
WHEN 'Rajasthan Royals' then 'RR'
WHEN 'Kolkata Knight Riders' then 'KKR'
WHEN 'Royal Challengers Bangalore' then 'RCB'
ELSE 'Not Available' END AS TEAM,
SEASON,
MAT AS MATCHES,
WON AS NUM_OF_WON_MATCHES,
LOST AS NUM_OF_LOST_MATCHES,
TIED AS NUM_OF_TIED_MATCHES,
NET_RATE AS NR,
POINTS AS TOTAL_POINTS,
NET_RUN_RATE AS NRR

FROM {{ ref('points_table') }}