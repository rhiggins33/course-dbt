WITH source AS (
  SELECT * FROM {{ source('postgres', 'addresses') }}
  ),

addresses AS (
  SELECT 
    address_id
    ,address
    ,zipcode
    ,state
    ,country
  FROM source
)

SELECT * FROM addresses
