WITH checkouts AS (
    SELECT * FROM {{ ref('int_checkouts') }}
),

prod_session AS (
    SELECT * FROM {{ ref('int_product_session_agg') }}
)

SELECT 
    c.name
    ,COUNT(DISTINCT(c.session_id)) AS purchase_count
    ,ps.session_count
    ,ROUND((COUNT(DISTINCT(c.session_id))/ps.session_count)*100,1) AS conversion_rate
FROM checkouts c
LEFT JOIN prod_session ps
    ON c.product_id = ps.product_id
GROUP BY all
ORDER BY conversion_rate DESC