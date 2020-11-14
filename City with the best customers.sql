--Which city has the best customers?
--We would like to throw a promotional Music Festival in the city we made the most money. 
--Write a query that returns the 1 city that has the highest 
--sum of invoice totals. Return both the city name and the sum of all invoice totals.
SELECT BillingCity, SUM(Total) AS Total_Invoice
FROM Invoice
GROUP BY BillingCity
ORDER BY Total_Invoice DESC
LIMIT 1;