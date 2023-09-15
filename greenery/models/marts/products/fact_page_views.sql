SELECT * 
FROM {{ source('postgres', 'events') }}
WHERE event_type = 'page_view'