WITH order_facts AS (
SELECT 
    user_id 
    ,COUNT(*) AS order_count
    ,SUM(order_cost) AS order_cost_all
    ,SUM(shipping_cost) AS shipping_cost_all
    ,SUM(order_total) AS order_total_all 
    ,ROUND(SUM(order_total)/3,2) AS total_cost_per_order
FROM {{ ref('stg_orders') }}
GROUP BY user_id
),

user_facts AS (
SELECT 
    o.user_id
    ,u.first_name
    ,u.last_name
    ,o.order_count
    ,o.order_cost_all
    ,o.shipping_cost_all
    ,o.order_total_all
    ,o.total_cost_per_order
FROM order_facts AS o
LEFT JOIN {{ ref('stg_users') }} AS u 
    ON u.user_id = o.user_id
)

SELECT * FROM user_facts