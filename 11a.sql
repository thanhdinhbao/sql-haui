USE ThucTap 
GO
 
-- Đưa ra thông tin gồm mã số, họ tênvà tên khoa của tất cả các giảng viên

SELECT Magv, Hotengv, Tenkhoa FROM dbo.TBLGiangVien INNER JOIN dbo.TBLKhoa ON TBLKhoa.Makhoa = TBLGiangVien.Makhoa

-- Đưa ra thông tin gồm mã số, họ tênvà tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’

SELECT Magv, Hotengv, Tenkhoa FROM dbo.TBLGiangVien INNER JOIN dbo.TBLKhoa ON TBLKhoa.Makhoa = TBLGiangVien.Makhoa
WHERE TBLKhoa.Makhoa = 'Geo' 

-- Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’

SELECT COUNT(*) AS N'So sv khoa Bio' FROM dbo.TBLSinhVien WHERE Makhoa = 'Bio'

-- Đưa ra danh sách gồm mã số, họ tênvà tuổi của các sinh viên khoa ‘TOAN’

SELECT Masv, Hotensv, (YEAR(GETDATE())-Namsinh) AS N'Tuổi' FROM dbo.TBLSinhVien WHERE Makhoa = 'Math'

-- Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’

SELECT COUNT(*) AS N'So GV khoa Bio' FROM dbo.TBLGiangVien WHERE Makhoa = 'Bio'

-- Cho biết thông tin về sinh viên không tham gia thực tập

SELECT * FROM dbo.TBLSinhVien WHERE Masv NOT IN  (SELECT Masv FROM dbo.TBLHuongDan)

-- Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa

SELECT TBLKhoa.Makhoa,Tenkhoa, COUNT(TBLGiangVien.Makhoa) AS N'Số GV'  FROM dbo.TBLGiangVien INNER JOIN dbo.TBLKhoa ON TBLKhoa.Makhoa = TBLGiangVien.Makhoa
GROUP BY TBLKhoa.Makhoa, Tenkhoa

-- Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học

SELECT Dienthoai FROM dbo.TBLKhoa INNER JOIN dbo.TBLSinhVien ON TBLSinhVien.Makhoa = TBLKhoa.Makhoa
WHERE Hotensv = 'Le van son'

