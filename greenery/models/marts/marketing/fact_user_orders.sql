WITH order_facts AS (
    SELECT * FROM {{ ref('int_user_order_agg') }}
),

user_facts AS (
    SELECT 
        o.user_id
        ,concat(u.first_name,' ',u.last_name) AS full_name
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