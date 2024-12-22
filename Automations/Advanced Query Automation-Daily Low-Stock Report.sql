SET GLOBAL event_scheduler = ON;
CREATE EVENT DailyLowStockReport
ON SCHEDULE EVERY 1 DAY
DO
CALL GetLowStockProducts(10); -- Using the stored procedure
