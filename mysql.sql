-- CREATE TABLE emp
-- (empID INT not NULL PRIMARY KEY, 
-- emp_name TEXT NOT NULL, emp_Email NOT NULL);

-- INSERT  INTO emp(empID, emp_name, emp_Email)
-- VALUES(9111, "siah", "siah@siaha.com")




SELECT * FROM emp;

SELECT name FROM sqlite_schema
WHERE type='table';


-- SELECT 
--     name
-- FROM 
--     sqlite_schema
-- WHERE 
--     type ='table' AND 
--     name NOT LIKE 'sqlite_%';

