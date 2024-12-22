ALTER TABLE Products ADD Cost DECIMAL(10,2);
SELECT 
    p.ItemNum, 
    p.Description, 
    SUM(o.Quantity * o.Price) AS TotalRevenue, 
    SUM(o.Quantity * p.Cost) AS TotalCost,
    (SUM(o.Quantity * o.Price) - SUM(o.Quantity * p.Cost)) AS Profit
FROM Orders o
INNER JOIN Products p ON o.ItemNum = p.ItemNum
GROUP BY p.ItemNum, p.Description;
