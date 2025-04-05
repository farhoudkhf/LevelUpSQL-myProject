-- Prepare a report of the library patrons
-- who have checked out the fewest books.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

SELECT COUNT(l.LoanID) AS CountLoans, l.PatronID, p.FirstName, p.Email
FROM Loans l 
    JOIN Patrons p ON p.PatronID = l.PatronID
WHERE l.LoanDate LIKE '2022-%'
GROUP BY p.PatronID
HAVING CountLoans < 15
ORDER BY Count(*) ASC;

-- SELECT Count(*) FROM Patrons;
-- SELECT * FROM Patrons WHERE PatronID = 83;
-- SELECT * FROM Loans WHERE PatronID = 83;

-- my solution for the new course
SELECT 
    Count(l.LOANID) AS LoanCount,
    p.Firstname,
    p.Email
FROM 
    Loans l
    JOIN Patrons p ON p.PATRONID = l.PatronID
WHERE
    l.LOANDATE LIKE '2024-%'
    -- l.LOANDATE BETWEEN '2024-01-01'
    -- AND '2024-12-31'
GROUP BY 
    l.PatronID
HAVING  
    LoanCount = 1
ORDER BY
    p.FIRSTNAME ASC
;

-- test results 
SELECT * FROM Loans 
WHERE LoanDate LIKE '2020-%'
ORDER BY LoanDate DESC;

-- Solution from instructor 
SELECT 
    COUNT(l.loanID) AS LoanCount,
    p.FirstName,
    p.Email
From
    Loans l 
    JOIN Patrons p ON l.PatronID = p.PatronID
WHERE 
    l.LoanDate BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    l.PatronID
HAVING
    LoanCount = 1
ORDER BY
    p.FirstName;
