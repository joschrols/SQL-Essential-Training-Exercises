/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: JOINS- LEFT OUTER
*/

SELECT
	i.InvoiceId,
	i.CustomerId,
	c.LastName,
	c.FirstName,
	i.InvoiceDate,
	i.BillingAddress,
	i.total
FROM
	Invoice AS i
LEFT OUTER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
ORDER BY
	i.InvoiceId