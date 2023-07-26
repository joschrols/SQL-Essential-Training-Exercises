/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: JOINS- JOINS on more than two tables | What employees are responsible for the 10 highest individual sales?
*/

SELECT
	e.FirstName AS 'Employee First Name',
	e.LastName AS 'Employee Last Name',
	e.EmployeeId,
	c.FirstName AS 'Customer First Name',
	c.LastName AS 'Customer Last Name',
	c.SupportRepId,
	i.CustomerId,
	i.total
FROM
	Invoice AS i
INNER JOIN
	Customer AS c
ON
	i.CustomerId = c.CustomerId
INNER JOIN
	Employee AS e
ON
	c.SupportRepId = e.EmployeeId
ORDER BY
	i.total DESC
LIMIT 10