CREATE PROCEDURE GetLowStockProducts(IN threshold INT)
BEGIN
	SELECT 
        p.ItemNum, 
        p.Description, 
        i.QuantityOnHand
    FROM Products p
    INNER JOIN Inventory i ON p.ItemNum = i.ItemNum
    WHERE i.QuantityOnHand < threshold;
END
