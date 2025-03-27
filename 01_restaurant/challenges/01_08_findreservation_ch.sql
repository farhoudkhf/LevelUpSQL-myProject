-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

SELECT c.FirstName, c.LastName, res.Date, res.PartySize FROM Reservations AS res
JOIN Customers AS c ON c.CustomerID = res.CustomerID
WHERE 
    res.Date LIKE '%-06-14%'
AND
    c.LastName LIKE 'St%'
AND
    res.PartySize = 4;


-- Report on range of dates
SELECT Date, FirstName, LastName, PartySize
FROM Reservations AS r
JOIN Customers AS c ON c.CustomerID = r.CustomerID
WHERE Date >= '2024-06-09' 
    AND Date <='2024-06-15'
ORDER BY Date;


SELECT 
    r.Date, 
    c.FirstName, 
    c.LastName, 
    r.PartySize
FROM 
    Reservations AS r
JOIN 
    Customers AS c ON c.CustomerID = r.CustomerID
WHERE 
    r.Date 
    BETWEEN '2024-06-09' AND '2024-06-15'
ORDER BY 
    r.Date ASC;