WITH events AS (
    SELECT * FROM {{ ref('stg_events') }}
),

session_events AS (
    SELECT 
        product_id
        ,SUM(CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_carts
        ,SUM(CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END) AS page_views
    FROM events
    GROUP BY product_id
)

SELECT * FROM session_events