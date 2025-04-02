-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(Loans);

SELECT * FROM Loans
WHERE ReturnedDate IS NULL
ORDER BY LoanID DESC
LIMIT 100;

-- Ward 7C room 34 -- Colonoscopy 

SELECT
    l.LoanID,
    l.DueDate,
    p.FirstName || ' ' || p.LastName AS Name,
    b.Title 
FROM 
    Loans l
    JOIN Patrons p ON p.PatronID = l.PatronID
    JOIN Books b ON b.BookID = l.BookID
WHERE 
    ReturnedDate IS NULL
    AND 
    DueDate = '2022-07-13'
ORDER BY 
    LoanID DESC
LIMIT 100;


-- my solution on the new course
SELECT
    l.DueDate,
    p.FirstName,
    p.EMAIL,
    b.Title 
FROM 
    Loans l
    JOIN Patrons p ON p.PatronID = l.PatronID
    JOIN Books b ON b.BookID = l.BookID
WHERE 
    ReturnedDate IS NULL
    AND 
    DueDate < '2024-09-01'
ORDER BY 
    DueDate DESC;

-- instructor solution
SELECT
    l.DueDate,
    p.FirstName,
    p.EMAIL,
    b.Title 
FROM 
    Loans l
JOIN
    Books b ON l.BookID = b.BookID
JOIN
    Patrons p ON l.PatronID = p.PatronID
WHERE
    l.DueDate <= '2024-09-01'
    AND l.ReturnedDate IS NULL
ORDER BY
    l.DueDate DESC;