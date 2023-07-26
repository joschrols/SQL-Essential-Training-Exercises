/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Returning multiple values from a subquery
*/

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity
FROM
	Invoice
WHERE
	InvoiceDate IN
(SELECT
	InvoiceDate
FROM
	Invoice
WHERE
	InvoiceId IN (251,252,254))