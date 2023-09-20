SELECT 
    event_id
    ,session_id
    ,user_id
    ,page_url
    ,created_at
    ,product_id
FROM {{ ref('stg_events') }}
WHERE event_type = 'page_view'
