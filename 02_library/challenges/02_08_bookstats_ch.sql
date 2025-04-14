-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

-- Report 1 - my solution this shows all the books in the db group by published year 
-- [wrong - should be distinct on title, there might be more than book with same title and same published year]
SELECT
    COUNT(b.BookID) AS Qty,
    --b.Title,
    b.Published
FROM 
    Books b
GROUP BY
    b.Published
ORDER BY
    Qty DESC,
    b.Published DESC,
    b.Title ASC 
;

SELECT * FROM Books ORDER BY Title;



SELECT
    Published,
    COUNT(DISTINCT(Title)) AS PubCount
FROM
    Books
GROUP BY
    Published
ORDER BY
    PubCount DESC;

SELECT
    COUNT(DISTINCT(Title)) AS PublishedCount
FROM
    Books;

SELECT
    COUNT(DISTINCT(Title)) pubCount,
    Published
FROM
    Books
GROUP BY 
    Published
ORDER BY
    pubCount DESC
    ;



-- report 2 - my solution 
SELECT
    Count(l.LoanID) AS LoanQty,
    --RANK() OVER (ORDER BY Count(l.loanID) DESC) AS Rank,
    DENSE_RANK() OVER (ORDER BY Count(l.loanID) DESC) AS Rank,
    b.Title,
    b.BookID
FROM
    Loans AS l 
    JOIN Books b ON b.BookID = l.BookID
GROUP BY
    b.Title
ORDER BY
    Rank,
    b.Title
    --LoanQty DESC
;

SELECT * FROM Loans WHERE BookID = 112;
SELECT * FROM Books WHERE Title ='The War of the Worlds';

-- new change on April 8th on mac

-- practice April 14th
SELECT 
    Title, Published 
FROM 
    Books
GROUP BY
    Title
ORDER BY 
    Title, Published;

-- number / distinct count of titles 
SELECT 
    COUNT(BookID) AS Qty,
    Title,
    Published 
FROM 
    Books
GROUP BY
    Title
ORDER BY
    Qty
;

-- report 1 Show how many titles were published in each year.
SELECT
    COUNT(DISTINCt(Title)) QtyPublished,
    Published
FROM
    Books
GROUP BY
    Published
ORDER BY
    QtyPublished DESC
;
