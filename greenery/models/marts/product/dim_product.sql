WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

events AS (
    SELECT * FROM {{ ref('stg_events') }}
)

SELECT 
    p.product_id
    ,p.name
    ,e.page_url
FROM events e
LEFT JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'page_view'
GROUP BY all
