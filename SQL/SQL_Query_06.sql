SELECT TOP 5
    City,
    SUM(PurchaseAmount) AS TotalRevenue
FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC;