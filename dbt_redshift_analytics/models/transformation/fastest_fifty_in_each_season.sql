{{
config(
matirialized='table'
)
}}

with fast_fifties as (

SELECT
season,
player,
venue,
match_date,
runs,
bf as balls_faced,
rank() over (partition by season order by bf) as rnk
from {{ ref('fastest_centuries_and_fifties') }}
where runs between 50 and 99

)

select * from fast_fifties where rnk = 1