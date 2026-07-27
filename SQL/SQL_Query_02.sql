CREATE TABLE SalesData (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    City VARCHAR(50),
    PurchaseAmount DECIMAL(10,2),
    PurchaseDate DATE
);
GO
SELECT COUNT(*) AS TotalRows
FROM SalesData;