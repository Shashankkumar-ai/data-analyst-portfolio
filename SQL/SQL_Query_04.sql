;WITH Numbers AS
(
    SELECT TOP (10000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO SalesData
(CustomerID, Name, Age, City, PurchaseAmount, PurchaseDate)
SELECT
    n,
    CONCAT('Customer', n),
    ABS(CHECKSUM(NEWID())) % 43 + 18,
    CHOOSE((ABS(CHECKSUM(NEWID())) % 5) + 1,
           'Delhi','Mumbai','Kolkata','Chennai','Bangalore'),
    CAST((RAND(CHECKSUM(NEWID())) * 9000 + 1000) AS DECIMAL(10,2)),
    DATEADD(DAY, -(ABS(CHECKSUM(NEWID())) % 365), GETDATE())
FROM Numbers;
GO
