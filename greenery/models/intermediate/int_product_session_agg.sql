WITH events AS (
    SELECT * FROM {{ ref('stg_events') }}
),

session_events AS (
    SELECT 
        product_id
        ,COUNT(DISTINCT(session_id)) AS session_count
    FROM events
    GROUP BY product_id
)

SELECT * FROM session_events