use DonDatHang2
GO



SELECT 
    o.OrderID AS [Mã số đơn hàng],
    c.CustomerName AS [Người đặt hàng],
    c.Address AS [Địa chỉ],
    c.PhoneNumber AS [Điện thoại],
    o.OrderDate AS [Ngày đặt hàng]
FROM 
    Orderr o
JOIN 
    Customer c ON o.CustomerID = c.CustomerID
WHERE 
    o.OrderID = 123;

SELECT 
    ROW_NUMBER() OVER (ORDER BY od.ProductID) AS [STT],
    p.Names AS [Tên hàng],
    p.Descriptions AS [Mô tả hàng],
    p.Unit AS [Đơn vị],
    od.Price AS [Giá],
    od.Quantity AS [Số lượng],
    od.Price * od.Quantity AS [Thành tiền]
FROM 
    OrderDetails od
JOIN 
    Product p ON od.ProductID = p.ProductID
WHERE 
    od.OrderID = 123;

SELECT 
    SUM(od.Price * od.Quantity) AS [Tổng tiền]
FROM 
    OrderDetails od
WHERE 
    od.OrderID = 123;

GO



SELECT 
    o.OrderID AS [Mã số đơn hàng],
    c.CustomerName AS [Người đặt hàng],
    c.Address AS [Địa chỉ],
    c.PhoneNumber AS [Điện thoại],
    o.OrderDate AS [Ngày đặt hàng]
FROM 
    Orderr o
JOIN 
    Customer c ON o.CustomerID = c.CustomerID
WHERE 
    o.OrderID = 124;

SELECT 
    ROW_NUMBER() OVER (ORDER BY od.ProductID) AS [STT],
    p.Names AS [Tên hàng],
    p.Descriptions AS [Mô tả hàng],
    p.Unit AS [Đơn vị],
    od.Price AS [Giá],
    od.Quantity AS [Số lượng],
    od.Price * od.Quantity AS [Thành tiền]
FROM 
    OrderDetails od
JOIN 
    Product p ON od.ProductID = p.ProductID
WHERE 
    od.OrderID = 124;

SELECT 
    SUM(od.Price * od.Quantity) AS [Tổng tiền]
FROM 
    OrderDetails od
WHERE 
    od.OrderID = 124;
GO


-- 1. Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng

SELECT DISTINCT
    c.CustomerID AS [Mã khách hàng],
    c.CustomerName AS [Tên khách hàng],
    c.Address AS [Địa chỉ],
    c.PhoneNumber AS [Số điện thoại],
    c.Status AS [Trạng thái]
FROM 
    Customer c
JOIN 
    Orderr o ON c.CustomerID = o.CustomerID
ORDER BY 
    c.CustomerID;
GO


-- Liệt kê danh sách sản phẩm của của hàng
SELECT 
    p.ProductID AS [Mã sản phẩm],
    p.Names AS [Tên sản phẩm],
    p.Descriptions AS [Mô tả sản phẩm],
    p.Unit AS [Đơn vị],
    p.Price AS [Giá],
    p.Quantity AS [Số lượng],
    p.Status AS [Trạng thái]
FROM 
    Product p
ORDER BY 
    p.ProductID;

GO


-- Liệt kê danh sách các đơn đặt hàng của cửa hàng.
SELECT 
    o.OrderID AS [Mã đơn hàng],
    c.CustomerName AS [Tên khách hàng],
    o.OrderDate AS [Ngày đặt hàng],
    o.Status AS [Trạng thái đơn hàng]
FROM 
    Orderr o
JOIN 
    Customer c ON o.CustomerID = c.CustomerID
ORDER BY 
    o.OrderID;
GO


-- 1. Liệt kê danh sách khách hàng theo thứ tự alphabet
SELECT 
    CustomerID AS [Mã khách hàng],
    CustomerName AS [Tên khách hàng],
    Address AS [Địa chỉ],
    PhoneNumber AS [Số điện thoại],
    Status AS [Trạng thái]
FROM 
    Customer
ORDER BY 
    CustomerName;
GO

-- 2. Liệt kê danh sách sản phẩm của cửa hàng theo thứ tự giá giảm dần
SELECT 
    ProductID AS [Mã sản phẩm],
    Names AS [Tên sản phẩm],
    Descriptions AS [Mô tả sản phẩm],
    Unit AS [Đơn vị],
    Price AS [Giá],
    Quantity AS [Số lượng],
    Status AS [Trạng thái]
FROM 
    Product
ORDER BY 
    Price DESC;
GO

-- 3. Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua
SELECT 
    p.ProductID AS [Mã sản phẩm],
    p.Names AS [Tên sản phẩm],
    p.Descriptions AS [Mô tả sản phẩm],
    p.Unit AS [Đơn vị],
    od.Price AS [Giá],
    od.Quantity AS [Số lượng],
    od.Price * od.Quantity AS [Thành tiền]
FROM 
    OrderDetails od
JOIN 
    Orderr o ON od.OrderID = o.OrderID
JOIN 
    Product p ON od.ProductID = p.ProductID
JOIN 
    Customer c ON o.CustomerID = c.CustomerID
WHERE 
    c.CustomerName = 'Nguyễn Văn An';
GO


-- 1. Số khách hàng đã mua hàng ở cửa hàng
SELECT 
    COUNT(DISTINCT c.CustomerID) AS [Số lượng khách hàng]
FROM 
    Customer c
JOIN 
    Orderr o ON c.CustomerID = o.CustomerID;
GO

-- 2.Số lượng mặt hàng mà cửa hàng bán
SELECT 
    COUNT(p.ProductID) AS [Số lượng mặt hàng]
FROM 
    Product p;
GO

-- 3. Tổng tiền của từng đơn hàng
SELECT 
    o.OrderID AS [Mã đơn hàng],
    SUM(od.Price * od.Quantity) AS [Tổng tiền]
FROM 
    OrderDetails od
JOIN 
    Orderr o ON od.OrderID = o.OrderID
GROUP BY 
    o.OrderID
ORDER BY 
    o.OrderID;

GO
