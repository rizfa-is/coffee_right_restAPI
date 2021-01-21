-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jan 2021 pada 04.19
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
(2, 'zaki08@gmail.com', '$2b$10$PL.tQ6CqkjlNwMCSIDIjF.7oSygVHPk93zNM7L84/5fcqcfzlMKsO', 'Zakii', '082987651222', 1, '2021-01-20 15:15:15', '2021-01-20 15:51:53'),
(3, 'karmawan@gmail.com', '$2b$10$NZq7FSRyC94CbZA4ais21u7.3bDr.DkgUt5x5ZY4UHxEXPyxphdMC', 'Karmawan', '081298056468', 0, '2021-01-20 15:18:46', '2021-01-20 15:18:46'),
(4, 'marwan@gmail.com', '$2b$10$mq7NdobuR0HgwaMOi.MNcub8GiIQjUVBzhMAA..Ax73iDw/fHKumO', 'Marwan', '082987651222', 1, '2021-01-20 16:14:09', '2021-01-20 16:14:09'),
(6, 'suparman@gmail.com', '$2b$10$rHPNoiafJD1dHuxJxMfKmO./Ei.nTLX729ydjT11NeAv54ruQZwEu', 'Suparman', '081298056468', 0, '2021-01-20 16:14:43', '2021-01-20 16:14:43'),
(7, 'bento@gmail.com', '$2b$10$YeoUD7TPtnhn3e4DNL8XZuMQEyycMC4mfjZYfXotsnrolggBVIBe2', 'Bento', '081298056468', 0, '2021-01-20 16:15:17', '2021-01-20 16:15:17');

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
(1, 2, 'IMG-1611157192723.jpg', '2021-01-20 15:15:15', '2021-01-20 15:39:52'),
(2, 4, NULL, '2021-01-20 16:14:09', '2021-01-20 16:14:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `ca_id` int(11) NOT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `pr_id` int(11) DEFAULT NULL,
  `ca_size` enum('R','L','XL') DEFAULT NULL,
  `ca_amount` int(11) DEFAULT NULL,
  `ca_price` int(11) DEFAULT NULL,
  `ca_created_at` timestamp NULL DEFAULT current_timestamp(),
  `ca_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 1, 'Kalimalang', 'IMG-1611157494269.jpg', '2021-01-20 15:15:02', '2021-01-20 15:44:54'),
(2, 3, 'Bekasi', 'IMG-1611157516881.jpg', '2021-01-20 15:18:46', '2021-01-20 15:45:16'),
(3, 6, NULL, NULL, '2021-01-20 16:14:43', '2021-01-20 16:14:43'),
(4, 7, NULL, NULL, '2021-01-20 16:15:17', '2021-01-20 16:15:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL,
  `ca_id` int(11) DEFAULT NULL,
  `or_id` int(11) DEFAULT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `pr_id` int(11) DEFAULT NULL,
  `od_size` enum('R','L','XL') DEFAULT NULL,
  `od_amount` int(11) DEFAULT NULL,
  `od_price` int(11) DEFAULT NULL,
  `od_created_at` timestamp NULL DEFAULT current_timestamp(),
  `od_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_tb`
--

CREATE TABLE `order_tb` (
  `or_id` int(11) NOT NULL,
  `ad_id` int(11) DEFAULT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `or_dt` enum('DI','DD','PU') DEFAULT NULL,
  `or_yn` enum('Y','N') DEFAULT NULL,
  `or_st` time DEFAULT NULL,
  `or_status` enum('Unpaid','Paid','Ready','Deliver','Done') DEFAULT NULL,
  `or_address` text DEFAULT NULL,
  `or_method` enum('Card','Bank','COD') DEFAULT NULL,
  `or_tax` int(11) DEFAULT NULL,
  `or_total` int(11) DEFAULT NULL,
  `or_created_at` timestamp NULL DEFAULT current_timestamp(),
  `or_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `pr_id` int(11) NOT NULL,
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

INSERT INTO `product` (`pr_id`, `pr_name`, `pr_desc`, `pr_unit_price`, `pr_image`, `pr_size`, `pr_category`, `pr_day_start_deliv`, `pr_day_end_deliv`, `pr_time_start_deliv`, `pr_time_end_deliv`, `pr_created_at`, `pr_updated_at`) VALUES
(1, 'Coffee Latte', 'good taste of vanilla', 40000, 'image', 'L', 'Favorite', 'Monday', 'Tuesday', '08:00:00', '17:00:00', '2021-01-20 07:27:38', '2021-01-21 02:07:08'),
(2, 'Matcha Latte', 'good matcha latte', 36000, 'image', 'R', 'None', 'Monday', 'Friday', '07:00:00', '17:00:00', '2021-01-20 11:39:47', '2021-01-21 02:07:15');

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
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ca_id`),
  ADD KEY `cs_id` (`cs_id`),
  ADD KEY `pr_id` (`pr_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cs_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`od_id`),
  ADD KEY `ca_id` (`ca_id`),
  ADD KEY `or_id` (`or_id`),
  ADD KEY `cs_id` (`cs_id`),
  ADD KEY `pr_id` (`pr_id`);

--
-- Indeks untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD PRIMARY KEY (`or_id`),
  ADD KEY `order_tb_ibfk_1` (`ad_id`),
  ADD KEY `order_tb_ibfk_2` (`cs_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pr_id`);

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
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `ca_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  MODIFY `or_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `product` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `product` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`ca_id`) REFERENCES `cart` (`ca_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`or_id`) REFERENCES `order_tb` (`or_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_4` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD CONSTRAINT `order_tb_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `admin` (`ad_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_tb_ibfk_2` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_tb_ibfk_3` FOREIGN KEY (`or_id`) REFERENCES `order_detail` (`or_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
