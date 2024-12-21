SELECT 
    o.OrderID,
    o.CustID AS CustomerID,
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    v.VendorID AS VendorID,
    v.VendorName AS VendorName,
    o.Quantity AS QuantityOrdered,
    o.Price AS SellingPrice,
    o.DateSold AS SaleDate
FROM 
    Orders o
INNER JOIN 
    Products p
ON 
    o.ItemNum = p.ItemNum
INNER JOIN 
    Vendors v
ON 
    p.VendorID = v.VendorID;
