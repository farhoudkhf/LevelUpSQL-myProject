-- Add a customer to the restaurant's loyalty program.

-- Use the following information to create a record:
-- Anna Smith (asmith@samoca.org)
-- 479 Lapis Dr., Memphis, TN
-- Phone: (555) 555-1212; Birthday: July 21, 1973

-- Schema info
SELECT name FROM sqlite_schema
WHERE type='table';

-- Table info
PRAGMA table_info('Customers');

SELECT * FROM Customers;

INSERT INTO Customers(FirstName, LastName, Email, Address, City, State, Phone, Birthday)
VALUES('Anna', 'Smith', 'asmith@samoca.org', '479 Lapis Dr.', 'Memphis', 'TN', '555-555-1212', '1973-07-21');

SELECT * FROM Customers
WHERE FirstName = 'Anna';

-- DELETE FROM Customers
-- WHERE CustomerID = 103 AND FirstName = 'Anna';


INSERT INTO Customers (FirstName, LastName, Email, Address, City, State, Phone, Birthday)
VALUES ('Anna', 'Smith', 'asmith@samoca.org', '479 Lapis Dr.', 'Memphis', 'TN', '555-555-1212', '1973-07-21');

SELECT * FROM Customers
ORDER BY CustomerID DESC
LIMIT 5;

