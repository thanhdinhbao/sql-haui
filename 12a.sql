USE QLBanHang
GO

-- Đưa ra thông tin MaSP, TenSP, TenHang,SoLuong, MauSac, GiaBan, DonViTinh, MoTa của các sản phẩm sắp xếp theo chiều giảm dần giá bán

	SELECT MaSP, TenSP, TenHang,SoLuong, MauSac, GiaBan, DonViTinh, MoTa FROM dbo.SanPham INNER JOIN dbo.HangSX 
	ON HangSX.MaHangSX = SanPham.MaHangSX
	ORDER BY GiaBan DESC

--  Đưa ra thông tin các sản phẩm có trong cữa hàng do công ty có tên hãng là Samsung sản xuất
	
	SELECT * FROM dbo.SanPham INNER JOIN dbo.HangSX ON HangSX.MaHangSX = SanPham.MaHangSX
	WHERE HangSX.MaHangSX = 'H01'

-- . Đưa ra thông tin các nhân viên Nữ ở phòng ‘Kế toán’.
	
	SELECT * FROM dbo.NhanVien WHERE GioiTinh = N'Nữ' AND TenPhong = N'Kế toán'

-- Đưa ra thông tin phiếu nhập gồm: SoHDN, MaSP, TenSP, TenHang, SoLuongN,
--DonGiaN, TienNhap=SoLuongN*DonGiaN, MauSac, DonViTinh, NgayNhap, TenNV,
--TenPhong, sắp xếp theo chiều tăng dần của hóa đơn nhập

	SELECT Nhap.SoHDN, Nhap.MaSP, TenSP, TenHang, SoLuongN, DonGiaN, TienNhap = SoLuongN*DonGiaN, MauSac,DonViTinh,NgayNhap, TenNV, TenPhong
	FROM dbo.Nhap INNER JOIN dbo.SanPham ON SanPham.MaSP = Nhap.MaSP
	INNER JOIN dbo.HangSX ON HangSX.MaHangSX = SanPham.MaHangSX
	INNER JOIN dbo.PNhap ON PNhap.SoHDN = Nhap.SoHDN
	INNER JOIN dbo.NhanVien ON NhanVien.MaNV = PNhap.MaNV
	ORDER BY Nhap.SoHDN ASC

-- Đưa ra thông tin phiếu xuất gồm: SoHDX, MaSP, TenSP, TenHang, SoLuongX,
-- GiaBan, tienxuat=SoLuongX*GiaBan, MauSac, DonViTinh, NgayXuat, TenNV,
-- TenPhong trong tháng 06 năm 2020, sắp xếp theo chiều tăng dần của SoHDX.

	SELECT Xuat.SoHDX, SanPham.MaSP, TenSP, TenHang, SoLuongX,GiaBan, TienXuat = SoLuongX*GiaBan, MauSac, DonViTinh,NgayXuat,TenNV,TenPhong
	FROM dbo.Xuat INNER JOIN dbo.SanPham ON SanPham.MaSP = Xuat.MaSP
	INNER JOIN dbo.HangSX ON HangSX.MaHangSX = SanPham.MaHangSX
	INNER JOIN dbo.PXuat ON PXuat.SoHDX = Xuat.SoHDX
	INNER JOIN dbo.NhanVien ON NhanVien.MaNV = PXuat.MaNV
	WHERE MONTH(NgayXuat) = 06 AND YEAR(NgayXuat) = 2020
	ORDER BY Xuat.SoHDX ASC
