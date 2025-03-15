-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

SELECT * FROM AnniversaryAttendees;

-- get table info
PRAGMA table_info(AnniversaryAttendees);

INSERT INTO AnniversaryAttendees (CustomerID, PartySize)
VALUES (
    (SELECT CustomerID
    FROM Customers
    WHERE Email = 'atapley2j@kinetecoinc.com'),
    3
);

SELECT CustomerID
FROM Customers
WHERE Email = 'atapley2j@kinetecoinc.com';

DELETE FROM AnniversaryAttendees AS AA
WHERE AA.CustomerID = 92 AND AA.PartySize = 3;