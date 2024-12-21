SELECT 
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    SUM(o.Quantity) AS ProductTotalQuantity,
    (SUM(o.Quantity) / (SELECT SUM(o2.Quantity) 
                        FROM Orders o2 
                        WHERE YEAR(o2.DateSold) = 2022) * 100) AS PercentageOfTotal
FROM 
    Orders o
INNER JOIN 
    Products p
ON 
    o.ItemNum = p.ItemNum
WHERE 
    YEAR(o.DateSold) = 2022 -- Replace '2022' with the desired year
GROUP BY 
    p.ItemNum, p.Description
ORDER BY 
    PercentageOfTotal DESC;

