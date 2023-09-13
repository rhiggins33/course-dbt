WITH source AS (
  SELECT * FROM {{ source('postgres', 'promos') }}
  ),

promos AS (
  SELECT 
    promo_id
    ,discount
    ,status
  FROM source
)

SELECT * FROM promos