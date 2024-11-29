-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2024 at 07:24 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doanweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `avatar_url` text DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(80) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(128) NOT NULL,
  `roles` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `avatar_url`, `name`, `email`, `username`, `password`, `phone`, `address`, `roles`, `gender`, `status`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Mai Văn Khải', 'khaimen572@gmail.com', 'khaimen57', '$2y$12$FlSLQzpfZCYD0AQ.CzVSPeQNUUlWU3U4nfmTffmEop0Er3de7zDHi', '0368193004', 'Quận Gò Vấp, TP.HCM', 1, 1, 1, '493JMZJHPQBEMDEJZBYC', NULL, '2024-11-22 07:29:04', '2024-11-22 07:46:22'),
(2, NULL, 'Lam Hoai Nhon', 'hoainhon@gmail.com', 'hoainhon', '$2y$12$XXUEOvg3KVsjd/7IgvLJw.CNyNLh8ypazNfE7aeL50G0nNIcWr60i', '0368193005', 'Quận Gò Vấp, TP.HCM', 2, 1, 1, NULL, NULL, '2024-11-22 07:29:05', '2024-11-22 07:29:05'),
(3, NULL, 'Kim Ngan', 'kimngan@gmail.com', 'kimngan', '$2y$12$jDdmeQdPpQUgko/9cCav/elBaYLnfo76DJQ5YKS66m6lrUU00so3m', '0368193004', 'Quận Gò Vấp, TP.HCM', 3, 2, 1, NULL, NULL, '2024-11-22 07:29:05', '2024-11-22 07:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `img_url` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `img_url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'logo_brand/logo-iphone.png', NULL, '2024-11-22 07:29:05', '2024-11-22 07:29:05'),
(2, 'Samsung', 'logo_brand/logo-samsung.png', NULL, '2024-11-22 07:29:05', '2024-11-22 07:29:05'),
(3, 'Oppo', 'logo_brand/logo-oppo.jpg', NULL, '2024-11-22 07:29:05', '2024-11-22 07:29:05'),
(4, 'Xiaomi', 'logo_brand/logo-xiaomi.png', NULL, '2024-11-22 07:29:05', '2024-11-22 07:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('a75f3f172bfb296f2e10cbfc6dfc1883', 'i:1;', 1732772810),
('a75f3f172bfb296f2e10cbfc6dfc1883:timer', 'i:1732772810;', 1732772810);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capacity`
--

CREATE TABLE `capacity` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `capacity`
--

INSERT INTO `capacity` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '64 GB', '2024-11-22 07:29:05', '2024-11-22 07:29:05'),
(2, '256 GB', '2024-11-22 07:29:06', '2024-11-22 07:29:06'),
(3, '512 GB', '2024-11-22 07:29:06', '2024-11-22 07:29:06'),
(4, '1 TB', '2024-11-22 07:29:06', '2024-11-22 07:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `capacity_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_id`, `product_id`, `color_id`, `capacity_id`, `quantity`, `created_at`, `updated_at`) VALUES
(9, 2, 10, 1, 1, 1, '2024-11-24 11:20:39', '2024-11-24 11:20:39'),
(10, 2, 11, 1, 1, 1, '2024-11-24 11:40:29', '2024-11-24 11:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Đen', '2024-11-22 07:29:06', '2024-11-22 07:29:06'),
(2, 'Trắng', '2024-11-22 07:29:06', '2024-11-22 07:29:06'),
(3, 'Titan', '2024-11-22 07:29:06', '2024-11-22 07:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `capacity_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `customer_id`, `product_id`, `capacity_id`, `color_id`, `content`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 1, 1, 'rat la tuyet voi luon', '2024-11-23 02:44:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_detail`
--

CREATE TABLE `comment_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment_detail`
--

INSERT INTO `comment_detail` (`id`, `comment_id`, `admin_id`, `content`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'cam on ban da danh gia', '2024-11-23 02:45:08', '2024-11-22 19:45:08', '2024-11-22 19:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `email`, `password`, `phone`, `address`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Khải Mai Văn', 'khaimen57@gmail.com', '$2y$10$rq7TlBjfe0yLXet/sRHwVud8a8x08EJ43m5j4tl.r8zYHUGnsBASy', '0368193004', 'Thị trấn Đak Pơ, Huyện Đăk Pơ, Tỉnh Gia Lai', 1, NULL, '2024-10-25 21:01:02', '2024-10-25 21:01:02'),
(2, 'Mai Văn Anh', 'khaimen571@gmail.com', '$2y$12$6IerN/KtG8FmlXrqKsMn8umkIgyWO8J7CITtxUxaO1/4OW8GqD.A2', '0368193009', 'Xã Đại Thành, Huyện Quốc Oai, Thành phố Hà Nội', 1, NULL, '2024-11-24 00:29:30', '2024-11-27 22:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `name`, `date_start`, `date_end`, `status`, `created_at`, `updated_at`) VALUES
(1, '2/9', '2024-11-23 10:24:00', '2024-11-30 10:17:00', 1, '2024-11-22 20:19:02', '2024-11-22 20:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `discount_detail`
--

CREATE TABLE `discount_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_detail_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percent` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_camera`
--

CREATE TABLE `front_camera` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resolution` varchar(50) NOT NULL,
  `record` text NOT NULL,
  `feature` text NOT NULL,
  `flash` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_camera`
--

INSERT INTO `front_camera` (`id`, `resolution`, `record`, `feature`, `flash`, `created_at`, `updated_at`) VALUES
(1, '12 MP', '4K at 30 fps', 'Auto-HDR, Panorama', 1, NULL, NULL),
(2, '8 MP', '1080p at 30 fps', 'HDR, Portrait Mode', 0, NULL, NULL),
(3, '16 MP', '1080p at 60 fps', 'Night Mode, Wide Angle', 0, NULL, NULL),
(4, '20 MP', '4K at 60 fps', 'Super Steady, Portrait Mode', 1, NULL, NULL),
(5, '32 MP', '4K at 30 fps', 'AI Beauty, HDR', 1, NULL, NULL),
(6, '10 MP', '1080p at 30 fps', 'Auto-HDR, Panorama', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `img_product`
--

CREATE TABLE `img_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `img_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `img_product`
--

INSERT INTO `img_product` (`id`, `product_id`, `color_id`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 'img-product\\phpD488.tmp', '2024-11-22 19:46:07', '2024-11-22 19:46:07'),
(2, 10, 2, 'img-product\\phpD489.tmp', '2024-11-22 19:46:07', '2024-11-22 19:46:07'),
(3, 11, 1, 'img-product\\php83D1.tmp', '2024-11-24 00:40:52', '2024-11-24 00:40:52'),
(4, 11, 2, 'img-product\\php83D2.tmp', '2024-11-24 00:40:52', '2024-11-24 00:40:52');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `total` decimal(12,0) DEFAULT NULL,
  `payment_method` varchar(60) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `ship` decimal(10,0) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `customer_id`, `phone`, `address`, `total`, `payment_method`, `note`, `status`, `ship`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, '0368193004', 'Gia lai', 26000000, 'Thanh toán khi nhận hàng', 'abc', 4, 30000, '2024-11-23 02:56:01', NULL, NULL),
(2, 2, '0368193009', '353, Xã Đại Thành, Huyện Quốc Oai, Thành phố Hà Nội', 8025000, 'Thanh toán khi nhận hàng', 'Hello', 4, 25000, '2024-11-24 07:33:34', '2024-11-24 00:32:53', '2024-11-24 00:33:34'),
(3, 2, '0368193009', '353, Xã Đại Thành, Huyện Quốc Oai, Thành phố Hà Nội', 8025000, 'Thanh toán VNPAY', 'Hello', 5, 25000, '2024-11-24 18:23:10', '2024-11-24 11:21:55', '2024-11-24 11:23:10'),
(4, 2, '0368193009', '353, Xã Đại Thành, Huyện Quốc Oai, Thành phố Hà Nội', 8025000, 'Thanh toán VNPAY', 'Hello', 5, 25000, '2024-11-24 18:49:33', '2024-11-24 11:30:38', '2024-11-24 11:49:33'),
(5, 2, '0368193009', '353, Xã Đại Thành, Huyện Quốc Oai, Thành phố Hà Nội', 8027000, 'Thanh toán VNPAY', NULL, 4, 25000, '2024-11-24 18:49:42', '2024-11-24 11:40:34', '2024-11-24 11:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `capacity_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `into_money` decimal(12,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `invoice_id`, `product_id`, `color_id`, `capacity_id`, `quantity`, `price`, `into_money`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 1, 1, 2, 13000000, 26000000, NULL, NULL),
(2, 2, 10, 1, 1, 1, 8000000, 8000000, '2024-11-24 00:32:53', '2024-11-24 00:32:53'),
(3, 3, 10, 1, 1, 1, 8000000, 8000000, '2024-11-24 11:21:55', '2024-11-24 11:21:55'),
(4, 4, 10, 1, 1, 1, 8000000, 8000000, '2024-11-24 11:30:38', '2024-11-24 11:30:38'),
(5, 5, 10, 1, 1, 1, 8000000, 8000000, '2024-11-24 11:40:34', '2024-11-24 11:40:34'),
(6, 5, 11, 1, 1, 1, 2000, 2000, '2024-11-24 11:40:34', '2024-11-24 11:40:34');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logo`
--

CREATE TABLE `logo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img_url` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logo`
--

INSERT INTO `logo` (`id`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 'logo\\php3714.tmp', '2024-11-22 07:29:08', '2024-11-22 20:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(58, '0001_01_01_000000_create_users_table', 1),
(59, '0001_01_01_000001_create_cache_table', 1),
(60, '0001_01_01_000002_create_jobs_table', 1),
(61, '2024_10_30_165348_create_admin_table', 1),
(62, '2024_11_16_125406_creare_customer_table', 1),
(63, '2024_11_16_125851_creare_provider_table', 1),
(64, '2024_11_16_125947_creare_capacity_table', 1),
(65, '2024_11_16_130036_creare_brand_table', 1),
(66, '2024_11_16_130117_creare_product_series_table', 1),
(67, '2024_11_16_130157_creare_colors_table', 1),
(68, '2024_11_16_130245_creare_products_table', 1),
(69, '2024_11_16_130326_creare_product_detail_table', 1),
(70, '2024_11_16_130441_create_img_product_table', 1),
(71, '2024_11_16_130601_create_invoice_table', 1),
(72, '2024_11_16_130639_create_invoice_detail_table', 1),
(73, '2024_11_16_130724_create_warehouse_table', 1),
(74, '2024_11_16_130759_create_warehouse_detail_table', 1),
(75, '2024_11_16_130834_create_discount_table', 1),
(76, '2024_11_16_130911_create_discount_detail_table', 1),
(77, '2024_11_16_130934_create_rate_table', 1),
(78, '2024_11_16_131038_create_comments_table', 1),
(79, '2024_11_16_131102_create_logo_table', 1),
(80, '2024_11_16_131127_create_comment_detail_table', 1),
(81, '2024_11_16_131159_create_news_table', 1),
(82, '2024_11_16_131256_create_front_camera_table', 1),
(83, '2024_11_16_131321_create_rear_camera_table', 1),
(84, '2024_11_16_131350_create_screen_table', 1),
(85, '2024_11_16_131425_create_slide_show_table', 1),
(86, '2024_11_16_131458_create_product_description_table', 1),
(87, '2024_11_16_131518_create_cart_table', 1),
(88, '2024_11_16_131545_create_payment_table', 1),
(89, '2024_11_24_191744_create_return_oders_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `img_url` text NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `admin_id`, `title`, `img_url`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tất tần tật về iPhone 15 Pro và iPhone 15 Pro Max: Nâng cấp đỉnh cao của Apple', 'new\\phpD67A.tmp', '<h2>iPhone 15 Pro v&agrave; iPhone 15 Pro Max sở hữu thiết kế Titan mỏng nhẹ v&agrave; mạnh mẽ với nhiều điểm mới: cạnh viền mới, N&uacute;t T&aacute;c Vụ mới, n&acirc;ng cấp camera v&agrave; chip A17 Pro.</h2>\r\n\r\n<p>Rạng s&aacute;ng 13/9 theo giờ Việt Nam, Apple đ&atilde; ra mắt iPhone 15 Pro v&agrave; iPhone 15 Pro Max. Hai mẫu smartphone được thiết kế bằng titan chuẩn h&agrave;ng kh&ocirc;ng vũ trụ chắc chắn m&agrave; vẫn mỏng nhẹ, mang đến những mẫu Pro c&oacute; trọng lượng nhẹ nhất của Apple từ trước đến nay.</p>\r\n\r\n<p>Thiết kế mới với cạnh viền v&agrave; n&uacute;t Action c&oacute; thể tuỳ chỉnh, hỗ trợ người d&ugrave;ng c&aacute; nh&acirc;n ho&aacute; trải nghiệm với iPhone.</p>\r\n\r\n<p>Nhiều n&acirc;ng cấp camera mạnh mẽ tương đương với 7 ống k&iacute;nh chuy&ecirc;n nghiệp bao gồm: một camera Ch&iacute;nh 48MP hỗ trợ độ ph&acirc;n giải mới l&ecirc;n đến 24MP ở chế độ mặc định, chụp ch&acirc;n dung thế hệ mới với t&iacute;nh năng Focus v&agrave; Depth Control, nhiều cải tiến ở chế độ ban đ&ecirc;m v&agrave; Smart HDR, cũng như camera Telephoto 5x ho&agrave;n to&agrave;n mới chỉ c&oacute; tr&ecirc;n iPhone 15 Pro Max.</p>\r\n\r\n<p>Chip A17 Pro đưa trải nghiệm chơi game v&agrave; hiệu năng chuy&ecirc;n nghiệp l&ecirc;n một tầm cao mới. Cổng kết nối USB-C mới được tăng tốc với tốc độ của USB 3 - nhanh hơn gấp 20 lần so với USB 2. C&ugrave;ng với c&aacute;c định dạng video mới, gi&uacute;p xử l&yacute; quy tr&igrave;nh l&agrave;m việc chuy&ecirc;n nghiệp một c&aacute;ch mạnh mẽ m&agrave; trước đ&acirc;y kh&ocirc;ng thể thực hiện được.</p>\r\n\r\n<p>iPhone 15 Pro v&agrave; iPhone 15 Pro Max sẽ c&oacute; bốn m&agrave;u mới tuyệt đẹp, bao gồm Titan Đen, Titan Trắng, Titan Xanh v&agrave; Titan Tự Nhi&ecirc;n.</p>\r\n\r\n<p><em>&quot;Đ&acirc;y l&agrave; d&ograve;ng sản phẩm chuy&ecirc;n nghiệp nhất m&agrave; ch&uacute;ng t&ocirc;i từng tạo ra, với thiết kế hiện đại bằng Titan, hệ thống camera iPhone ti&ecirc;n tiến nhất tạo ra sự thay đổi cuộc chơi trong quy tr&igrave;nh l&agrave;m việc mới, đồng thời chip A17 Pro mở đường cho một chương mới về hiệu năng v&agrave; c&aacute;c tựa game chưa từng thấy tr&ecirc;n iPhone. iPhone 15 Pro v&agrave; iPhone 15 Pro Max đại diện cho những điều tuyệt vời nhất về thiết kế v&agrave; những đổi mới h&agrave;ng đầu trong ng&agrave;nh của Apple, l&agrave;m phong ph&uacute; th&ecirc;m trải nghiệm h&agrave;ng ng&agrave;y của người d&ugrave;ng, đồng thời gi&uacute;p họ thoả sức s&aacute;ng tạo.&quot;</em>&nbsp;Greg Joswiak, Ph&oacute; Chủ tịch Cấp cao bộ phận Tiếp thị To&agrave;n cầu của Apple, cho biết.</p>\r\n\r\n<h2 style=\"font-style:italic;\"><a href=\"https://kenh14cdn.com/203336854389633024/2023/9/13/photo-19-16945748708901566407697.jpg\"><img alt=\"\" class=\"left\" src=\"https://kenh14cdn.com/203336854389633024/2023/9/13/photo-19-16945748708901566407697.jpg\" /></a></h2>\r\n\r\n<p>&nbsp;</p>', '2024-11-24 10:27:54', '2024-11-24 10:30:34'),
(2, 1, 'Những tính năng không thể ngờ mà iPhone có thể mang lại', 'new\\php9CD0.tmp', '<h2><strong>Trong cuộc sống h&agrave;ng ng&agrave;y, ch&uacute;ng ta thường sử dụng iPhone cho những c&ocirc;ng việc đơn giản m&agrave; qu&ecirc;n đi nhiều t&iacute;nh năng hữu &iacute;ch m&agrave; thiết bị mang lại.</strong></h2>\r\n\r\n<p>Nếu l&agrave; người d&ugrave;ng&nbsp;<a href=\"https://www.24h.com.vn/iphone-c407e1576.html\">iPhone</a>, dưới đ&acirc;y l&agrave; một số &ldquo;thủ thuật&rdquo; gi&uacute;p họ c&oacute; thể tận dụng tối đa khả năng kh&ocirc;ng thể ngờ đến được Apple cung cấp cho thiết bị của m&igrave;nh. Người d&ugrave;ng cần n&acirc;ng cấp iPhone l&ecirc;n phi&ecirc;n bản iOS 18 mới nhất nếu kh&ocirc;ng thấy một số t&iacute;nh năng trong danh s&aacute;ch.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.24h.com.vn/upload/4-2024/images/2024-11-18/1-1731875426-217-width740height495.jpg\" style=\"height:495px; width:740px\" /></p>\r\n\r\n<p><strong>Chức năng &ldquo;Chống r&igrave;nh m&ograve;&rdquo;</strong></p>\r\n\r\n<p>iPhone chứa đựng nhiều th&ocirc;ng tin c&aacute; nh&acirc;n quan trọng. Khi cho người kh&aacute;c mượn, người d&ugrave;ng c&oacute; thể lo ngại về việc họ truy cập v&agrave;o c&aacute;c ứng dụng ri&ecirc;ng tư. Để bảo vệ th&ocirc;ng tin của m&igrave;nh, h&atilde;y v&agrave;o phần &ldquo;C&agrave;i đặt&rdquo;, chọn &ldquo;Trợ năng&rdquo; v&agrave; sau đ&oacute; k&iacute;ch hoạt &ldquo;Truy cập được hướng dẫn&rdquo;. Người d&ugrave;ng sẽ cần nhập m&atilde; k&iacute;ch hoạt để thiết lập chế độ n&agrave;y nhằm gi&uacute;p iPhone chỉ hoạt động trong một ứng dụng duy nhất. Đừng qu&ecirc;n tắt t&iacute;nh năng n&agrave;y khi lấy lại điện thoại.</p>\r\n\r\n<p><strong>Chặn truy cập ứng dụng</strong></p>\r\n\r\n<p>Ngo&agrave;i việc giới hạn quyền truy cập v&agrave;o to&agrave;n bộ điện thoại, người d&ugrave;ng cũng c&oacute; thể chặn một số ứng dụng nhất định bằng c&aacute;ch sử dụng Face ID. T&iacute;nh năng n&agrave;y đảm bảo chỉ bản th&acirc;n mới c&oacute; thể truy cập v&agrave;o những ứng dụng quan trọng gi&uacute;p bảo vệ th&ocirc;ng tin c&aacute; nh&acirc;n trong trường hợp điện thoại bị đ&aacute;nh cắp. Để thực hiện, chỉ cần nhấn giữ v&agrave;o biểu tượng ứng dụng người d&ugrave;ng muốn bảo vệ, sau đ&oacute; chọn &ldquo;Y&ecirc;u cầu Face ID&rdquo;.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.24h.com.vn/upload/4-2024/images/2024-11-18/2-1731875572-267-width740height495.jpg\" style=\"height:495px; width:740px\" /></p>\r\n\r\n<p><strong>L&ecirc;n lịch nhắn tin</strong></p>\r\n\r\n<p>Nếu thường xuy&ecirc;n qu&ecirc;n việc nhắn tin, t&iacute;nh năng l&ecirc;n lịch gửi tin nhắn tr&ecirc;n iPhone sẽ l&agrave; một giải ph&aacute;p hữu &iacute;ch. Người d&ugrave;ng c&oacute; thể l&ecirc;n lịch gửi tin nhắn cho người nhận v&agrave;o một ng&agrave;y v&agrave; giờ cụ thể. V&iacute; dụ, nếu cần nhắc nhở người A v&agrave; B về một sự kiện n&agrave;o đ&oacute;, h&atilde;y l&ecirc;n lịch gửi tin nhắn trước thời điểm m&agrave; người d&ugrave;ng c&oacute; thể qu&ecirc;n. T&iacute;nh năng n&agrave;y cũng gi&uacute;p người d&ugrave;ng tr&aacute;nh được sự th&ocirc;i th&uacute;c phải phản hồi ngay lập tức. Để sử dụng, trong ứng dụng Tin nhắn h&atilde;y soạn nội dung tin nhắn v&agrave; chạm v&agrave;o dấu &ldquo;+&rdquo; b&ecirc;n cạnh trường nhập văn bản trước khi nhấn v&agrave;o t&ugrave;y chọn Gửi sau để chọn khung thời gian muốn l&ecirc;n lịch cho tin nhắn được gửi đi.</p>\r\n\r\n<p><strong>Kh&aacute;m ph&aacute; vật thể hoặc sinh vật</strong></p>\r\n\r\n<p>Khi đi dạo, người d&ugrave;ng c&oacute; thể bắt gặp những điều th&uacute; vị v&agrave; muốn biết ch&uacute;ng l&agrave; g&igrave;. Với iPhone, người d&ugrave;ng chỉ cần hướng camera v&agrave;o vật thể đ&oacute; v&agrave; thiết bị sẽ gi&uacute;p x&aacute;c định. T&iacute;nh năng n&agrave;y tương tự như Google Lens v&agrave; rất dễ sử dụng.</p>\r\n\r\n<p><img alt=\"\" src=\"https://cdn.24h.com.vn/upload/4-2024/images/2024-11-18/4-1731875453-15-width740height416.jpg\" style=\"height:416px; width:740px\" /></p>\r\n\r\n<p>Chỉ cần chụp ảnh, nhấn v&agrave;o n&uacute;t Th&ocirc;ng tin (biểu tượng i) ở cuối m&agrave;n h&igrave;nh, iPhone sẽ cung cấp cho người d&ugrave;ng c&acirc;u trả lời. Khi x&aacute;c định th&agrave;nh c&ocirc;ng, c&aacute;c biểu tượng nhỏ sẽ xuất hiện ở cuối h&igrave;nh ảnh, cho biết đ&oacute; l&agrave; thực vật hay động vật g&igrave;. Tuy nhi&ecirc;n t&iacute;nh năng n&agrave;y hiện tại chỉ hoạt động với một số ng&ocirc;n ngữ nhất định.</p>\r\n\r\n<p>Những t&iacute;nh năng n&agrave;y kh&ocirc;ng chỉ gi&uacute;p người d&ugrave;ng sử dụng iPhone hiệu quả hơn m&agrave; c&ograve;n mang lại sự tiện lợi trong cuộc sống h&agrave;ng ng&agrave;y.</p>\r\n\r\n<p>Nguồn: https://arttimes.vn/cong-nghe/nhung-tinh-nang-khong-the-ngo-ma-iphone-co-the-mang-lai-c61a55056.html</p>', '2024-11-24 10:34:09', '2024-11-24 10:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vnp_TxnRef` bigint(20) UNSIGNED NOT NULL,
  `vnp_Amount` decimal(12,0) NOT NULL,
  `vnp_BankCode` varchar(255) NOT NULL,
  `vnp_BankTranNo` varchar(255) NOT NULL,
  `vnp_CardType` varchar(255) NOT NULL,
  `vnp_OrderInfo` varchar(255) NOT NULL,
  `vnp_PayDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vnp_ResponseCode` varchar(255) NOT NULL,
  `vnp_TmnCode` varchar(255) NOT NULL,
  `vnp_TransactionNo` varchar(255) NOT NULL,
  `vnp_TransactionStatus` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `vnp_TxnRef`, `vnp_Amount`, `vnp_BankCode`, `vnp_BankTranNo`, `vnp_CardType`, `vnp_OrderInfo`, `vnp_PayDate`, `vnp_ResponseCode`, `vnp_TmnCode`, `vnp_TransactionNo`, `vnp_TransactionStatus`, `created_at`, `updated_at`) VALUES
(1, 5, 802700000, 'NCB', 'VNP14695361', 'ATM', 'Thanh toan GD:5', '2024-11-24 18:42:07', '00', 'UNB557KN', '14695361', '00', '2024-11-24 11:42:20', '2024-11-24 11:42:20'),
(2, 5, 802700000, 'NCB', 'VNP14695361', 'ATM', 'Thanh toan GD:5', '2024-11-24 18:42:07', '00', 'UNB557KN', '14695361', '00', '2024-11-24 11:48:11', '2024-11-24 11:48:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `product_series_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `brand_id`, `product_series_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 13', 'Online giá siêu rẻ', 1, 4, NULL, NULL, NULL),
(2, 'iPhone 11', 'Online giá siêu rẻ', 1, 1, NULL, NULL, NULL),
(3, 'Samsung Galaxy S21', 'Online giá siêu rẻ', 2, 2, NULL, NULL, NULL),
(4, 'iPhone 12', 'Online giá siêu rẻ', 1, 3, NULL, NULL, NULL),
(5, 'Samsung Galaxy Note 20', 'Online giá siêu rẻ', 2, 2, NULL, NULL, NULL),
(6, 'Oppo Find X3 Pro', 'Online giá siêu rẻ', 3, 5, NULL, NULL, NULL),
(7, 'Xiaomi Mi 11', 'Online giá siêu rẻ', 4, 6, NULL, NULL, NULL),
(8, 'Xiaomi Redmi Note 10', 'Online giá siêu rẻ', 4, 6, NULL, NULL, NULL),
(9, 'Samsung Galaxy A52', 'Online giá siêu rẻ', 2, 2, NULL, NULL, NULL),
(10, 'Iphone 11 pro max', 'xin', 1, 1, NULL, '2024-11-22 19:40:41', '2024-11-22 19:40:41'),
(11, 'Iphone 13 pro maxxx', NULL, 1, 4, NULL, '2024-11-24 00:39:20', '2024-11-24 00:39:20'),
(12, 'Iphone 13 pro maxxx', NULL, 1, 4, NULL, '2024-11-24 00:39:21', '2024-11-24 00:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_description`
--

CREATE TABLE `product_description` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `front_camera_id` bigint(20) UNSIGNED NOT NULL,
  `rear_camera_id` bigint(20) UNSIGNED NOT NULL,
  `screen_id` bigint(20) UNSIGNED NOT NULL,
  `weight` varchar(3) NOT NULL,
  `os` varchar(50) NOT NULL,
  `battery` varchar(4) NOT NULL,
  `ram` varchar(2) NOT NULL,
  `chip` varchar(20) NOT NULL,
  `sims` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_description`
--

INSERT INTO `product_description` (`id`, `product_id`, `front_camera_id`, `rear_camera_id`, `screen_id`, `weight`, `os`, `battery`, `ram`, `chip`, `sims`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '200', 'Android 12', '4500', '8', 'Snapdragon 888', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(2, 2, 2, 2, 2, '180', 'iOS 15', '3095', '4', 'A15 Bionic', 'Dual SIM (Nano-SIM and eSIM)', NULL, NULL),
(3, 3, 3, 3, 3, '210', 'Android 11', '5000', '6', 'Exynos 2100', 'Single SIM (Nano-SIM) or Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(4, 4, 4, 4, 4, '190', 'iOS 13', '4800', '12', 'Snapdragon 8 Gen 1', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(5, 5, 5, 5, 5, '190', 'Android 13', '4800', '8', 'Snapdragon 8 Gen 1', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(6, 6, 6, 6, 5, '190', 'Android 13', '4800', '8', 'Snapdragon 8 Gen 1', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(7, 7, 5, 5, 5, '190', 'Android 13', '4800', '8', 'Snapdragon 8 Gen 1', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(8, 8, 6, 6, 5, '190', 'Android 13', '4800', '8', 'Snapdragon 8 Gen 1', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(9, 9, 6, 6, 5, '190', 'Android 13', '4800', '8', 'Snapdragon 8 Gen 1', 'Dual SIM (Nano-SIM, dual stand-by)', NULL, NULL),
(10, 10, 2, 1, 2, '234', 'IOS', '1345', '64', 'A345', '4G', '2024-11-22 19:40:41', '2024-11-22 19:40:41'),
(11, 11, 2, 3, 2, '234', 'IOS', '1345', '64', 'A345', '4G', '2024-11-24 00:39:20', '2024-11-24 00:39:20'),
(12, 12, 2, 3, 2, '234', 'IOS', '1345', '64', 'A345', '4G', '2024-11-24 00:39:21', '2024-11-24 00:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_detail`
--

CREATE TABLE `product_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `capacity_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_detail`
--

INSERT INTO `product_detail` (`id`, `product_id`, `color_id`, `capacity_id`, `price`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 1, 8000000, 3, 1, '2024-11-22 19:40:41', '2024-11-24 11:49:35'),
(2, 10, 2, 1, 13000000, 5, 1, '2024-11-22 19:40:41', '2024-11-22 19:41:24'),
(3, 11, 1, 1, 2000, 9, 1, '2024-11-24 00:39:20', '2024-11-24 11:49:35'),
(4, 11, 2, 2, 999999, 10, 1, '2024-11-24 00:39:20', '2024-11-24 00:40:11'),
(5, 12, 1, 1, NULL, NULL, 1, '2024-11-24 00:39:21', '2024-11-24 00:39:21'),
(6, 12, 2, 2, NULL, NULL, 1, '2024-11-24 00:39:21', '2024-11-24 00:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_series`
--

CREATE TABLE `product_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_series`
--

INSERT INTO `product_series` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Iphone 11', NULL, '2024-11-22 07:29:06', '2024-11-22 07:29:06'),
(2, 'Samsung Galaxy', NULL, '2024-11-22 07:29:06', '2024-11-22 07:29:06'),
(3, 'Iphone 12', NULL, '2024-11-22 07:29:07', '2024-11-22 07:29:07'),
(4, 'Iphone 13', NULL, '2024-11-22 07:29:07', '2024-11-22 07:29:07'),
(5, 'Oppo Find', NULL, '2024-11-22 07:29:07', '2024-11-22 07:29:07'),
(6, 'Xiaomi Mi', NULL, '2024-11-22 07:29:07', '2024-11-22 07:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(128) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `name`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Công Ty TNHH Thế giới di động', '0368193004', 'Đức Cơ,Gia Lai', 1, '2024-11-22 19:41:14', '2024-11-22 19:41:14');

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `capacity_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `star` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rate`
--

INSERT INTO `rate` (`id`, `product_id`, `capacity_id`, `color_id`, `customer_id`, `star`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 1, 2, 5, '2024-11-24 00:33:50', '2024-11-24 00:33:50'),
(2, 10, 1, 1, 2, 5, '2024-11-24 11:50:01', '2024-11-24 11:50:01'),
(3, 11, 1, 1, 2, 5, '2024-11-24 11:50:05', '2024-11-24 11:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `rear_camera`
--

CREATE TABLE `rear_camera` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resolution` varchar(50) NOT NULL,
  `record` text NOT NULL,
  `feature` text NOT NULL,
  `flash` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rear_camera`
--

INSERT INTO `rear_camera` (`id`, `resolution`, `record`, `feature`, `flash`, `created_at`, `updated_at`) VALUES
(1, '48 MP', '8K at 24 fps', 'Night Mode, Pro Mode, Ultra-wide', 1, NULL, NULL),
(2, '12 MP', '4K at 60 fps', 'HDR10+, Super Steady', 1, NULL, NULL),
(3, '64 MP', '4K at 30 fps', 'Ultra-wide, Macro, Depth Sensor', 1, NULL, NULL),
(4, '108 MP', '8K at 30 fps', 'Periscope, Night Mode', 1, NULL, NULL),
(5, '24 MP', '4K at 60 fps', 'HDR, Slow Motion', 1, NULL, NULL),
(6, '16 MP', '1080p at 30 fps', 'Wide Angle, Panorama', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `return_orders`
--

CREATE TABLE `return_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `img_url` text DEFAULT NULL,
  `reason` text NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `screen`
--

CREATE TABLE `screen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `technoscreen` varchar(30) NOT NULL,
  `resolution` varchar(60) NOT NULL,
  `size` varchar(20) NOT NULL,
  `brightness` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `screen`
--

INSERT INTO `screen` (`id`, `technoscreen`, `resolution`, `size`, `brightness`, `created_at`, `updated_at`) VALUES
(1, 'OLED', '1440 x 3200 pixels', '6.5 inches', '800 nits', NULL, NULL),
(2, 'LCD', '1080 x 2400 pixels', '6.1 inches', '600 nits', NULL, NULL),
(3, 'AMOLED', '2340 x 1080 pixels', '6.7 inches', '1000 nits', NULL, NULL),
(4, 'Super AMOLED', '3040 x 1440 pixels', '6.4 inches', '900 nits', NULL, NULL),
(5, 'Retina', '2532 x 1170 pixels', '6.2 inches', '1100 nits', NULL, NULL),
(6, 'Dynamic AMOLED', '3200 x 1440 pixels', '6.8 inches', '1200 nits', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1CBqG0HeKdxBUHUsKCRdgU3Ejfwogk1H46J0Xgq8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGp0UkI0OUVhOE5IaU9KclR3NDhhSE55cFpXNlR2Y3BTYXlGYVVVVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732688949),
('wrDAimnRF3lvKFBkOT0rQZMH5ur8mRwkcsdrtyuu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaG1nWDZwdzk4OXNjNENuZzd2MGJvSmhLZThmdmxMS0tITE15V29IaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9zdGF0aXN0aWNhbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1732772209);

-- --------------------------------------------------------

--
-- Table structure for table `slide_show`
--

CREATE TABLE `slide_show` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `img_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slide_show`
--

INSERT INTO `slide_show` (`id`, `product_id`, `img_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'slide\\php4EF6.tmp', '2024-11-24 10:36:00', '2024-11-24 10:36:00'),
(2, 11, 'slide\\phpA37F.tmp', '2024-11-24 10:36:22', '2024-11-24 10:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` decimal(12,0) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`id`, `provider_id`, `date`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-11-23 02:41:25', 95000000, 1, '2024-11-22 19:41:24', '2024-11-22 19:41:25'),
(2, 1, '2024-11-24 07:40:11', 100000, 1, '2024-11-24 00:40:10', '2024-11-24 00:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_detail`
--

CREATE TABLE `warehouse_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `capacity_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `in_price` decimal(10,0) NOT NULL,
  `out_price` decimal(10,0) NOT NULL,
  `into_money` decimal(12,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_detail`
--

INSERT INTO `warehouse_detail` (`id`, `warehouse_id`, `product_id`, `color_id`, `capacity_id`, `quantity`, `in_price`, `out_price`, `into_money`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 2, 1, 5, 12000000, 13000000, 60000000, '2024-11-22 19:41:24', '2024-11-22 19:41:24'),
(2, 1, 10, 1, 1, 5, 7000000, 8000000, 35000000, '2024-11-22 19:41:25', '2024-11-22 19:41:25'),
(3, 2, 11, 1, 1, 10, 1000, 2000, 10000, '2024-11-24 00:40:11', '2024-11-24 00:40:11'),
(4, 2, 11, 2, 2, 10, 9000, 999999, 90000, '2024-11-24 00:40:11', '2024-11-24 00:40:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `capacity`
--
ALTER TABLE `capacity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`),
  ADD KEY `cart_color_id_foreign` (`color_id`),
  ADD KEY `cart_capacity_id_foreign` (`capacity_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_customer_id_foreign` (`customer_id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_capacity_id_foreign` (`capacity_id`),
  ADD KEY `comments_color_id_foreign` (`color_id`);

--
-- Indexes for table `comment_detail`
--
ALTER TABLE `comment_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_detail_comment_id_foreign` (`comment_id`),
  ADD KEY `comment_detail_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_detail`
--
ALTER TABLE `discount_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_detail_discount_id_foreign` (`discount_id`),
  ADD KEY `discount_detail_product_id_foreign` (`product_id`),
  ADD KEY `discount_detail_product_detail_id_foreign` (`product_detail_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `front_camera`
--
ALTER TABLE `front_camera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `img_product`
--
ALTER TABLE `img_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `img_product_product_id_foreign` (`product_id`),
  ADD KEY `img_product_color_id_foreign` (`color_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_detail_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_detail_product_id_foreign` (`product_id`),
  ADD KEY `invoice_detail_color_id_foreign` (`color_id`),
  ADD KEY `invoice_detail_capacity_id_foreign` (`capacity_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logo`
--
ALTER TABLE `logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_vnp_txnref_foreign` (`vnp_TxnRef`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_product_series_id_foreign` (`product_series_id`);

--
-- Indexes for table `product_description`
--
ALTER TABLE `product_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_description_product_id_foreign` (`product_id`),
  ADD KEY `product_description_front_camera_id_foreign` (`front_camera_id`),
  ADD KEY `product_description_rear_camera_id_foreign` (`rear_camera_id`),
  ADD KEY `product_description_screen_id_foreign` (`screen_id`);

--
-- Indexes for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_detail_product_id_foreign` (`product_id`),
  ADD KEY `product_detail_color_id_foreign` (`color_id`),
  ADD KEY `product_detail_capacity_id_foreign` (`capacity_id`);

--
-- Indexes for table `product_series`
--
ALTER TABLE `product_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_product_id_foreign` (`product_id`),
  ADD KEY `rate_capacity_id_foreign` (`capacity_id`),
  ADD KEY `rate_color_id_foreign` (`color_id`),
  ADD KEY `rate_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `rear_camera`
--
ALTER TABLE `rear_camera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_orders`
--
ALTER TABLE `return_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_orders_invoice_id_foreign` (`invoice_id`),
  ADD KEY `return_orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `screen`
--
ALTER TABLE `screen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slide_show`
--
ALTER TABLE `slide_show`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slide_show_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `warehouse_detail`
--
ALTER TABLE `warehouse_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_detail_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_detail_product_id_foreign` (`product_id`),
  ADD KEY `warehouse_detail_color_id_foreign` (`color_id`),
  ADD KEY `warehouse_detail_capacity_id_foreign` (`capacity_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `capacity`
--
ALTER TABLE `capacity`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment_detail`
--
ALTER TABLE `comment_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `discount_detail`
--
ALTER TABLE `discount_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_camera`
--
ALTER TABLE `front_camera`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `img_product`
--
ALTER TABLE `img_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logo`
--
ALTER TABLE `logo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_description`
--
ALTER TABLE `product_description`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_series`
--
ALTER TABLE `product_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rate`
--
ALTER TABLE `rate`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rear_camera`
--
ALTER TABLE `rear_camera`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `return_orders`
--
ALTER TABLE `return_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `screen`
--
ALTER TABLE `screen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `slide_show`
--
ALTER TABLE `slide_show`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouse_detail`
--
ALTER TABLE `warehouse_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_capacity_id_foreign` FOREIGN KEY (`capacity_id`) REFERENCES `capacity` (`id`),
  ADD CONSTRAINT `cart_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_capacity_id_foreign` FOREIGN KEY (`capacity_id`) REFERENCES `capacity` (`id`),
  ADD CONSTRAINT `comments_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `comments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `comment_detail`
--
ALTER TABLE `comment_detail`
  ADD CONSTRAINT `comment_detail_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  ADD CONSTRAINT `comment_detail_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discount_detail`
--
ALTER TABLE `discount_detail`
  ADD CONSTRAINT `discount_detail_discount_id_foreign` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  ADD CONSTRAINT `discount_detail_product_detail_id_foreign` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`),
  ADD CONSTRAINT `discount_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `img_product`
--
ALTER TABLE `img_product`
  ADD CONSTRAINT `img_product_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `img_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_capacity_id_foreign` FOREIGN KEY (`capacity_id`) REFERENCES `capacity` (`id`),
  ADD CONSTRAINT `invoice_detail_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `invoice_detail_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  ADD CONSTRAINT `invoice_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_vnp_txnref_foreign` FOREIGN KEY (`vnp_TxnRef`) REFERENCES `invoice` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `products_product_series_id_foreign` FOREIGN KEY (`product_series_id`) REFERENCES `product_series` (`id`);

--
-- Constraints for table `product_description`
--
ALTER TABLE `product_description`
  ADD CONSTRAINT `product_description_front_camera_id_foreign` FOREIGN KEY (`front_camera_id`) REFERENCES `front_camera` (`id`),
  ADD CONSTRAINT `product_description_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_description_rear_camera_id_foreign` FOREIGN KEY (`rear_camera_id`) REFERENCES `rear_camera` (`id`),
  ADD CONSTRAINT `product_description_screen_id_foreign` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`id`);

--
-- Constraints for table `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_capacity_id_foreign` FOREIGN KEY (`capacity_id`) REFERENCES `capacity` (`id`),
  ADD CONSTRAINT `product_detail_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `product_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `rate_capacity_id_foreign` FOREIGN KEY (`capacity_id`) REFERENCES `capacity` (`id`),
  ADD CONSTRAINT `rate_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `rate_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `rate_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `return_orders`
--
ALTER TABLE `return_orders`
  ADD CONSTRAINT `return_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `return_orders_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slide_show`
--
ALTER TABLE `slide_show`
  ADD CONSTRAINT `slide_show_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`);

--
-- Constraints for table `warehouse_detail`
--
ALTER TABLE `warehouse_detail`
  ADD CONSTRAINT `warehouse_detail_capacity_id_foreign` FOREIGN KEY (`capacity_id`) REFERENCES `capacity` (`id`),
  ADD CONSTRAINT `warehouse_detail_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `warehouse_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `warehouse_detail_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
