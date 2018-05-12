SELECT Customer.CustomerType, sum(sales_fact.Sales_Amount) as Sales_Amount,
Date.CalendarYear, avg(NULLIF(sales_fact.Number_of_days,0)) as Average_Number_Of_Day_To_Process
FROM sales_fact
INNER JOIN Customer
ON Customer.Customer_SK = sales_fact.Customer_SK
INNER JOIN Date
ON Date.Date_SK = sales_fact.SalesDate_SK
GROUP BY Date.CalendarYear, Customer.CustomerType;
