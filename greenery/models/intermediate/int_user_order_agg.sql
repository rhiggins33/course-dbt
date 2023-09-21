WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

agg AS (
    SELECT 
        user_id 
        ,COUNT(*) AS order_count
        ,SUM(order_cost) AS order_cost_all
        ,SUM(shipping_cost) AS shipping_cost_all
        ,SUM(order_total) AS order_total_all 
        ,ROUND(SUM(order_total)/3,2) AS total_cost_per_order
    FROM orders
    GROUP BY user_id
)

SELECT * FROM agg