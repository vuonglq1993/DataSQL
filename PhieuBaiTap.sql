
create database PhieuSanPham
GO
use PhieuSanPham
go


create table Products(
    ProductID NVARCHAR(15) primary key,
    Manufacture DATE,
    Catid nvarchar(15),
    CareerID int,
    CONSTRAINT fkc FOREIGN KEY(CareerID) REFERENCES Career(CareerID),
    CONSTRAINT fkcat FOREIGN KEY(Catid) REFERENCES Category(Catid)
);

CREATE table Career(
    CareerID int primary key,
    CareerLastName nvarchar(100),
    CareerFirstName nvarchar(100),
);

create table Category(
    Catid nvarchar(15) PRIMARY KEY,
    CatName nvarchar(100),
);

INSERT into Career(CareerID,CareerLastName,CareerFirstName) VALUES
(987688, N'Nguyễn Văn',N'An');

insert  into Category(Catid,  CatName) VALUES
('Z37E',N'Máy tính sách tay Z37');


insert into Products(ProductID,Manufacture,Catid,CareerID) Values 
('Z37 111111','2009-12-12','Z37E',987688);

INSERT INTO Career (CareerID, CareerLastName,CareerFirstName) VALUES
(987689, N'Trần Thị','B'),
(987690, N'Lê Văn',N'C');

-- Insert data into the Category table
INSERT INTO Category (Catid, CatName) VALUES
('A45B', N'Television A45'),
('P67Q', N'Smartphone P67'),
('D23K', N'Refrigerator D23'),
('L78M', N'Washing Machine L78');

-- Insert data into the Products table
INSERT INTO Products (ProductID, Manufacture, Catid, CareerID) VALUES 
('A45 222222', '2021-06-15', 'A45B', 987689),
('P67 333333', '2020-03-20', 'P67Q', 987690),
('D23 444444', '2018-11-05', 'D23K', 987688),
('L78 555555', '2019-08-25', 'L78M', 987689);


-- Liệt kê danh sách các loại sản phẩm của công ty
Select * from Category;

-- Liệt kê danh sách sản phẩm của công ty
Select * from Products;

-- Liệt kê danh sách người chịu trách nhiệm của công ty
Select * from Career;

-- Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
Select * from Category
order by CatName asc;

-- Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
Select * from Career
order by CareerFirstName;

-- Liệt kê các sản phẩm của loại sản phẩm có mã số là Z37E.
Select * from Products
Where CatID = 'Z37E' ;

-- Liệt kê các sản phẩm Nguyễn Văn An chịu trách nhiệm theo thứ tự giảm đần của mã.
SELECT p.ProductID, p.Manufacture, p.Catid, p.CareerID, c.CareerLastName, c.CareerFirstName
FROM Products p
JOIN Career c ON p.CareerID = c.CareerID
WHERE c.CareerLastName = N'Nguyễn Văn' AND c.CareerFirstName = N'An'
ORDER BY p.ProductID DESC;

-- Số sản phẩm của từng loại sản phẩm
SELECT Catid, COUNT(ProductID) AS NumberOfProducts
FROM Products
GROUP BY Catid;

-- Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm 
SELECT p.ProductID, p.Manufacture, p.Catid, c.CatName
FROM Products p
JOIN Category c ON p.Catid = c.Catid;

-- Hiển thị toàn bộ thông tin về người chịu trách nhiệm, loại sản phẩm và sản phẩm 
SELECT c.CareerID, c.CareerLastName, c.CareerFirstName, p.ProductID, p.Manufacture, p.Catid, cat.CatName
FROM Products p
JOIN Career c ON p.CareerID = c.CareerID
JOIN Category cat ON p.Catid = cat.Catid;


-- Viết câu lệnh để thay đổi trường ngày sản xuất là trước hoặc bằng ngày hiện tại.
UPDATE Products
SET Manufacture = GETDATE()
WHERE Manufacture > GETDATE();



-- Viết câu lệnh để thêm trường phiên bản của sản phẩm.
ALTER TABLE Products
ADD Version NVARCHAR(50);