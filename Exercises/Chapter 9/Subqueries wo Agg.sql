/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Subqueries without aggregate functions
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate >
(SELECT
	InvoiceDate
FROM
	Invoice
WHERE
	InvoiceId = 251)
ORDER BY
	InvoiceDate