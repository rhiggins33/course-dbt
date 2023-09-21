WITH users AS (
    SELECT * FROM {{ ref('stg_users') }}
),

addresses AS (
    SELECT * FROM {{ ref('stg_addresses') }}
),

address_user_count AS (
    SELECT * FROM {{ ref('int_address_user_count') }}
)

SELECT
    u.user_id
    ,u.first_name
    ,u.last_name
    ,u.email
    ,u.phone_number
    ,u.created_at
    ,u.updated_at
    ,a.address
    ,a.zipcode
    ,a.state
    ,a.country
    ,auc.address_user_count
FROM users u
LEFT JOIN addresses a
    ON u.address_id = a.address_id
LEFT JOIN address_user_count auc 
    ON u.address_id = auc.address_id
