﻿USE QLBanHang
GO

-- Đưa ra các thông tin về các Sản phẩm có màu Đỏ.

SELECT * FROM dbo.SanPham WHERE MauSac = N'Đỏ'

-- Đưa ra 2 sản phẩm có giá bán Lớn nhất
FROM NhanVien

-- Đưa ra SoHDN, ngày nhập, tháng nhập, năm nhập của các PNhap

SELECT SoHDN, DATENAME(DAY,NgayNhap),MONTH(NgayNhap), YEAR(NgayNhap) FROM dbo.PNhap

-- Đưa ra SoHDX, ngày xuất, tháng xuất, năm xuất của các PXuat

SELECT SoHDX, DATENAME(DAY,NgayXuat),MONTH(NgayXuat), YEAR(NgayXuat) FROM dbo.PXuat

-- Đưa ra tất cả các nhân viên có họ ‘Nguyễn’

SELECT * FROM dbo.NhanVien WHERE SUBSTRING(TenNV,1,CHARINDEX(' ', TenNV)) = N'Nguyễn'

-- Đưa ra tất cả các sản phẩm có chữ ‘Flus’ trong đó.

SELECT * FROM dbo.SanPham WHERE TenSP LIKE '%Plus%'

-- Đưa ra tất cả các sản phầm có giá bán sắp xếp theo chiều từ cao đến thấp và số lượng sắp xếp theo chiều từ thấp đến cao

SELECT * FROM dbo.SanPham ORDER BY GiaBan DESC, SoLuong ASC

-- Đưa ra thông tin tất cả các sản phẩm, thông tin xuất ra theo định dạng mỗi sản phẩm trên 1 dòng, ví dụ:

SELECT N'Mã sản phẩm: ' + MaSP + N', Tên sản phẩm: ' + TenSP + N', Số lượng: ' + CONVERT(NVARCHAR(10), SoLuong) AS N'Thông tin sản phẩm'
FROM SanPham

-- Đưa ra các sản phẩm có số lượng lớn nhất
SELECT TOP 1 WITH TIES *
FROM SanPham
ORDER BY SoLuong DESC

SELECT *
FROM SanPham
WHERE SoLuong = (SELECT MAX(SoLuong) FROM SanPham)

-- Đưa ra các sản phẩm có giá bán nhỏ nhất

SELECT TOP(1) WITH TIES * FROM dbo.SanPham ORDER BY GiaBan ASC

SELECT * FROM dbo.SanPham WHERE GiaBan = (SELECT MIN(GiaBan) FROM dbo.SanPham)

-- Đưa ra nhân viên có tên là ‘Tuấn Anh’ Ở phòng Tổ chức

SELECT * FROM dbo.NhanVien WHERE SUBSTRING(TenNV,CHARINDEX(' T',TenNV),8) = N'Tuấn Anh' AND TenPhong = N'Tổ chức'

-- Đưa ra thông tin PXuat bao gồm SoHDX,NgayX,MaNV, với tháng xuất là tháng 9, năm xuất là 2021