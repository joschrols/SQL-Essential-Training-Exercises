/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Subqueries in the SELECT | How is each individual city performing against the global average sales?
*/

SELECT
	BillingCity,
	AVG(total) AS [City Average],
	(SELECT AVG(total) FROM Invoice) AS [Global Average]
FROM
	Invoice
GROUP BY
	BillingCity
ORDER BY 
	BillingCity