-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jan 2021 pada 04.00
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
(1, 'ikrima@gmail.com', '$2b$10$ZRhi/UvOOtlhenIOOMU9ZuX7gLVcBkYkK/04xv1IT2thCNcbzePX2', 'Ikrima', '081298056468', 0, '2021-01-25 01:30:53', '2021-01-25 01:32:54'),
(2, 'rosadi@gmail.com', '$2b$10$JI6OnRRAXXqzv8pQSvXJCuMdrx4HevcopC8MdVnmFxAbZVcq6CGrW', 'Rosyid Rosadi', '089609960946', 1, '2021-01-25 01:31:19', '2021-01-25 01:32:42');

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
(1, 2, 'IMG-1611538464230.jpg', '2021-01-25 01:31:19', '2021-01-25 01:34:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coupon`
--

CREATE TABLE `coupon` (
  `co_id` int(11) NOT NULL
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
(1, 1, 'Bekasi', 'IMG-1611538629406.jpg', '2021-01-25 01:30:53', '2021-01-25 01:37:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery`
--

CREATE TABLE `delivery` (
  `dv_id` int(11) NOT NULL,
  `dv_dt` enum('DI','DD','PU') NOT NULL,
  `dv_yn` enum('Y','N') NOT NULL,
  `dv_st` time NOT NULL,
  `dv_day_start` text NOT NULL,
  `dv_day_end` text NOT NULL,
  `dv_time_start` time NOT NULL,
  `dv_time_end` time NOT NULL,
  `dv_created_at` timestamp NULL DEFAULT current_timestamp(),
  `dv_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `delivery`
--

INSERT INTO `delivery` (`dv_id`, `dv_dt`, `dv_yn`, `dv_st`, `dv_day_start`, `dv_day_end`, `dv_time_start`, `dv_time_end`, `dv_created_at`, `dv_updated_at`) VALUES
(1, 'DI', 'Y', '00:00:00', 'empty', 'empty', '12:00:00', '12:00:00', '2021-01-25 01:37:28', '2021-01-25 01:37:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `discount`
--

CREATE TABLE `discount` (
  `dc_id` int(11) NOT NULL,
  `dc_nominal` double DEFAULT NULL,
  `dc_created_at` timestamp NULL DEFAULT current_timestamp(),
  `dc_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `discount`
--

INSERT INTO `discount` (`dc_id`, `dc_nominal`, `dc_created_at`, `dc_updated_at`) VALUES
(1, 0.9, '2021-01-25 01:59:54', '2021-01-25 02:13:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `dv_id` int(11) DEFAULT NULL,
  `py_id` int(11) DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL,
  `od_totalPrice` int(11) DEFAULT NULL,
  `od_status` enum('Unpaid','Paid','Ready','Deliver','Done') DEFAULT NULL,
  `od_address` text DEFAULT NULL,
  `od_tax` int(11) DEFAULT NULL,
  `od_created_at` timestamp NULL DEFAULT current_timestamp(),
  `od_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_tb`
--

CREATE TABLE `order_tb` (
  `or_id` int(11) NOT NULL,
  `pr_id` int(11) DEFAULT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `or_status` enum('Cart','Done') DEFAULT NULL,
  `or_size` enum('R','L','XL') DEFAULT NULL,
  `or_amount` int(11) DEFAULT NULL,
  `or_price` int(11) DEFAULT NULL,
  `or_created_at` timestamp NULL DEFAULT current_timestamp(),
  `or_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_tb`
--

INSERT INTO `order_tb` (`or_id`, `pr_id`, `cs_id`, `or_status`, `or_size`, `or_amount`, `or_price`, `or_created_at`, `or_updated_at`) VALUES
(1, 1, 1, 'Cart', 'R', 2, 30000, '2021-01-25 02:46:49', '2021-01-25 02:46:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment`
--

CREATE TABLE `payment` (
  `py_id` int(11) NOT NULL,
  `py_method` enum('Card','Bank','COD') DEFAULT NULL,
  `py_created_at` timestamp NULL DEFAULT current_timestamp(),
  `py_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `payment`
--

INSERT INTO `payment` (`py_id`, `py_method`, `py_created_at`, `py_updated_at`) VALUES
(1, 'Card', '2021-01-25 02:51:15', '2021-01-25 02:51:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `pr_id` int(11) NOT NULL,
  `dc_id` int(11) DEFAULT NULL,
  `pr_name` varchar(50) DEFAULT NULL,
  `pr_size` enum('R','L','XL') DEFAULT NULL,
  `pr_desc` text DEFAULT NULL,
  `pr_unit_price` int(11) DEFAULT NULL,
  `pr_image` text DEFAULT NULL,
  `pr_category` enum('Favorite','Promo','None') DEFAULT NULL,
  `pr_created_at` timestamp NULL DEFAULT current_timestamp(),
  `pr_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`pr_id`, `dc_id`, `pr_name`, `pr_size`, `pr_desc`, `pr_unit_price`, `pr_image`, `pr_category`, `pr_created_at`, `pr_updated_at`) VALUES
(1, 1, 'Coklat', 'R', 'Manis', 15000, 'IMG-1611540037867.jpg', 'Favorite', '2021-01-25 02:00:37', '2021-01-25 02:00:37'),
(2, 1, 'Stroberi', 'R', 'Manis', 15000, 'IMG-1611540067616.jpg', 'Favorite', '2021-01-25 02:01:07', '2021-01-25 02:01:07'),
(3, 1, 'mangga', 'R', 'Manis', 15000, 'IMG-1611542660064.jpg', 'Favorite', '2021-01-25 02:44:20', '2021-01-25 02:44:20');

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
-- Indeks untuk tabel `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`co_id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cs_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indeks untuk tabel `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`dv_id`);

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
  ADD KEY `dv_id` (`dv_id`),
  ADD KEY `py_id` (`py_id`),
  ADD KEY `co_id` (`co_id`),
  ADD KEY `order_detail_ibfk_2` (`cs_id`);

--
-- Indeks untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD PRIMARY KEY (`or_id`),
  ADD KEY `cs_id` (`cs_id`),
  ADD KEY `pr_id` (`pr_id`);

--
-- Indeks untuk tabel `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`py_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `product_ibfk_1` (`dc_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `account`
--
ALTER TABLE `account`
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `coupon`
--
ALTER TABLE `coupon`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `delivery`
--
ALTER TABLE `delivery`
  MODIFY `dv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `discount`
--
ALTER TABLE `discount`
  MODIFY `dc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  MODIFY `or_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `payment`
--
ALTER TABLE `payment`
  MODIFY `py_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_3` FOREIGN KEY (`dv_id`) REFERENCES `delivery` (`dv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_4` FOREIGN KEY (`py_id`) REFERENCES `payment` (`py_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_ibfk_5` FOREIGN KEY (`co_id`) REFERENCES `coupon` (`co_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD CONSTRAINT `order_tb_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_tb_ibfk_2` FOREIGN KEY (`pr_id`) REFERENCES `product` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`dc_id`) REFERENCES `discount` (`dc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
