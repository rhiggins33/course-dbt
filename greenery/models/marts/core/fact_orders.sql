WITH item_total AS (
    SELECT 
        product_id
        ,SUM(quantity) order_total
    FROM {{ ref('stg_order_items') }}
    GROUP BY product_id
),

product_order AS (
SELECT
    i.product_id
    ,p.name
    ,i.order_total   
FROM item_total i
LEFT JOIN {{ ref('stg_products') }} p
    ON i.product_id = p.product_id
)

SELECT * FROM product_order