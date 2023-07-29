# QuanLyBanHang
Bài Tập Thực Hành Số 2: Tạo Bảng

1. Tạo CSDL có tên : 
Create DATABASE QuanLyBanHang;

2. Sử dụng CSDL QuanLyBanHang, tạo các bảng sau :

create DATABASE QuanLyBanHang;

USE QuanLyBanHang;

CREATE TABLE TinhTP (
    MaTP CHAR(2) PRIMARY KEY NOT NULL,
    TenTP VARCHAR(30) NOT NULL DEFAULT ' '
);

CREATE TABLE DonVi (
    MaDV CHAR(2) PRIMARY KEY NOT NULL,
    TenDV VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE NhaCungCap (
    MaNCC INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TenNCC VARCHAR(30) NOT NULL UNIQUE,
    DiaChi VARCHAR(60) NOT NULL DEFAULT ' ',
    DienThoai VARCHAR(11) NOT NULL DEFAULT ' '
);

CREATE TABLE MatHang (
    MaMH INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TenMH VARCHAR(30) NOT NULL UNIQUE,
    DonViTinh VARCHAR(20) NOT NULL DEFAULT ' ',
    DonGia INT UNSIGNED NOT NULL DEFAULT 0,
    HinhSP TEXT NULL,
    MaNCC INT NOT NULL
);

CREATE TABLE KhachHang (
    MaKH VARCHAR(10) PRIMARY KEY NOT NULL,
    TenKH VARCHAR(40) NOT NULL DEFAULT ' ',
    DiaChi VARCHAR(60) NOT NULL DEFAULT ' ',
    DienThoai VARCHAR(11) NOT NULL DEFAULT ' ',
    MaTP CHAR(2) NOT NULL
);

CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    HoLot VARCHAR(30) NOT NULL DEFAULT ' ',
    TenNV VARCHAR(20) NOT NULL DEFAULT ' ',
    Phai ENUM('F', 'M') NOT NULL DEFAULT 'F',
    LuongCB INT UNSIGNED NOT NULL DEFAULT 0,
    NgayNViec DATE NOT NULL,
    DiaChiNV VARCHAR(60) NOT NULL DEFAULT ' ',
    DienThoaiNV VARCHAR(11) NULL DEFAULT ' ',
    HinhNV TEXT NULL
);

CREATE TABLE DonDatHang (
    MaDDH CHAR(5) PRIMARY KEY NOT NULL,
    MaKH VARCHAR(10) NOT NULL,
    MaNV INT NOT NULL,
    NgayDH DATE NOT NULL,
    NgayGiao DATE
);

CREATE TABLE ChiTietDDH (
    MaDDH CHAR(5) NOT NULL,
    MaMH INT NOT NULL,
    SoLuong INT NOT NULL,
    GiamGia DATE DEFAULT 0,
    PRIMARY KEY (MaDDH, MaMH)
);

CREATE TABLE ChamCong (
    Thang TINYINT UNSIGNED NOT NULL,
    Nam SMALLINT UNSIGNED NOT NULL,
    MaNV INT NOT NULL,
    NgayCong TINYINT DEFAULT 0,
    PRIMARY KEY (Thang, Nam, MaNV)
);

3. Mô hình quan hệ giữa các bảng :
ALTER TABLE `ChamCong` ADD FOREIGN KEY (`MaNV`) REFER `NhanVien`(`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DonDatHang` ADD FOREIGN KEY (`MaNV`) REFERENCES `NhanVien`(`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `NhanVien` ADD FOREIGN KEY (`MaDV`) REFERENCES `DonVi`(`MaDV`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `DonDatHang` ADD FOREIGN KEY (`MaKH`) REFERENCES `KhachHang`(`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ChiTietDDH` ADD FOREIGN KEY (`MaDDH`) REFERENCES `DonDatHang`(`MaDDH`) ON DELETE CASCADE ON UPDATE CASCADE;

CHANGE TABLE `ChiTietDDH` ADD FOREIGN KEY (`MaMH`) REFERENCES `MatHang`(`MaMH`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `KhachHang` ADD FOREIGN KEY (`MaTP`) REFER `TinhTP`(`MaTP`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `MatHang` ADD FOREIGN KEY (`MaNCC`) REFER `NhaCungCap`(`MaNCC`) ON DELETE CASCADE ON UPDATE CASCADE;

4. Thực hiện một số câu lệnh trên bảng :
•	Xem danh sách các bảng của CSDL QuanlyBanHang.
SHOW TABLES;

•	Xem danh sách của các cột trong từng bảng.
-- Xem danh sách các cột trong bảng TinhTP
SHOW COLUMNS FROM TinhTP;

-- Xem danh sách các cột trong bảng DonVi
SHOW COLUMNS FROM DonVi;

-- Xem danh sách các cột trong bảng NhaCungCap
SHOW COLUMNS FROM NhaCungCap;

-- Xem danh sách các cột trong bảng MatHang
SHOW COLUMNS FROM MatHang;

-- Xem danh sách các cột trong bảng KhachHang
SHOW COLUMNS FROM KhachHang;

-- Xem danh sách các cột trong bảng NhanVien
SHOW COLUMNS FROM NhanVien;

-- Xem danh sách các cột trong bảng DonDatHang
SHOW COLUMNS FROM DonDatHang;

-- Xem danh sách các cột trong bảng ChiTietDDH
SHOW COLUMNS FROM ChiTietDDH;

•	Xem cấu trúc của từng bảng.
-- Xem cấu trúc của bảng TinhTP
DESC TinhTP;

-- Xem cấu trúc của bảng DonVi
DESC DonVi;

-- Xem cấu trúc của bảng NhaCungCap
DESC NhaCungCap;

-- Xem cấu trúc của bảng MatHang
DESC MatHang;

-- Xem cấu trúc của bảng KhachHang
DESC KhachHang;

-- Xem cấu trúc của bảng NhanVien
DESC NhanVien;

-- Xem cấu trúc của bảng DonDatHang
DESC DonDatHang;

-- Xem cấu trúc của bảng ChiTietDDH
DESC ChiTietDDH;

5. Nhập dữ liệu vào bảng

INSERT INTO TinhTP (MaTP, TenTP)
VALUES
    ('CT', 'Can Tho'),
    ('HN', 'Hà Nội'),
    ('HP', 'Hải Phòng'),
    ('HU', 'Hué'),
    ('ND', 'Nam Định'),
    ('NT', 'Nha Trang'),
    ('TP', 'TP. Hồ Chí Minh'),
    ('VI', 'Vinh');

INSERT INTO DonVi (MaDV, TenDV)
VALUES
    ('GD', 'Ban Giám Đốc'),
    ('KT', 'Kế Toán'),
    ('NV', 'Nghiệp Vụ'),
    ('TC', 'Tổ Chức');

INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChi, DienThoai)
VALUES
    (1, 'CTY Đồ Hộp Tân Bin', 'TP.HCM', '123456'),
    (2, 'CTY Rượu Bình Tân', 'Dien Thoai', '342342'),
    (3, 'CTY Đức Phát', 'TP.HCM', '453456'),
    (4, 'CTY Rau Quả Việt Nam.', 'Hà Nội', '867567'),
    (5, 'CTY Thủy Săn Tiền Giang', 'Tiền Giang', '876876'),
    (6, 'CTY VINAMILK', 'TP.HCM', '646478'),
    (7, 'CTY Nông Sản Lâm Đồng', 'Đà Lạt', '565467');

INSERT INTO MatHang (MaMH, TenMH, DonViTinh, DonGia, HinhSP, MaNCC)
VALUES
    (1, 'Rượu', 'Chai', 230.00, NULL, 7),
    (2, 'Tiêu', 'Hôp', 40.00, NULL, 7),
    (3, 'Bánh Kem', 'Cái', 10.00, NULL, 3),
    (4, 'Bơ', 'Kg', 38.00, NULL, 6),
    (5, 'Bánh Mì', 'Cái', 8.00, NULL, 3),
    (6, 'Nem', 'Kg', 23.79, NULL, 1),
    (7, 'Táo', 'Kg', 5.00, NULL, 4),
    (8, 'Cá Hộp', 'Thùng', 62.50, NULL, 1);

INSERT INTO KhachHang (MaKH, TenKH, DiaChi, MaTP, DienThoai)
VALUES
    ('CODACO', 'Cơ Khí Dân Dụng', '388 Hòa Hảo P5', 'TP', '1757828'),
    ('COTEC', 'Công Nghệ Mới', '319 Nguyễn Trãi P7', 'CT', '7657657'),
    ('DHP', 'Đại Hưng Phát', '343 Nhật Tảo P16', 'NT', '6546565'),
    ('GIAY32', 'Giày 32', '105A Ngô Quyền P11', 'CT', '6565468'),
    ('RUBIMEX', 'Công Nghiệp Cao Su', '220 Lê Văn Sỹ', 'NT', '2987912'),
    ('SAMACO', 'SXKD Dịch Vụ Tổng Hợp', '56 Nguyễn Biểu P2', 'CT', '1987987'),
    ('SAMECO', 'Cơ khí Sài Gòn', '156 Lê Đại Hành P7', 'HN', '2397997'),
    ('TRACODI', 'Đầu tư phát triển GTVT', 'Hàm Nghi Q1', 'HP', '0976766'),
    ('VITICO', 'Hóa Nhựa Vĩnh Tiến', '35 Tô Hiến Thành P14', 'TP', '3987980'),
    ('VTP', 'Van Hưng Phát', '119 Bạch Vân P17', 'HN', '3765768');

INSERT INTO `NhanVien` (`MaNV`, `HoLot`, `TenNV`, `Phai`, `LuongCB`, `NgayNViec`, `DiaChiNV`, `DienThoaiNV`, `HinhNV`, `MaDV`) VALUES
(1, 'Nguyen', 'Van A' ,'M', '5000000', '2023-05-04', 'Hà Nội', '09800000', '', 'GD'),
(2, 'Nguyen', 'Van B' ,'M', '1000000', '2023-05-04', 'Can Tho', '09800001', '', 'KT'),
(3, 'Nguyen', 'Van C' ,'M', '4000000', '2023-05-04', 'Hải Phòng', '09800002', '', 'NV'),
(4, 'Nguyen', 'Thi D' ,'F', '3000000', '2023-05-04', 'Hà Nội', '09800003', '', 'TC'),
(5, 'Nguyen', 'Thi E' ,'F' ,'8000000', '2023-05-04', 'Hà Nội', '09800004', '', 'GD'),
(6, 'Nguyen', 'Van G' ,'M', '7000000', '2023-05-04', 'Hà Nội', '09800005', '', 'GD'),
(7, 'Nguyen', 'Van H' ,'M', '3000000', '2023-05-04', 'Nam Định', '09800006', '', 'KT'),
(8, 'Nguyen', 'Van K' ,'M', '4000000', '2023-05-04', 'Nha Trang', '09800007', '', 'NV'),
(9, 'Nguyen', 'Thi L' ,'F', '5000000', '2023-05-04', 'Vinh', '09800008', '', 'TC'),
(10, 'Nguyen', 'Thi M' ,'F' ,'4000000', '2023-05-04', 'TP. Hồ Chí Minh', '09800009', '', 'GD');

INSERT INTO `ChamCong` (`Thang`, `Nam`, `MaNV`, `NgayCong`) VALUES
(1, 2023, 1, 1),
(1, 2023, 2, 2),
(1, 2023, 3, 3),
(1, 2023, 4, 4),
(1, 2023, 5, 5),
(1, 2023, 6, 6),
(1, 2023, 7, 7),
(1, 2023, 8, 8),
(1, 2023, 9, 9),
(1, 2023, 10, 10);

INSERT INTO `DonDatHang` (`MaDDH`, `MaKH`, `MaNV`, `NgayDH`, `NgayGiao`) VALUES
('DH01', 'CODACO', 1, '2023-09-28', '2023-10-02'),
('DH02', 'COTEC', 2, '2023-08-29', '2023-09-03'),
('DH03', 'DHP', 3, '2023-10-30', '2023-11-04'),
('DH04', 'RUBIMEX', 4, '2023-11-30', '2023-12-05'),
('DH05', 'SAMACO', 5, '2023-12-01', '2023-12-06');

INSERT INTO `ChiTietDDH` (`MaDDH`, `MaMH`, `SoLuong`, `GiamGia`) VALUES
('DH01', 1, 1, 0.5),
('DH01', 2, 3, 0.5),
('DH02', 3, 5, 0.5),
('DH02', 4, 7, 0.5),
('DH03', 5, 2, 0.5),
('DH04', 6, 4, 0.5),
('DH05', 7, 6, 0.5);






Bài Tập Thực Hành Số 3: Truy vấn

1. Liệt kê danh sách các mặt hàng, bao gồm các thông tin sau : MaMH, TenMH,
DonViTinh, DonGia.
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang;
2. Liệt kê các mặt hàng có đơn giá >=62 thông tin gồm các cột sau: MaMH, TenMH,
DonViTinh, DonGia.
SELECT MaMH, TenMH, DonViTinh, DonGia
FROM MatHang
WHERE DonGia >= 62;
3. Liệt kê các mặt hàng mà nhà cung cấp có MaNCC là 4 hoặc 2 thông tin gồm các cột sau: MaNCC, TenNCC, MaMH, TenMH, DonViTinh, DonGia.
SELECT NhaCungCap.MaNCC, TenNCC, MaMH, TenMH, DonViTinh, DonGia
FROM MatHang
JOIN NhaCungCap ON MatHang.MaNCC = NhaCungCap.MaNCC
WHERE NhaCungCap.MaNCC IN (2, 4);
4. Liệt kê các mặt hàng mà nhà cung cấp có địa chỉ tại TP.HCM thông tin gồm các cột sau: MaNCC, TenNCC, DiaChi, MaMH, TenMH, DonViTinh, DonGia.
SELECT NhaCungCap.MaNCC, TenNCC, DiaChi, MaMH, TenMH, DonViTinh, DonGia
FROM MatHang
JOIN NhaCungCap ON MatHang.MaNCC = NhaCungCap.MaNCC
WHERE NhaCungCap.DiaChi = 'TP.HCM';
5. Liệt kê các đơn hàng trong khoảng thời gian từ ngày 01/01/1997 đến ngày
31/01/1997 thông tin gồm các trường sau: MaDDH, NgayDH, MaKH, TenKH,
MaMH, TenMH, SoLuong.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, KhachHang.MaKH, KhachHang.TenKH, ChiTietDDH.MaMH, MatHang.TenMH, ChiTietDDH.SoLuong
FROM DonDatHang 
JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
WHERE DonDatHang.NgayDH BETWEEN '1997-01-01' AND '1997-01-31';
6. Liệt kê các đơn hàng trong tháng 2 năm 1997 thông tin gồm các trường sau : MaDDH, NgayDH, NgayGiao, MaNV, HoTenNV.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, DonDatHang.NgayGiao, NhanVien.MaNV, NhanVien.HoLot + ' ' + NhanVien.TenNV AS HoTenNV
FROM DonDatHang 
JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE DonDatHang.NgayDH >= '1997-02-01' AND DonDatHang.NgayDH <= '1997-02-28';
7. Liệt kê các đơn đặt hàng giao trước ngày 01/03/1997 và nhân viên phục vụ có MaNV là 4 hay 5. Thông tin gồm các trường sau : MaDDH, NgayDH, MaKH, TenKH, MaNV, HoTenNV.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, KhachHang.MaKH, KhachHang.TenKH, DonDatHang.MaNV, NhanVien.HoLot + ' ' + NhanVien.TenNV AS HoTenNV
FROM DonDatHang 
JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE DonDatHang.NgayGiao < '1997-03-01' AND DonDatHang.MaNV IN (4, 5);
8. Liệt kê các nhân viên thuộc phái Nam. Thông tin gồm các trường sau: MaNV, HoLot, TenNV, DiaChi, NgayNViec, Phai
SELECT MaNV, HoLot, TenNV, DiaChiNV, NgayNViec, Phai
FROM NhanVien
WHERE Phai = 'M';
9. Liệt kê các nhân viên nhận việc từ ngày 01/07/1991 đến ngày 30/11/1992 và lương cơ bản <300 thông tin gồm các Field sau: MaDV, MaNV, HoLot, TenNV, Phai, LuongCB, NgayNV.
SELECT MaDV, MaNV, HoLot, TenNV, Phai, LuongCB, NgayNViec
FROM NhanVien
WHERE NgayNViec BETWEEN '1991-07-01' AND '1992-11-30' AND LuongCB < 300;
10. Liệt kê các nhân viên Nữ cư trú tại Q1 Hay Nam. Thông tin gồm các field sau: MaNV, HoLot, Ten,NV, Phai, DiaChi.
SELECT MaNV, HoLot, TenNV, Phai, DiaChiNV
FROM NhanVien
WHERE (Phai = 'F' AND DiaChiNV LIKE '%Q1%') OR (Phai = 'M' AND DiaChiNV LIKE '%Nam%');
11. Liệt kê các nhân viên có ngày công làm việc trong tháng 1 năm 1999 nhỏ hơn 25 ngày thông tin gồm các Field sau: MaNV, HoLot, TenNV, MaDV, TenDV, Thang, Nam, NgayCong.
SELECT ChamCong.MaNV, NhanVien.HoLot, NhanVien.TenNV, NhanVien.MaDV, DonVi.TenDV, ChamCong.Thang, ChamCong.Nam, ChamCong.NgayCong
FROM ChamCong 
JOIN NhanVien ON ChamCong.MaNV = NhanVien.MaNV
JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
WHERE ChamCong.Thang = 1 AND ChamCong.Nam = 1999 AND ChamCong.NgayCong < 25;
12. Liệt kê các đơn hàng mà nhân viên phục vụ thuộc phái nữ thông tin gồm các trường sau: MaDDH, NgayDH, NgayGiao, MaNV, HoTenNV, Phai.
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, DonDatHang.NgayGiao, NhanVien.MaNV, NhanVien.HoLot + ' ' + NhanVien.TenNV AS HoTenNV, NhanVien.Phai
FROM DonDatHang 
JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE NhanVien.Phai = 'F';
13. Liệt kê các đơn hàng được hẹn giao trong vòng 15 ngày sau khi đặt hàng. Thông tin gồm các trường sau: MaDDH, NgayDH, NgayGiao, MaKH, TenKH, Thời gian (Từ ngày đặt hàng đến ngày giao hàng)
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, DonDatHang.NgayGiao, KhachHang.MaKH, KhachHang.TenKH,
       DATEDIFF(DD, DonDatHang.NgayDH, DonDatHang.NgayGiao) AS ThoiGianGiaoHang
FROM DonDatHang 
JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
WHERE DATEDIFF(DD, DonDatHang.NgayDH, DonDatHang.NgayGiao) <= 15;
14. Liệt kê các đơn đặt hàng. Thông tin gồm các trường sau : MaDDH, NgayDH, MaMH, tenMH, SoLuong, DonGia, ThanhTien (Biết ThanhTien = SoLuong*DonGia*(1- GiamGia)
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, ChiTietDDH.MaMH, MatHang.TenMH, ChiTietDDH.SoLuong, MatHang.DonGia, (ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) AS ThanhTien
FROM DonDatHang 
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH;
15. Liệt kê các đơn hàng được đặt trong quý 1 năm 1997. Thông tin gồm các trường sau: Nam, Quy, NgayDH, MaDDH, MaKH, TenKH, MaNV, TenNV
SELECT DATEPART(YEAR, DonDatHang.NgayDH) AS Nam, DATEPART(QUARTER, DonDatHang.NgayDH) AS Quy,
       DonDatHang.NgayDH, DonDatHang.MaDDH, DonDatHang.MaKH, KhachHang.TenKH, DonDatHang.MaNV, NhanVien.TenNV
FROM DonDatHang 
JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
JOIN NhanVien ON DonDatHang.MaNV = NhanVien.MaNV
WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1997 AND DATEPART(QUARTER, DonDatHang.NgayDH) = 1;
16. Liệt kê các đơn đặt hàng có chứa các mặt hàng có mã như sau: 1,3,5,7 thông tin gồm: MaDDH, NgayDH, MaMH, TenMH
SELECT DonDatHang.MaDDH, DonDatHang.NgayDH, ChiTietDDH.MaMH, MatHang.TenMH
FROM DonDatHang 
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
WHERE ChiTietDDH.MaMH IN (1, 3, 5, 7);
17. Đếm tổng số khách hàng theo từng TinhTp. Thông tin gồm: MaTP, TongsoKH.
SELECT MaTP, COUNT(MaKH) AS TongsoKH
FROM KhachHang
GROUP BY MaTP;
18. Đếm tổng số nhân viên theo từng Đơn Vị. Thông tin gồm: MaDV, TenDV,
TongSoNV.
SELECT MaDV, COUNT(MaNV) AS TongSoNV
FROM NhanVien
GROUP BY MaDV;
19. Đếm số đơn hàng. Thông tin gồm : Nam, MaKH, TenKH, TongSoDonDatHang.
SELECT DATEPART(YEAR, NgayDH) AS Nam, COUNT(MaDDH) AS TongSoDDH
FROM DonDatHang
GROUP BY DATEPART(YEAR, NgayDH);
20. Tính tổng trị (Thành tiền) của từng đơn hàng. Thông tin gồm : Nam, MaDDH, MaKH, NgayDH, NgayGiao, TongTri.
SELECT DATEPART(YEAR, NgayDH) AS Nam, MaDDH, NgayDH, NgayGiao,
       SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) AS TongTri
FROM DonDatHang 
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
GROUP BY DATEPART(YEAR, NgayDH), MaDDH, NgayDH, NgayGiao;
21. Tính tổng thành tiền của từng khách hàng trong từng năm. Thông tin gồm: Nam, MaKH, TenKH, TongTien
SELECT DATEPART(YEAR, DonDatHang.NgayDH) AS Nam, DonDatHang.MaKH, KhachHang.TenKH,
       SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) AS TongTien
FROM DonDatHang 
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
GROUP BY DATEPART(YEAR, DonDatHang.NgayDH), DonDatHang.MaKH, KhachHang.TenKH;
22. Liệt kê danh sách khách hàng có tổng trị đặt hàng nhiều nhất trong năm 1998. Thông tin gồm : MaKH, TenKH, Nam, TongTienMax.
SELECT DonDatHang.MaKH, KhachHang.TenKH, 1998 AS Nam, 
       SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) AS TongTienMax
FROM DonDatHang DDH
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
JOIN KhachHang ON DonDatHang.MaKH = KhachHang.MaKH
WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1998
GROUP BY DonDatHang.MaKH, KhachHang.TenKH
HAVING SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) = (
    SELECT MAX(TongTien)
    FROM (
        SELECT DonDatHang.MaKH, SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) AS TongTien
        FROM DonDatHang
        JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
        JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
        WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1998
        GROUP BY DonDatHang.MaKH
    ) AS T
);
23. Liệt kê danh sách các mặt hàng có tổng giá trị đặt hàng nhiều nhất trong 1997 thông tin gồm : MaMH, TenMH, Nam, TongTienMax
SELECT MatHang.MaMH, TenMH, Nam, MAX(TongTien) AS TongTienMax
FROM (
    SELECT MatHang.MaMH, TenMH, YEAR(DonDatHang.NgayDH) AS Nam, SUM(SoLuong * DonGia * (1 - IFNULL(GiamGia, 0))) AS TongTien
    FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE YEAR(DonDatHang.NgayDH) = 1997
    GROUP BY MatHang.MaMH, TenMH, Nam
) AS TongTienNam
GROUP BY MatHang.MaMH, TenMH, Nam
HAVING TongTienMax = (
    SELECT MAX(TongTien) AS MaxTongTien
    FROM (
        SELECT YEAR(NgayDH) AS Nam, SUM(SoLuong * DonGia * (1 - IFNULL(GiamGia, 0))) AS TongTien
        FROM DonDatHang
        JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
        JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
        WHERE YEAR(NgayDH) = 1997
        GROUP BY Nam
    ) AS TongTienNamMax
);
24. Cuối năm công ty muốn tặng lịch cho khách hàng với quy định như sau: 1 đơn đặt hàng 2 cuốn lịch. Tạo truy vấn gồm các thông tin sau: MaKH, TenKH, DiaChi,
SoDDH, SoLichTang.
SELECT ChiTietDDH.MaMH, MH.TenMH, 1997 AS Nam, 
       SUM(ChiTietDDH.SoLuong * MH.DonGia * (1 - ChiTietDDH.GiamGia)) AS TongTienMax
FROM DonDatHang
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1997
GROUP BY ChiTietDDH.MaMH, MatHang.TenMH
HAVING SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) = (
    SELECT MAX(TongTien)
    FROM (
        SELECT ChiTietDDH.MaMH, SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia)) AS TongTien
        FROM DonDatHang 
        JOIN ChiTietDDH ON DonDatHang.MaDDH = CT.MaDDH
        JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
        WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1997
        GROUP BY ChiTietDDH.MaMH
    ) AS T
);
25. Thống kê tổng lương nhân viên của từng Đơn vị trong năm 1999. thông tin gồm:
MaDV, TenDV, Thang, TongLuong.
SELECT DonVi.MaDV, DonVi.TenDV, MONTH(NhanVien.NgayNViec) AS Thang, SUM(LuongCB) AS TongLuong
FROM NhanVien
JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
WHERE YEAR(NhanVien.NgayNViec) = 1999
GROUP BY DonVi.MaDV, DonVi.TenDV, MONTH(NhanVien.NgayNViec);
26. Liệt kê Đơn vị có tổng lương trong năm 1999. lớn nhấ t thông tin gồm : MaDV,
TenDV, Thang, TongLuongMax.
SELECT NhanVien.MaDV, DonVi.TenDV, 1999 AS Nam, 
       SUM(NhanVien.LuongCB * ChamCong.NgayCong) AS TongLuong
FROM NhanVien 
JOIN DonVi ON NhanVien.MaDV = DonVi.MaDV
JOIN ChamCong ON NhanVien.MaNV = ChamCong.MaNV
WHERE ChamCong.Nam = 1999
GROUP BY NhanVien.MaDV, DonVi.TenDV;
27. Tạo Table LuuDDH gồm các đơn đặt hàng trong năm 1997,1998 và 1999 gồm các trường sau : MaDDH, MaKH, NgayDH, NgayGiao, MaMH, SoLuong, GiamGia.
CREATE TABLE LuuDDH AS
SELECT MaDDH, MaKH, NgayDH, NgayGiao, MaMH, SoLuong, GiamGia
FROM DonDatHang
JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
WHERE YEAR(NgayDH) IN (1997, 1998, 1999);
28. Xóa Trong Table LuuDDH các đơn đặt hàng 1997
DELETE FROM LuuDDH
WHERE YEAR(NgayDH) = 1997;
29. Tăng 2% giảm giá trong Table LuuDDH cho các đơn đặt hàng trong năm 1999
UPDATE LuuDDH
SET GiamGia = GiamGia + 0.02
WHERE DATEPART(YEAR, NgayDH) = 1999;
30. Tạo table Luong9901 (bảng lương tháng 1 năm 1999) gồm các Field sau: Thang, Nam, MaNV, HoTen, LuongCB, NgayCong, Luong. (biết lương = Luơng căn bản * Ngày công)
SELECT 1 AS Thang, 1999 AS Nam, MaNV, HoLot + ' ' + TenNV AS HoTen,
       LuongCB, NgayCong, LuongCB * NgayCong AS Luong
INTO Luong9901
FROM NhanVien
WHERE DATEPART(MONTH, NgayNViec) = 1 AND DATEPART(YEAR, NgayNViec) = 1999;
31. Tăng lương các nhân viên trong bảng lương Luong9901 tăng 10% đối với các nhân viên Nam và 20% đối với các nhân viên nữ và điều kiện là có ngày công > 20 ngày.
UPDATE Luong9901
SET LuongCB = LuongCB * 1.1
WHERE Phai = 'M' AND NgayCong > 20;

UPDATE Luong9901
SET LuongCB = LuongCB * 1.
32. Liệt kê các mặt hàng không có đặt hàng trong khoảng thời gian [từ 1/5/1997] [đến 1/5/1998]
SELECT MH.MaMH, MH.TenMH
FROM MatHang MH
LEFT JOIN ChiTietDDH CT ON MH.MaMH = CT.MaMH
LEFT JOIN DonDatHang DDH ON CT.MaDDH = DonDatHang.MaDDH
WHERE (DonDatHang.NgayDH IS NULL OR DonDatHang.NgayDH < '1998-05-01') AND (DonDatHang.NgayGiao IS NULL OR DonDatHang.NgayGiao >= '1997-05-01');
















Bài Tập Thực Hành Số 3: Function – Procedure – Trigger
1. Tạo Function tính tổng doanh thu của năm 1997.
CREATE FUNCTION TongDoanhThuNam1997() 
RETURNS int
BEGIN
    DECLARE @TongDT int
    SELECT @TongDT = SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia))
    FROM DonDatHang 
    JOIN ChiTietDDH ON DDH.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1997;
    RETURN @TongDT;
END;
SELECT TongDoanhThuNam1997() AS TongDoanhThu1997;
2. Tạo Function tính tổng doanh thu của một năm (được truyền tham số).
CREATE FUNCTION TongDoanhThuNam(@Nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @TongDTN INT;
    SELECT @TongDTN  = SUM(SoLuong * DonGia * (1 - GiamGia)) 
    FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE DATEPART(YEAR, DonDatHang.NgayDH) = @Nam;    
RETURN @TongDTN;
END;
SELECT TongDoanhThuNam(@Nam) AS TongDoanhThu;
3. Tạo Function tính tổng thành tiền của một đơn đặt hàng (được truyền tham số).
CREATE FUNCTION TongTTDonHang(@MaDDH CHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @TongTT int;
    SELECT @TongTT = SUM(SoLuong * DonGia * (1 - GiamGia))
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE ChiTietDDH.MaDDH = @MaDDH;
    RETURN @TongTT;
END;
DECLARE @MaDDH CHAR(5) = ' ';
SELECT TongTTDonHang (@MaDDH) AS Tong;
4. Tạo Function tính tổng doanh thu của một nhân viên (được truyền tham số).
CREATE FUNCTION TongDTNV(@MaNV int)
RETURNS INT
AS
BEGIN
    DECLARE @TongDTNV int;
    SELECT @ TongDTNV = SUM(SoLuong * DonGia * (1 - GiamGia))
FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaMH = ChiTietDDH.MaMH
JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE DonDatHang.MaNV = @MaNV;
    RETURN @TongDTNV;
END;
DECLARE @MaNV int = 2;
SELECT TongDTNV (@MaNV) AS TongDTNV;
5. Thực hiện lại các câu truy vấn trên với Procedure.
5.1.
CREATE PROCEDURE TongDoanhThuNam1997Procedure
AS
BEGIN
    DECLARE @TongDT INT;
    SELECT @TongDT = SUM(ChiTietDDH.SoLuong * MatHang.DonGia * (1 - ChiTietDDH.GiamGia))
    FROM DonDatHang 
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE DATEPART(YEAR, DonDatHang.NgayDH) = 1997;
    SELECT @TongDT AS TongDoanhThu1997;
END;

EXEC TongDoanhThuNam1997Procedure;

5.2.
CREATE PROCEDURE TongDoanhThuNamProcedure
    @Nam INT
AS
BEGIN
    DECLARE @TongDTN INT;
    SELECT @TongDTN = SUM(SoLuong * DonGia * (1 - GiamGia)) 
    FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE DATEPART(YEAR, DonDatHang.NgayDH) = @Nam;
    SELECT @TongDTN AS TongDoanhThu;
END;
DECLARE @Nam INT;
SET @Nam = 1997; 
EXEC TongDoanhThuNamProcedure @Nam;

5.3.
CREATE PROCEDURE TongThanhTienDonHangProcedure
    @MaDDH CHAR(5)
AS
BEGIN
    DECLARE @TongTT INT;
    SELECT @TongTT = SUM(SoLuong * DonGia * (1 - GiamGia))
    FROM ChiTietDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE ChiTietDDH.MaDDH = @MaDDH;
    SELECT @TongTT AS Tong;
END;

DECLARE @MaDDH CHAR(5) = 'DDH001'; 
EXEC TongThanhTienDonHangProcedure @MaDDH;

5.4.
CREATE PROCEDURE TongDoanhThuNhanVienProcedure
    @MaNV INT
AS
BEGIN
    DECLARE @TongDTNV INT;
    SELECT @TongDTNV = SUM(SoLuong * DonGia * (1 - GiamGia))
    FROM DonDatHang
    JOIN ChiTietDDH ON DonDatHang.MaDDH = ChiTietDDH.MaDDH
    JOIN MatHang ON ChiTietDDH.MaMH = MatHang.MaMH
    WHERE DonDatHang.MaNV = @MaNV;
    SELECT @TongDTNV AS TongDoanhThuNV;
END;

DECLARE @MaNV INT = 2; 
EXEC TongDoanhThuNhanVienProcedure @MaNV;
6. Tạo Procedure liệt kê danh sách nhân viên theo phái (được truyền tham số).
CREATE PROCEDURE DSNV(@Phai CHAR(1))
BEGIN
    SELECT * FROM NhanVien
    WHERE Phai = @Phai;
END;

DECLARE @Phai CHAR(1) = 'Nu'; 
EXEC DSNV @Phai;
7. 8. Tạo Procedure liệt kê danh sách mặt hàng theo đơn đặt hàng (được truyền tham số).
CREATE PROCEDURE LKmathangDDH(@MaDDH CHAR(5))
BEGIN
    SELECT * FROM ChiTietDDH
    WHERE MaDDH = @MaDDH;
END;

DECLARE @MaDDH CHAR(5) = '001'; 
EXEC LKmathangDDH @MaDDH;
9. Tạo Procedure liệt kê danh sách mặt hàng theo nhà cung cấp (được truyền tham số).
CREATE PROCEDURE LKmathangNCC(@MaNCC int)
BEGIN
    SELECT * FROM MatHang
    WHERE MatHang.MaNCC = @MaNCC;
END;

DECLARE @MaNCC INT = 2; 
EXEC LKmathangNCC @MaNCC;
10. Tạo Procedure liệt kê danh sách đơn đặt hàng được đặt từ ngày A đến ngày B (A, B được truyền tham số).
CREATE PROCEDURE LKmathangNgay 
    @NgayBatDau DATE,
    @NgayKetThuc DATE
AS
BEGIN
    SELECT *
    FROM DonDatHang
    WHERE NgayDH BETWEEN @NgayBatDau AND @NgayKetThuc;
END;

DECLARE @NgayBatDau DATE = '2023-01-01'; 
DECLARE @NgayKetThuc DATE = '2023-12-31'; 
EXEC LKmathangNgay @NgayBatDau, @NgayKetThuc;
![image](https://github.com/dtd412/QuanLyBanHang/assets/91583747/95e4cf79-9b17-4855-975a-958898e865ed)
