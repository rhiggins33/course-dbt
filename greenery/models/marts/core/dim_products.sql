WITH products AS ( 
    SELECT * FROM {{ ref('stg_products') }}
),

events AS ( 
    SELECT * FROM {{ ref('stg_events') }}
)

SELECT 
    p.*
    ,e.page_url
FROM products p
LEFT JOIN events e
    ON p.product_id = e.product_id
GROUP BY ALL