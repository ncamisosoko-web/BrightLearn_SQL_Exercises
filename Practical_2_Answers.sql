--1. INNER JOIN: Orders with Customer and Product Names
--Question:1
--List all orders along with the customer name and product name.
--Expected Output Columns:
--• OrderID, OrderDate, CustomerName, ProductName, Quantity
SELECT O.ORDERID,
       O.ORDERDATE,
       C.CUSTOMERNAME,
       P.PRODUCTNAME,
       O.QUANTITY
FROM PACTICAL_2.JOINS.CUSTOMER AS C
INNER JOIN PACTICAL_2.JOINS.ORDERS As O
ON C.CUSTOMERID= O.CUSTOMERID
INNER JOIN PACTICAL_2.JOINS.PRODUCT AS P
ON O.PRODUCTID= P.PRODUCTID;

................................................................................

--2. INNER JOIN: Customers Who Placed Orders
--Question:
--Which customers have placed at least one order?
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate
SELECT C.CustomerID,
       C.CustomerName,
       C.Country,
       O.OrderID,
       O.OrderDate
FROM pactical_2.joins.customer AS C
INNER JOIN PACTICAL_2.JOINS.ORDERS AS O
ON O.CUSTOMERID = O.CUSTOMERID
WHERE quantity >= 1;

................................................................................
--3. LEFT JOIN: All Customers and Their Orders
--Question:
--List all customers and any orders they might have placed. Include customers who have
--not placed any orders.
--Expected Output Columns:
• --CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT C.CustomerID,
       C.CustomerName,
       C.Country,
       O.OrderID,
       O.OrderDate,
       P.PRODUCTID,
       O.QUANTITY    
FROM PACTICAL_2.JOINS.CUSTOMER AS C
LEFT JOIN PACTICAL_2.JOINS.ORDERS As O
ON C.CUSTOMERID= O.CUSTOMERID
LEFT JOIN PACTICAL_2.JOINS.PRODUCT AS P
ON O.PRODUCTID= P.PRODUCTID;       

................................................................................
--4. LEFT JOIN: Product Order Count
--Question:
--List all products and how many times each was ordered (if any).
--Expected Output Columns:
--• ProductID, ProductName, TotalOrders
--(TotalOrders is the count of how many times the product appears in orders)

SELECT COUNT(o.productID) as TotalOrders,
              p.productid,
              p.productname
FROM pactical_2.joins.product as p
LEFT JOIN pactical_2.joins.orders as O
ON p.productid = o.productid
GROUP BY ALL
            
................................................................................
--Question:
--Find all orders along with product details, including any products that might not have
--been ordered.
--Expected Output Columns:
--• OrderID, OrderDate, ProductID, ProductName, Price, Quantity
SELECT o.orderID,
       o.orderdate,
       p.productid,
       p.productname,
       p.price,
       o.quantity
FROM pactical_2.joins.product as p
RIGHT JOIN pactical_2.joins.orders as O
ON p.productid = o.productid;
................................................................................
--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question:
--Which customers have made orders, and include customers even if they have never
--placed an order.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity
SELECT C.CustomerID,
       C.CustomerName,
       C.Country,
       O.OrderID,
       O.OrderDate,
       O.PRODUCTID,
       O.QUANTITY    
FROM PACTICAL_2.JOINS.CUSTOMER AS C
RIGHT JOIN PACTICAL_2.JOINS.ORDERS As O
ON C.CUSTOMERID= O.CUSTOMERID;

................................................................................
--7. FULL OUTER JOIN: All Customers and All Orders
--Question:
--List all customers and orders, showing NULLs where customers have not ordered or
--where orders have no customer info.
--Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity
SELECT C.CustomerID,
       C.CustomerName,
       C.Country,
       O.OrderID,
       O.OrderDate,
       O.PRODUCTID,
       O.QUANTITY    
FROM PACTICAL_2.JOINS.CUSTOMER AS C
FULL OUTER JOIN PACTICAL_2.JOINS.ORDERS As O
ON C.CUSTOMERID= O.CUSTOMERID;
................................................................................
--8. FULL OUTER JOIN: All Products and Orders
--Question:
--List all products and orders, showing NULLs where products were never ordered or
--orders are missing product info.
--Expected Output Columns:
--• ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity
SELECT p.productID,
       p.productname,
       p.price,
       o.orderID,
       o.orderDate,
       o.customerid,
       o.Quantity
FROM pactical_2.joins.product as p
FULL OUTER JOIN pactical_2.joins.orders as o
ON p.productid= o.productid;
