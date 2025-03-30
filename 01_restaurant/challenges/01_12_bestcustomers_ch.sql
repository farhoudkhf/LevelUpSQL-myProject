-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

-- get list of the tables in the schema
SELECT name FROM sqlite_schema
WHERE TYPE = 'table';

-- get table info
PRAGMA table_info(_TableName_);

-- highest spent on a single order
SELECT 
    c.FirstName || ' ' || c.LastName AS CustomersName,
    od.OrderID,
    COUNT(*) AS numDishes,
    SUM(Price) AS totalSpent
FROM 
    OrdersDishes od
    JOIN Dishes d ON d.DishID = od.DishID
    JOIN Orders o ON o.OrderID = od.OrderID
    JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY
    od.OrderID
ORDER BY
    totalSpent DESC;

-- highest number of orders by a customer (MySolution), when using aggregate, we have to use "HAVING"
SELECT 
    COUNT(o.CustomerID) AS OrderCount, 
    -- c.customerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM 
    Orders o
JOIN 
    Customers c ON c.CustomerID = o.CustomerID
GROUP BY
    o.CustomerID
HAVING
    OrderCount >= 15
ORDER BY
    OrderCount DESC;
