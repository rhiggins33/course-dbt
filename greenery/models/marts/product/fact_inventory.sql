WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

page_url AS (
    SELECT * FROM {{ ref('stg_events') }}
),

events AS (
    SELECT * FROM {{ ref('int_product_session_agg') }}
)

SELECT 
    p.product_id
    ,p.name
    ,p.price
    ,p.inventory
    ,p.price*p.inventory AS total_value
    ,u.page_url
    ,e.add_to_carts
    ,e.page_views
    ,ROUND(DIV0(add_to_carts, page_views)*100, 1) AS percent_added 
FROM products p
LEFT JOIN page_url u
    ON u.product_id = p.product_id
LEFT JOIN events e 
    ON p.product_id = e.product_id
GROUP BY ALL
ORDER BY percent_added


