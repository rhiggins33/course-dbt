WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

events AS (
    SELECT * FROM {{ ref('stg_events') }}
)

SELECT 
    p.product_id
    ,p.name
    ,p.price
    ,p.inventory
    ,p.price*p.inventory AS total_value
    ,e.page_url
    ,COUNT(e.event_type) AS page_views
FROM products p
LEFT JOIN events e
    ON e.product_id = p.product_id
WHERE e.event_type = 'page_view'
GROUP BY ALL


