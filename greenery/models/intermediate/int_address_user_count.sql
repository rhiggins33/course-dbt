WITH users AS (
    SELECT * FROM {{ ref('stg_users') }}
)

SELECT 
    address_id
    ,COUNT(DISTINCT(user_id)) AS address_user_count 
FROM users 
GROUP BY address_id
