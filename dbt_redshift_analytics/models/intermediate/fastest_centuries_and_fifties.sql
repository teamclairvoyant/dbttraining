{{
config(
matirialized='incremental'
)
}}

SELECT
*
FROM {{ ref('fastest_centuries') }}

UNION

SELECT
*
FROM {{ ref('fastest_fifties') }}


{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where Match_Date > (select max(Match_Date) from {{ this }})

{% endif %}

