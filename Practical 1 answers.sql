--Q1. Display all columns for all transactions.
--Expected output: All columns
SELECT*
FROM practical.sales.retail_sales;

.......................................................................
--Q2. Display only the Transaction ID, Date, and Customer ID for all records.
--Expected output: Transaction ID, Date, Customer ID
SELECT transaction_id,
       date,
       customer_id
FROM practical.sales.retail_sales;

.......................................................................
--Q3. Display all the distinct product categories in the dataset.
--Expected output: Product Category
SELECT DISTINCT product_category
FROM practical.sales.retail_sales;

.......................................................................
--Q4. Display all the distinct gender values in the dataset.
--Expected output: Gender
SELECT DISTINCT gender
FROM practical.sales.retail_sales;

.......................................................................
--Q5. Display all transactions where the Age is greater than 40.
--Expected output: All columns
SELECT *
FROM practical.sales.retail_sales
WHERE age > 40;
.......................................................................
--Q6. Display all transactions where the Price per Unit is between 100 and 500.
--Expected output: All columns
SELECT *
FROM practical.sales.retail_sales
WHERE price_per_unit  BETWEEN 100 AND 500;
.......................................................................
--Q7. Display all transactions where the Product Category is either 'Beauty' or
--'Electronics'.
--Expected output: All columns
SELECT *
FROM PRACTICAL.SALES.RETAIL_SALES
WHERE product_category IN('Beauty','Electronics');
.......................................................................
--Q8. Display all transactions where the Product Category is not 'Clothing'.
--Expected output: All columns
SELECT *
FROM practical.sales.retail_sales
WHERE product_category NOT IN ('clothing');
.......................................................................
--Q9. Display all transactions where the Quantity is greater than or equal to 3.
--Expected output: All columns
SELECT *
FROM practical.sales.retail_sales
WHERE quantity >= 3;
.......................................................................
--Q10. Count the total number of transactions.
--Expected output: Total_Transactions
SELECT COUNT(transaction_id) as Total_transactions
FROM practical.sales.retail_sales;
.......................................................................
--Q11. Find the average Age of customers.
--Expected output: Average_Age
SELECT AVG(age) as Average_Age
FROM practical.sales.retail_sales;
.......................................................................
--Q12. Find the total quantity of products sold.
--Expected output: Total_Quantity
SELECT SUM(quantity) as Total_Quantity
FROM practical.sales.retail_sales;
.......................................................................
--Q13. Find the maximum Total Amount spent in a single transaction.
--Expected output: Max_Total_Amount
SELECT MAX(total_amount) as Max_Total_Amount
FROM practical.sales.retail_sales;
.......................................................................
--Q14. Find the minimum Price per Unit in the dataset.
--Expected output: Min_Price_per_Unit
SELECT MIN(price_per_unit) as Min_Price_per_Unit
FROM practical.sales.retail_sales;
.......................................................................
--Q15. Find the number of transactions per Product Category.
--Expected output: Product Category, Transaction_Count
SELECT COUNT(TRANSACTION_ID) as Transaction_Count,
       PRODUCT_CATEGORY
FROM practical.sales.retail_sales
GROUP BY PRODUCT_CATEGORY;
.......................................................................
--Q16. Find the total revenue (Total Amount) per gender.
--Expected output: Gender, Total_Revenue
SELECT gender,
      SUM(total_amount) as Total_revenue
FROM practical.sales.retail_sales
GROUP BY gender;
.......................................................................
--Q17. Find the average Price per Unit per product category.
--Expected output: Product Category, Average_Price
SELECT product_category,
      AVG(price_per_unit) as Average_price
FROM practical.sales.retail_sales
GROUP BY product_category;
.......................................................................
--Q18. Find the total revenue per product category where total revenue is greater than
--10,000.
--Expected output: Product Category, Total_Revenue
SELECT product_category,
      SUM(total_amount) as Total_revenue
FROM practical.sales.retail_sales
GROUP BY product_category
HAVING Total_revenue > 10000;
.......................................................................
--Q19. Find the average quantity per product category where the average is more than 2.
--Expected output: Product Category, Average_Quantity
SELECT product_category,
      AVG(quantity) as Avergae_Quantity
FROM practical.sales.retail_sales
GROUP BY product_category
HAVING Avergae_Quantity > 2;
.......................................................................
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000,
--otherwise 'Low'.
--Expected output: Transaction ID, Total Amount, Spending_Level
SELECT transaction_id,
       total_amount,
    CASE
      WHEN total_amount > 1000 THEN 'High'
      ELSE 'Low'
    END as Spending_Level
FROM practical.sales.retail_sales;    
.......................................................................

--Q21. Display a new column called Age_Group that labels customers as:
--• 'Youth' if Age < 30
--• 'Adult' if Age is between 30 and 59
--• 'Senior' if Age >= 60
--Expected output: Customer ID, Age, Age_Group
SELECT customer_id,
       age,
    CASE
      WHEN age < 30 THEN 'Youth'
      WHEN age BETWEEN 30 AND 59 THEN 'Adult'
      WHEN age >= 60 THEN 'Senior'
    END AS Age_Group
FROM practical.sales.retail_sales;     
