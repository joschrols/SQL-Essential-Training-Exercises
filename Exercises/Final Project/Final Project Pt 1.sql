/*
AUTHOR: Josh Olson
DATE: 06/02/2023
DESC: Final Project | Part 1
*/

-- 1. How many transactions took place between 2011-2012?
/*SELECT
	COUNT(*)
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	*/

-- 2. How much money did WSDA Music make during the same period?
SELECT
	SUM(total) 
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'