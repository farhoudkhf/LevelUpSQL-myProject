-- CREATE TABLE emp
-- (empID INT not NULL PRIMARY KEY, 
-- emp_name TEXT NOT NULL, emp_Email NOT NULL);

-- INSERT  INTO emp(empID, emp_name, emp_Email)
-- VALUES(9111, "siah", "siah@siaha.com")

CREATE TABLE MyCalendar
(day_date DATE not NULL PRIMARY KEY, 
day_name TEXT NOT NULL, day_activity TEXT);

INSERT INTO MyCalendar(day_date, day_name, day_activity)
VALUES(date('now','localtime'), 'Friday', 'TEST_02 using the local date');

-- get table info
PRAGMA table_info(emp2);

ALTER TABLE emp2
RENAME COLUMN FirsName to FirstName;

ALTER TABLE emp2
ADD email varchar(255) NOT NULL;

ALTER TABLE emp2
ALTER COLUMN LastName TEXT NOT Null;

ALTER TABLE emp2
DROP COLUMN emp_Email;

INSERT INTO emp2(empID, FirstName, LastName,  email) 
VALUES(9111, "Xx", "Yy", "xx.yy@test.co.uk");

SELECT * FROM emp2;

IF(SELECT COUNT(*) FROM 

SELECT exists(SELECT 1 FROM emp2 WHERE email = 'OzxbcwfEnuehjy@gmail.com') AS row_exists;


SELECT 
    CASE
        WHEN EXISTS (SELECT 1 FROM emp2 WHERE email = 'Ozxbcwf..Enuehjy@gmail.com') 
        THEN 'Exist'
        ELSE 'Does not'
    END;


SELECT 
    CASE
        WHEN (SELECT COUNT(email) FROM emp2 WHERE email = 'Ozxbcwf..Enuehjy@gmail.com')=0
        THEN 
            
        ELSE 'Does not'
    END;


INSERT INTO emp2(empID, FirstName, LastName,  email) 
VALUES(9112, "Ozxbcwf","Enuehjy","Ozxbcwf.Enuehjy@gmail.com");
INSERT INTO emp2(empID, FirstName, LastName,  email) 
VALUES(9113, "Kmadwbc","Jfqqbezpxc","Kmadwbc.Jfqqbezpxc@live.com");

IF NOT EXISTS(SELECT email from emp2 where email="Ozxbcwf.Enuehjy@gmail.com")
    BEGIN
        INSERT INTO emp2(empID, FirstName, LastName,  email) 
        VALUES(9112, "Ozxbcwf","Enuehjy","Ozxbcwf.Enuehjy@gmail.com")
    END;

SELECT EXISTS(SELECT email from emp2 where email="Ozxbcwf.Enuehjy@gmail.com")

-- "if" didn't work
IF (SELECT COUNT(email) from emp2 where email="Ozxbcwf.Enuehjy@gmail.com")=1
BEGIN
'exist'
END;

IF (SELECT COUNT(email) from emp2 where email="Ozxbcwf.Enuehjy@gmail.com")
    BEGIN
        INSERT INTO emp2(empID, FirstName, LastName,  email) 
        VALUES(9112, "Ozxbcwf","Enuehjy","Ozxbcwf.Enuehjy@gmail.com")
    END;

SELECT name FROM sqlite_schema
WHERE type='table';

SELECT CURRENT_DATE;

SELECT date('now','localtime');

-- SELECT 
--     name
-- FROM 
--     sqlite_schema
-- WHERE 
--     type ='table' AND 
--     name NOT LIKE 'sqlite_%';

SELECT * FROM emp;

-- Rank practice
CREATE TABLE rankDemo (Name VARCHAR(10));

INSERT INTO rankDemo (Name)
VALUES ('A'), ('B'), ('B'), ('C'), ('C'), ('D'), ('E');

SELECT * 
FROM rankDemo
; 

SELECT Name,
RANK () OVER (ORDER BY Name) 
FROM rankDemo
; 

SELECT Name,
DENSE_RANK () OVER (ORDER BY Name) 
FROM rankDemo
;

SELECT Name,
ROW_NUMBER () OVER (ORDER BY Name) 
FROM rankDemo
;

-- PARTITION BY
SELECT Name,
ROW_NUMBER () OVER (PARTITION BY Name) 
FROM rankDemo
;

SELECT Name,
DENSE_RANK () OVER (ORDER BY Name) 
FROM rankDemo
GROUP BY Name
;

SELECT Name,
RANK () OVER (ORDER BY Name) 
FROM rankDemo
GROUP BY Name
;