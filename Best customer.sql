--Who is the best customer?
--The customer who has spent the most money will be declared the best customer. 
--Build a query that returns the person who has spent the most money
SELECT C.CustomerId, (FirstName||' '|| LastName) AS Full_Name, SUM(Total) AS Total_Money_Spent
FROM Customer C
JOIN Invoice I
ON I.CustomerId = C.CustomerId
GROUP BY C.CustomerId
ORDER BY Total_Money_Spent DESC
LIMIT 1;