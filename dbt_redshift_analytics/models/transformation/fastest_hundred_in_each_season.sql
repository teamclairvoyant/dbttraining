
{{
config(
matirialized='table'
)
}}

with fast_centuries as (

SELECT
player,
venue,
match_date,
runs,
bf as balls_faced,
rank() over (partition by season order by bf) as rnk
from {{ ref('fastest_centuries_and_fifties') }}
where runs >=100
)

select * from fast_centuries where rnk = 1