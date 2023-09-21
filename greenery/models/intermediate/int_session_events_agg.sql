WITH events AS (
    SELECT * FROM {{ ref('stg_events') }}
),

session_events AS (
    SELECT 
        user_id
        ,session_id
        ,SUM(CASE WHEN event_type = 'add_to_cart' THEN 1 ELSE 0 END) AS add_to_carts
        ,SUM(CASE WHEN event_type = 'checkout' THEN 1 ELSE 0 END) AS checkouts
        ,SUM(CASE WHEN event_type = 'package_shipped' THEN 1 ELSE 0 END) AS package_shippeds
        ,SUM(CASE WHEN event_type = 'page_view' THEN 1 ELSE 0 END) AS page_views
        ,MIN(created_at) AS first_session_event
        ,MAX(created_at) AS last_session_event
    FROM events
    GROUP BY user_id, session_id
)

SELECT * FROM session_events