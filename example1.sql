use Northwind 
GO

SELECT * FROM Products

-- Chỉ lấy ra những sản phẩm có giá lớn hơn 100$:
WHERE [UnitPrice]>100


-- Chỉ lấy ra tên và giá của sản phẩm:
SELECT [ProductName], [UnitPrice] FROM Products

-- Lấy ra top 5 bản ghi đầu tiên của Product:
SELECT TOP 5 * FROM Products





