WITH source AS (
    SELECT * FROM {{ source('postgres', 'order_items') }}
),

order_items AS (
  SELECT 
    order_id
    ,product_id
    ,quantity
  FROM source
)

SELECT * FROM order_items