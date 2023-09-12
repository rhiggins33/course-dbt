How many users do we have? 130

    SELECT 
        DISTINCT COUNT(*) 
    FROM dev_db.dbt_rodhiggiucscedu.stg_users

On average, how many orders do we receive per hour? ~7.5 orders per hour

    SELECT 
        COUNT(*) / ((DATEDIFF(minute, MIN(created_at), MAX(created_at)))/60) AS avg_orders_per_hour
    FROM dev_db.dbt_rodhiggiucscedu.stg_orders

On average, how long does an order take from being placed to being delivered? ~3.9 days

    SELECT 
        AVG(DATEDIFF(day, created_at, delivered_at)) as avg_delivery_time
    FROM dev_db.dbt_rodhiggiucscedu.stg_orders

How many users have only made one purchase? 25 users
    
    SELECT 
        COUNT(*)
    FROM 
        (SELECT user_id
        FROM dev_db.dbt_rodhiggiucscedu.stg_orders
        GROUP BY user_id
        HAVING COUNT(user_id) = 1)

>Two purchases? 28 users

    SELECT 
        COUNT(*)
    FROM 
        (SELECT user_id
        FROM dev_db.dbt_rodhiggiucscedu.stg_orders
        GROUP BY user_id
        HAVING COUNT(user_id) = 2)

>Three+ purchases? 71 users

    SELECT 
        COUNT(*)
    FROM 
        (SELECT user_id
        FROM dev_db.dbt_rodhiggiucscedu.stg_orders
        GROUP BY user_id
        HAVING COUNT(user_id) > 2)

On average, how many unique sessions do we have per hour? ~16.3 sessions per hour

    SELECT 
        AVG(session_count) AS avg_sessions_per_hour
    FROM 
        (SELECT 
        DATE_TRUNC('hour', created_at) AS session_hour,
        COUNT(DISTINCT session_id) AS session_count
        FROM dev_db.dbt_rodhiggiucscedu.stg_events
        GROUP BY session_hour)