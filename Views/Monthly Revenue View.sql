CREATE VIEW MonthlyRevenue AS
SELECT 
    YEAR(DateSold) AS SaleYear, 
    MONTH(DateSold) AS SaleMonth, 
    SUM(Quantity * Price) AS TotalRevenue
FROM Orders
GROUP BY SaleYear, SaleMonth;
