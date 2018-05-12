SELECT m.OrderMethod AS FrequentOrderMethod,
COUNT(f.InvoiceID_DD) AS Frequency
FROM sales_fact f
INNER JOIN Method m
ON m.Method_SK = f.Method_SK
WHERE  f.Division = 'PEC'
GROUP BY  m.OrderMethod
ORDER BY Frequency DESC
LIMIT 3;
