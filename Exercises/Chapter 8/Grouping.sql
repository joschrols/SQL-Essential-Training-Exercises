/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Grouping in SQL | What are the average invoice totals greater than $5.00 for cities starting with B?
*/

SELECT
	BillingCity, -- non-aggregated field
	ROUND(AVG(total), 2) -- aggregated field
FROM
	Invoice
WHERE
	BillingCity LIKE 'B%'
GROUP BY	-- Group by non-aggregated field
	BillingCity
HAVING
	AVG(total) > 5
ORDER BY
	BillingCity