SELECT
    product_id
    ,name 
    ,price
    ,inventory
    ,price*inventory AS total_value
FROM {{ ref('stg_products') }}
