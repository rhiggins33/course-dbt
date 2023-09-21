WITH events AS (
    SELECT * FROM {{ ref('stg_events') }}
)

SELECT 
    event_id
    ,session_id
    ,user_id
    ,page_url
    ,created_at
    ,product_id
FROM events
WHERE event_type = 'page_view'

