/*
AUTHOR: Josh Olson
DATE: 06/02/2023
DESC: Final Project | Part 2
*/

/*
1. Get a list of employees who exceeded the average transaction amount from sales they generated during 2011-2012
2. Create a Commission Payout column that displays each employee's commission based on 15% of the sales transaction amount
3. Which employees made the highest commission?
4. List the customers that were served by the employee identified in the last question
5. Which customer made the highest purchase?
6. Look at this customer record, see anything suspicious?
7. Who can you conclude is our primary person of interest?
*/

--1. Get a list of employees who exceeded the average transaction amount from sales they generated during 2011-2012
SELECT
	e.FirstName,
	e.LastName,
	sum(i.total) AS [Total Sales]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	AND i.total > 11.66
GROUP BY
	e.FirstName,
	e.LastName
ORDER BY e.LastName

--2. Create a Commission Payout column that displays each employee's commission based on 15% of the sales transaction amount
SELECT
	e.FirstName,
	e.LastName,
	sum(i.total) AS [Total Sales],
	round(sum(i.total)*.15,2) AS [Commission Payout]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
GROUP BY
	e.FirstName,
	e.LastName
ORDER BY e.LastName

--3. Which employees made the highest commission? --> Jane Peacock at $106.21
--4. List the customers that were served by the employee identified in the last question
SELECT
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
	sum(i.total) AS [Total Sales],
	round(sum(i.total)*.15,2) AS [Commission Payout]
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
INNER JOIN
	Employee e
ON e.EmployeeId = c.SupportRepId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
	AND e.LastName = 'Peacock'
GROUP BY
	c.FirstName,
	c.LastName,
	e.FirstName,
	e.LastName
ORDER BY [Total Sales] DESC

--5. Which customer made the highest purchase?
--John Doeein  $1000.86

--6. Look at this customer record, see anything suspicious?
SELECT
	*
FROM
	Customer c
WHERE
	c.LastName = 'Doeein'
	
--7. Who can you conclude is our primary person of interest?
--Jane Peacock