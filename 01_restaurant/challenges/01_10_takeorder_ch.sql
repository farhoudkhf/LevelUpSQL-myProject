-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

INSERT INTO 
    Orders (
        CustomerID,
        OrderDate
    )
VALUES (
    (SELECT CustomerID
    FROM Customers
    WHERE 
            FirstName = 'Loretta'
        AND
            LastName = 'Hundey'
        AND
            Address = '6939 Elka Place'),
    '2022-09-20 14:00:00'
);

SELECT * FROM Orders
ORDER BY OrderID DESC;
-- orderID 1001

SELECT * FROM OrdersDishes
ORDER BY OrdersDishesID DESC
LIMIT 10;

-- insert (one row) [ Name = 'House Salad' ] into ordersdishes
INSERT INTO
    OrdersDishes (
        OrderID,
        DishID
    )
VALUES (
    (
        SELECT 
            OrderID
        FROM 
            Orders
        WHERE 
            OrderID = 1001
    ),
    (
        SELECT 
            DishID
        FROM 
            Dishes
        WHERE 
            Name = 'House Salad'
    )
);

-- insert 3rows into ordersdishes
INSERT INTO
    OrdersDishes (
        OrderID,
        DishID
    )
VALUES 
        (
            (  -- or just 1001
                SELECT 
                    OrderID
                FROM 
                    Orders
                WHERE 
                    OrderID = 1001
                ),
                (
                SELECT 
                    DishID
                FROM 
                    Dishes
                WHERE 
                    Name = 'House Salad'
            )
        ),
        (
            (
                SELECT 
                    OrderID
                FROM 
                    Orders
                WHERE 
                    OrderID = 1001
            ),
            (
                SELECT 
                    DishID
                FROM 
                    Dishes
                WHERE 
                    Name = 'Mini Cheeseburgers'
            )
        ),
        (
            (
                SELECT 
                    OrderID
                FROM 
                    Orders
                WHERE 
                    OrderID = 1001
            ),
            (
                SELECT 
                    DishID
                FROM 
                    Dishes
                WHERE 
                    Name = 'Tropical Blue Smoothie'
            )
        )
;

-- reversed 3 rows
-- insert 3rows into ordersdishes
INSERT INTO
    OrdersDishes (
        OrderID,
        DishID
    )
VALUES 
        (1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
        (1001, (SELECT DishID FROM Dishes WHERE Name = 'Classic Burger')),
        (1001, (SELECT DishID FROM Dishes WHERE Name = 'Pomegranate Iced Tea'));

DELETE FROM OrdersDishes
WHERE OrderID = 1001;

SELECT COUNT(*) FROM OrdersDishes WHERE OrderID = 1001;

SELECT 
    SUM(Price) AS Total
FROM
    Dishes
WHERE
        Name = 'House Salad'
    OR
        Name = 'Mini Cheeseburgers'
    OR
        Name = 'Tropical Blue Smoothie';

-- report on the order based on order number    
SELECT
    c.FirstName AS Name,
    od.OrderID AS OrderNUM,
    OrderDate AS Date,
    Count(od.OrderID) AS Items,
    SUM(Price) AS Total
FROM
    OrdersDishes AS od
    JOIN Dishes AS d ON d.DishID = od.DishID
    JOIN Orders AS o ON o.OrderID = od.OrderID
    JOIN Customers AS c ON c.customerID = o.customerID
WHERE od.OrderID = 1001;

-- solution from the course
SELECT
    o.OrderID AS OrderNum,
    c.LastName AS Name,
    COUNT(d.DishID) AS Items,
    SUM(d.Price) AS Total
FROM 
    Orders o
    JOIN OrdersDishes od ON o.OrderID = od.OrderID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Dishes d ON d.DishID = od.DishID
WHERE
    o.OrderID = 1001
GROUP BY
    o.OrderID;



-- report on the order based on order numbers top bills   
SELECT
    c.FirstName AS Name,
    od.OrderID AS OrderNUM,
    OrderDate AS Date,
    Count(od.OrderID) AS Items,
    SUM(Price) AS Total
FROM
    OrdersDishes od
    JOIN Dishes d ON d.DishID = od.DishID
    JOIN Orders o ON o.OrderID = od.OrderID
    JOIN Customers c ON c.customerID = o.customerID
--WHERE od.OrderID = 1001;
GROUP BY od.OrderID
Order BY Total DESC
LIMIT 20;


-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(Orders);

SELECT * FROM Customers
WHERE FirstName = 'Loretta';

SELECT DishID, Name, Price FROM Dishes
WHERE 
    Name = 'House Salad'
OR
    Name = 'Mini Cheeseburgers'
OR
    Name = 'Tropical Blue Smoothie';

SELECT * FROM Orders
ORDER BY OrderID DESC;


SELECT *
FROM orders
ORDER BY OrderID DESC
LIMIT 10;

SELECT *
FROM OrdersDishes
WHERE OrderID = 1001;

SELECT * FROM Dishes;