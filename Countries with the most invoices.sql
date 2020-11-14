-- Which countries have the most Invoices?
--Use the Invoice table to determine the countries that have the most invoices. 
--Provide a table of BillingCountry and Invoices ordered by the number of invoices for each country. 
--The country with the most invoices should appear first.
SELECT BillingCountry, COUNT(InvoiceId) AS Total_Invoice_Id
FROM Invoice
GROUP BY BillingCountry
ORDER BY Total_Invoice_Id DESC;