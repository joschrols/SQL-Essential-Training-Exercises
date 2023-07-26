/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: Subqueries and DISTINCT | Which tracks are not selling?
*/

SELECT
	TrackId,
	Composer,
	Name
FROM
	Track
WHERE
	TrackId NOT IN
(SELECT
	DISTINCT
	TrackId
FROM
	InvoiceLine
ORDER BY
	TrackId)