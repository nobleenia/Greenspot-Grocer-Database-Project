SELECT 
    p.ItemNum AS ProductID,
    p.Description AS ProductDescription,
    i.QuantityOnHand AS StockQuantity
FROM 
    Products p
LEFT JOIN 
    Inventory i
ON 
    p.ItemNum = i.ItemNum
WHERE 
    i.QuantityOnHand = 0 OR i.QuantityOnHand IS NULL;
