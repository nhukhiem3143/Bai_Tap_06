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
### Bước 1: Tạo Database sv_tnut

![Screenshot 2025-04-24 224454](https://github.com/user-attachments/assets/7143338f-cca5-4237-9413-62944efc5e7f)

### Bước 2: Bấm Ctrl O để mở file

![Screenshot 2025-04-24 225144](https://github.com/user-attachments/assets/fece2a4d-2520-4b48-90a5-6bbd7b1496f7)

### Bước 3: Chạy file

![Screenshot 2025-04-24 224454](https://github.com/user-attachments/assets/30c6b91a-ae1a-4317-85b0-6660cd657608)

#### Thêm thành công
![Screenshot 2025-04-24 224842](https://github.com/user-attachments/assets/fc8d6736-1eb6-4912-9cda-425cf06523ea)

### Bước 4: Kiểm tra xem đã có đủ dữ liệu hay chưa

![Screenshot 2025-04-24 230012](https://github.com/user-attachments/assets/ba4a8758-7b0b-4e6f-be5d-7a34915ec28f)

- Sẽ hiện bảng như này nhưng chỉ hiện giới hạn 200 Rows

![Screenshot 2025-04-24 230411](https://github.com/user-attachments/assets/e7240ec3-e9e3-4874-a6ac-8b20be85701d)

- Tạo new query mới để kiểm tra xem đã thêm đủ hay chưa

![Screenshot 2025-04-24 225808](https://github.com/user-attachments/assets/52f758d2-6530-4048-a4d0-ea0bcc027251)

### Như vậy là đã import được dữ liệu trong sv_tnut.sql vào sql server thành công

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
### 🧠 Giải thích: 
- ns là ngày sinh (kiểu date).
- Muốn tìm sinh viên trùng sinh nhật với mình cả ngày/tháng/năm thì so sánh trực tiếp là đủ.
- Câu này lọc ra những dòng có ngày sinh đúng bằng 2004-05-31, nghĩa là trùng hoàn toàn ngày/tháng/năm sinh với bạn.

### Kết quả : 

![image](https://github.com/user-attachments/assets/c2c9e28a-4ab3-40c4-a274-7ac1f6611589)

## 4. SQL để tìm xem có những sv nào trùng ngày và tháng sinh 
```sql
SELECT *
FROM SV
WHERE DAY(ns) = 31 AND MONTH(ns) = 5;
```
### 🧠 Giải thích:
- Chỉ quan tâm đến ngày và tháng, không care năm.
- Dùng hàm DAY() và MONTH() để tách ra so sánh.
- DAY(ns) lấy ra ngày trong tháng từ cột ns.
- MONTH(ns) lấy ra tháng từ ns.
- Lọc ra các sinh viên sinh ngày 31 tháng 5.
  
### Kết quả : 

![image](https://github.com/user-attachments/assets/15941f22-d424-411e-bf9d-ab58bfc6c140)

## 5. SQL để tìm xem có những sv nào trùng tháng và năm sinh 
```sql
SELECT *
FROM SV
WHERE MONTH(ns) = 5 AND YEAR(ns) = 2004;
```
### 🧠 Giải thích:
- Tương tự trên, giờ thì cần MONTH() và YEAR() để lọc ra sinh viên sinh cùng tháng và năm với bạn.
- Lọc các sinh viên sinh vào tháng 5 năm 2004, không cần đúng ngày.

### Kết quả : 

![image](https://github.com/user-attachments/assets/65c29838-9d5c-4c4d-be95-fb77d8c1a4b0)

## 6. SQL để tìm xem có những sv nào trùng tên 
```sql
SELECT *
FROM SV
WHERE ten = N'Khiêm';
```
### 🧠 Giải thích:
- So sánh cột ten với tên của bạn.
- Lọc ra các sinh viên có tên là Khiêm.
- Dùng N'' vì là chuỗi Unicode (có dấu tiếng Việt).

### Kết quả : 

![image](https://github.com/user-attachments/assets/e58175c6-2aba-4057-9d71-983c8bb4bff0)

## 7. SQL để tìm xem có những sv nào trùng họ và tên đệm 
```sql
SELECT *
FROM SV
WHERE hodem = N'Nguyễn Như';
```
### 🧠 Giải thích:
- Tương tự như trên nhưng giờ là cột hodem
- hodem là họ và tên đệm.
- Lọc ra các sinh viên có hodem giống bạn (Nguyễn Như).
- Dùng N'' vì là chuỗi Unicode (có dấu tiếng Việt).

### Kết quả : 

![image](https://github.com/user-attachments/assets/9bf9880e-057f-4b97-8178-eb20695e4463)

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
### 📌 Giải thích:
- LEN(sdt) đảm bảo chiều dài số điện thoại giống nhau.
- master.dbo.spt_values là bảng hệ thống chứa nhiều số liên tiếp (dùng để lặp từ 1 đến độ dài của số điện thoại).
- So sánh từng ký tự một giữa SV.sdt và '968694065', đếm số ký tự khác nhau.
- Chỉ lấy những dòng có đúng 1 ký tự khác.
### Kết quả : 

## 9. LIỆT KÊ TẤT CẢ CÁC SV NGÀNH KMT, SẮP XẾP THEO TÊN VÀ HỌ ĐỆM, KIỂU TIẾNG  VIỆT
```sql
SELECT *
FROM SV
WHERE lop LIKE N'%KMT%' OR lop LIKE N'%KTP%'
ORDER BY ten COLLATE Vietnamese_CI_AS, hodem COLLATE Vietnamese_CI_AS;
```
### 🧠 Giải thích:
- Lọc theo lớp có chữ KMT hoặc KTP (2 ngành cùng chuyên ngành).
- COLLATE Vietnamese_CI_AS: Sắp xếp theo chuẩn bảng chữ cái tiếng Việt, không lệch dấu hay sai thứ tự ă, â, đ....

### Kết quả : 

![image](https://github.com/user-attachments/assets/91647ae7-0dba-41a9-93a4-079386301dd1)

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
### 🧠 Giải thích:
- lop LIKE '%KMT%' hoặc '%KTP%': Lọc đúng ngành. LIKE : chỉ cần có Ký tự giống ko cần giống hết.
- hodem LIKE '%Thị%' là gợi ý mạnh để nhận diện nữ. Đoán giới tính nữ qua họ đệm Thị hoặc tên phổ biến của nữ.
- Bổ sung danh sách các tên phổ biến của nữ (Lan, Mai, Yến...) vì có người không có chữ "Thị".
- Loại trừ một số TH đặc biệt như "Văn Ngọc", "Khắc Linh", "Duy Linh", "Phạm Đan Linh" vì khả năng cao là nam (tên unisex, nhưng đệm chỉ nam) tên nghe như nữ nhưng thực ra là nam.
- Dùng TRIM() để tránh lỗi khoảng trắng trong dữ liệu.
#### ✅ Ý tưởng: vì không có cột gioitinh, nên bạn dùng logic phỏng đoán tên giới tính để lọc sinh viên nữ.
### Kết quả : 

![image](https://github.com/user-attachments/assets/ee05d7f2-c084-4f5a-9f0e-4937d086bce1)

# The End
