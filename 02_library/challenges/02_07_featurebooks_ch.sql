-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

-- my solution 
SELECT
    --DISTINCT(b.Title),
    -- b.BookID,
    b.Title,
    b.Author,
    b.Published
FROM 
    Books b
    JOIN Loans l ON l.BookID = b.BookID
WHERE 
    b.Published BETWEEN 1890 AND 1899
    AND
    l.ReturnedDate IS NOT NULL
ORDER BY
    b.Published DESC, b.Title ASC, b.Author ASC;


-- Practice 
SELECT 
    DISTINCT(b.BookID),
    COUNT(b.BookID),
    b.Title 
FROM 
    Books b
    JOIN Loans l ON l.BookID = b.BookID
WHERE
    l.ReturnedDate IS NOT NULL
    AND
    b.Published BETWEEN 1890 AND 1899
GROUP BY
    b.BookID
ORDER BY
    Title;

-- my solution, correct [Complete]
SELECT 
    COUNT(b.BookID) AS QTY,
    b.Title
FROM 
    Books b
WHERE 
    b.Published BETWEEN 1890 AND 1899
    AND
    b.BookID NOT IN
        (SELECT l.BookID FROM Loans l WHERE l.ReturnedDate IS NULL)
GROUp BY
    b.Title
ORDER BY
    QTY,
    B.Title
;

-- course sol
SELECT Title, Barcode
FROM Books
WHERE Published BETWEEN 1890 AND 1899
AND (BookID NOT IN 
  (SELECT BookID 
  FROM Loans 
  WHERE ReturnedDate IS NULL)) 
ORDER BY Title;

-- instructor solution
SELECT
    COUNT(Title) AS Qty,
    Title
FROM
    Books
WHERE
    Published BETWEEN 1890 AND 1899
    AND
    (BookID NOT IN 
        (SELECT BookID FROM Loans WHERE ReturnedDate IS NULL)
    )
GROUP BY
    Title
ORDER BY
    QTY ASC,
    Title ASC;