--We want to find out the most popular music Genre for each country. 
--We determine the most popular genre as the genre with the highest amount of purchases. 
--Write a query that returns each country along with the top Genre. 
--For countries where the maximum number of purchases is shared return all Genres.
--For this query, you will need to use the Invoice, InvoiceLine, Customer, Track, and Genre tables.
WITH table_1 AS
(SELECT I.BillingCountry AS Country_Name, G.Name AS Genre_Name, COUNT(I.InvoiceId) AS Purchases
FROM Invoice I
JOIN InvoiceLine IL
ON I.InvoiceId = IL.InvoiceId
JOIN Track T
ON IL.TrackId = T.TrackId
JOIN Genre G
ON T.GenreId = G.GenreId
GROUP BY Country_Name, Genre_Name
ORDER BY Country_Name, Purchases DESC)


SELECT t1.Country_Name, t1.Genre_Name, t2.Max_Purchases 
FROM table_1 t1
JOIN
	(SELECT Country_Name, Genre_Name, MAX(Purchases) AS Max_Purchases
	FROM table_1
	GROUP BY Country_Name)t2
ON t1.Country_Name = t2.Country_Name
WHERE t1.Purchases = t2.Max_Purchases
ORDER BY Max_Purchases DESC; 