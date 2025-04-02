-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(Patrons);

SELECT * FROM Patrons;

SELECT * FROM Loans ORDER BY LoanID DESC LIMIT 100;


-- Solution insert 2 records
INSERT INTO Loans 
    (BookID, PatronID, LoanDate, DueDate)
VALUES
    (
        (
            SELECT BookID
            FROM Books
            WHERE 
            (Title = 'The Picture of Dorian Gray' AND Barcode = '2855934983')
        ),
        (
            SELECT PatronID 
            FROM Patrons 
            WHERE Email = 'jvaan@wisdompets.com'
                AND FirstName = 'Jack'
                AND LastName ='Vaan'
        ),
        '2022-08-25',
        '2022-09-08'
    ),
    (
        (
            SELECT BookID
            FROM Books
            WHERE 
            (Title = 'Great Expectations' AND Barcode = '4043822646')
        ),
        (
            SELECT PatronID 
            FROM Patrons 
            WHERE Email = 'jvaan@wisdompets.com'
                AND FirstName = 'Jack'
                AND LastName ='Vaan'
        ),
        '2022-08-25',
        '2022-09-08'
    );

SELECT PatronID 
FROM Patrons 
WHERE Email = 'jvaan@wisdompets.com'
AND FirstName = 'Jack'
AND LastName ='Vaan';

SELECT BookID
FROM Books
WHERE 
    (Title = 'The Picture of Dorian Gray' AND Barcode = '2855934983')
    OR
    (Title = 'Great Expectations' AND Barcode = '4043822646');

SELECT *
FROM Books
WHERE 
    (Title = 'The Picture of Dorian Gray' AND Barcode = '2855934983')
    OR
    (Title = 'Great Expectations' AND Barcode = '4043822646');

-- Solution report
SELECT 
    l.LoanID, 
    p.PatronID,
    p.FirstName || ' ' || p.LastName AS Name,
    l.BookID, 
    b.Title, 
    l.LoanDate, 
    l.DueDate, 
    b.Barcode
FROM Loans l
JOIN Books b ON b.BookID = l.BookID 
JOIN Patrons p ON p.PatronID = l.PatronID
WHERE l.PatronID = 
    (SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com')
ORDER BY LoanID DESC;


-- From the new course (my solution) same as the course solution
INSERT INTO Loans 
    (BookID, PatronID, LoanDate, DueDate)
VALUES
    (
        (SELECT BookID FROM Books WHERE Barcode = '2855934983'),
        (SELECT PatronID FROM Patrons WHERE 
            Email = 'jvaan@wisdompets.com'
            AND FirstName = 'Jack'
            AND LastName ='Vaan'
        ),
        '2024-08-25',
        '2024-09-08'
    ),
    (
        (SELECT BookID FROM Books WHERE Barcode = '4043822646'),
        (SELECT PatronID FROM Patrons WHERE 
            Email = 'jvaan@wisdompets.com'
            AND FirstName = 'Jack'
            AND LastName ='Vaan'
        ),
        '2024-08-25',
        '2024-09-08'
    );

SELECT LoanID, b.Title, DueDate, ReturnedDate
FROM Loans l
JOIN Books b ON b.BOOKID = l.BookID
WHERE l.PatronID = (SELECT PatronID FROM Patrons WHERE Email = 'jvaan@wisdompets.com')
ORDER BY LoanID DESC;