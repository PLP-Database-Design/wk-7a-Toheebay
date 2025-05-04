-- answer to assignment no1
use sampledb;
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';

--answer to assignment no2

USE sampledb;

-- 1NF transformation
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
-- ... 


-- Orders Table (OrderID, CustomerName)
SELECT DISTINCT 
    OrderID, 
    CustomerName
FROM (
    SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
    UNION ALL
    SELECT 101, 'John Doe', 'Mouse'
    UNION ALL
    SELECT 102, 'Jane Smith', 'Tablet'
    UNION ALL
    SELECT 102, 'Jane Smith', 'Keyboard'
    UNION ALL
    SELECT 102, 'Jane Smith', 'Mouse'
    UNION ALL
    SELECT 103, 'Emily Clark', 'Phone'
) AS OneNF;


-- OrderProducts Table (OrderID, Product)
SELECT 
    OrderID, 
    Product
FROM (
    SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
    UNION ALL
    SELECT 101, 'John Doe', 'Mouse'
    UNION ALL
    SELECT 102, 'Jane Smith', 'Tablet'
    UNION ALL
    SELECT 102, 'Jane Smith', 'Keyboard'
    UNION ALL
    SELECT 102, 'Jane Smith', 'Mouse'
    UNION ALL
    SELECT 103, 'Emily Clark', 'Phone'
) AS OneNF;


--the two normalize table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(255),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
