WITH events AS (
    SELECT * FROM {{ ref('stg_events') }}
),

items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

checkouts AS (
    SELECT 
        session_id
        ,order_id
        ,event_type
    FROM events
    WHERE event_type = 'checkout'
    GROUP BY all
)

SELECT 
    c.session_id
    ,c.order_id
    ,i.product_id
    ,p.name
FROM checkouts c
LEFT JOIN items i
    ON c.order_id = i.order_id
LEFT JOIN products p
    ON i.product_id = p.product_id