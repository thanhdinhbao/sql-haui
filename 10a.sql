USE QLBanHang
GO
--b. Đưa ra thông tin MaSP, TenSP,SoLuong, MauSac, GiaBan, DonViTinh, MoTa của các sản phẩm sắp xếp theo chiều giảm dần giá bán.
SELECT MaSP,TenSP,SoLuong, MauSac, GiaBan,DonViTinh,MoTa FROM dbo.SanPham ORDER BY GiaBan DESC

-- Đưa ra thông tin 2 sản phẩm có giá bán thấp nhất.

SELECT TOP(2) * FROM dbo.SanPham ORDER BY GiaBan ASC

--  Đưa ra thông tin các nhân viên Nữ ở phòng ‘Kế toán’.

SELECT * FROM dbo.NhanVien WHERE GioiTinh=N'Nữ' AND TenPhong=N'Kế toán'

-- Đưa ra thông tin các sản phẩm có màu “Đỏ” và có giá bán từ 500.000 đến 10.000.000

SELECT * FROM dbo.SanPham WHERE MauSac = N'Đỏ' AND GiaBan BETWEEN 500000 AND 10000000

