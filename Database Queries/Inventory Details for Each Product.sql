SELECT 
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    i.QuantityOnHand AS StockQuantity,
    i.PurchaseDate AS LastPurchaseDate,
    i.Location AS InventoryLocation
FROM 
    Products p
INNER JOIN 
    Inventory i
ON 
    p.ItemNum = i.ItemNum;
