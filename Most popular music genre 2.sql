--this SELECT gets only the highest purchased genre for each country, 
--that is why I did 'max(count)' to get the maximum of the count
SELECT 
  Country, 
  Name, 
  GenreId, 
  MAX(count) as max_count
  --the SELECT below is what gets the value you need which is the country name and their total purchase, 
  --but if i do only the above SELECT it will give the value of all the genres but what i need is only the highest, 
  --which is where the subquery comes in hence the select above
  --this second SELECT is what the first select statement will draw from.
FROM(SELECT
  c.Country,
  g.Name,
  g.GenreId,
  Count(*) as count
FROM Customer c
JOIN Invoice
  ON c.CustomerId = Invoice.CustomerId
JOIN InvoiceLine
  ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track
  ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre g
  ON Track.GenreId = g.GenreId
GROUP BY c.Country, g.Name) sub GROUP BY Country