-- Chall_02-01 Practice
SELECT * 
FROM Books
WHERE Title LIKE '%racul%';

SELECT *
FROM Loans
WHERE BookID IN 
    (
        SELECT BookID 
        FROM Books
        WHERE Title LIKE '%racul%'
    )
    AND 
    ReturnedDate IS NULL
ORDER BY BookID
;

SELECT COUNT(*)
FROM Books
WHERE Title LIKE '%racul%'
;


SELECT
(SELECT COUNT(*)
FROM Books
WHERE Title LIKE '%racul%')
-
(SELECT count(*)
FROM Loans
WHERE BookID IN
    (
        SELECT BookID 
        FROM Books
        WHERE Title LIKE '%racul%'
    )
    AND
    ReturnedDate IS NULL)
AS numOfAvailable
;

SELECT COUNT(*) 
FROM Loans 
WHERE 
    ReturnedDate IS NULL
    AND
    BookID IN 
    (
        SELECT BookID 
        FROM Books
        WHERE Title LIKE '%racul%'
    )
;

-- Chall_02-02 Practice 
SELECT * FROM Books ORDER BY BookID DESC;

-- Chall_02_06 Practice
SELECT COUNT(l.PatronID) AS loanCount, l.PatronID, p.FirstName
FROM 
    Loans l
    JOIN Patrons p ON p.PatronID = l.PatronID
GROUP BY l.PatronID
ORDER BY loanCount
;

-- Chall_02_08
SELECT Published, COUNT(DISTINCT(Title)) AS pubCount
FROM Books
GROUP BY Published
ORDER BY pubCount DESC
;

SELECT 
    Published, 
    COUNT(DISTINCT(Title)) AS pubCount,
    GROUP_CONCAT(DISTINCT(Title)) AS titles
FROM Books
GROUP BY Published
ORDER BY pubCount DESC
;