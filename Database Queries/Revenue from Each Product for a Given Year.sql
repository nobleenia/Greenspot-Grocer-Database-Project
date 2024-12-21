SELECT 
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    YEAR(o.DateSold) AS SaleYear,
    SUM(o.Quantity * o.Price) AS TotalRevenue
FROM 
    Orders o
INNER JOIN 
    Products p
ON 
    o.ItemNum = p.ItemNum
WHERE 
    YEAR(o.DateSold) = 2022 -- Replace '2022' with the desired year
GROUP BY 
    p.ItemNum, p.Description, YEAR(o.DateSold)
ORDER BY 
    TotalRevenue DESC; -- Order by highest revenue first
