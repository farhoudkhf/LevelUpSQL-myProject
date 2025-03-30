-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

-- get table info
PRAGMA table_info(Customers);

-- get table info
PRAGMA table_info(Dishes);

SELECT
    c.FirstName || ' ' || c.LastName AS Name,
    d.Name AS 'Favorite Dish'
FROM 
    Customers c
    JOIN Dishes d ON c.FavoriteDish = d.DishID
ORDER BY
    Name ASC;

SELECT
    c.FirstName || ' ' || c.LastName AS Name,
    c.FavoriteDish AS 'Dish ID',
    d.Name AS 'Favorite Dish'
FROM 
    Customers c
    JOIN Dishes d ON c.FavoriteDish = d.DishID
WHERE
    c.FirstName = 'Cleo';

UPDATE 
    Customers 
SET 
    FavoriteDish = 
        (SELECT DishID FROM Dishes d WHERE d.Name = 'Quinoa Salmon Salad')
WHERE
    Customers.FirstName = 'Cleo'
    AND
    Customers.LastName = 'Goldwater';

-- SELECT DishID FROM Dishes d WHERE d.Name = 'Quinoa Salmon Salad';

-- NEW COURSE CHALLENGE
-- Find two most popular dishes amoung our customers 

SELECT
    d.Name AS 'Dish Name',
    COUNT(FavoriteDish) AS MostFavor
FROM
    Customers c
    JOIN Dishes d ON d.DishID = c.FavoriteDish
GROUP BY
    FavoriteDish
ORDER BY
    MostFavor DESC
LIMIT 10;

SELECT * FROM Customers WHERE FavoriteDish IS NULL;


SELECT
    d.Name AS Item,
    COUNT(FavoriteDish) AS Ferequency
FROM
    Customers c
    JOIN Dishes d ON d.DishID = c.FavoriteDish
GROUP BY
    FavoriteDish
ORDER BY
    Ferequency DESC
LIMIT 2;

-- solution from the course [not working on sqlite]
SELECT
    Name AS Item,
    COUNT(*) AS Ferequency
FROM
    Customers
JOIN 
    Dishes d ON Dishes.DishID = Customers.FavoriteDish
GROUP BY
    Item
ORDER BY
    Ferequency DESC
LIMIT 2;