CREATE DATABASE QLBanHang
ON PRIMARY (NAME='QLBanHang', FILENAME ='D:\SQL\QLBanHang.mdf', SIZE=16,MAXSIZE=UNLIMITED,FILEGROWTH=32)
LOG ON (NAME='QLBanHang_log', FILENAME ='D:\SQL\QLBanHang.ldf', SIZE=16,MAXSIZE=UNLIMITED,FILEGROWTH=32)

GO
USE QLBanHang
GO

CREATE TABLE HangSX(MaHangSX NCHAR(10) NOT NULL CONSTRAINT PK_HangSX PRIMARY KEY,TenHang NVARCHAR(20),DiaChi NVARCHAR(30), SoDT NVARCHAR(20), Email NVARCHAR(30))
CREATE TABLE SanPham(MaSP NCHAR(10) NOT NULL CONSTRAINT PK_SanPham PRIMARY KEY, MaHangSX NCHAR(10) NOT NULL CONSTRAINT FK_SP_HSX FOREIGN KEY(MaHangSX) REFERENCES dbo.HangSX(MaHangSX), TenSP NVARCHAR(20), SoLuong INT, MauSac NVARCHAR(20), GiaBan MONEY, DonViTinh NCHAR(10), MoTa NVARCHAR(MAX))
CREATE TABLE NhanVien(MaNV NCHAR(10) NOT NULL CONSTRAINT PK_NhanVien PRIMARY KEY, TenNV NVARCHAR(20), GioiTinh NCHAR(10),DiaChi NVARCHAR(30), SoDT NVARCHAR(20), Email NVARCHAR(30), TenPhong NVARCHAR(30))
CREATE TABLE PNhap(SoHDN NCHAR(10) NOT NULL CONSTRAINT PK_PNhap PRIMARY KEY, NgayNhap DATE, MaNV NCHAR(10) CONSTRAINT FK_PNhap_NV FOREIGN KEY(MaNV) REFERENCES dbo.NhanVien(MaNV))
CREATE TABLE Nhap(SoHDN NCHAR(10) NOT NULL CONSTRAINT PK_Nhap PRIMARY KEY CONSTRAINT FK_Nhap_PNhap FOREIGN KEY(SoHDN) REFERENCES dbo.PNhap(SoHDN),MaSP NCHAR(10) CONSTRAINT FK_Nhap_SP FOREIGN KEY(MaSP) REFERENCES dbo.SanPham(MaSP), SoLuongN INT, DonGiaN MONEY)
CREATE TABLE PXuat(SoHDX NCHAR(10) NOT NULL CONSTRAINT PK_PXuat PRIMARY KEY, NgayXuat DATE, MaNV NCHAR(10) CONSTRAINT FK_PXuat_NV FOREIGN KEY(MaNV) REFERENCES dbo.NhanVien(MaNV))
CREATE TABLE Xuat(SoHDX NCHAR(10) NOT NULL CONSTRAINT PK_Xuat PRIMARY KEY CONSTRAINT FK_Xuat_PXuat FOREIGN KEY(SoHDX) REFERENCES dbo.PXuat(SoHDX), MaSP NCHAR(10) NOT NULL CONSTRAINT FK_Xuat_SP FOREIGN KEY(MaSP) REFERENCES dbo.SanPham(MaSP), SoLuongX INT)

INSERT INTO dbo.HangSX VALUES
(N'H01','Samsung','Korea','011-08271717','ss@gmail.com.kr'),
(N'H02','OPPO','China','081-08626262','oppo@gmail.com.cn'),
(N'H03','Vinfone',N'Việt nam','084-098262626','vf@gmail.com.vn')

INSERT INTO dbo.NhanVien
(
    MaNV,
    TenNV,
    GioiTinh,
    DiaChi,
    SoDT,
    Email,
    TenPhong
)
VALUES
('NV01', N'Nguyễn Thị Thu', N'Nữ', N'Hà Nội', '0982626521', 'thu@gmail.com', N'Kế toán'),
('NV02', N'Lê Văn Nam', N'Nam', N'Bắc Ninh', '0972525252', 'nam@gmail.com', N'Vật tư'),
('NV03', N'Trần Hòa Bình', N'Nữ', N'Hà Nội', '0328388388', 'hb@gmail.com', N'Kế toán')

INSERT INTO dbo.SanPham
(
    MaSP,
    MaHangSX,
    TenSP,
    SoLuong,
    MauSac,GiaBan,DonViTinh,MoTa
)
VALUES
('SP01', 'H02', 'F1 Plus', 100, N'Xám', 700000, N'Chiếc', N'Hàng cận cao cấp'),
('SP02', 'H01', 'Galaxy Note 11', 50, N'Đỏ', 19000000, N'Chiếc', N'Hàng cao cấp'),
('SP03', 'H02', 'F1 Lite', 200, N'Nâu', 3000000, N'Chiếc', N'Hàng phổ thông'),
('SP04', 'H03', 'Vjoy3', 200, N'Xám', 1500000, N'Chiếc', N'Hàng phổ thông'),
('SP05', 'H01', 'Galaxy V21', 500, N'Nâu', 8000000, N'Chiếc', N'Hàng cận cao cấp')

INSERT INTO dbo.PNhap
(
    SoHDN,
    NgayNhap,
    MaNV
)
 VALUES ('N01','02/05/2019','NV01'),
 ('N02','04/07/2020','NV02'),
 ('N03','05/17/2020','NV02'),
 ('N04','03/22/2020','NV03'),
 ('N05','07/07/2020','NV01')

 INSERT INTO dbo.Nhap
 (
     SoHDN,
     MaSP,
     SoLuongN,
     DonGiaN
 )
  VALUES ('N01','SP02',10,17000000),
  ('N02','SP01',30,6000000),
  ('N03','SP04',20,1200000),
  ('N04','SP01',10,6200000),
  ('N05','SP05',20,7000000)

  INSERT INTO dbo.PXuat
  (
      SoHDX,
      NgayXuat,
      MaNV
  )
   VALUES ('X01','06/14/2020','NV02'),
   ('X02','03/05/2019','NV03'),
   ('X03','12/12/2020','NV01'),
   ('X04','06/02/2020','NV02'),
   ('X05','05/18/2020','NV01')

INSERT INTO dbo.Xuat
(
    SoHDX,
    MaSP,
    SoLuongX
)
 VALUES ('X01','SP03',5),
 ('X02','SP01',3),
 ('X03','SP02',1),
 ('X04','SP03',2),
 ('X05','SP05',1)

--a. Hãy tạo/xóa/đọc thông tin CSDL quản lý bán hàng.
--e. Cập nhật lại Địa chỉ Nhân viên Hà tây thành Hà nội
UPDATE dbo.NhanVien SET DiaChi = N'Hà Nội' WHERE DiaChi = N'Hà Tây'
--f. Xóa Các Sản phẩm do hãng Blackberry cung ứng. 
DELETE dbo.SanPham WHERE MaHangSX='Blackberry'
