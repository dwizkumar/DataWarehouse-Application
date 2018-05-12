SELECT a.Year AS Current_Year,a.First_Supplier,a.FirstSup_GrossProfit as Current_Year_Profit,b.SecondSup_GrossProfit as Last_Year_Profit
FROM (SELECT d.CalendarYear AS Year, s.SupplierName AS First_Supplier, sum(Sales_Amount-Total_Amount) AS FirstSup_GrossProfit
		FROM Supplier s, sales_fact f, Date d
		WHERE s.Supplier_SK = f.Supplier_SK
		AND d.Date_SK = f.SalesDate_SK
		GROUP BY d.CalendarYear,s.SupplierName) a 
		JOIN
		(SELECT d.CalendarYear AS Year, s.SupplierName AS Second_Supplier, sum(Sales_Amount-Total_Amount) AS SecondSup_GrossProfit
		FROM Supplier s, sales_fact f, Date d
		WHERE s.Supplier_SK = f.Supplier_SK
		AND d.Date_SK = f.SalesDate_SK
		GROUP BY d.CalendarYear,s.SupplierName) b 
WHERE a.First_Supplier = b.Second_Supplier
AND a.Year = b.Year - 1;
