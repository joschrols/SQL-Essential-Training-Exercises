/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Aggregate Functions | What are our all time global sales?
*/

SELECT
	SUM(total) AS [Total Sales],
	AVG(total) AS [Average Sales],
	MAX(total) AS [Maximum Sale],
	MIN(total) AS [Minimum Sale],
	COUNT(*) AS [Sales Count]
FROM
	Invoice