CREATE DATABASE QLSV
ON PRIMARY (NAME = 'QLSV', FILENAME = 'D:\SQL\QLSV.mdf', SIZE =8, MAXSIZE = UNLIMITED, FILEGROWTH = 32)
LOG ON (NAME = 'QLSV_Log', FILENAME = 'D:\SQL\QLSV.ldf', SIZE =8, MAXSIZE = UNLIMITED, FILEGROWTH = 32)

GO 
USE QLSV


CREATE TABLE SinhVien(MaSV NCHAR(20) NOT NULL CONSTRAINT PK_SinhVien PRIMARY KEY, TenSV NVARCHAR(30), QueQuan NVARCHAR(20))
CREATE TABLE MonHoc(MaMH NVARCHAR(20) NOT NULL CONSTRAINT PK_MonHoc PRIMARY KEY, TenMH NVARCHAR(30), SoTC INT DEFAULT 3 CONSTRAINT CHK_TC CHECK (SoTC >= 2 AND SoTC <=5))
CREATE TABLE KetQua(MaSV NCHAR(20) CONSTRAINT FK_KQ_SV FOREIGN KEY(MaSV) REFERENCES dbo.SinhVien(MaSV),MaMH NVARCHAR(20) CONSTRAINT FK_KQ_MH FOREIGN KEY(MaMH) REFERENCES dbo.MonHoc(MaMH), Diem NVARCHAR(20) CONSTRAINT CHK_Diem CHECK (Diem >=0 AND Diem <=10))

INSERT INTO dbo.SinhVien
(
    MaSV,
    TenSV,
    QueQuan
)
VALUES
(   '2022601124',
    N'Đinh Bảo Thành',
    N'Phú Thọ'
    ),(   '2022601123',
    N'Hoàng Bảo Tuyên',
    N'Hải Ní'
    ),(   '2022601122',
    N'Trường Nê',
    N'Đông Ank'
    )

INSERT INTO dbo.MonHoc
(
    MaMH,
    TenMH,
    SoTC
)
VALUES
(   'M1',    -- MaMH - nvarchar(20)
    N'Toán',   -- TenMH - nvarchar(30)
    DEFAULT -- SoTC - int
    ),
	(   'M2',    -- MaMH - nvarchar(20)
    N'Văn',   -- TenMH - nvarchar(30)
    2 -- SoTC - int
    ),
	(   'M3',    -- MaMH - nvarchar(20)
    N'Anh',   -- TenMH - nvarchar(30)
    4 -- SoTC - int
    )

	INSERT INTO dbo.KetQua
	(
	    MaSV,
	    MaMH,
	    Diem
	)
	VALUES
	(   '2022601124', -- MaSV - nchar(20)
	    'm1', -- MaMH - nvarchar(20)
	    '10'  -- Diem - nvarchar(20)
	    ),	(   '2022601123', -- MaSV - nchar(20)
	    'm1', -- MaMH - nvarchar(20)
	    '4'  -- Diem - nvarchar(20)
	    ),	(   '2022601122', -- MaSV - nchar(20)
	    'm3', -- MaMH - nvarchar(20)
	    '7'  -- Diem - nvarchar(20)
	    ),	(   '2022601122', -- MaSV - nchar(20)
	    'm2', -- MaMH - nvarchar(20)
	    '1'  -- Diem - nvarchar(20)
	    ),	(   '2022601123', -- MaSV - nchar(20)
	    'm2', -- MaMH - nvarchar(20)
	    '9'  -- Diem - nvarchar(20)
	    ),	(   '2022601124', -- MaSV - nchar(20)
	    'm3', -- MaMH - nvarchar(20)
	    '4'  -- Diem - nvarchar(20)
	    )

		SELECT * FROM dbo.MonHoc

		SELECT * FROM dbo.SinhVien

		SELECT * FROM dbo.KetQua
