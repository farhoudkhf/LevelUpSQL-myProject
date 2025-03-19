-- Generate a list of customer information.

-- Show their first name, last name, and email address.
-- Sort the list of results by last name.

SELECT FirstName AS Name, LastName AS Surname, Email 
FROM customers
ORDER BY LastName, FirstName ASC;

SELECT FirstName, LastName, Email 
FROM Customers
ORDER BY LastName;