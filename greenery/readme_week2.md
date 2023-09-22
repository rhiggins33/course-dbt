PART 1: Models

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

    dim_product: Product ID, Name of product, and URL of product. Organized as collection of noun-related fields.

    fact_inventory: glimpse of per-product metrics, i.e. inventory value, add to carts and page views. Percent_added gives possible insight into product page purchase success. Organized as event-related fields. 


PART 2: Tests

-- What assumptions are you making about each model? (i.e. why are you adding each test?)

Price-related values (cost, shipping cost, promo value) should all be positive values. Primary key ID should be unique/not null. Tested uniqueness of address_id for stg_user to determine if there are multiple users at same address - named test 'multiple_users_per_address' - this might influence address-level vs. user-level analytics.

-- Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?

Test for 'multiple_users_per_address' did 'fail' as there are addresses with multiple user_id associated with them.

-- Your stakeholders at Greenery want to understand the state of the data each day. Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through.

1. Run scheduled tests.
2. Run tests after any changes are made to code.
3. Use dbt build to stop process on test failures before it creates all downstream models.
4. Allow your team to review changes and test results before merging changes. 


PART 3: dbt Snapshots

-- Which products had their inventory change from week 1 to week 2? 

Pothos
Philodendron
Monstera
String of pearls