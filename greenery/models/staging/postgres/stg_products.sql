WITH source AS (
  SELECT * FROM {{ source('postgres', 'products') }}
  ),

products AS (
  SELECT 
    product_id
    ,name
    ,price
    ,inventory
  FROM source
)

SELECT * FROM products