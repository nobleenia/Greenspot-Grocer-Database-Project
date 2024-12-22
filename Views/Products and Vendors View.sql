CREATE VIEW ProductsWithVendors AS
SELECT 
    p.ItemNum, 
    p.Description AS ProductDescription, 
    v.VendorName
FROM Products p
INNER JOIN Vendors v ON p.VendorID = v.VendorID;
