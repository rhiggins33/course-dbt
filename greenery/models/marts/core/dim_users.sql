SELECT
    u.user_id
    ,concat(u.first_name,' ',u.last_name) AS full_name
    ,u.email
    ,u.phone_number
    ,u.created_at
    ,u.updated_at
    ,a.address
    ,a.zipcode
    ,a.state
    ,a.country
FROM {{ ref('stg_users') }} u
LEFT JOIN {{ ref('stg_addresses') }} a
    ON u.address_id = a.address_id

