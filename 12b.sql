USE QLBanHang
GO

-- Đưa ra các thông tin về các hóa đơn mà hãng Samsung đã nhập trong năm 2020, gồm: SoHDN, MaSP, TenSP, SoLuongN, DonGiaN, NgayNhap, TenNV, TenPhong.

	SELECT Nhap.SoHDN, SanPham.MaSP, TenSP, SoLuongN,DonGiaN,NgayNhap,TenNV, TenPhong FROM dbo.Nhap INNER JOIN dbo.SanPham ON SanPham.MaSP = Nhap.MaSP
	INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN
	INNER JOIN dbo.NhanVien ON NhanVien.MaNV = PNhap.MaNV
	WHERE MaHangSX = 'H01' AND YEAR(NgayNhap) = 2020

--  Đưa ra Top 10 hóa đơn xuất có số lượng xuất nhiều nhất trong năm 2020, sắp xếp theo chiều giảm dần của SoLuongX.

	SELECT TOP(10) * FROM dbo.Xuat INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	WHERE YEAR(NgayXuat) = 2020 
	ORDER BY SoLuongX DESC

--  Đưa ra thông tin 10 sản phẩm có giá bán cao nhất trong cữa hàng, theo chiều giảm dần giá bán

	SELECT TOP(10) * FROM dbo.SanPham ORDER BY GiaBan DESC

-- Đưa ra các thông tin sản phẩm có giá bán từ 100.000 đến 500.000 của hãng Samsung

	SELECT * FROM dbo.SanPham WHERE GiaBan BETWEEN 100000 AND 500000 AND MaHangSX = 'H01'

-- Tính tổng tiền đã nhập trong năm 2020 của hãng Samsung. 

	SELECT SUM(SoLuongN*DonGiaN) AS N'Tổng tiền nhập' FROM dbo.Nhap INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN
	INNER JOIN dbo.SanPham ON SanPham.MaSP = Nhap.MaSP
	WHERE YEAR(NgayNhap) = 2020 AND MaHangSX = 'H01'

-- Đưa ra SoHDN, NgayNhap có tiền nhập phải trả cao nhất trong năm 2020

	SELECT Nhap.SoHDN, NgayNhap FROM dbo.PNhap INNER JOIN dbo.Nhap ON Nhap.SoHDN = PNhap.SoHDN
	WHERE YEAR(NgayNhap) = 2020 AND SoLuongN*DonGiaN =
	(
		SELECT MAX(SoLuongN*DonGiaN) FROM dbo.Nhap
	)

-- Thống kê tổng tiền đã xuất trong ngày 14/06/2020.

	SELECT SUM(SoLuongX*GiaBan) AS N'Tổng tiền xuất' FROM dbo.Xuat INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	INNER JOIN dbo.SanPham ON SanPham.MaSP = Xuat.MaSP
	WHERE NgayXuat = '06/14/2020'
-- . Đưa ra thông tin các sản phẩm được bán bởi nhân viên có tên ‘Nguyễn Lê Minh’ trong năm 2021.

	SELECT * FROM dbo.SanPham INNER JOIN dbo.Xuat ON Xuat.MaSP = SanPham.MaSP
	INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	INNER JOIN dbo.NhanVien ON NhanVien.MaNV = PXuat.MaNV
	WHERE TenNV = N'Nguyễn Lê Minh' AND YEAR(NgayXuat) = 2021

-- Đưa ra các mặt hàng đã bán trong ngày ‘3/2/2021’ sắp xếp theo chiều giảm dần soluongX.

	SELECT * FROM dbo.Xuat INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	WHERE NgayXuat = '03/02/2021' 
	ORDER BY SoLuongX DESC
-- 12.3

-- Hãy thống kê xem mỗi hãng sản xuất có bao nhiêu loại sản phẩm

	SELECT SanPham.MaHangSX, COUNT(TenSP) FROM dbo.HangSX INNER JOIN dbo.SanPham 
	ON SanPham.MaHangSX = HangSX.MaHangSX
	GROUP BY SanPham.MaHangSX

-- Hãy thống kê xem tổng tiền nhập của mỗi sản phẩm trong năm 2020.

	SELECT (SoLuongN*DonGiaN) AS N'Tổng tiền nhập mỗi sp 2020' FROM dbo.Nhap INNER JOIN dbo.PNhap 
	ON PNhap.SoHDN = Nhap.SoHDN
	WHERE YEAR(NgayNhap) = 2020

--  Hãy thống kê các sản phẩm có tổng số lượng xuất năm 2020 là lớn hơn 10.000 sản phẩm của hãng Samsung.

	SELECT * FROM dbo.Xuat INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	INNER JOIN dbo.SanPham ON SanPham.MaSP = Xuat.MaSP
	WHERE MaHangSX = 'H01' AND SUM(SoLuongX) > 10

-- Thống kê số lượng nhân viên Nam của mỗi phòng ban

	SELECT TenPhong,COUNT(*) AS N'Số lượng' FROM dbo.NhanVien WHERE GioiTinh = 'Nam' GROUP BY TenPhong 

-- Thống kê tổng số lượng nhập của mỗi hãng sản xuất trong năm 2018

	SELECT MaHangSX,COUNT(MaHangSX) AS N'Số lượng' FROM dbo.Nhap INNER JOIN dbo.SanPham ON SanPham.MaSP = Nhap.MaSP
	INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN
	WHERE YEAR(NgayNhap) = 2018
	GROUP BY MaHangSX

-- Hãy thống kê xem tổng lượng tiền xuất của mỗi nhân viên trong năm 2018 là bao nhiêu

	SELECT MaNV, (SoLuongX*GiaBan) AS N'Tổng tiền xuất' FROM dbo.Xuat INNER JOIN dbo.SanPham ON SanPham.MaSP = Xuat.MaSP
	INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	WHERE YEAR(NgayXuat) = 2020
	GROUP BY MaNV, (SoLuongX*GiaBan)
	





