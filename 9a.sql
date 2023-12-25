CREATE DATABASE SINHVIEN
ON PRIMARY (NAME = 'SINHVIEN', FILENAME = 'D:\SQL\SINHVIEN.mdf', SIZE = 8, MAXSIZE = UNLIMITED, FILEGROWTH = 32)
LOG ON (NAME = 'SINHVIEN_log', FILENAME = 'D:\SQL\SINHVIEN.ldf', SIZE = 8, MAXSIZE = UNLIMITED, FILEGROWTH = 32)

USE SINHVIEN 
GO

CREATE TABLE Khoa(MaKhoa CHAR(10) NOT NULL CONSTRAINT PK_Khoa PRIMARY KEY, TenKhoa CHAR(30), DienThoai CHAR(10))
CREATE TABLE GiangVien(MaGV INT NOT NULL CONSTRAINT PK_GV PRIMARY KEY, HoTenGV CHAR(30), Luong DECIMAL(5,2),MaKhoa CHAR(10) CONSTRAINT FK_GV_K FOREIGN KEY(MaKhoa) REFERENCES dbo.Khoa(MaKhoa))
CREATE TABLE SinhVien(MaSV int NOT NULL CONSTRAINT PK_SV PRIMARY KEY, HoTenSV CHAR(30), MaKhoa CHAR(10) CONSTRAINT FK_SV_K FOREIGN KEY(MaKhoa) REFERENCES dbo.Khoa(MaKhoa), NamSinh int, QueQuan CHAR(30))

INSERT INTO dbo.Khoa
(
    MaKhoa,
    TenKhoa,
    DienThoai
)
 VALUES ('K01',N'Khoa CNTT','012345678'),
 ('K02',N'Khoa Cơ Khí','987654321'),
 ('K03',N'Khoa Hóa','19283764')

 INSERT INTO dbo.GiangVien
 (
     MaGV,
     HoTenGV,
     Luong,
     MaKhoa
 )
  VALUES (123,N'Nguyễn Văn A',10.00,'K01'),
  (234,N'Nguyễn Văn B',11.00,'K03'),
  (345,N'Nguyễn Văn C',12.00,'K02'),
  (456,N'Nguyễn Văn D',9.00,'K01'),
  (567,N'Nguyễn Văn E',15.00,'K03')

  INSERT INTO SinhVien VALUES (1,N'Đinh Bảo A','K01',2001,N'Phú Thọ'),
  (2,N'Đinh Bảo B','K03',2004,N'Hà Nội'),
  (3,N'Đinh Bảo C','K02',2005,N'Nam Định'),
  (4,N'Đinh Bảo D','K01',2002,N'Hà Nội'),
  (5,N'Đinh Bảo E','K02',2003,N'Phú Thọ'),
  (6,N'Đinh Bảo F','K03',2000,N'Tuyên Quang')

  -- Đưa ra thông tin tất cả các sinh viên sắp xếp theo chiều tăng dần của năm sinh

  SELECT * FROM dbo.SinhVien ORDER BY NamSinh DESC

  -- Đưa ra thông tin 2 sinh viên có tuổi lớn nhất

  SELECT TOP(2) * FROM dbo.SinhVien ORDER BY (YEAR(CURRENT_TIMESTAMP)-NamSinh) DESC

  -- Đưa ra thông tin 30% giảng viên có lương cao nhất
  SELECT TOP(30) PERCENT * FROM GiangVien ORDER BY Luong DESC


  -- Đưa ra danh sách các sinh viên không có quê ở Hà Nội, Bắc Giang, Lạng Sơn

  SELECT * FROM SinhVien WHERE QueQuan NOT IN ('Ha Noi', 'Bac Giang', 'Lang Son')

  --Đưa ra thông tin 2 giảng viên có lương thấp nhấp

  SELECT TOP(2) * FROM dbo.GiangVien ORDER BY Luong ASC