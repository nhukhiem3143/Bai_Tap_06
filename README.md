# Nguyễn Như Khiêm - K225480106030
# Bài tập 6: Hệ quản trị CSDL
# Chủ đề: Câu lệnh Select
# Yêu cầu bài tập: 
## Cho file sv_tnut.sql (1.6MB)
1. Hãy nêu các bước để import được dữ liệu trong sv_tnut.sql vào sql server của em
2. dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên (của sv đang làm bài tập này)
3. nhập sql để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm với em?
4. nhập sql để tìm xem có những sv nào trùng ngày và tháng sinh với em?
5. nhập sql để tìm xem có những sv nào trùng tháng và năm sinh với em?
6. nhập sql để tìm xem có những sv nào trùng tên với em?
7. nhập sql để tìm xem có những sv nào trùng họ và tên đệm với em.
8. nhập sql để tìm xem có những sv nào có sđt sai khác chỉ 1 số so với sđt của em.
9. BẢNG SV CÓ HƠN 9000 ROWS, HÃY LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT, GIẢI THÍCH.
10. HÃY NHẬP SQL ĐỂ LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV (TRÌNH BÀY QUÁ TRÌNH SUY NGHĨ VÀ GIẢI NHỮNG VỨNG MẮC)

## DEADLINE: 23H59:59 NGÀY 25/4/2025
## *Ghi chú: Giải thích tại sao lại có SQL như vậy.*

# Bài làm :
## 1. Các bước để import được dữ liệu trong sv_tnut.sql vào sql server 
## 2. Dữ liệu đầu vào là tên của sv; sđt; ngày, tháng, năm sinh của sinh viên :
- Tên : Khiêm
- Họ đệm : Nguyễn Như
- Số điện thoại : 0968694065
- Ngày/Tháng/Năm sinh : 31/05/2004
## 3. SQL để tìm xem có những sv nào trùng hoàn toàn ngày/tháng/năm 
```sql
SELECT * 
FROM SV 
WHERE ns = '2004-05-31';
```

## 4. SQL để tìm xem có những sv nào trùng ngày và tháng sinh 
```sql
SELECT *
FROM SV
WHERE DAY(ns) = 31 AND MONTH(ns) = 5;
```
## 5. SQL để tìm xem có những sv nào trùng tháng và năm sinh 
```sql
SELECT *
FROM SV
WHERE MONTH(ns) = 5 AND YEAR(ns) = 2004;
```

## 6. SQL để tìm xem có những sv nào trùng tên 
```sql
SELECT *
FROM SV
WHERE ten = N'Khiêm';
```

## 7. SQL để tìm xem có những sv nào trùng họ và tên đệm 
```sql
SELECT *
FROM SV
WHERE hodem = N'Nguyễn Như';
```


## 8. SQL để tìm xem có những sv nào có sđt sai khác chỉ 1 số dt 
```sql
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
```

## 9. LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT
```sql
SELECT *
FROM SV
WHERE lop LIKE N'%KMT%' OR lop LIKE N'%KTP%'
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;
```

### GIẢI THÍCH : 


## 10. SQL LIỆT KÊ CÁC SV NỮ NGÀNH KMT CÓ TRONG BẢNG SV 
```sql
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
```











