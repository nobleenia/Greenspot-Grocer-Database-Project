SELECT 
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    p.ItemType AS ProductType,
    p.Location AS ProductLocation,
    p.Unit AS Unit,
    v.VendorID AS VendorID,
    v.VendorName AS VendorName
FROM 
    Products p
INNER JOIN 
    Vendors v
ON 
    p.VendorID = v.VendorID;
