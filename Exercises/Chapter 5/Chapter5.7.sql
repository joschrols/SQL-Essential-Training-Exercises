/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: How many invoices were billed in cities that have a B anywhere in its name?
*/

-- % I don't care what comes next

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	BillingCity LIKE '%B%'
ORDER BY
	InvoiceDate