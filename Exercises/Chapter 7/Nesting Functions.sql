/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Nesting Fuctions
*/

SELECT
	SUM(total) AS [Total Sales],
	ROUND(AVG(total), 2) AS [Average Sales],
	MAX(total) AS [Maximum Sale],
	MIN(total) AS [Minimum Sale],
	COUNT(*) AS [Sales Count]
FROM
	Invoice