-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT c.FirstName, c.LastName, res.Date, res.PartySize FROM Reservations AS res
JOIN Customers AS c ON c.CustomerID = res.CustomerID
WHERE 
    res.Date LIKE '%-06-14%'
AND
    c.LastName LIKE 'St%'
AND
    res.PartySize = 4;