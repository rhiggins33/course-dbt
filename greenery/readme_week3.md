PART 1:

-- What is our overall conversion rate? 62.5%

WITH total AS (
    SELECT                      
        COUNT(DISTINCT(e.session_id)) AS total_count
    FROM stg_events e
),

checkouts AS (
    SELECT
        COUNT(DISTINCT(e.session_id)) AS checkout_count
    FROM stg_events e
    WHERE e.event_type = 'checkout'
)

SELECT 
    ROUND((checkout_count/total_count)*100,1) AS total_conversion_rate
FROM checkouts,total;

-- What is our conversion rate by product?

NAME	CONVERSION_RATE
String of pearls	60.9
Arrow Head	55.6
Cactus	54.5
ZZ Plant	54
Bamboo	53.7
Rubber Plant	51.9
Monstera	51
Calathea Makoyana	50.9
Fiddle Leaf Fig	50
Majesty Palm	49.3
Aloe Vera	49.2
Devil's Ivy	48.9
Philodendron	48.4
Jade Plant	47.8
Pilea Peperomioides	47.5
Spider Plant	47.5
Dragon Tree	46.8
Money Tree	46.4
Orchid	45.3
Bird of Paradise	45
Ficus	42.6
Birds Nest Fern	42.3
Pink Anthurium	41.9
Boston Fern	41.3
Alocasia Polly	41.2
Peace Lily	40.9
Ponytail Palm	40
Snake Plant	39.7
Angel Wings Begonia	39.3
Pothos	34.4

-- Why might certain products be converting at higher/lower rates than others? 

We can make a range of hypotheses from technical issues related to poor website design, or availability and marketability of the individual products.


PART 6:

-- Which products had their inventory change from week 2 to week 3? 

Monstera
String of pearls
Philodendron
Pothos
Bamboo
ZZ Plant

