-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jan 2021 pada 16.12
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
-- Database: `coffee_right2`
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
(2, 'rosadi@gmail.com', '$2b$10$JI6OnRRAXXqzv8pQSvXJCuMdrx4HevcopC8MdVnmFxAbZVcq6CGrW', 'Rosyid Rosadi', '089609960946', 1, '2021-01-25 01:31:19', '2021-01-25 01:32:42'),
(4, 'alvita@gmail.com', '$2b$10$nGWADHkwv9jTM9M/Rirge.KnbIkchcVs2GngkzbpjkMnl4.RI1mWO', 'Alvita', '086788543123', 0, '2021-01-25 00:55:18', '2021-01-25 00:55:18'),
(5, 'yolanda@gmail.com', '$2b$10$TCwJA24syejdsDc7rIj8sum3kgnSGUELpNTK3gxCep.2BWbh.zUBe', 'Yolanda', '086788543123', 0, '2021-01-25 23:42:36', '2021-01-25 23:42:36');

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
  `cs_gender` enum('Male','Female') DEFAULT NULL,
  `cs_birthday` date DEFAULT NULL,
  `cs_address` text DEFAULT NULL,
  `cs_image` text DEFAULT NULL,
  `cs_created_at` timestamp NULL DEFAULT current_timestamp(),
  `cs_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`cs_id`, `ac_id`, `cs_gender`, `cs_birthday`, `cs_address`, `cs_image`, `cs_created_at`, `cs_updated_at`) VALUES
(1, 1, 'Female', '1998-11-04', 'Bekasi', 'IMG-1611538629406.jpg', '2021-01-25 01:30:53', '2021-01-26 15:10:55'),
(2, 4, 'Male', '1998-04-02', 'Malang', 'IMG-1611565046259.jpg', '2021-01-25 00:55:18', '2021-01-26 15:11:09'),
(3, 5, NULL, '1997-07-29', NULL, NULL, '2021-01-25 23:42:36', '2021-01-26 15:11:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `delivery`
--

CREATE TABLE `delivery` (
  `dv_id` int(11) NOT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `dv_dt` enum('DI','DD','PU') DEFAULT NULL,
  `dv_yn` enum('Y','N') DEFAULT NULL,
  `dv_st` time DEFAULT NULL,
  `dv_address` text DEFAULT NULL,
  `dv_created_at` timestamp NULL DEFAULT current_timestamp(),
  `dv_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `delivery`
--

INSERT INTO `delivery` (`dv_id`, `cs_id`, `dv_dt`, `dv_yn`, `dv_st`, `dv_address`, `dv_created_at`, `dv_updated_at`) VALUES
(4, 2, 'DI', 'Y', '12:00:00', 'Malang', '2021-01-25 09:23:33', '2021-01-26 01:48:26'),
(5, 2, 'PU', 'Y', '15:00:00', 'Malang', '2021-01-25 13:10:01', '2021-01-26 01:46:15'),
(8, 2, 'PU', 'Y', '15:00:00', 'Belimbing, Malang', '2021-01-26 05:19:55', '2021-01-26 05:19:55'),
(9, 2, 'PU', 'Y', '15:00:00', 'Singosari, Malang', '2021-01-26 05:51:52', '2021-01-26 05:51:52'),
(15, 3, 'PU', 'Y', '15:00:00', 'Bojong Gede', '2021-01-26 12:47:39', '2021-01-26 12:47:39');

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
(1, 0, '2021-01-25 00:53:14', '2021-01-25 00:53:14'),
(2, 0.1, '2021-01-25 00:53:49', '2021-01-25 00:53:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `dv_id` int(11) DEFAULT NULL,
  `od_total_price_before_tax` int(11) DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL,
  `od_totalPrice` int(11) DEFAULT NULL,
  `od_status` enum('Unpaid','Paid','Ready','Deliver','Done') DEFAULT NULL,
  `od_payment_method` enum('Card','Bank','COD') DEFAULT NULL,
  `od_tax` int(11) DEFAULT NULL,
  `od_created_at` timestamp NULL DEFAULT current_timestamp(),
  `od_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`od_id`, `cs_id`, `dv_id`, `od_total_price_before_tax`, `co_id`, `od_totalPrice`, `od_status`, `od_payment_method`, `od_tax`, `od_created_at`, `od_updated_at`) VALUES
(1, 2, 4, 85000, NULL, 93500, 'Done', 'COD', 8500, '2021-01-25 09:42:33', '2021-01-26 02:39:12'),
(3, 2, 5, 59000, NULL, 64900, 'Unpaid', 'COD', 5900, '2021-01-25 13:11:36', '2021-01-26 02:22:38'),
(12, 2, 8, 74000, NULL, 81400, 'Done', 'COD', 7400, '2021-01-26 05:20:38', '2021-01-26 05:29:11'),
(13, 2, 9, 37000, NULL, 40700, 'Unpaid', 'COD', 3700, '2021-01-26 05:52:30', '2021-01-26 05:52:30'),
(15, 3, 15, 73600, NULL, 80960, 'Paid', 'Card', 7360, '2021-01-26 12:48:46', '2021-01-26 12:48:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_tb`
--

CREATE TABLE `order_tb` (
  `or_id` int(11) NOT NULL,
  `pr_id` int(11) DEFAULT NULL,
  `cs_id` int(11) DEFAULT NULL,
  `or_status` enum('Cart','Done') DEFAULT NULL,
  `or_amount` int(11) DEFAULT NULL,
  `or_price` int(11) DEFAULT NULL,
  `od_id` int(11) DEFAULT NULL,
  `or_created_at` timestamp NULL DEFAULT current_timestamp(),
  `or_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `order_tb`
--

INSERT INTO `order_tb` (`or_id`, `pr_id`, `cs_id`, `or_status`, `or_amount`, `or_price`, `od_id`, `or_created_at`, `or_updated_at`) VALUES
(3, 1, 2, 'Done', 2, 50000, 1, '2021-01-25 09:01:33', '2021-01-25 14:15:25'),
(5, 4, 2, 'Done', 1, 27000, 3, '2021-01-25 12:49:49', '2021-01-26 00:22:37'),
(18, 7, 3, 'Done', 2, 48600, 15, '2021-01-26 12:45:23', '2021-01-26 12:52:10'),
(19, 1, 3, 'Done', 1, 25000, 15, '2021-01-26 12:45:49', '2021-01-26 12:52:10');

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
  `pr_favorite` enum('Y','N') DEFAULT NULL,
  `pr_category` enum('Food','Drink') DEFAULT NULL,
  `pr_created_at` timestamp NULL DEFAULT current_timestamp(),
  `pr_updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`pr_id`, `dc_id`, `pr_name`, `pr_desc`, `pr_unit_price`, `pr_image`, `pr_favorite`, `pr_category`, `pr_created_at`, `pr_updated_at`) VALUES
(1, 1, 'Hazelnut Latte', 'good taste of hazelnut latte', 25000, 'IMG-1611564216226.png', 'Y', 'Drink', '2021-01-25 08:43:36', '2021-01-25 08:43:36'),
(4, 1, 'Creamy Ice Latte', 'good taste of creamy ice latte', 27000, 'IMG-1611578879909.png', 'Y', 'Drink', '2021-01-25 12:47:59', '2021-01-25 12:47:59'),
(7, 2, 'Choco Oreo', 'Good taste of choco oreo', 27000, 'IMG-1611663972201.png', 'Y', 'Drink', '2021-01-26 12:03:42', '2021-01-26 12:26:12');

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
  ADD KEY `cs_id` (`cs_id`),
  ADD KEY `dv_id` (`dv_id`),
  ADD KEY `co_id` (`co_id`);

--
-- Indeks untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD PRIMARY KEY (`or_id`),
  ADD KEY `cs_id` (`cs_id`),
  ADD KEY `pr_id` (`pr_id`),
  ADD KEY `od_id` (`od_id`);

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
  MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `coupon`
--
ALTER TABLE `coupon`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `delivery`
--
ALTER TABLE `delivery`
  MODIFY `dv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `discount`
--
ALTER TABLE `discount`
  MODIFY `dc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  MODIFY `or_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  ADD CONSTRAINT `order_detail_ibfk_5` FOREIGN KEY (`co_id`) REFERENCES `coupon` (`co_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_tb`
--
ALTER TABLE `order_tb`
  ADD CONSTRAINT `order_tb_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_tb_ibfk_2` FOREIGN KEY (`pr_id`) REFERENCES `product` (`pr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_tb_ibfk_3` FOREIGN KEY (`od_id`) REFERENCES `order_detail` (`od_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`dc_id`) REFERENCES `discount` (`dc_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
