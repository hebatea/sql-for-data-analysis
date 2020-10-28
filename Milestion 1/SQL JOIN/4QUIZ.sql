-- The Chinook database contains all invoices from the beginning of 2009 till the end of 2013.
-- The employees at Chinook store are interested in seeing all invoices that happened in 2013 only. 
-- Using the Invoice table, write a query that returns all the info of the invoices in 2013.

SELECT * 
FROM Invoice i
WHERE i.InvoiceDate BETWEEN '2013-01-01' AND '2014-01-01';


-- Q2 The Chinook team decided to run a marketing campaign in Brazil, Canada, india, and Sweden. 
-- Using the customer table, write a query that returns the first name, last name, 
-- and country for all customers from the 4 countries.

SELECT firstName, lastName, country
FROM customer
WHERE country IN ('Brazil', 'Canada', 'India', 'Sweden')

-- Q3 Using the Track and Album tables, write a query that returns all the songs that start 
-- with the letter 'A' and the composer field is not empty. 
-- Your query should return the name of the song, the name of the composer, and the title of the album.

SELECT t.name, t.composer, a.title
FROM Track t
JOIN Album a
ON t.albumId = a.albumId
WHERE t.nameL IKE 'A%' AND t.composer != '';

SELECT t.name as song_name, t.composer, a.title
FROM Track t
JOIN Album a
ON t.AlbumId = a.AlbumId
AND t.name LIKE 'A%' AND t.composer != '';

-- Q4 The Chinook team would like to throw a promotional Music Festival 
-- for their top 10 customers who have spent the most in a single invoice. 
-- Write a query that returns the first name, last name,
-- and invoice total for the top 10 invoices ordered by invoice total descending."

SELECT c.firstName, c.lastName, i.total
FROM Invoice i 
JOIN customer c
ON c.customerId = i.customerId
LIMIT 10
ORDER BY i.total DESC

