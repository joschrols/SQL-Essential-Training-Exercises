/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Grouping by more than one field at a time | What are the average invoice totals by billing country and city?
*/

SELECT
	BillingCountry,
	BillingCity, -- non-aggregated field
	ROUND(AVG(total), 2) -- aggregated field
FROM
	Invoice
GROUP BY	-- Group by non-aggregated field
	BillingCountry,
	BillingCity
ORDER BY
	BillingCountry