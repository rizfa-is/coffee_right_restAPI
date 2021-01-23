-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Jan 2021 pada 04.28
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_right`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `account`
--

CREATE TABLE `account` (
  `ac_id` int(11) NOT NULL,
  `ac_email` varchar(50) DEFAULT NULL,
  `ac_password` text DEFAULT NULL,
  `ac_name` varchar(100) DEFAULT NULL,
  `ac_phone` varchar(20) DEFAULT NULL,
  `ac_level` int(11) DEFAULT NULL,
  `ac_created_at` timestamp NULL DEFAULT current_timestamp(),
  `ac_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `account`
--

INSERT INTO `account` (`ac_id`, `ac_email`, `ac_password`, `ac_name`, `ac_phone`, `ac_level`, `ac_created_at`, `ac_updated_at`) VALUES
(1, 'miqdad@gmail.com', '$2b$10$iA7UEBDHvPpqP.BTA.uK2.OvUNw01jdZ1tX7zxyB/PL8Y9vsEvYGG', 'Miqdad', '081298056468', 0, '2021-01-20 15:15:02', '2021-01-20 15:15:02'),
(2, 'ikrima@gmail.com', '$2b$10$PL.tQ6CqkjlNwMCSIDIjF.7oSygVHPk93zNM7L84/5fcqcfzlMKsO', 'Ikrima', '082987651222', 1, '2021-01-20 15:15:15', '2021-01-23 02:38:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL,
  `ac_id` int(11) DEFAULT NULL,
  `ad_image` text DEFAULT NULL,
  `ad_created_at` timestamp NULL DEFAULT current_timestamp(),
  `ad_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`ad_id`, `ac_id`, `ad_image`, `ad_created_at`, `ad_updated_at`) VALUES
(1, 2, 'image-1611154800177.jpg', '2021-01-20 15:15:15', '2021-01-23 02:45:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `cs_id` int(11) NOT NULL,
  `ac_id` int(11) DEFAULT NULL,
  `cs_address` text DEFAULT NULL,
  `cs_image` text DEFAULT NULL,
  `cs_created_at` timestamp NULL DEFAULT current_timestamp(),
  `cs_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`cs_id`, `ac_id`, `cs_address`, `cs_image`, `cs_created_at`, `cs_updated_at`) VALUES
(1, 1, 'Kalimalang', 'IMG-1611157494269.jpg', '2021-01-20 15:15:02', '2021-01-20 15:44:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `discount`
--

CREATE TABLE `discount` (
  `dc_id` int(11) NOT NULL,
  `dc_nominal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `discount`
--

INSERT INTO `discount` (`dc_id`, `dc_nominal`) VALUES
(1, 0.1),
(2, 0.2),
(3, 0.3),
(4, 0.4),
(5, 0.5),
(6, 0.6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL,
  `or_id` int(11) DEFAULT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `pr_id` int(11) DEFAULT NULL,
  `od_size` enum('R','L','XL') DEFAULT NULL,
  `od_amount` int(11) DEFAULT NULL,
  `od_price` int(11) DEFAULT NULL,
  `od_created_at` timestamp NULL DEFAULT current_timestamp(),
  `od_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`od_id`, `or_id`, `cs_id`, `pr_id`, `od_size`, `od_amount`, `od_price`, `od_created_at`, `od_updated_at`) VALUES
(1, 1, 1, 1, 'L', 12, 50000, '2021-01-22 16:14:13', '2021-01-23 02:47:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_tb`
--

CREATE TABLE `order_tb` (
  `or_id` int(11) NOT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `or_dt` enum('DI','DD','PU') DEFAULT NULL,
  `or_yn` enum('Y','N') DEFAULT NULL,
  `or_st` time DEFAULT NULL,
  `or_status` enum('Unpaid','Paid','Ready','Deliver','Done') DEFAULT NULL,
  `or_address` text DEFAULT NULL,
  `or_method` enum('Card','Bank','COD') DEFAULT NULL,
  `or_tax` double DEFAULT NULL,
  `or_total` int(11) DEFAULT NULL,
  `or_created_at` timestamp NULL DEFAULT current_timestamp(),
  `or_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_tb`
--

INSERT INTO `order_tb` (`or_id`, `cs_id`, `or_dt`, `or_yn`, `or_st`, `or_status`, `or_address`, `or_method`, `or_tax`, `or_total`, `or_created_at`, `or_updated_at`) VALUES
(1, 1, 'DI', 'Y', '07:00:00', 'Unpaid', 'Bekasi', 'Card', 0.1, 21, '2021-01-22 19:05:46', '2021-01-23 03:16:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `pr_id` int(11) NOT NULL,
  `dc_id` int(11) DEFAULT NULL,
  `pr_name` varchar(50) DEFAULT NULL,
  `pr_desc` text DEFAULT NULL,
  `pr_unit_price` int(11) DEFAULT NULL,
  `pr_image` text DEFAULT NULL,
  `pr_size` enum('R','L','XL') DEFAULT NULL,
  `pr_category` enum('Favorite','Promo','None') DEFAULT NULL,
  `pr_day_start_deliv` text DEFAULT NULL,
  `pr_day_end_deliv` text DEFAULT NULL,
  `pr_time_start_deliv` time DEFAULT NULL,
  `pr_time_end_deliv` time DEFAULT NULL,
  `pr_created_at` timestamp NULL DEFAULT current_timestamp(),
  `pr_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`pr_id`, `dc_id`, `pr_name`, `pr_desc`, `pr_unit_price`, `pr_image`, `pr_size`, `pr_category`, `pr_day_start_deliv`, `pr_day_end_deliv`, `pr_time_start_deliv`, `pr_time_end_deliv`, `pr_created_at`, `pr_updated_at`) VALUES
(1, 1, 'Coffee Latte', 'good taste of vanilla', 40000, 'image', 'L', 'Favorite', 'Monday', 'Tuesday', '08:00:00', '17:00:00', '2021-01-20 07:27:38', '2021-01-23 03:15:17'),
(2, 2, 'Matcha Latte', 'good matcha latte', 36000, 'image', 'R', 'None', 'Monday', 'Friday', '07:00:00', '17:00:00', '2021-01-20 11:39:47', '2021-01-23 03:15:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cs_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indeks untuk tabel `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`dc_id`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `or_id` (`or_id`),
  ADD KEY `cs_id` (`cs_id`),
  ADD KEY `pr_id` (`pr_id`);

--
-- Indeks untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD PRIMARY KEY (`or_id`),
  ADD KEY `cs_id` (`cs_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `dc_id` (`dc_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `discount`
--
ALTER TABLE `discount`
  MODIFY `dc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  MODIFY `or_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`or_id`) REFERENCES `order_tb` (`or_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`pr_id`) REFERENCES `product` (`pr_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD CONSTRAINT `order_tb_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`dc_id`) REFERENCES `discount` (`dc_id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
