--3. nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
SELECT * 
FROM SV 
WHERE ns = '2004-05-31';

--4. nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
SELECT *
FROM SV
WHERE DAY(ns) = 31 AND MONTH(ns) = 5;

--5. nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
SELECT *
FROM SV
WHERE MONTH(ns) = 5 AND YEAR(ns) = 2004;

--6. nhập sql để tìm xem có những sv nào trùng tên với em?
SELECT *
FROM SV
WHERE ten = N'Khiêm';

--7. nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
SELECT *
FROM SV
WHERE hodem = N'Nguyễn Như';

--8. nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
SELECT *
FROM SV
WHERE 
    LEN(sdt) = LEN('968694065') AND
    (
        SELECT COUNT(*)
        FROM (
            SELECT number 
            FROM master.dbo.spt_values 
            WHERE type = 'P' AND number BETWEEN 1 AND LEN('968694065')
        ) AS x
        WHERE SUBSTRING(SV.sdt, x.number, 1) <> SUBSTRING('968694065', x.number, 1)
    ) = 1;

--9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
SELECT *
FROM SV
WHERE lop LIKE N'%KMT%' OR lop LIKE N'%KTP%'
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;

--10. HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)
SELECT * 
FROM SV
WHERE (TRIM(lop) LIKE '%KMT%' OR TRIM(lop) LIKE '%KTP%')
  AND (
        TRIM(hodem) LIKE N'%Thị%' 
        OR ten IN (N'Lan', N'Hằng', N'Huệ', N'Bích', N'Mai', N'Hương', N'Linh', N'Thảo', N'Trang', N'Hiền', N'Giang', N'Ngọc', N'Yến')
      )
  AND NOT (
		   (TRIM(hodem) LIKE N'%Văn%' AND ten = N'Ngọc') 
        OR (TRIM(hodem) LIKE N'%Khắc%' AND ten = N'Linh')
	    OR (TRIM(hodem) LIKE N'%Duy%' AND ten = N'Linh')
		OR (TRIM(hodem) LIKE N'%Phạm Đan%' AND ten = N'Linh')
  );
