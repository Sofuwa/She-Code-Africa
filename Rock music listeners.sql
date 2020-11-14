--Use your query to return the email, first name, last name, and Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email address starting with A.
SELECT Email, FirstName, LastName, G.Name AS Genre_Name
FROM Customer
JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
JOIN InvoiceLine
ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track
ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre G
ON Track.GenreId = G.GenreId
WHERE Genre_Name == 'Rock'
GROUP BY Email
ORDER BY Email ASC;