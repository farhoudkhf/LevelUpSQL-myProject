-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

SELECT 
    Title,
    BookID
    --Count(*) 
FROM 
    Books
WHERE
    Title LIKE '%Dracula%';

SELECT * FROM Books;
SELECT * FROM Loans WHERE ReturnedDate IS NULL;

-- number of books with title like '%Dracula%' that is on loan and has not been returned yet
SELECT 
    COUNT(b.Title)
FROM
    Books b
JOIN
    Loans l ON l.BookID = b.BookID
WHERE
    b.Title LIKE '%Dracula%'
    AND
    ReturnedDate IS NULL;


-- number of available books to loan [mySolution]
SELECT
    COUNT(BookID) - 
    (
        SELECT 
            COUNT(b.Title)
        FROM
            Books b
        JOIN
            Loans l ON l.BookID = b.BookID
        WHERE
            b.Title LIKE '%Dracula%'
            AND
            ReturnedDate IS NULL
    ) AS NumOfAvailables
FROM
    Books
WHERE
    Title LIKE '%Dracula%';

-- Solution from the course
SELECT
    (
        SELECT COUNT(*)
        FROM Books
        WHERE Title = 'Dracula'
    ) -
    (
        SELECT COUNT(b.Title)
        FROM Books b
        JOIN Loans l ON l.BookID = b.BookID
        WHERE b.Title LIKE '%Dracula%'
        AND ReturnedDate IS NULL
    ) AS AvailableCopies;
