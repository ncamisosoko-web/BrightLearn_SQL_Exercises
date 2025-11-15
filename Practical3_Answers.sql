--Qustion-1.
--Find all records where Size is missing and the purchase_amount is greater than
--50.
--Expected Columns: Customer ID, Size, purchase_amount, Item
--Purchased
SELECT customer_id,
       size,
       purchase_amount,
       ITEM_PURCHASED
FROM practical_3.shopping.trends
WHERE size IS NULL AND purchase_amount > 50;
------------------------------------------------------------------------------------------
--Qustion-2
--2. List the total number of purchases grouped by Season, treating NULL values a
--s 'Unknown Season'.
--Expected Columns: Season, Total Purchases
SELECT ifnull(season, 'Unknown Season') as season,
       SUM(previous_purchases) as Total_Purchases
FROM practical_3.shopping.trends
GROUP BY ALL;
------------------------------------------------------------------------------------------
--Qustion-3
--Count how many customers used each Payment Method, treating NULLs as
--'Not Provided'.
--Expected Columns: Payment Method, Customer Count
SELECT IFNULL(payment_method,'Not Provided') as PAYMENT_METHOD,
       COUNT(customer_id) as Customer_Count
FROM practical_3.shopping.trends
GROUP BY ALL;
------------------------------------------------------------------------------------------
--Qustion-4
--. Show customers where Promo Code Used is NULL and Review Rating is below
--3.0.
--Expected Columns: Customer ID, Promo Code Used, Review Rating, Item Purchased
SELECT customer_id,
       promo_code_used,
       review_rating,
       item_purchased
FROM practical_3.shopping.trends
WHERE promo_code_used IS NULL AND REVIEW_RATING < 3.0;

------------------------------------------------------------------------------------------
--Qustion-5
--Group customers by Shipping
--Type, and return the average purchase_amount, treating missing values as 0.
--Expected Columns: Shipping Type, Average purchase_amount
SELECT IFNULL(shipping_type,'Unknown') as SHIPPING_TYPE,
       AVG(IFNULL(purchase_amount,0))as Average_purchase_amount
FROM practical_3.shopping.trends
GROUP BY ALL;

------------------------------------------------------------------------------------------
--Qustion-6
--Display the number of purchases per Location only for those with more than
--5 purchases and no NULL Payment Method.
--Expected Columns: Location, Total Purchases
SELECT IFNULL(location, 'Unknown') as location,
       SUM(previous_purchases) as Total_Purchases
FROM practical_3.shopping.trends
WHERE previous_purchases > 5 AND PAYMENT_METHOD IS NOT NULL
GROUP BY ALL;

------------------------------------------------------------------------------------------
--Qustion-7
--Create a column Spender Category that classifies customers using CASE:
--'High' if amount > 80, 'Medium' if BETWEEN 50 AND 80,
--'Low' otherwise. Replace NULLs in purchase_amount with 0.
--Expected Columns: Customer ID, purchase_amount, Spender Category

SELECT  CUSTOMER_ID,
            IFNULL(purchase_amount, 0) as purchase_amount,
      CASE  
           WHEN purchase_amount > 80 THEN 'High'
           WHEN purchase_amount BETWEEN 50 AND 80 THEN 'Medium'
           ELSE 'low'
        END AS Spender_Category
FROM practical_3.shopping.trends;

------------------------------------------------------------------------------------------
--Qustion-8
--. Find customers who have no Previous
--Purchases value but whose Color is not NULL.
--Expected Columns: Customer ID, Color, Previous Purchases
SELECT customer_id,
       color,
       previous_purchases
FROM practical_3.shopping.trends
WHERE previous_purchases IS NULL AND COLOR IS NOT NULL;

------------------------------------------------------------------------------------------
--Qustion-9
--Group records by Frequency of
--Purchases and show the total amount spent per group, treating NULL frequenc
--ies as 'Unknown'.
--Expected Columns: Frequency of Purchases, Total purchase_amount

SELECT IFNULL(frequency_of_purchases, 'Unknown') AS FREQUENCY_OF_PURCHASES,
       SUM(previous_purchases) As Total_purchase_amount
FROM practical_3.shopping.trends
GROUP BY ALL;

------------------------------------------------------------------------------------------
--Qustion-10
--.Display a list of all Category values with the number of times each was purcha
--sed, excluding rows where Categoryis NULL.
--Expected Columns: Category, Total Purchases
SELECT category,
      COUNT(previous_purchases) AS Total_purchase
FROM practical_3.shopping.trends
WHERE category is not null
GROUP BY category;

------------------------------------------------------------------------------------------
--Qustion-11
--.Return the top
--5 Locations with the highest total purchase_amount, replacing NULLs in amount
--with 0.
--Expected Columns: Location, Total purchase_amount
SELECT IFNULL(location, 'Unknown'),
       SUM(IFNULL(previous_purchases,0)) AS Total_purchase_amount
FROM practical_3.shopping.trends
GROUP BY location
ORDER BY  location DESC
LIMIT 5;

------------------------------------------------------------------------------------------
--Qustion-12
--.Group customers by Gender and Size, and count how many entries have a NUL
--L Color.
--Expected Columns: Gender, Size, Null Color Count
SELECT GENDER,
       size,
       count(customer_id) as Null_Color_Count
FROM practical_3.shopping.trends
WHERE color is null
GROUP By GENDER, size;

------------------------------------------------------------------------------------------
--Qustion-13
--Identify all Item Purchased where more than 3 purchases had NULL Shipping
--Type.
--Expected Columns: Item Purchased, NULL Shipping Type Count
SELECT item_purchased,
       COUNT(customer_id) as Null_Shipping_Type_Count
FROM practical_3.shopping.trends
WHERE shipping_type is null
GROUP BY item_purchased
HAVING  Null_Shipping_Type_Count> 3;

------------------------------------------------------------------------------------------
--Qustion-14
--Show a count of how many customers per Payment Method have NULL Review
--Rating.
--Expected Columns: Payment Method, Missing Review Rating Count

SELECT payment_method,
      COUNT(customer_id) As Missing_Review_Rating_Count
FROM practical_3.shopping.trends
WHERE review_rating is null
GROUP BY payment_method;

select*
from practical_3.shopping.trends;

------------------------------------------------------------------------------------------
--Qustion-15
--Group by Category and return the average Review Rating, replacing NULLs with
--0, and filter only where average is greater than 3.5.
--Expected Columns: Category, Average Review Rating
SELECT Category,
       AVG(IFNULL(REVIEW_RATING, 0)) as Average_Review_Rating
FROM practical_3.shopping.trends
WHERE review_rating> 3.5
GROUP By category;

------------------------------------------------------------------------------------------
--Qustion-16
-- List all Colors that are missing (NULL) in at least
-- 2 rows and the average Age of customers for those rows.
-- Expected Columns: Color, Average Age

SELECT color,
       AVG(Age) AS Average_Age
FROM practical_3.shopping.trends
WHERE color is null
GROUP By all;

------------------------------------------------------------------------------------------
--Qustion-17
--Use CASE to create a column Delivery Speed: 'Fast' if Shipping Type is 'Express' or
--'Next Day Air', 'Slow' if 'Standard',
--'Other' for all else including NULL. Then count how many customers fall into
--each category.
--Expected Columns: Delivery Speed, Customer Count

SELECT 
    COUNT(IFNULL(customer_id,0)) AS Customer_Count,
    CASE
        WHEN shipping_type = 'Express' THEN 'Fast'
        WHEN shipping_type = 'Air' THEN 'Next Day'
        WHEN shipping_type = 'Standard' THEN 'Slow'
        ELSE 'Other'
    END AS Delivery_Speed
FROM practical_3.shopping.trends
GROUP BY ALL;

------------------------------------------------------------------------------------------
--Qustion-18
--Find customers whose purchase_amount is NULL and whose Promo Code Used is
--'Yes'.
--Expected Columns: Customer ID, purchase_amount, Promo Code Used
SELECT customer_id,
       purchase_amount,
       promo_code_used
FROM practical_3.shopping.trends
WHERE purchase_amount is null AND promo_code_used = 'Yes';


------------------------------------------------------------------------------------------
--Qustion-19
--Group by Location and show the maximum Previous
--Purchases, replacing NULLs with 0, only where the average rating is above 4.0.
--Expected Columns: Location, Max Previous Purchases, Average
--Review Rating

SELECT location,
    MAX(IFNULL(previous_purchases,0)) AS Max_Previous_Purchase,
    AVG(IFNULL(review_rating,0)) AS Average_Review_Rating
FROM practical_3.shopping.trends
WHERE  review_rating > 4.0 
GROUP BY ALL

------------------------------------------------------------------------------------------
--Qustion-20
--Show customers who have a NULL Shipping
--Type but made a purchase in the range of 30 to 70 USD.
--Expected Columns: Customer ID, Shipping
--Type, purchase_amount, Item Purchased
SELECT customer_id,
    shipping_type,
    purchase_amount,
    item_purchased
FROM practical_3.shopping.trends
WHERE shipping_type IS NULL AND purchase_amount BETWEEN 30 AND 70;


