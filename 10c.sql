﻿USE QLBanHang
GO
 
-- Đưa ra 10 mặt hàng có SoLuongN nhiều nhất trong năm 2019

SELECT TOP(10) * FROM dbo.Nhap INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN WHERE YEAR(NgayNhap) = 2019
ORDER BY SoLuongN DESC

-- Đưa ra MaSP,TenSP của các sản phẩm do công ty ‘Samsung’ sản xuất do nhân viên có mã ‘NV01’ nhập.

SELECT Nhap.MaSP, TenSP FROM dbo.SanPham INNER JOIN dbo.Nhap ON Nhap.MaSP = SanPham.MaSP 
INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN 
WHERE MaHangSX = N'Samsung' AND MaNV = 'NV01'

-- Đưa ra SoHDN,MaSP,SoLuongN,ngayN của mặt hàng có MaSP là ‘SP02’, được nhân viên ‘NV02’ xuất.