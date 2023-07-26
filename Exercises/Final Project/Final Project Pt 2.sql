/*
AUTHOR: Josh Olson
DATE: 06/02/2023
DESC: Final Project | Part 2
*/

/*
1. Get a list of customers who made purchases between 2011-2012
2. Get a list of customers, sales reps, total transaction amounts for each customer between 2011-2012
3. How many transactions are above the average transaction amount during the same time?
4. What was the average transaction amount for each year that WSDA Music has been in business?
*/

--1. Get a list of customers who made purchases between 2011-2012
SELECT
	c.FirstName,
	c.LastName,
	i.total
FROM
	Invoice i
INNER JOIN
	Customer c
ON i.CustomerId = c.CustomerId
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
ORDER BY
	i.total DESC

--2. Get a list of customers, sales reps, total transaction amounts for each customer between 2011-2012
SELECT
	c.FirstName AS [Customer FN],
	c.LastName AS [Customer LN],
	e.FirstName AS [Employee FN],
	e.LastName AS [Employee LN],
	i.total
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
ORDER BY
	i.total DESC

--3. How many transactions are above the average transaction amount during the same time?
-- Find Average transaction amount between 2011 and 2012
SELECT
	round(avg(total),2) AS [Avg Transaction Amount]
FROM
	Invoice
WHERE
	InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
-- Get the number of transactions above the average transaction amount
SELECT
	count(total) AS [Num of Transactions Above Avg]
FROM
	Invoice
WHERE
	total >
			(
				SELECT
					round(avg(total),2) AS [Avg Transaction Amount]
				FROM
					Invoice
				WHERE
					InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
			)
	AND InvoiceDate >= '2011-01-01' AND InvoiceDate <= '2012-12-31'
			
--4. What was the average transaction amount for each year that WSDA Music has been in business?
SELECT
	round(avg(total),2) AS [Avg Transaction Amount],
	strftime('%Y',InvoiceDate) AS Year
FROM
	Invoice
GROUP BY
	strftime('%Y',InvoiceDate)