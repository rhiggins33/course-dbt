Part 1:

-- Which products had their inventory change from week 3 to week 4? 

Philodendron
Pothos
Bamboo
String of pearls
ZZ Plant
Monstera

-- Now that we have 3 weeks of snapshot data, can you use the inventory changes to determine which products had the most fluctuations in inventory? 

4X each for: Monstera
Philodendron
Pothos
String of pearls

SELECT name, Count(*) AS changes FROM inventory_snap GROUP BY name ORDER BY changes DESC;

-- Did we have any items go out of stock in the last 3 weeks? Yes, String of Pearls and Pothos both went out of stock during Week 3.

SELECT name, DBT_updated_at from inventory_snap Where inventory = 0;

Part 2: 

-- How are our users moving through the product funnel?


-- Which steps in the funnel have largest drop off points?

Add_to_cart_rate is relatively high (50.7%) 

SELECT AVG(add_to_carts/page_views) AS add_to_cart_rate FROM int_user_session_agg;

but the drop off is checkouts where only 33.8% of add_to_carts are converted to checkouts.

SELECT AVG(DIV0(checkouts,add_to_carts)) AS checkout_rate FROM int_user_session_agg;

Part 3a:

-- if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?

dbt allows data engineers, data analysts and the newly defined analytics engineers to cooperate and share one common interface to transform (ELT!) and model data and will write documentation and a DAG that is readable to less data-savy stakeholders.

-- if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?

We are just starting to use dbt (that is why I am in the course) but I would encourage the use of descriptions to reduce redundant code commenting.

-- if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?

I feel my career has been steering towards analytics engineering and I feel that the use of macros is so important to bring together analytics and engineering. It is also so important to learn all the other organizational practices from week 4 (exposures, artifacts). 

Part 3b:

-- how would you go about setting up a production/scheduled dbt run of your project in an ideal state? (Hint: what steps would you have? Which orchestration tool(s) would you be interested in using? What schedule would you run your project on? Which metadata would you be interested in using? How/why would you use the specific metadata? , etc.)
