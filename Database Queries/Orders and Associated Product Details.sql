SELECT 
    o.OrderID,
    o.CustID AS CustomerID,
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    o.Quantity AS QuantityOrdered,
    o.Price AS SellingPrice,
    o.DateSold AS SaleDate
FROM 
    Orders o
INNER JOIN 
    Products p
ON 
    o.ItemNum = p.ItemNum;
