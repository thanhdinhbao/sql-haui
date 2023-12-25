USE ThucTap
GO

-- 1. Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn

SELECT TBLDeTai.Madt, Tendt FROM dbo.TBLDeTai INNER JOIN dbo.TBLHuongDan ON TBLHuongDan.Madt = TBLDeTai.Madt
INNER JOIN dbo.TBLGiangVien ON TBLGiangVien.Magv = TBLHuongDan.Magv
WHERE Hotengv = 'Tran son'

-- 2. Cho biết tên đề tài không có sinh viên nào thực tập

SELECT Tendt FROM dbo.TBLDeTai WHERE Madt NOT IN (SELECT Madt FROM dbo.TBLHuongDan)

-- 3. Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.

SELECT Magv, Hotengv, Tenkhoa FROM dbo.TBLGiangVien INNER JOIN dbo.TBLKhoa ON TBLKhoa.Makhoa = TBLGiangVien.Makhoa
WHERE Magv IN (
SELECT Magv FROM dbo.TBLHuongDan
GROUP BY Magv HAVING (COUNT(Masv) > 1)
)


-- 4. Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất

	SELECT Madt, Tendt FROM dbo.TBLDeTai WHERE Kinhphi IN 
	(

		SELECT MAX(Kinhphi)  FROM dbo.TBLDeTai
	)

-- 5. Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập

	SELECT DISTINCT TBLHuongDan.Madt,Tendt  FROM dbo.TBLHuongDan INNER JOIN dbo.TBLDeTai ON TBLDeTai.Madt = TBLHuongDan.Madt
	WHERE TBLHuongDan.Madt IN
	(
		SELECT Madt FROM dbo.TBLHuongDan 
		GROUP BY Madt 
		HAVING (COUNT(Masv) > 2)
	)

-- 6. Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’

	SELECT TBLSinhVien.Masv, Hotensv, KetQua FROM dbo.TBLSinhVien INNER JOIN dbo.TBLHuongDan ON TBLHuongDan.Masv = TBLSinhVien.Masv
	WHERE Makhoa = 'Geo'

-- 7. Đưa ra tên khoa, số lượng sinh viên của mỗi khoa

	SELECT Tenkhoa, COUNT(Masv) AS N'Số lượng sinh viên' FROM dbo.TBLKhoa INNER JOIN dbo.TBLSinhVien ON TBLSinhVien.Makhoa = TBLKhoa.Makhoa
	GROUP BY Tenkhoa

-- 8. Cho biết thông tin về các sinh viên thực tập tại quê nhà

	SELECT * FROM dbo.TBLSinhVien INNER JOIN dbo.TBLHuongDan ON TBLHuongDan.Masv = TBLSinhVien.Masv
	INNER JOIN dbo.TBLDeTai ON TBLDeTai.Madt = TBLHuongDan.Madt
	WHERE Quequan = Noithuctap

-- 9. Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập

	SELECT * FROM dbo.TBLSinhVien INNER JOIN dbo.TBLHuongDan ON TBLHuongDan.Masv = TBLSinhVien.Masv
	WHERE KetQua IS  NULL

-- 10.Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0

	SELECT TBLSinhVien.Masv, Hotensv FROM dbo.TBLSinhVien INNER JOIN dbo.TBLHuongDan ON TBLHuongDan.Masv = TBLSinhVien.Masv
	WHERE KetQua =  0