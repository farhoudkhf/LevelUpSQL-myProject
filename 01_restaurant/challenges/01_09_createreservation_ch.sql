-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

PRAGMA table_info(Reservations);

-- INSERT INTO Customers()


SELECT * 
FROM Customers 
WHERE Email = 'smac@kinetecoinc.com';

INSERT INTO Customers 
(FirstName, LastName, Email, Phone) VALUES 
('Sam', 'McAdams', 'smac@kinetecoinc.com', '(555) 555-1232');

SELECT * 
FROM Customers 
WHERE Email = 'smac@kinetecoinc.com';

INSERT INTO Reservations 
(CustomerID, Date, PartySize) VALUES 
(102, '2022-08-12 18:00:00', 5);

SELECT Customers.FirstName, Customers.LastName, Customers.Email, Reservations.Date, Reservations.PartySize 
FROM Customers 
JOIN Reservations ON Customers.CustomerID = Reservations.CustomerID 
WHERE Customers.Email = 'smac@kinetecoinc.com';




----------
-- Start - From the new course
----------
-- SQL request(s)​​​​​​‌‌​‌​​​​​‌​‌​​‌‌‌​​​‌​‌​​ below
INSERT INTO 
    Reservations
        (CustomerID,
        Date, 
        PartySize)
    VALUES (
        (SELECT CustomerID
        FROM Customers
        WHERE 
            FirstName = 'Cleo'
        AND 
            LastName = 'Goldwater'
        AND
            Email = 'cgoldwater15@landonhotel.com'    
        ),
        '2025-04-12 18:00:00',
        7
    );

SELECT c.FirstName, c.LastName, r.ReservationID, r.Date
FROM Reservations AS r, Customers AS c
WHERE c.CustomerID = 
    (
        SELECT CustomerID
        FROM Customers
        WHERE 
            FirstName = 'Cleo'
        AND 
            LastName = 'Goldwater'
    )
AND
    Date LIKE '2025-04-12%';

-- second SELECT with join
SELECT 
    ReservationID, FirstName, LastName, Date
FROM
    Reservations AS r
JOIN
    Customers AS c ON c.CustomerID = r.CustomerID
WHERE
    c.CustomerID = 
    (SELECT CustomerID
    FROM Customers
    WHERE Email = 'cgoldwater15@landonhotel.com')
ORDER BY ReservationID DESC
LIMIT 5;

--------
-- End - From the new course
--------

--------
-- Start, do not use
--------
INSERT INTO Customers(FirstName, LastName)
VALUES ('Farhoud', 'Khoshnoud') 
WHERE NOT EXISTS (
    SELECT * 
    FROM Customers
    WHERE Customers.FirstName = 'Farhoud'
);

SELECT * FROM Customers;

SELECT IIF(
    (SELECT COUNT(*) FROM Customers
        WHERE FirstName = 'Farhoud') > 0, 'Exist', 'Not Exist' ) 
        Result;


SELECT COUNT(*) FROM Customers
WHERE FirstName = 'Farhoud';

SELECT IIF(
    (SELECT COUNT(*) FROM Customers
        WHERE FirstName = 'Farhoud') > 0, 
        'Exist', 
        'not exist'
         ) 
    Result;

DELETE FROM Customers
WHERE FirstName = 'Farhoud';

------
-- End
------