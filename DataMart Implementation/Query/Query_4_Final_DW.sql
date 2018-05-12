SELECT count(b.TotalSalesAmount) AS Rank, a.Customer_SK AS CustomerKey, a.CustomerName, a.TotalSalesAmount
FROM (SELECT c.CustomerName, c.Customer_SK, SUM(Sales_Amount) AS TotalSalesAmount
FROM sales_fact f, Customer c
WHERE f.Customer_SK = c.Customer_SK 
GROUP BY c.Customer_SK) a
JOIN
(SELECT c.CustomerName, c.Customer_SK,SUM(Sales_Amount) AS TotalSalesAmount
FROM sales_fact f, Customer c
WHERE f.Customer_SK = c.Customer_SK 
GROUP BY c.Customer_SK) b
WHERE a.TotalSalesAmount <= b.TotalSalesAmount
GROUP BY a.Customer_SK, a.CustomerName
ORDER BY a.TotalSalesAmount desc
LIMIT 5;
