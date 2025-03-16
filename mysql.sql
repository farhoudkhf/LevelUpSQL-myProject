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
RENAME COLUMN emp_name to FirsName;

ALTER TABLE emp2
ADD LastName varchar(255);

ALTER TABLE emp2
ALTER COLUMN LastName TEXT NOT Null;

ALTER TABLE emp2
DROP COLUMN emp_Email;

SELECT * FROM MyCalendar;

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