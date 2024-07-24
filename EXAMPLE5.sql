IF EXISTS (SELECT * FROM sys.databases WHERE Name='Example5')
DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO  
USE Example5
GO
--Tạo bảng Lớp học
DROP TABLE LopHoc
CREATE TABLE LopHoc(
MaLopHoc INT PRIMARY KEY IDENTITY,
TenLopHoc VARCHAR(10
)
GO

SELECT * FROM LopHoc
GO          
INSERT INTO Lophoc(TenLopHoc) VALUES ('T2009M')
-- SELECT * FROM LopHoc
UPDATE LopHoc SET TenLopHoc = 'T2403M'
WHERE MaLopHoc = 1002
DELETE FROM LopHoc WHERE MaLopHoc = 1002
GO

DROP TABLE SinhVien
CREATE TABLE SinhVien(
    MaSV int PRIMARY KEY ,
    tenSV nvarchar(250),
    ClassCode int,
    CONSTRAINT fk FOREIGN KEY (ClassCode) REFERENCES LopHoc(MaLopHoc)
)
GO
INSERT INTO SinhVien(MaSV, tenSV, ClassCode) VALUES (1, 'Minh', 5),(3, 'Hoa', 5),(14, 'Minh', 5);
SELECT * FROM SinhVien
SELECT * FROM LopHoc

GO



