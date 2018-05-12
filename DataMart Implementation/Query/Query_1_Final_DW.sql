use Finance_DW;

SELECT TOTAL_YEAR.CalendarYear, ((COD_COUNT/Total_Count)*100) AS COD_percentage
		, ((CASH_COUNT/Total_Count)*100) AS CASH_percentage, ((CHARGE_COUNT/Total_Count)*100) AS CHARGE_percentage
FROM (SELECT d.CalendarYear, count(1) as COD_COUNT
		FROM Date d
		INNER JOIN sales_fact s
		ON d.Date_SK = s.SalesDate_SK
		INNER JOIN Method m
		ON s.Method_SK = m.Method_SK
		WHERE m.PaymentMethod = "cod" and s.Method_SK > 0
		GROUP BY d.CalendarYear) COD_YEAR,
	(SELECT d.CalendarYear, count(1) as CASH_COUNT
		FROM Date d
		INNER JOIN sales_fact s
		ON d.Date_SK = s.SalesDate_SK
		INNER JOIN Method m
		ON s.Method_SK = m.Method_SK
		WHERE m.PaymentMethod = "cash" and s.Method_SK > 0
		GROUP BY d.CalendarYear) CASH_YEAR,
	(SELECT d.CalendarYear, count(1) as CHARGE_COUNT
		FROM Date d
		INNER JOIN sales_fact s
		ON d.Date_SK = s.SalesDate_SK
		INNER JOIN Method m
		ON s.Method_SK = m.Method_SK
		WHERE m.PaymentMethod = "charge" and s.Method_SK > 0
		GROUP BY d.CalendarYear) CHARGE_YEAR,
	(SELECT d.CalendarYear, count(1) as Total_Count
		FROM Date d
		INNER JOIN sales_fact s
		ON d.Date_SK = s.SalesDate_SK
		WHERE s.Method_SK > 0
		GROUP BY d.CalendarYear) TOTAL_YEAR
WHERE COD_YEAR.CalendarYear = TOTAL_YEAR.CalendarYear and CHARGE_YEAR.CalendarYear = TOTAL_YEAR.CalendarYear and
CASH_YEAR.CalendarYear = TOTAL_YEAR.CalendarYear;
