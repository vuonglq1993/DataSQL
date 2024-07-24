CREATE DATABASE CACPHONGBAN
GO
USE CACPHONGBAN
GO

CREATE TABLE PhongBan(
    MaPB varchar(7) PRIMARY KEY,
    TenPB nvarchar(50)
)
GO


INSERT INTO PhongBan(MaPB,TenPB) VALUES 
('11A11','Phong Tai Chinh Ke Toan'),('11A12','Phong Kinh Doanh'),('11A13','Phong Hanh Chinh Nhan Su'),('11A14','Phong Ky Thuat'),('11A15','Trung Tam Dieu Hanh');
GO
SELECT * FROM PhongBan
GO

CREATE TABLE NhanVien(
    MaNV varchar(7) PRIMARY KEY,
    TenNV nvarchar(50),
    NgaySinh DateTime,
    SoCCCD char(12) UNIQUE,
    GioiTinh Char(1),
    DiaChi nvarchar(100),
    NgayVaoLam Date,
    MaPB varchar(7)
    CONSTRAINT fk FOREIGN KEY(MaPB) REFERENCES PhongBan(MaPB)
)
GO
    INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCCCD, GioiTinh, DiaChi, NgayVaoLam, MaPB)
VALUES
('1', 'Nguyen Van A', '1990-01-15', '012345678901', 'M', '123 Duong Le Loi, Quan 1, TP Ho Chi Minh', '2020-05-01', '11A11'),
('2', 'Tran Thi B', '1985-03-22', '098765432109', 'F', '456 Duong Tran Hung Dao, Quan 1, TP Ho Chi Minh', '2019-07-15', '11A11'),
('3', 'Le Van C', '1992-07-08', '112233445566', 'M', '789 Duong Nguyen Trai, Quan 1, TP Ho Chi Minh', '2021-09-01', '11A11'),
('4', 'Pham Thi D', '1988-11-30', '667788990011', 'F', '101 Duong Cach Mang Thang Tam, Quan 1, TP Ho Chi Minh', '2018-11-20', '11A11'),
('5', 'Hoang Van E', '1995-05-14', '334455667788', 'M', '202 Duong Hai Ba Trung, Quan 1, TP Ho Chi Minh', '2022-03-10', '11A11');
GO

 INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, SoCCCD, GioiTinh, DiaChi, NgayVaoLam, MaPB)
VALUES
('6', 'Nguyen Thi F', '1992-02-12', '123456789012', 'F', '789 Duong Le Loi, Quan 1, TP Ho Chi Minh', '2023-01-15', '11A12'),
('7', 'Tran Van G', '1991-03-19', '345678901234', 'M', '456 Duong Tran Hung Dao, Quan 1, TP Ho Chi Minh', '2023-03-22', '11A12'),
('8', 'Le Thi H', '1989-04-25', '567890123456', 'F', '123 Duong Hai Ba Trung, Quan 1, TP Ho Chi Minh', '2023-05-01', '11A12'),
('9', 'Pham Van I', '1993-06-30', '678901234567', 'M', '789 Duong Nguyen Trai, Quan 1, TP Ho Chi Minh', '2023-07-15', '11A14'),
('10', 'Hoang Thi J', '1994-08-15', '789012345678', 'F', '456 Duong Cach Mang Thang Tam, Quan 1, TP Ho Chi Minh', '2023-08-25', '11A14'),
('11', 'Nguyen Thi K', '1987-09-21', '890123456789', 'F', '123 Duong Hai Ba Trung, Quan 1, TP Ho Chi Minh', '2023-09-30', '11A14'),
('12', 'Tran Van L', '1985-10-10', '901234567890', 'M', '789 Duong Le Loi, Quan 1, TP Ho Chi Minh', '2023-10-10', '11A15'),
('13', 'Le Thi M', '1990-11-11', '012345678901', 'F', '456 Duong Tran Hung Dao, Quan 1, TP Ho Chi Minh', '2023-11-15', '11A15'),
('14', 'Pham Thi N', '1992-12-20', '123456789012', 'F', '789 Duong Nguyen Trai, Quan 1, TP Ho Chi Minh', '2023-12-20', '11A15'),
('15', 'Hoang Van O', '1991-01-30', '234567890123', 'M', '123 Duong Cach Mang Thang Tam, Quan 1, TP Ho Chi Minh', '2024-01-30', '11A15');
SELECT * FROM NhanVien
GO

CREATE TABLE LuongDA(
    MaDA varchar(8) primary KEY,
    MaNV VARCHAR(7),
    NgayNhan Datetime,
    SoTien Money,
    CONSTRAINT chec_money_positive CHECK(SoTien > 0),
    CONSTRAINT FO FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV)
)
GO

insert into LuongDA(MaDA,MaNV,NgayNhan,SoTien) VALUES
(101, 1, '2024-07-01', 1500000.00),
(101, 2, '2024-07-02', 2000000.00),
(102, 3, '2024-07-03', 1800000.00),
(102, 4, '2024-07-04', 2200000.00),
(103, 5, '2024-07-05', 2100000.00);
GO

-- Hiển thị thông tin về các bảng LUONGDA, NHANVIEN, PHONGBAN.
SELECT * FROM PhongBan
SELECT * FROM NhanVien
select * from LuongDA
GO  

-- Hiển thị những nhân viên có giới tính là ‘F’.
select * from NhanVien
WHERE GioiTinh = 'F'
GO

-- Hiển thị tất cả các dự án, mỗi dự án trên 1 dòng.
SELECT MaDA from LuongDA
GO

-- Hiển thị tổng lương của từng nhân viên
SELECT nv.MaNV, nv.TenNV, SUM(ld.SoTien) AS TotalAmount
FROM NhanVien nv
JOIN LuongDA ld ON nv.MaNV = ld.MaNV
GROUP BY nv.MaNV, nv.TenNV;
GO

-- Hiển thị tất cả các nhân viên trên một phòng ban cho trước
SELECT nv.*
FROM NhanVien nv
JOIN PhongBan pb ON nv.MaPB = pb.MaPB
WHERE pb.MaPB = '11A13';
GO

-- Hiển thị mức lương của những nhân viên phòng tài chính kế toán.
SELECT nv.MaNV, nv.TenNV, pb.TenPB, ld.SoTien
FROM NhanVien nv
JOIN PhongBan pb ON nv.MaPB = pb.MaPB
JOIN LuongDA ld ON nv.MaNV = ld.MaNV
WHERE pb.TenPB = 'Phong Tai Chinh Ke Toan';
GO

-- Hiển thị số lượng nhân viên của từng phòng.
SELECT pb.MaPB, pb.TenPB, COUNT(nv.MaNV) AS SoLuongNhanVien
FROM PhongBan pb
LEFT JOIN NhanVien nv ON pb.MaPB = nv.MaPB
GROUP BY pb.MaPB, pb.TenPB;
GO

-- hiển thị những nhân viên mà tham gia ít nhất vào một dự án.
SELECT DISTINCT nv.MaNV, nv.TenNV, nv.MaPB
FROM NhanVien nv
JOIN LuongDA ld ON nv.MaNV = ld.MaNV;
GO

-- hiển thị phòng ban có số lượng nhân viên nhiều nhất.
SELECT TOP 1 pb.MaPB, pb.TenPB, COUNT(nv.MaNV) AS SoLuongNhanVien
FROM PhongBan pb
LEFT JOIN NhanVien nv ON pb.MaPB = nv.MaPB
GROUP BY pb.MaPB, pb.TenPB
ORDER BY SoLuongNhanVien DESC;
GO

-- Tính tổng số lượng nhân viên trong phòng Hành Chính Nhân Sự
SELECT COUNT(*) AS TongSoNhanVienPhongHCNS
FROM NhanVien nv
JOIN PhongBan pb ON nv.MaPB = pb.MaPB
WHERE pb.TenPB = 'Phong Hanh Chinh Nhan Su';
GO

-- Xóa dự án có mã là DXD02
DELETE FROM LuongDA
WHERE MaDA = 'DXD02';
GO

-- Xoá đi từ bảng LuongDA những nhân viên có mức lương 2000000.
DELETE FROM LuongDA
WHERE SoTien = 2000000.00;
GO


-- Cập nhật mức lương của những người tham gia dự án 101 thêm 10%
UPDATE LuongDA
SET SoTien = SoTien * 1.10
WHERE MaDA = '101';
GO

-- Xóa các bản ghi từ bảng NhanVien mà không có mã nhân viên trong bảng LuongDA
DELETE FROM NhanVien
WHERE NOT EXISTS (
    SELECT 1
    FROM LuongDA
    WHERE NhanVien.MaNV = LuongDA.MaNV
);
