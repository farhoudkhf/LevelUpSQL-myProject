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

-- Chall_02-02 Practice 


