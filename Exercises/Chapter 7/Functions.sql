/*
AUTHOR: Josh Olson
DATE: 06/01/2023
DESC: FUNCTIONS
*/

SELECT
	FirstName,
	LastName,
	Address,
	FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ' ' || State || ' ' || PostalCode AS [Mailing Address],
	length(PostalCode),
	substr(PostalCode, 1, 5) AS [5 Digit Postal Code],
	upper(FirstName) AS [First Name All caps],
	lower(LastName) AS [Last Name All lower]
FROM
	Customer
WHERE
	Country = 'USA'