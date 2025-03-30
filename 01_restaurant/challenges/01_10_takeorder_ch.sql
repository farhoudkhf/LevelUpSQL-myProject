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
ORDER BY OrdersDishesID DESC;

INSERT INTO
    OrdersDishes (
        OrderID,
        DishID
    )
VALUES (
    (
    
    ),
    (
    
    )
);



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

SELECT * FROM Customers;