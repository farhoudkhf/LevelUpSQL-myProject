-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

SELECT * 
FROM Loans
WHERE ReturnedDate IS NULL;

SELECT 
    l.*,
    b.Barcode,
    b.Title
FROM
    Loans l 
    JOIN Books b ON b.BookID = l.BookID
WHERE
    (b.Barcode = '6435968624' OR b.Barcode = '5677520613' OR b.Barcode = '8730298424')
    AND l.ReturnedDate IS NULL
ORDER BY 
    l.LoanID DESC;

-- my solution 
UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE LoanID IN 
    (
        SELECT l.LoanID
        FROM Loans l 
            JOIN Books b ON b.BookID = l.BookID
        WHERE
            (b.Barcode = '6435968624' OR b.Barcode = '5677520613' OR b.Barcode = '8730298424')
            AND l.ReturnedDate IS NULL
    );

-- test the filter
SELECT l.*, b.Title, b.Barcode
FROM Loans l 
    JOIN Books b ON b.BookID = l.BookID
WHERE
    (b.Barcode = '6435968624' OR b.Barcode = '5677520613' OR b.Barcode = '8730298424')
    AND l.ReturnedDate IS NULL;

-- test the result
SELECT l.*, b.Title, b.Barcode
FROM Loans l 
    JOIN Books b ON b.BookID = l.BookID
WHERE
    (b.Barcode = '6435968624' OR b.Barcode = '5677520613' OR b.Barcode = '8730298424')
    AND 
    l.ReturnedDate = '2022-07-05'
;

-- my solution on the new course
-- SQL request(s)​​​​​​‌‌​‌​​​‌​​​​‌‌​​‌‌​‌​​‌​​ below
UPDATE Loans
SET ReturnedDate = '2024-09-09'
WHERE LoanID IN 
    (
    SELECT l.LoanID
    FROM Loans l
    JOIN Books b ON b.BOOKID = l.BOOKID
    WHERE 
        (b.BARCODE = '6435968624'
        OR b.BARCODE = '5677520613'
        OR b.BARCODE = '8730298424')
        AND
        l.RETURNEDDATE IS NULL
    );

SELECT l.ReturnedDate, b.Barcode
FROM Loans l
    JOIN Books b ON b.BOOKID = l.BOOKID
WHERE b.Barcode IN 
    (6435968624, 5677520613, 8730298424)
    -- WHERE
    -- (b.BARCODE = '6435968624'
    -- OR b.BARCODE = '5677520613'
    -- OR b.BARCODE = '8730298424')
ORDER BY
    l.RETURNEDDATE DESC, b.Barcode DESC
LIMIT 8;


-- Instructor solution
UPDATE Loans
SET ReturnedDate = '2024-09-09'
WHERE BookID = 
    (SELECT BookID FROM Books WHERE Barcode = '6435968624')
    AND RETURNEDDATE IS NULL;

UPDATE Loans
SET ReturnedDate = '2024-09-09'
WHERE BookID = 
    (SELECT BookID FROM Books WHERE Barcode = '5677520613')
    AND RETURNEDDATE IS NULL;

UPDATE Loans
SET ReturnedDate = '2024-09-09'
WHERE BookID = 
    (SELECT BookID FROM Books WHERE Barcode = '8730298424')
    AND RETURNEDDATE IS NULL;

SELECT l.ReturnedDate, b.Barcode
FROM Loans l
    JOIN Books b ON b.BOOKID = l.BOOKID
WHERE 
    b.Barcode IN (6435968624, 5677520613, 8730298424)
ORDER BY 
    l.RETURNEDDATE DESC, b.Barcode DESC
LIMIT 8; 