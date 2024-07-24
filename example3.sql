USE AdventureWorks2022
GO

-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID > 15

SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID > 15

-- Khai báo biến 
Go

DECLARE @deptID INT --Khai báo biến cục bộ tên là deptID kiểu int
SELECT @deptID=12 --Gán giá trị cho biến bằng 1
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department
                        WHERE DepartmentID >= @deptID

Go

USE Northwind
GO


SELECT * FROM Categories
SELECT CategoryID,CategoryName,[Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT TOP 1 * FROM Employees

SELECT @@LANGUAGE --Hiển thị thông tin của biến toàn cục @@Language, trả lại thông tin ngôn ngữ sử dụng trong sql server
SELECT @@VERSION --Hiển thị thông tin của biến toàn cục @@VERSION, trả lại thông tin về phiên bản sql server

Go 

USE AdventureWorks2022
Go 

--Lấy tổng tất cả giá trị các bản ghi trường StadardCost thuộc bảng ProductCostHistory
SELECT SUM(StandardCost) FROM Production.ProductCostHistory

--Tinh gia tri trung binh cua truong StadardCost thuoc bang ProducCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory

--Lay ra gia tri lon nhat cua truong StandardCost thuoc bang ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory

--Dem tong so ban ghi trong bang ProductPhoto
SELECT COUNT(*) AS TotalRecords FROM Production.ProductCostHistory

--Lay ra ngay gio he thong:

SELECT GETDATE()

--Lay ra gio he thong
SELECT DATEPART(hh,GETDATE())

--Dinh dang ngay dung ham CONVERT
SELECT CONVERT(varchar(50), GETDATE(), 103)

--Lay ra dinh danh cua co so du lieu
SELECT DB_ID('AdventureWorks2022')

--Tao co so du lieu:
CREATE DATABASE EXAMPLE3

USE EXAMPLE3

--Tao bang trong co so du lieu
CREATE TABLE Contacts

(MailID VARCHAR(20),Name NTEXT, TelephoneNumber INT)

--Them 1 cot vao bang da co
ALTER TABLE Contacts ADD Address NVARCHAR(50)

--Them du lieu vao bang Contacts:
INSERT INTO Contacts values ('xeko@gmail.com', N'Nguyen Van A',9898998, N'Ha Noi')
INSERT INTO Contacts values ('lynka@gmail.com', N'Nguyen Thi B',4329234, N'Ha Noi')
INSERT INTO Contacts values ('TranVanC@gmail.com', N'Tran Van C',905243524, N'Ha Noi')
INSERT INTO Contacts values ('vand@gmail.com', N'Trinh Van D',4563576, N'Ha Noi')

--Lay tat ca ban ghi trong bang:
SELECT * FROM Contacts

--Xoa ban ghi:
DELETE FROM Contacts WHERE MailID='tranvanC@gmail.com'

--Sua ban ghi:
UPDATE Contacts SET Name=N'Nguyen Viet Anh' WHERE MailID='vanD@gmail.com'

--Tao login account de test GRANT
CREATE LOGIN example3 WITH PASSWORD ='12345678'

--Tao user tu login account vua tao
CREATE USER example3 FROM LOGIN EXAMPLE3

--Huy bo tat ca cac quyen cua user example3 tren bang Contacts
REVOKE ALL ON Contacts FROM example3

--disconnect va connect lai voi user example3/123456, thuc hien cau lenh select de demo cho sinh vien thay user khong con bat ky quyen nao tren bang Contacts trong co so du lieu

--Gan quyen SELECT cho example3 tren bang Contacts
GRANT SELECT ON Contacts to example3

