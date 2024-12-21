SELECT 
    YEAR(o.DateSold) AS SaleYear,
    MONTH(o.DateSold) AS SaleMonth,
    SUM(o.Quantity * o.Price) AS TotalRevenue
FROM 
    Orders o
GROUP BY 
    YEAR(o.DateSold), MONTH(o.DateSold)
ORDER BY 
    SaleYear, SaleMonth;
