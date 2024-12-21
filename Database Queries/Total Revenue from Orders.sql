SELECT 
    SUM(o.Quantity * o.Price) AS TotalRevenue
FROM 
    Orders o;
