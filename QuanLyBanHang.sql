-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2023 at 01:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `QuanLyBanHang`
--

-- --------------------------------------------------------

--
-- Table structure for table `ChamCong`
--

CREATE TABLE `ChamCong` (
  `Thang` tinyint(3) UNSIGNED NOT NULL,
  `Nam` smallint(5) UNSIGNED NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayCong` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ChamCong`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `ChiTietDDH`
--

CREATE TABLE `ChiTietDDH` (
  `MaDDH` char(5) NOT NULL,
  `MaMH` int(11) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `GiamGia` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ChiTietDDH`
--

INSERT INTO `ChiTietDDH` (`MaDDH`, `MaMH`, `SoLuong`, `GiamGia`) VALUES
('DH01', 1, 1, '0000-00-00'),
('DH01', 2, 3, '0000-00-00'),
('DH02', 3, 5, '0000-00-00'),
('DH02', 4, 7, '0000-00-00'),
('DH03', 5, 2, '0000-00-00'),
('DH04', 6, 4, '0000-00-00'),
('DH05', 7, 6, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `DonDatHang`
--

CREATE TABLE `DonDatHang` (
  `MaDDH` char(5) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `MaNV` int(11) NOT NULL,
  `NgayDH` date NOT NULL,
  `NgayGiao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DonDatHang`
--

INSERT INTO `DonDatHang` (`MaDDH`, `MaKH`, `MaNV`, `NgayDH`, `NgayGiao`) VALUES
('DH01', 'CODACO', 1, '2023-09-28', '2023-10-02'),
('DH02', 'COTEC', 2, '2023-08-29', '2023-09-03'),
('DH03', 'DHP', 3, '2023-10-30', '2023-11-04'),
('DH04', 'RUBIMEX', 4, '2023-11-30', '2023-12-05'),
('DH05', 'SAMACO', 5, '2023-12-01', '2023-12-06');

-- --------------------------------------------------------

--
-- Table structure for table `DonVi`
--

CREATE TABLE `DonVi` (
  `MaDV` char(2) NOT NULL,
  `TenDV` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DonVi`
--

INSERT INTO `DonVi` (`MaDV`, `TenDV`) VALUES
('GD', 'Ban Giám Đốc'),
('KT', 'Kế Toán'),
('NV', 'Nghiệp Vụ'),
('TC', 'Tổ Chức');

-- --------------------------------------------------------

--
-- Table structure for table `KhachHang`
--

CREATE TABLE `KhachHang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(40) NOT NULL DEFAULT ' ',
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' ',
  `MaTP` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `KhachHang`
--

INSERT INTO `KhachHang` (`MaKH`, `TenKH`, `DiaChi`, `DienThoai`, `MaTP`) VALUES
('CODACO', 'Cơ Khí Dân Dụng', '388 Hòa Hảo P5', '1757828', 'TP'),
('COTEC', 'Công Nghệ Mới', '319 Nguyễn Trãi P7', '7657657', 'CT'),
('DHP', 'Đại Hưng Phát', '343 Nhật Tảo P16', '6546565', 'NT'),
('GIAY32', 'Giày 32', '105A Ngô Quyền P11', '6565468', 'CT'),
('RUBIMEX', 'Công Nghiệp Cao Su', '220 Lê Văn Sỹ', '2987912', 'NT'),
('SAMACO', 'SXKD Dịch Vụ Tổng Hợp', '56 Nguyễn Biểu P2', '1987987', 'CT'),
('SAMECO', 'Cơ khí Sài Gòn', '156 Lê Đại Hành P7', '2397997', 'HN'),
('TRACODI', 'Đầu tư phát triển GTVT', 'Hàm Nghi Q1', '0976766', 'HP'),
('VITICO', 'Hóa Nhựa Vĩnh Tiến', '35 Tô Hiến Thành P14', '3987980', 'TP'),
('VTP', 'Van Hưng Phát', '119 Bạch Vân P17', '3765768', 'HN');

-- --------------------------------------------------------

--
-- Table structure for table `MatHang`
--

CREATE TABLE `MatHang` (
  `MaMH` int(11) NOT NULL,
  `TenMH` varchar(30) NOT NULL,
  `DonViTinh` varchar(20) NOT NULL DEFAULT ' ',
  `DonGia` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `HinhSP` text DEFAULT NULL,
  `MaNCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MatHang`
--

INSERT INTO `MatHang` (`MaMH`, `TenMH`, `DonViTinh`, `DonGia`, `HinhSP`, `MaNCC`) VALUES
(1, 'Rượu', 'Chai', 230, NULL, 7),
(2, 'Tiêu', 'Hôp', 40, NULL, 7),
(3, 'Bánh Kem', 'Cái', 10, NULL, 3),
(4, 'Bơ', 'Kg', 38, NULL, 6),
(5, 'Bánh Mì', 'Cái', 8, NULL, 3),
(6, 'Nem', 'Kg', 24, NULL, 1),
(7, 'Táo', 'Kg', 5, NULL, 4),
(8, 'Cá Hộp', 'Thùng', 63, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `NhaCungCap`
--

CREATE TABLE `NhaCungCap` (
  `MaNCC` int(11) NOT NULL,
  `TenNCC` varchar(30) NOT NULL,
  `DiaChi` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoai` varchar(11) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `NhaCungCap`
--

INSERT INTO `NhaCungCap` (`MaNCC`, `TenNCC`, `DiaChi`, `DienThoai`) VALUES
(1, 'CTY Đồ Hộp Tân Bin', 'TP.HCM', '123456'),
(2, 'CTY Rượu Bình Tân', 'Dien Thoai', '342342'),
(3, 'CTY Đức Phát', 'TP.HCM', '453456'),
(4, 'CTY Rau Quả Việt Nam.', 'Hà Nội', '867567'),
(5, 'CTY Thủy Săn Tiền Giang', 'Tiền Giang', '876876'),
(6, 'CTY VINAMILK', 'TP.HCM', '646478'),
(7, 'CTY Nông Sản Lâm Đồng', 'Đà Lạt', '565467');

-- --------------------------------------------------------

--
-- Table structure for table `NhanVien`
--

CREATE TABLE `NhanVien` (
  `MaNV` int(11) NOT NULL,
  `HoLot` varchar(30) NOT NULL DEFAULT ' ',
  `TenNV` varchar(20) NOT NULL DEFAULT ' ',
  `MaDV` char(2) NOT NULL,
  `Phai` enum('F','M') NOT NULL DEFAULT 'F',
  `LuongCB` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `NgayNViec` date NOT NULL,
  `DiaChiNV` varchar(60) NOT NULL DEFAULT ' ',
  `DienThoaiNV` varchar(11) DEFAULT ' ',
  `HinhNV` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `NhanVien`
--

INSERT INTO `NhanVien` (`MaNV`, `HoLot`, `TenNV`, `MaDV`, `Phai`, `LuongCB`, `NgayNViec`, `DiaChiNV`, `DienThoaiNV`, `HinhNV`) VALUES
(1, 'Nguyen', 'Van A', 'GD', 'M', 5000000, '2023-05-04', 'Hà Nội', '09800000', ''),
(2, 'Nguyen', 'Van B', 'KT', 'M', 1000000, '2023-05-04', 'Can Tho', '09800001', ''),
(3, 'Nguyen', 'Van C', 'NV', 'M', 4000000, '2023-05-04', 'Hải Phòng', '09800002', ''),
(4, 'Nguyen', 'Thi D', 'TC', 'F', 3000000, '2023-05-04', 'Hà Nội', '09800003', ''),
(5, 'Nguyen', 'Thi E', 'GD', 'F', 8000000, '2023-05-04', 'Hà Nội', '09800004', ''),
(6, 'Nguyen', 'Van G', 'GD', 'M', 7000000, '2023-05-04', 'Hà Nội', '09800005', ''),
(7, 'Nguyen', 'Van H', 'KT', 'M', 3000000, '2023-05-04', 'Nam Định', '09800006', ''),
(8, 'Nguyen', 'Van K', 'NV', 'M', 4000000, '2023-05-04', 'Nha Trang', '09800007', ''),
(9, 'Nguyen', 'Thi L', 'TC', 'F', 5000000, '2023-05-04', 'Vinh', '09800008', ''),
(10, 'Nguyen', 'Thi M', 'GD', 'F', 4000000, '2023-05-04', 'TP. Hồ Chí Minh', '09800009', '');

-- --------------------------------------------------------

--
-- Table structure for table `TinhTP`
--

CREATE TABLE `TinhTP` (
  `MaTP` char(2) NOT NULL,
  `TenTP` varchar(30) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TinhTP`
--

INSERT INTO `TinhTP` (`MaTP`, `TenTP`) VALUES
('CT', 'Can Tho'),
('HN', 'Hà Nội'),
('HP', 'Hải Phòng'),
('HU', 'Hué'),
('ND', 'Nam Định'),
('NT', 'Nha Trang'),
('TP', 'TP. Hồ Chí Minh'),
('VI', 'Vinh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ChamCong`
--
ALTER TABLE `ChamCong`
  ADD PRIMARY KEY (`Thang`,`Nam`,`MaNV`),
  ADD KEY `MaNV` (`MaNV`);

--
-- Indexes for table `ChiTietDDH`
--
ALTER TABLE `ChiTietDDH`
  ADD PRIMARY KEY (`MaDDH`,`MaMH`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Indexes for table `DonDatHang`
--
ALTER TABLE `DonDatHang`
  ADD PRIMARY KEY (`MaDDH`),
  ADD KEY `MaNV` (`MaNV`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `DonVi`
--
ALTER TABLE `DonVi`
  ADD PRIMARY KEY (`MaDV`),
  ADD UNIQUE KEY `TenDV` (`TenDV`);

--
-- Indexes for table `KhachHang`
--
ALTER TABLE `KhachHang`
  ADD PRIMARY KEY (`MaKH`),
  ADD KEY `MaTP` (`MaTP`);

--
-- Indexes for table `MatHang`
--
ALTER TABLE `MatHang`
  ADD PRIMARY KEY (`MaMH`),
  ADD UNIQUE KEY `TenMH` (`TenMH`),
  ADD KEY `MaNCC` (`MaNCC`);

--
-- Indexes for table `NhaCungCap`
--
ALTER TABLE `NhaCungCap`
  ADD PRIMARY KEY (`MaNCC`),
  ADD UNIQUE KEY `TenNCC` (`TenNCC`);

--
-- Indexes for table `NhanVien`
--
ALTER TABLE `NhanVien`
  ADD PRIMARY KEY (`MaNV`),
  ADD KEY `MaDV` (`MaDV`);

--
-- Indexes for table `TinhTP`
--
ALTER TABLE `TinhTP`
  ADD PRIMARY KEY (`MaTP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `MatHang`
--
ALTER TABLE `MatHang`
  MODIFY `MaMH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `NhaCungCap`
--
ALTER TABLE `NhaCungCap`
  MODIFY `MaNCC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `NhanVien`
--
ALTER TABLE `NhanVien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ChamCong`
--
ALTER TABLE `ChamCong`
  ADD CONSTRAINT `chamcong_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `NhanVien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ChiTietDDH`
--
ALTER TABLE `ChiTietDDH`
  ADD CONSTRAINT `chitietddh_ibfk_1` FOREIGN KEY (`MaDDH`) REFERENCES `DonDatHang` (`MaDDH`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietddh_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `MatHang` (`MaMH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `DonDatHang`
--
ALTER TABLE `DonDatHang`
  ADD CONSTRAINT `dondathang_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `NhanVien` (`MaNV`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dondathang_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `KhachHang` (`MaKH`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `KhachHang`
--
ALTER TABLE `KhachHang`
  ADD CONSTRAINT `khachhang_ibfk_1` FOREIGN KEY (`MaTP`) REFERENCES `TinhTP` (`MaTP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MatHang`
--
ALTER TABLE `MatHang`
  ADD CONSTRAINT `mathang_ibfk_1` FOREIGN KEY (`MaNCC`) REFERENCES `NhaCungCap` (`MaNCC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `NhanVien`
--
ALTER TABLE `NhanVien`
  ADD CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`MaDV`) REFERENCES `DonVi` (`MaDV`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
