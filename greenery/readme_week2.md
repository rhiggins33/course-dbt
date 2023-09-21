-- What is our user repeat rate? (Repeat Rate = Users who purchased 2 or more times / users who purchased)  79.8%

WITH user_order AS (
    SELECT 
        user_id
        ,COUNT(DISTINCT(order_id)) AS order_count 
    FROM stg_orders
    GROUP BY user_id
),

repeat_users AS (
    SELECT 
        COUNT(*) AS repeat_users_count
    FROM user_order 
    WHERE order_count > 1
),

total_users AS (
    SELECT 
        COUNT(DISTINCT user_id) as total_users_count
    FROM stg_orders
)

SELECT
    repeat
    ,total_users_count
    ,DIV0(repeat_users_count, total_users_count) AS repeat_user_rate 
FROM repeat_users, total_users;

-- What are good indicators of a user who will likely purchase again? 
    
    Order speed, items left in cart, post-order session, getting a promo code for next order

-- What about indicators of users who are likely NOT to purchase again? 

    Order speed, order never arrived, shipping costs, no post-order session

-- If you had more data, what features would you want to look into to answer this question?
     
    Customer service communication history, conflict resolution
    
-- Explain the product mart models you added. Why did you organize the models in the way you did?