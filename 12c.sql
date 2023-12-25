﻿--  Hãy Đưa ra tổng tiền nhập của mỗi nhân viên trong tháng 8 – năm 2018 có tổng giá trị lớn hơn 100.000	SELECT MaNV,SUM(SoLuongN*DonGiaN) AS TTN FROM dbo.Nhap INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN	WHERE MONTH(NgayNhap) = 08 AND YEAR(NgayNhap) = 2018	GROUP BY MaNV	HAVING SUM(SoLuongN*DonGiaN) > 100000-- Hãy Đưa ra danh sách các sản phẩm đã nhập nhưng chưa xuất bao giờ. Select SanPham.MaSP,TenSP	SELECT * FROM dbo.SanPham INNER JOIN dbo.Nhap ON Nhap.MaSP = SanPham.MaSP	WHERE Nhap.MaSP NOT IN 	(		SELECT MaSP FROM dbo.Xuat	)-- Hãy Đưa ra danh sách các sản phẩm đã nhập năm 2020 và đã xuất năm 2020.	SELECT SanPham.MaSP, TenSP, MaHangSX FROM dbo.PNhap INNER JOIN dbo.PXuat ON PXuat.MaNV = PNhap.MaNV	INNER JOIN dbo.Nhap ON Nhap.SoHDN = PNhap.SoHDN	INNER JOIN dbo.SanPham ON SanPham.MaSP = Nhap.MaSP	WHERE YEAR(NgayNhap) = 2020 AND YEAR(NgayXuat) = 2020-- Hãy Đưa ra danh sách các nhân viên vừa nhập vừa xuất.	SELECT DISTINCT NhanVien.MaNV, TenNV FROM dbo.NhanVien INNER JOIN dbo.PNhap ON PNhap.MaNV = NhanVien.MaNV	INNER JOIN dbo.PXuat ON PXuat.MaNV = NhanVien.MaNV	WHERE NhanVien.MaNV IN 	(		SELECT MaNV FROM dbo.PNhap	)	AND NhanVien.MaNV IN 	(		SELECT MaNV FROM dbo.PXuat	)-- Hãy Đưa ra danh sách các nhân viên không tham gia việc nhập và xuất.	SELECT DISTINCT NhanVien.MaNV, TenNV FROM dbo.NhanVien INNER JOIN dbo.PNhap ON PNhap.MaNV = NhanVien.MaNV	INNER JOIN dbo.PXuat ON PXuat.MaNV = NhanVien.MaNV	WHERE NhanVien.MaNV NOT IN 	(		SELECT MaNV FROM dbo.PNhap	)	AND NhanVien.MaNV NOT IN 	(		SELECT MaNV FROM dbo.PXuat	)