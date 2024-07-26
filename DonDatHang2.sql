
create database DonDatHang2
GO
use DonDatHang2
go

create table Orderr(
    OrderID int PRIMARY KEY,
    CustomerID int,
    OrderDate date,
    Status NVARCHAR(15)
    CONSTRAINT fk2 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
)
GO

CREATE TABLE Customer(
    CustomerID int PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Address NVARCHAR(100),
    PhoneNumber varchar(10),
    Status Varchar(15)
)
GO


create table OrderDetails(
    OrderID int,
    productID int,
    Price money,
    quantity int
    CONSTRAINT fk FOREIGN KEY(productID) REFERENCES Product(ProductID),
    CONSTRAINT fk1 FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID)

)
GO

create table Product(
    productID int PRIMARY KEY,
    names nvarchar(100),
    DESCRIPTIONs nvarchar(100),
    unit nvarchar(7),
    Price money,
    quantity int,
    Status varchar(15)
)
Go

INSERT INTO Customer (CustomerID, CustomerName, Address, PhoneNumber, Status)
VALUES 
('1',N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '0987654321', 'Active');
GO

INSERT INTO Product (productID, Names, Descriptions, Unit, Price, Quantity, Status)
VALUES 
('111',N'Máy Tính T450', N'Máy nhập mới', N'Chiếc', 1000, 1, 'Avai'),
('112',N'Điện Thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, 2, 'Avai'),
('113',N'Máy In Samsung 450', N'Máy in đang ế', N'Chiếc', 100, 1, 'Avai');
GO

INSERT INTO Orderr (OrderID, CustomerID, OrderDate, Status)
VALUES 
(123, 1, '2009-11-18', 'Completed');
GO

INSERT INTO OrderDetails (OrderID, ProductID, Price, Quantity)
VALUES 
(123, 111, 1000, 1),
(123, 112, 200, 2),
(123, 113, 100, 1);
GO

INSERT INTO Customer (CustomerID,CustomerName, Address, PhoneNumber, Status)
VALUES 
('2','Trần Văn Bình', '222 Lê Lợi, Đống Đa, Hà Nội', '912345678', 'Active');
GO


INSERT INTO Product (ProductID, Names, Descriptions, Unit, Price, Quantity, Status)
VALUES 
(114, 'Máy Chiếu Sony X123', 'Máy chiếu cao cấp', 'Chiếc', 500, 2, 'Avai'),
(115, 'Loa JBL T150', 'Loa nghe nhạc', 'Chiếc', 150, 4, 'Avai');
GO


INSERT INTO Orderr (OrderID, CustomerID, OrderDate, Status)
VALUES 
(124, 2, '2021-06-21', 'Pending');
GO


INSERT INTO OrderDetails (OrderID, ProductID, Price, Quantity)
VALUES 
(124, 111, 1000, 1),
(124, 114, 500, 2),
(124, 115, 150, 4);
GO

INSERT INTO Customer (CustomerID, CustomerName, Address, PhoneNumber, Status)
VALUES 
('3', N'Lê Thị Hương', N'333 Phố Huế, Hai Bà Trưng, Hà Nội', '901234567', 'Active');
GO


INSERT INTO Product (ProductID, Names, Descriptions, Unit, Price, Quantity, Status)
VALUES 
(116, N'Bàn Phím Logitech K120', N'Bàn phím máy tính', 'Chiếc', 25, 5, 'Avai'),
(117, N'Chuột Logitech M185', N'Chuột máy tính', 'Chiếc', 20, 5, 'Avai');
GO


INSERT INTO Orderr (OrderID, CustomerID, OrderDate, Status)
VALUES 
(125, 3, '2022-12-15', 'Shipped');
GO

INSERT INTO OrderDetails (OrderID, ProductID, Price, Quantity)
VALUES 
(125, 114, 500, 1),
(125, 116, 25, 2),
(125, 117, 20, 3);
GO

-- Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
ALTER TABLE Product
ADD CONSTRAINT check_price_positive CHECK (Price > 0);


