-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

-- Schema Info
SELECT name FROM sqlite_schema
WHERE type='table';

-- SHOW COLUMNS FROM Reservations;

SELECT * FROM Reservations;


SELECT * FROM Customers WHERE FirstName = 'Norby';

SELECT * FROM Reservations
WHERE Date IS NULL;

SELECT * FROM Reservations
JOIN Customers ON Customers.CustomerID = Reservations.CustomerID
WHERE Reservations.CustomerID = 64;

SELECT ReservationID, Date FROM Reservations
JOIN Customers ON Customers.CustomerID = Reservations.CustomerID
WHERE Customers.FirstName = 'Norby'
AND Reservations.Date > '2022-07-24';

UPDATE Reservations SET Date = Null WHERE ReservationID = 2000;

-- DELETE FROM Reservations
-- WHERE ReservationID = 2000;