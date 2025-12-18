-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2025 at 09:41 AM
-- Server version: 8.0.41-0ubuntu0.24.04.1
-- PHP Version: 8.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(4, NULL, 'Man Fashion', 1, '2025-12-17 20:04:14', '2025-12-17 20:04:14'),
(5, NULL, 'Woman Fashion', 1, '2025-12-17 20:08:43', '2025-12-17 20:08:43'),
(6, NULL, 'Kids Fashion', 1, '2025-12-17 20:09:15', '2025-12-17 20:09:15'),
(7, NULL, 'Bags', 1, '2025-12-17 20:09:30', '2025-12-17 20:09:30'),
(8, NULL, 'Sun Glasses', 1, '2025-12-17 20:09:46', '2025-12-17 20:09:46'),
(9, NULL, 'Heels', 1, '2025-12-17 20:10:01', '2025-12-17 20:10:01'),
(10, NULL, 'Sneakers', 1, '2025-12-17 20:10:34', '2025-12-17 20:10:34'),
(11, NULL, 'jewellery', 1, '2025-12-17 20:18:24', '2025-12-17 20:18:24'),
(12, NULL, 'Watches', 1, '2025-12-17 20:18:54', '2025-12-17 20:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(23, 'App\\Models\\Category', 6, '365a0990-ad95-478d-88c0-955801782835', 'hero_image', '92642', '92642.jpg', 'image/jpeg', 'media', 'media', 440671, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:09:15', '2025-12-17 20:09:15'),
(24, 'App\\Models\\Category', 7, '1485c252-3d0a-47a4-98e5-ce73e0ba2fa3', 'hero_image', 'images', 'images.jpeg', 'image/jpeg', 'media', 'media', 6640, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:09:30', '2025-12-17 20:09:30'),
(25, 'App\\Models\\Category', 8, '629e9d6a-df78-4d8a-bcb4-39c6f7cccecf', 'hero_image', 'Quay_HighKey_BlackFade_Front_3c2f5e85-e5b9-44f9-8c77-6e5cbfa00e62', 'Quay_HighKey_BlackFade_Front_3c2f5e85-e5b9-44f9-8c77-6e5cbfa00e62.webp', 'image/webp', 'media', 'media', 57754, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:09:46', '2025-12-17 20:09:46'),
(26, 'App\\Models\\Category', 9, 'eb1b550b-ca2c-46c2-98ad-50e010421967', 'hero_image', 'download (1)', 'download-(1).jpeg', 'image/jpeg', 'media', 'media', 6319, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:10:01', '2025-12-17 20:10:01'),
(27, 'App\\Models\\Category', 10, '12212ebc-9b81-45a8-b22c-435af4657d4f', 'hero_image', 'download (2)', 'download-(2).jpeg', 'image/jpeg', 'media', 'media', 8611, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:10:34', '2025-12-17 20:10:34'),
(28, 'App\\Models\\Category', 11, '6bd68176-565e-46e3-9607-dc93b5f0bb96', 'hero_image', 'taara-bridal-set-pastels-533348', 'taara-bridal-set-pastels-533348.jpg', 'image/jpeg', 'media', 'media', 254600, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:18:24', '2025-12-17 20:18:24'),
(29, 'App\\Models\\Category', 12, '013b2204-7da5-47aa-82c1-2b1a613e7fa5', 'hero_image', 'images (1)', 'images-(1).jpeg', 'image/jpeg', 'media', 'media', 12146, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:18:54', '2025-12-17 20:18:54'),
(33, 'App\\Models\\Category', 4, 'f15837d2-6729-4663-97c7-f34d85ccd038', 'hero_image', 'gean-montoya-M2Hk2bVtNn4-unsplash', 'gean-montoya-M2Hk2bVtNn4-unsplash.jpg', 'image/jpeg', 'media', 'media', 38401, '[]', '[]', '[]', '[]', 3, '2025-12-17 20:35:01', '2025-12-17 20:35:01'),
(34, 'App\\Models\\Product', 5, '20791d7d-59c0-40e7-9720-0db50ba93f8c', 'hero_image', 'BLACK-BLUE-DG152', 'BLACK-BLUE-DG152.jpg', 'image/jpeg', 'media', 'media', 106274, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:45:44', '2025-12-17 20:45:44'),
(35, 'App\\Models\\Product', 5, 'db513be4-be8c-47b9-bf65-5790cf35b786', 'gallery_images', 'BLACK-BLUE-DG152-3', 'BLACK-BLUE-DG152-3.jpg', 'image/jpeg', 'media', 'media', 48700, '[]', '[]', '[]', '[]', 2, '2025-12-17 20:45:44', '2025-12-17 20:45:44'),
(36, 'App\\Models\\Product', 5, 'aee46f5f-c85c-4757-8b57-a145fced2b1a', 'gallery_images', 'BLACK-BLUE-DG152-2', 'BLACK-BLUE-DG152-2.jpg', 'image/jpeg', 'media', 'media', 130325, '[]', '[]', '[]', '[]', 3, '2025-12-17 20:45:44', '2025-12-17 20:45:44'),
(37, 'App\\Models\\Product', 6, 'a30dafbf-a4a1-4433-aa85-1c46b33e4384', 'hero_image', '176-ash-ck', '176-ash-ck.jpg', 'image/jpeg', 'media', 'media', 144266, '[]', '[]', '[]', '[]', 1, '2025-12-17 20:49:23', '2025-12-17 20:49:23'),
(38, 'App\\Models\\Product', 6, '50933be7-eb0d-4f28-9973-888b8a2b2117', 'gallery_images', '176-ash-ck-back', '176-ash-ck-back.jpg', 'image/jpeg', 'media', 'media', 149871, '[]', '[]', '[]', '[]', 2, '2025-12-17 20:49:23', '2025-12-17 20:49:23'),
(39, 'App\\Models\\Product', 6, '7b6d615a-bdbf-48a4-9023-12156ab5a6d0', 'gallery_images', '176-ash-ck2', '176-ash-ck2.jpg', 'image/jpeg', 'media', 'media', 189875, '[]', '[]', '[]', '[]', 3, '2025-12-17 20:49:23', '2025-12-17 20:49:23'),
(40, 'App\\Models\\Product', 7, 'b18e9d03-26c0-4553-8b8a-7abbf99978c2', 'hero_image', '02', '02.jpg', 'image/jpeg', 'media', 'media', 85776, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:03:34', '2025-12-17 21:03:34'),
(41, 'App\\Models\\Product', 7, '23f99803-7790-42a6-9006-b9e528d48dfa', 'gallery_images', '02', '02.jpg', 'image/jpeg', 'media', 'media', 85776, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:03:34', '2025-12-17 21:03:34'),
(42, 'App\\Models\\Product', 7, 'dceb82d8-3dca-432f-85fe-ce8d5753e1ee', 'gallery_images', '03', '03.jpg', 'image/jpeg', 'media', 'media', 242527, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:03:34', '2025-12-17 21:03:34'),
(43, 'App\\Models\\Product', 8, '1a728c7c-1533-469c-a4bf-3a79f02e55f0', 'hero_image', 'g4', 'g4.jpg', 'image/jpeg', 'media', 'media', 85786, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:06:34', '2025-12-17 21:06:34'),
(44, 'App\\Models\\Product', 8, '1d05b967-5e0a-4fc2-bc09-aa5c2cc96bee', 'gallery_images', 'g4', 'g4.jpg', 'image/jpeg', 'media', 'media', 85786, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:06:34', '2025-12-17 21:06:34'),
(45, 'App\\Models\\Product', 8, 'dc2b3b9e-3b36-480b-a5eb-4f9202004478', 'gallery_images', 'g4.1', 'g4.1.jpg', 'image/jpeg', 'media', 'media', 208980, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:06:34', '2025-12-17 21:06:34'),
(46, 'App\\Models\\Product', 9, '2377394f-4c86-45b1-be2f-5c79b6f4aa6d', 'hero_image', 'k9.1', 'k9.1.jpg', 'image/jpeg', 'media', 'media', 204691, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:09:32', '2025-12-17 21:09:32'),
(47, 'App\\Models\\Product', 9, '04b4cbda-6bdf-4506-b2ef-8a23bede7c36', 'gallery_images', 'k9.1', 'k9.1.jpg', 'image/jpeg', 'media', 'media', 204691, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:09:32', '2025-12-17 21:09:32'),
(48, 'App\\Models\\Product', 9, '09fcdf1e-4b25-4846-a910-166e40d0ceed', 'gallery_images', 'k9', 'k9.jpg', 'image/jpeg', 'media', 'media', 250862, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:09:32', '2025-12-17 21:09:32'),
(49, 'App\\Models\\Product', 10, 'e9554247-2c66-4a3b-a930-576c0cff54b1', 'hero_image', 'k8', 'k8.jpg', 'image/jpeg', 'media', 'media', 256795, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:18:28', '2025-12-17 21:18:28'),
(50, 'App\\Models\\Product', 10, 'ebe3ec7c-eabe-4d74-b2ef-15d4e7a83f7d', 'gallery_images', 'k8', 'k8.jpg', 'image/jpeg', 'media', 'media', 256795, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:18:28', '2025-12-17 21:18:28'),
(51, 'App\\Models\\Product', 10, 'ccfe7a1f-9017-479a-855e-71918fc775f3', 'gallery_images', 'k8.1', 'k8.1.jpg', 'image/jpeg', 'media', 'media', 238416, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:18:28', '2025-12-17 21:18:28'),
(52, 'App\\Models\\Product', 11, '2441a0d9-65f3-4d13-a518-b1ad73b0365a', 'hero_image', 'Drass14', 'Drass14.webp', 'image/webp', 'media', 'media', 113498, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:22:10', '2025-12-17 21:22:10'),
(53, 'App\\Models\\Product', 11, 'b270a4bc-0545-4ab3-81d4-1c1b8baed296', 'gallery_images', 'Drass15', 'Drass15.webp', 'image/webp', 'media', 'media', 112528, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:22:10', '2025-12-17 21:22:10'),
(54, 'App\\Models\\Product', 11, '72d485a6-9237-4260-bd09-59f045e52738', 'gallery_images', 'Drass16', 'Drass16.webp', 'image/webp', 'media', 'media', 90158, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:22:10', '2025-12-17 21:22:10'),
(55, 'App\\Models\\Product', 12, 'b4d8d3d0-7728-4717-b8fb-f05bf8f42aaf', 'hero_image', '1814-1990', '1814-1990.webp', 'image/webp', 'media', 'media', 89842, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:24:13', '2025-12-17 21:24:13'),
(56, 'App\\Models\\Product', 12, '470fe630-4181-4799-8f5b-07d727a8e65c', 'gallery_images', '1814-1990', '1814-1990.webp', 'image/webp', 'media', 'media', 89842, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:24:13', '2025-12-17 21:24:13'),
(57, 'App\\Models\\Product', 13, '939ccb72-b49f-473e-bd3d-943c863bda51', 'hero_image', 'Drass22', 'Drass22.webp', 'image/webp', 'media', 'media', 194136, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:26:47', '2025-12-17 21:26:47'),
(58, 'App\\Models\\Product', 13, 'c99d486f-dbef-4d92-aa8a-1d413170e033', 'gallery_images', 'Drass22', 'Drass22.webp', 'image/webp', 'media', 'media', 194136, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:26:47', '2025-12-17 21:26:47'),
(59, 'App\\Models\\Product', 13, '4d2efedc-cea1-49de-953f-1153f6658bac', 'gallery_images', 'Drass23', 'Drass23.webp', 'image/webp', 'media', 'media', 170782, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:26:47', '2025-12-17 21:26:47'),
(60, 'App\\Models\\Product', 13, 'aa64e53a-58fd-42ed-a423-2f80e592ad35', 'gallery_images', 'Drass25', 'Drass25.webp', 'image/webp', 'media', 'media', 178798, '[]', '[]', '[]', '[]', 4, '2025-12-17 21:26:47', '2025-12-17 21:26:47'),
(61, 'App\\Models\\Product', 14, '2fda7543-7368-4d25-93e7-c2f25b92eee4', 'hero_image', 'Abaya-2', 'Abaya-2.jpg', 'image/jpeg', 'media', 'media', 377875, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:40:54', '2025-12-17 21:40:54'),
(62, 'App\\Models\\Product', 14, 'de42f79e-5146-41cd-88fe-08faa616bcb1', 'gallery_images', '3-2-600x900', '3-2-600x900.jpg', 'image/jpeg', 'media', 'media', 113550, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:40:54', '2025-12-17 21:40:54'),
(63, 'App\\Models\\Product', 14, '789b38bd-89a5-4240-bbe0-4966260103c5', 'gallery_images', 'Abaya-2', 'Abaya-2.jpg', 'image/jpeg', 'media', 'media', 377875, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:40:54', '2025-12-17 21:40:54'),
(64, 'App\\Models\\Product', 15, '2931713d-a92a-4384-8af9-bce3ff815a7a', 'hero_image', 'saree26', 'saree26.webp', 'image/webp', 'media', 'media', 188482, '[]', '[]', '[]', '[]', 1, '2025-12-17 21:42:41', '2025-12-17 21:42:41'),
(65, 'App\\Models\\Product', 15, '57440592-7ab8-4bd3-8eac-1b8b59a68ca0', 'gallery_images', 'saree26', 'saree26.webp', 'image/webp', 'media', 'media', 188482, '[]', '[]', '[]', '[]', 2, '2025-12-17 21:42:41', '2025-12-17 21:42:41'),
(66, 'App\\Models\\Product', 15, '71826fab-31e5-414b-a60b-30c83d24da97', 'gallery_images', 'saree25', 'saree25.webp', 'image/webp', 'media', 'media', 169152, '[]', '[]', '[]', '[]', 3, '2025-12-17 21:42:41', '2025-12-17 21:42:41'),
(67, 'App\\Models\\Product', 15, 'b3838243-7d70-4065-9d8e-e94282c2e799', 'gallery_images', 'saree27', 'saree27.webp', 'image/webp', 'media', 'media', 165366, '[]', '[]', '[]', '[]', 4, '2025-12-17 21:42:41', '2025-12-17 21:42:41'),
(68, 'App\\Models\\Category', 5, '1ca37e4c-da85-4665-a7f3-0eb532fc74e8', 'hero_image', 'Drass14', 'Drass14.webp', 'image/webp', 'media', 'media', 113498, '[]', '[]', '[]', '[]', 4, '2025-12-17 21:43:33', '2025-12-17 21:43:33'),
(69, 'App\\Models\\Product', 16, 'ee087332-551f-43d5-8d5a-b1c61ae0d01a', 'hero_image', 'e9ff1023-bc65-418e-8869-3d0964f3f8a1', 'e9ff1023-bc65-418e-8869-3d0964f3f8a1.webp', 'image/webp', 'media', 'media', 73870, '[]', '[]', '[]', '[]', 1, '2025-12-17 22:40:51', '2025-12-17 22:40:51'),
(70, 'App\\Models\\Product', 16, 'ee3c6ea5-9e5e-4e17-bac5-d173d635a33a', 'gallery_images', 'dd43a71f-ae9a-4d4e-9aed-afd49b7d59d0', 'dd43a71f-ae9a-4d4e-9aed-afd49b7d59d0.jpg', 'image/jpeg', 'media', 'media', 246538, '[]', '[]', '[]', '[]', 2, '2025-12-17 22:40:51', '2025-12-17 22:40:51'),
(71, 'App\\Models\\Product', 16, 'a5641ade-3847-41ad-a28d-9b45286cdf31', 'gallery_images', '778f918b-36c1-4300-87c9-6c065bf6f885', '778f918b-36c1-4300-87c9-6c065bf6f885.jpg', 'image/jpeg', 'media', 'media', 203065, '[]', '[]', '[]', '[]', 3, '2025-12-17 22:40:52', '2025-12-17 22:40:52'),
(72, 'App\\Models\\Product', 17, 'a7b9adf0-f440-41f8-9a1d-a39e962700fe', 'hero_image', '8d115a7e-4adb-406a-a0ba-710a4913bece', '8d115a7e-4adb-406a-a0ba-710a4913bece.jpg', 'image/jpeg', 'media', 'media', 214291, '[]', '[]', '[]', '[]', 1, '2025-12-17 22:42:00', '2025-12-17 22:42:00'),
(73, 'App\\Models\\Product', 17, 'eea5a4e2-b2ea-4ba7-8482-2432c1e3ea95', 'gallery_images', '3679a12e-ecb3-43e8-8647-4a2d70df6a2b', '3679a12e-ecb3-43e8-8647-4a2d70df6a2b.jpg', 'image/jpeg', 'media', 'media', 227007, '[]', '[]', '[]', '[]', 2, '2025-12-17 22:42:00', '2025-12-17 22:42:00'),
(74, 'App\\Models\\Product', 17, '52803595-1540-4b8f-a3af-bd99615b2f7c', 'gallery_images', '6b60bfd3-a9e9-41c4-8827-1e4a06c986fd', '6b60bfd3-a9e9-41c4-8827-1e4a06c986fd.jpg', 'image/jpeg', 'media', 'media', 267123, '[]', '[]', '[]', '[]', 3, '2025-12-17 22:42:00', '2025-12-17 22:42:00'),
(75, 'App\\Models\\Product', 18, '37db45c8-f56f-4075-a5b7-e540b8e9fa43', 'hero_image', 'd26c4ea3-53b4-43cf-b1d4-84a7db18494a-600x722', 'd26c4ea3-53b4-43cf-b1d4-84a7db18494a-600x722.jpg', 'image/jpeg', 'media', 'media', 49773, '[]', '[]', '[]', '[]', 1, '2025-12-17 22:42:58', '2025-12-17 22:42:58'),
(76, 'App\\Models\\Product', 18, '51fceeb4-bdce-4571-9026-5b0302f69293', 'gallery_images', '6ccef772-524f-4575-88bc-e88e440305ad', '6ccef772-524f-4575-88bc-e88e440305ad.jpg', 'image/jpeg', 'media', 'media', 275718, '[]', '[]', '[]', '[]', 2, '2025-12-17 22:42:58', '2025-12-17 22:42:58'),
(77, 'App\\Models\\Product', 18, 'c4c7035d-2a40-43ee-af06-13a287ee4b8f', 'gallery_images', '5bc1e600-9a48-4b43-9878-101662168103', '5bc1e600-9a48-4b43-9878-101662168103.jpg', 'image/jpeg', 'media', 'media', 118521, '[]', '[]', '[]', '[]', 3, '2025-12-17 22:42:58', '2025-12-17 22:42:58'),
(78, 'App\\Models\\Product', 19, '3896ff5f-b8bb-47c0-aac3-d17026b2aab8', 'hero_image', '28d849ba-8103-4e7b-abfb-4c1ae177e8d0', '28d849ba-8103-4e7b-abfb-4c1ae177e8d0.jpg', 'image/jpeg', 'media', 'media', 134541, '[]', '[]', '[]', '[]', 1, '2025-12-17 22:43:54', '2025-12-17 22:43:54'),
(79, 'App\\Models\\Product', 19, 'e0cad7ed-5afa-4088-9c2a-5adc2e7716e5', 'gallery_images', '3e9a75f1-1e86-4fb8-8f24-4d9b09faef6d-600x722', '3e9a75f1-1e86-4fb8-8f24-4d9b09faef6d-600x722.jpg', 'image/jpeg', 'media', 'media', 50265, '[]', '[]', '[]', '[]', 2, '2025-12-17 22:43:54', '2025-12-17 22:43:54'),
(80, 'App\\Models\\Product', 19, '526a3d5d-faf4-4be6-9b8c-2e207120af93', 'gallery_images', 'adaddd9b-85b4-4b97-9231-c21ced61d853', 'adaddd9b-85b4-4b97-9231-c21ced61d853.jpg', 'image/jpeg', 'media', 'media', 158369, '[]', '[]', '[]', '[]', 3, '2025-12-17 22:43:54', '2025-12-17 22:43:54'),
(81, 'App\\Models\\Product', 20, '053c18ce-3dce-421b-9486-b33b6754bcba', 'hero_image', '6f5f32d9-79b5-4f79-a806-4db154450e69', '6f5f32d9-79b5-4f79-a806-4db154450e69.jpg', 'image/jpeg', 'media', 'media', 116147, '[]', '[]', '[]', '[]', 1, '2025-12-17 22:44:54', '2025-12-17 22:44:54'),
(82, 'App\\Models\\Product', 20, '5b77ab76-012c-4965-9c30-ea949656318c', 'gallery_images', '33a073b2-b03d-49bd-9cce-5f075672c2ba', '33a073b2-b03d-49bd-9cce-5f075672c2ba.jpg', 'image/jpeg', 'media', 'media', 133670, '[]', '[]', '[]', '[]', 2, '2025-12-17 22:44:54', '2025-12-17 22:44:54'),
(83, 'App\\Models\\Product', 20, 'b012c047-bd83-4789-9607-a8b3846904d4', 'gallery_images', 'dcf5681d-c9e5-450e-a643-0ef75571cc55', 'dcf5681d-c9e5-450e-a643-0ef75571cc55.jpg', 'image/jpeg', 'media', 'media', 277527, '[]', '[]', '[]', '[]', 3, '2025-12-17 22:44:54', '2025-12-17 22:44:54'),
(84, 'App\\Models\\Product', 21, '0054d1ac-2600-4b1f-bcc4-8fad82c256a6', 'hero_image', '055b6d5a-5632-40c7-9675-e12a640dd17a', '055b6d5a-5632-40c7-9675-e12a640dd17a.jpg', 'image/jpeg', 'media', 'media', 143063, '[]', '[]', '[]', '[]', 1, '2025-12-17 22:46:13', '2025-12-17 22:46:13'),
(85, 'App\\Models\\Product', 21, '117f017f-d796-4dc4-81f8-7344994ec72b', 'gallery_images', '248cec10-cdf2-44e6-9e1b-c91b58ae8679-600x722', '248cec10-cdf2-44e6-9e1b-c91b58ae8679-600x722.jpg', 'image/jpeg', 'media', 'media', 51891, '[]', '[]', '[]', '[]', 2, '2025-12-17 22:46:13', '2025-12-17 22:46:13'),
(86, 'App\\Models\\Product', 21, 'a74de773-e626-4cff-9c3c-6c716c1328a9', 'gallery_images', '2cb983c3-7cb6-4f00-a512-894c38079a3e', '2cb983c3-7cb6-4f00-a512-894c38079a3e.jpg', 'image/jpeg', 'media', 'media', 259429, '[]', '[]', '[]', '[]', 3, '2025-12-17 22:46:13', '2025-12-17 22:46:13'),
(87, 'App\\Models\\Product', 22, 'bfe74d5b-506b-4c41-b19d-4dcec6df9d03', 'hero_image', 'apple-watch-se-3-starlight51', 'apple-watch-se-3-starlight51.jpeg', 'image/jpeg', 'media', 'media', 34199, '[]', '[]', '[]', '[]', 1, '2025-12-18 01:52:12', '2025-12-18 01:52:12'),
(88, 'App\\Models\\Product', 22, '0fac4e41-d64a-4e62-b8a6-6f55b7448ef5', 'gallery_images', 'apple-watch-se-3-midnight-1873', 'apple-watch-se-3-midnight-1873.jpeg', 'image/jpeg', 'media', 'media', 34722, '[]', '[]', '[]', '[]', 2, '2025-12-18 01:52:12', '2025-12-18 01:52:12'),
(89, 'App\\Models\\Product', 22, '63622b53-9a21-4c40-95cc-ce7a7b8057b9', 'gallery_images', 'apple-watch-se-3-starlight-1772', 'apple-watch-se-3-starlight-1772.jpeg', 'image/jpeg', 'media', 'media', 37957, '[]', '[]', '[]', '[]', 3, '2025-12-18 01:52:12', '2025-12-18 01:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(6, '2025_12_16_141602_create_products_table', 2),
(7, '2025_12_16_141613_create_categories_table', 2),
(8, '2025_12_17_061939_create_media_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `quantity` int NOT NULL,
  `alert_quantity` int NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('published','pending','out_of_stock') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `category_id`, `tags`, `sku`, `regular_price`, `price`, `quantity`, `alert_quantity`, `short_description`, `description`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Men’s Formal Blazer Color: BLACK BLUE DG(152)', 'mens-formal-blazer-color-black-blue-dg152', 4, NULL, 'PRD-003F6B', 4495.00, 3595.00, 300, 20, 'Men’s Formal Blazer Color: (176) ASH CK', '{\"time\":1766025944733,\"blocks\":[{\"id\":\"O3C6ziaWMI\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Product Type: Men’s Blazer\",\"meta\":{},\"items\":[]},{\"content\":\"Color: ASH CK\",\"meta\":{},\"items\":[]},{\"content\":\"Material: Poly viscose fabric\",\"meta\":{},\"items\":[]},{\"content\":\"Pattern: Slim Fit\",\"meta\":{},\"items\":[]},{\"content\":\"Style:– Single Breasted– Two Button– Side Vent– Notch Lapel\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instruction: Dry Clean Recommended.\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 20:45:44', '2025-12-18 00:04:30'),
(6, 'Men’s Formal Blazer Color: (176) ASH CK', 'mens-formal-blazer-color-176-ash-ck', 4, NULL, 'PRD-E7B55F', 4495.00, 3895.00, 200, 20, 'Men’s Formal Blazer Color: (176) ASH CK', '{\"time\":1766026163550,\"blocks\":[{\"id\":\"30NMlvq26a\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Product Type: Men’s Blazer\",\"meta\":{},\"items\":[]},{\"content\":\"Color: ASH CK\",\"meta\":{},\"items\":[]},{\"content\":\"Material: Poly viscose fabric\",\"meta\":{},\"items\":[]},{\"content\":\"Pattern: Slim Fit\",\"meta\":{},\"items\":[]},{\"content\":\"Style:– Single Breasted– Two Button– Side Vent– Notch Lapel\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instruction: Dry Clean Recommended.\",\"meta\":{},\"items\":[]},{\"content\":\"Available: At Online Store\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 20:49:23', '2025-12-18 00:04:30'),
(7, 'Men’s Panjabi : 23. Leaf Print', 'mens-panjabi-23-leaf-print', 4, NULL, 'PRD-1E0357', 3095.00, 2799.00, 135, 12, 'Men’s Panjabi : 23. Leaf Print', '{\"time\":1766027014189,\"blocks\":[{\"id\":\"7WQ5r89yDs\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Product Type: Men’s Panjabi\",\"meta\":{},\"items\":[]},{\"content\":\"Color: Leaf Print\",\"meta\":{},\"items\":[]},{\"content\":\"Material: Cotton Mix\",\"meta\":{},\"items\":[]},{\"content\":\"Pattern: Regular Fit\",\"meta\":{},\"items\":[]},{\"content\":\"Style:– Band Collar– Two Side Pocket– Matching Button– Lightweight\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instruction: Dry Clean Recommended.\",\"meta\":{},\"items\":[]},{\"content\":\"Available: At Outlets\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 21:03:34', '2025-12-18 00:04:30'),
(8, 'Men’s Polo Half Sleeve Off White T-Shirt', 'mens-polo-half-sleeve-off-white-t-shirt', 4, NULL, 'PRD-48E4D0', 2800.00, 2000.00, 235, 24, 'Men’s Polo Half Sleeve Off White T-Shirt', '{\"time\":1766027194498,\"blocks\":[{\"id\":\"Ph6RVIBmaC\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Product Type: Men’s Polo T-Shirt (Limited Edition)\",\"meta\":{},\"items\":[]},{\"content\":\"Sizes: M- 38, L- 40, XL- 42, XXL- 44 (Chest Size)\",\"meta\":{},\"items\":[]},{\"content\":\"Color: Off White\",\"meta\":{},\"items\":[]},{\"content\":\"Material: 80% cotton, 20% nylon\",\"meta\":{},\"items\":[]},{\"content\":\"Pattern: Regular Fit\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instruction: Dry Clean (Only)\",\"meta\":{},\"items\":[]},{\"content\":\"Available: Both in Online &amp; Stores\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 21:06:34', '2025-12-18 00:04:30'),
(9, 'Feme Kurti: Black Floral Design', 'feme-kurti-black-floral-design', 5, NULL, 'PRD-884227', 3000.00, 3000.00, 115, 15, 'Feme Kurti: Black Floral Design', '{\"time\":1766027372609,\"blocks\":[{\"id\":\"jiTm2-Bw3O\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Product Type: Kurti\",\"meta\":{},\"items\":[]},{\"content\":\"Color: Black Floral Design\",\"meta\":{},\"items\":[]},{\"content\":\"Material: Georgette\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instruction: Dry Clean Recommended.\",\"meta\":{},\"items\":[]},{\"content\":\"Available: At Outlets\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 21:09:32', '2025-12-18 00:04:30'),
(10, 'Feme Kurti: Silver Floral Design', 'feme-kurti-silver-floral-design', 5, NULL, 'PRD-16517B', 3199.00, 3099.00, 243, 12, 'Feme Kurti: Silver Floral Design', '{\"time\":1766027908108,\"blocks\":[{\"id\":\"klXSouYq0-\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Product Type: Kurti\",\"meta\":{},\"items\":[]},{\"content\":\"Color: Maroon Floral Design\",\"meta\":{},\"items\":[]},{\"content\":\"Material: Georgette\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instruction: Dry Clean Recommended.\",\"meta\":{},\"items\":[]},{\"content\":\"Available: At Outlets\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 21:18:28', '2025-12-18 00:04:30'),
(11, 'Readymade Georgette Party Dress', 'readymade-georgette-party-dress', 5, NULL, 'PRD-931260', 2850.00, 2190.00, 235, 12, 'Condition: Readymade, New\r\nSize: Free Size (Fits up to 50 inches)\r\nMaterial: Premium Indian Weightless Georgette\r\nDress Length: 38 inches', '{\"time\":1766028130457,\"blocks\":[{\"id\":\"ILfzrrLY6U\",\"type\":\"header\",\"data\":{\"text\":\"Readymade Georgette Embroidered Party Dress\",\"level\":2}},{\"id\":\"nRAIArHj8P\",\"type\":\"paragraph\",\"data\":{\"text\":\"Step into the spotlight and make every moment special. This stunning readymade party dress is designed for those who want to blend timeless elegance with modern comfort, ensuring you look and feel your absolute best at any celebration.\"}},{\"id\":\"_ZEBpz1aia\",\"type\":\"header\",\"data\":{\"text\":\"Features and Benefits\",\"level\":3}},{\"id\":\"mMWPFTQkI0\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"<b>Intricate Embroidery:</b><span>&nbsp;</span>Beautiful embroidery on the front and back adds a touch of sophistication and artistry, guaranteeing you’ll stand out.\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Premium Georgette Fabric:</b><span>&nbsp;</span>Crafted from Indian Weightless Georgette, the dress drapes beautifully, offering a graceful silhouette that moves with you.\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Readymade Convenience:</b><span>&nbsp;</span>Arrives ready to wear, so you can skip the hassle of tailoring and be party-ready in an instant.\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Inclusive Free Size:</b><span>&nbsp;</span>Thoughtfully designed to fit up to a 50-inch bust, providing a comfortable and flattering look for a wide range of body types.\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Complete Outfit:</b><span>&nbsp;</span>Comes with a matching inner lining and an embroidered Georgette veil, giving you a perfectly coordinated ensemble right out of the package.\",\"meta\":{},\"items\":[]}]}},{\"id\":\"qcdzGqmn1B\",\"type\":\"header\",\"data\":{\"text\":\"Detailed Description\",\"level\":3}},{\"id\":\"TZf1i_uGdQ\",\"type\":\"paragraph\",\"data\":{\"text\":\"Turn heads at your next event with our exquisitely designed Georgette Embroidered Party Dress. Crafted from premium Indian Weightless Georgette, this dress feels as light as air while offering a luxurious, flowing drape. The intricate embroidery work on both the front and back showcases exceptional craftsmanship, adding a layer of opulence to your look. Designed for both style and comfort, this readymade outfit is the perfect choice for festivals, parties, and special gatherings where you want to shine.\"}},{\"id\":\"bxmxX-fxBk\",\"type\":\"header\",\"data\":{\"text\":\"Specifications\",\"level\":3}},{\"id\":\"UPMF9ArhEF\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"<b>Condition:</b><span>&nbsp;</span>Readymade, New\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Size:</b><span>&nbsp;</span>Free Size (Fits up to 50 inches)\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Material:</b><span>&nbsp;</span>Premium Indian Weightless Georgette\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Dress Length:</b><span>&nbsp;</span>38 inches\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Inner:</b><span>&nbsp;</span>Included\",\"meta\":{},\"items\":[]},{\"content\":\"<b>Veil:</b><span>&nbsp;</span>Matching Georgette with embroidery work\",\"meta\":{},\"items\":[]}]}},{\"id\":\"Pwm2vUbnG2\",\"type\":\"header\",\"data\":{\"text\":\"Usage/Application\",\"level\":3}},{\"id\":\"-8ZaF9VoNX\",\"type\":\"paragraph\",\"data\":{\"text\":\"This versatile dress is perfect for a variety of occasions, including parties, festivals, weddings, and other celebrations. To maintain its beauty, we recommend gentle hand washing or dry cleaning. Store it in a cool, dry place away from direct sunlight.\"}},{\"id\":\"wPtFD2GiWr\",\"type\":\"header\",\"data\":{\"text\":\"Package Content\",\"level\":3}},{\"id\":\"SU9kRlmUtx\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"1 x Readymade Georgette Embroidered Dress\",\"meta\":{},\"items\":[]},{\"content\":\"1 x Matching Inner\",\"meta\":{},\"items\":[]},{\"content\":\"1 x Embroidered Georgette Veil\",\"meta\":{},\"items\":[]}]}},{\"id\":\"a6lvQO0kLU\",\"type\":\"header\",\"data\":{\"text\":\"Call-to-Action\",\"level\":3}},{\"id\":\"3-6tNH-Xpm\",\"type\":\"paragraph\",\"data\":{\"text\":\"Don’t wait to make a statement. Add this beautiful dress to your collection today and be ready to brighten up your next special moment!\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 21:22:10', '2025-12-18 00:04:30'),
(12, 'Long Lehenga choli', 'long-lehenga-choli', NULL, NULL, 'PRD-E51407', 1990.00, 1990.00, 124, 10, 'Body: Soft Georgette\r\nDesign Work: Heavy Embroidery\r\nSleeve: Georgette', '{\"time\":1766033221095,\"blocks\":[{\"id\":\"KmNNoTfj-u\",\"type\":\"header\",\"data\":{\"text\":\"Long Lehenga choli\",\"level\":2}},{\"id\":\"BYr9QQtbf9\",\"type\":\"paragraph\",\"data\":{\"text\":\"&nbsp;\"}},{\"id\":\"4sozJc1Zrk\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Body: Soft&nbsp;<a href=\\\"https://www.smarteshopbd.com/what-is-georgette/\\\">Georgette</a>\",\"meta\":{},\"items\":[]},{\"content\":\"Design Work: Heavy&nbsp;<a href=\\\"https://www.smarteshopbd.com/what-is-embroidery/\\\">Embroidery</a>\",\"meta\":{},\"items\":[]},{\"content\":\"Sleeve:&nbsp;<a href=\\\"https://www.smarteshopbd.com/what-is-georgette/\\\">Georgette</a>\",\"meta\":{},\"items\":[]},{\"content\":\"Dupatta:&nbsp;<a href=\\\"https://www.smarteshopbd.com/?page_id=3600&amp;preview=true\\\">Chiffon</a>\",\"meta\":{},\"items\":[]},{\"content\":\"Salwar &amp; Inner:&nbsp;<a href=\\\"https://www.smarteshopbd.com/what-is-santoon/\\\">Santoon</a>\",\"meta\":{},\"items\":[]},{\"content\":\"<a href=\\\"https://www.smarteshopbd.com/what-is-semi-stitched/\\\">Semi</a>&nbsp;–<a href=\\\"https://www.smarteshopbd.com/what-is-semi-stitched/\\\">Stitched</a>\",\"meta\":{},\"items\":[]},{\"content\":\"Type:&nbsp;<a href=\\\"https://www.smarteshopbd.com/what-is-replica/\\\">Replica</a>\",\"meta\":{},\"items\":[]},{\"content\":\"Color: As same as picture\",\"meta\":{},\"items\":[]}]}}],\"version\":\"2.31.0\"}', 0, 'published', '2025-12-17 21:24:13', '2025-12-18 00:04:30'),
(13, 'Readymade Georgette Embroidered Party Dress', 'readymade-georgette-embroidered-party-dress', 5, NULL, 'PRD-1405A7', 2555.00, 2000.00, 120, 10, 'Readymade Georgette Embroidered Party Dress', '{\"time\":1766033230108,\"blocks\":[{\"id\":\"y_iLT7MRDI\",\"type\":\"header\",\"data\":{\"text\":\"Readymade Georgette Embroidered Party Dress—Perfect Fit, Elegant Style\",\"level\":2}},{\"id\":\"L-DffkpEa5\",\"type\":\"header\",\"data\":{\"text\":\"Product Overview\",\"level\":4}},{\"id\":\"fiJC2AQrVy\",\"type\":\"paragraph\",\"data\":{\"text\":\"Turn heads at your next event with this stunning readymade georgette embroidered<span>&nbsp;</span><a href=\\\"https://www.smarteshopbd.com/product-category/womens-clothing/round-dress/\\\">party dress</a>. Designed for style and comfort, its free-size fit (up to 47 inches) ensures every woman feels confident and fabulous. With embroidered detailing covering both the front and back, paired with premium fabrics, this dress offers an unmatched blend of charm and sophistication.\"}},{\"id\":\"M5qBsSsCb6\",\"type\":\"header\",\"data\":{\"text\":\"Features and Benefits\",\"level\":3}},{\"id\":\"0UnFNQ6OWH\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Readymade Free-Size Fit—Effortlessly fits body sizes up to 47 inches, ensuring all-day comfort with no alterations needed.\",\"meta\":{},\"items\":[]},{\"content\":\"Indian Weightless Georgette Fabric—Delicate, breathable material for a graceful, airy silhouette perfect for any occasion.\",\"meta\":{},\"items\":[]},{\"content\":\"54-Inch-Length Elegance—Flattering design that creates an elongating, elegant look.\",\"meta\":{},\"items\":[]},{\"content\":\"Exquisite Embroidery—Stunning, hand-finished embroidery on both the front and back adds timeless sophistication.\",\"meta\":{},\"items\":[]},{\"content\":\"Paired with Luxury Pieces—Comes with a matching georgette embroidered veil and butterfly silk pajamas for a seamless, polished look.\",\"meta\":{},\"items\":[]},{\"content\":\"Inner Layer Included—Ensures comfort and coverage without the need for additional underclothing.\",\"meta\":{},\"items\":[]}]}},{\"id\":\"pcbileJUCn\",\"type\":\"header\",\"data\":{\"text\":\"Detailed Description\",\"level\":4}},{\"id\":\"CSxeHLZ9wT\",\"type\":\"paragraph\",\"data\":{\"text\":\"Step out in style with this Readymade Georgette Embroidered Party Dress, crafted to combine traditional craftsmanship with modern-day convenience. Its Indian Weightless Georgette material creates a flowing silhouette while remaining lightweight and breathable—ideal for dancing the night away! The two-piece set also includes an intricate embroidered veil and sumptuous Butterfly Silk pajamas, offering a polished ensemble ready for elegant soirées or grand celebrations. The detailed embroidery ensures you shine from every angle, while the inner layer keeps you feeling comfortable and confident all evening long.\"}},{\"id\":\"Q52uFnliDK\",\"type\":\"header\",\"data\":{\"text\":\"Specifications\",\"level\":3}},{\"id\":\"6OZnSjrXl0\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Condition: Readymade\",\"meta\":{},\"items\":[]},{\"content\":\"Body Fit: Free size (up to 47 inches)\",\"meta\":{},\"items\":[]},{\"content\":\"Length: 54 inches\",\"meta\":{},\"items\":[]},{\"content\":\"Material: Indian Weightless Georgette\",\"meta\":{},\"items\":[]},{\"content\":\"Work: Intricate front and back embroidery\",\"meta\":{},\"items\":[]},{\"content\":\"Other Details:\",\"meta\":{},\"items\":[]},{\"content\":\"Inner included\",\"meta\":{},\"items\":[]},{\"content\":\"Georgette embroidered veil\",\"meta\":{},\"items\":[]},{\"content\":\"Butterfly silk pajama\",\"meta\":{},\"items\":[]}]}},{\"id\":\"3j_d4KZJr0\",\"type\":\"header\",\"data\":{\"text\":\"Usage/Application\",\"level\":4}},{\"id\":\"XxoLqHuP0w\",\"type\":\"paragraph\",\"data\":{\"text\":\"Perfect for weddings, cocktail parties, galas, or celebratory dinners. Pair with sparkling earrings or a metallic clutch to complete the look. To keep it in pristine condition, we recommend dry cleaning only. Store in a cool, dry place, away from direct sunlight, to maintain the quality of the embroidery.\"}},{\"id\":\"XwkujNkQPe\",\"type\":\"header\",\"data\":{\"text\":\"Package Content\",\"level\":4}},{\"id\":\"eLgHWBPz-Y\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"1x Embroidered Georgette Party Dress\",\"meta\":{},\"items\":[]},{\"content\":\"1x Matching Veil with Georgette Embroidered Work\",\"meta\":{},\"items\":[]},{\"content\":\"1x Butterfly Silk Pajama\",\"meta\":{},\"items\":[]}]}},{\"id\":\"d0VfE-19DI\",\"type\":\"header\",\"data\":{\"text\":\"Call-to-Action\",\"level\":5}},{\"id\":\"Djxis9qCeR\",\"type\":\"paragraph\",\"data\":{\"text\":\"Don’t wait to dazzle! Elevate your wardrobe with this ready-to-wear masterpiece. Grab yours now to make your next party unforgettable!\"}}],\"version\":\"2.31.0\"}', 0, 'published', '2025-12-17 21:26:47', '2025-12-18 00:04:30'),
(14, 'Black Color Abaya with Embroidery & Stone Work', 'black-color-abaya-with-embroidery-stone-work', NULL, NULL, 'PRD-193DAB', 12592.00, 1199.00, 120, 10, 'Black Color Abaya with Embroidery & Stone Work', '{\"time\":1766029254605,\"blocks\":[{\"id\":\"OHQFIafF0n\",\"type\":\"paragraph\",\"data\":{\"text\":\"Black Color Abaya with Embroidery &amp; Stone Work\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 21:40:54', '2025-12-18 00:04:30'),
(15, 'Weightless Georgette Embroidery Saree', 'weightless-georgette-embroidery-saree', 5, NULL, 'PRD-5D0203', 2599.00, 2399.00, 80, 13, 'abric: Very Soft Weightless Georgette\r\nBlouse: Unstitched, included\r\nWork: High-Quality Embroidery', '{\"time\":1766033238567,\"blocks\":[{\"id\":\"SoxwM3lho5\",\"type\":\"header\",\"data\":{\"text\":\"Weightless Georgette Embroidery Saree—Elegant Design, Ultra-soft Feel: Unveiling effortless elegance with every drape.\",\"level\":2}},{\"id\":\"1ohd9-o127\",\"type\":\"header\",\"data\":{\"text\":\"Product Overview\",\"level\":4}},{\"id\":\"uQ6_J5dQFq\",\"type\":\"paragraph\",\"data\":{\"text\":\"Wrap yourself in timeless grace with the Weightless Georgette Embroidery<span>&nbsp;</span><a href=\\\"https://www.smarteshopbd.com/product-category/saree/\\\">Saree</a>. Designed for women who appreciate the mix of modern comfort and traditional craftsmanship, this saree is perfect for making an impression at weddings, festive occasions, and celebrations. Its weightless georgette fabric offers unmatched softness and flow, ensuring you stay both stylish and comfortable all day long.\"}},{\"id\":\"uTv4kPAYG3\",\"type\":\"header\",\"data\":{\"text\":\"Features and Benefits\",\"level\":3}},{\"id\":\"PdWLybUEza\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Lightweight Georgette Fabric—Enjoy unmatched comfort with a flowy, weightless feel that’s easy to drape and carry.\",\"meta\":{},\"items\":[]},{\"content\":\"Intricate Embroidery Work—High-quality, exquisite embroidery adds a touch of elegance to enhance your festive and ceremonial look.\",\"meta\":{},\"items\":[]},{\"content\":\"Unstitched Blouse Included—Tailor your blouse to perfection, as per your unique style preferences.\",\"meta\":{},\"items\":[]},{\"content\":\"Versatile for Special Occasions—Ideal for bridal wear, festive events, or making a style statement at celebrations.\",\"meta\":{},\"items\":[]}]}},{\"id\":\"o5c-QZZJeb\",\"type\":\"header\",\"data\":{\"text\":\"Detailed Description\",\"level\":4}},{\"id\":\"9CDCgOYaig\",\"type\":\"paragraph\",\"data\":{\"text\":\"This saree is a fusion of comfort and style, ideal for ethnic wear lovers and fashion enthusiasts. Crafted from premium-grade, weightless georgette, it provides an ultra-soft feel that drapes effortlessly, creating a flattering silhouette. The saree’s intricate embroidery work is carefully designed to make it a head-turner, ensuring you stand out no matter the occasion.\"}},{\"id\":\"TptBiA9P1g\",\"type\":\"paragraph\",\"data\":{\"text\":\"It comes with an unstitched blouse piece, giving you the creative freedom to design it to your personal taste. Whether you’re attending a wedding, celebrating festivals, or adding a luxurious touch to your wardrobe, this saree is your go-to choice for effortless elegance.\"}},{\"id\":\"u4hmKPVxTz\",\"type\":\"header\",\"data\":{\"text\":\"Specifications\",\"level\":3}},{\"id\":\"bD1eFi1uKK\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"Body Material: Soft, weightless georgette\",\"meta\":{},\"items\":[]},{\"content\":\"Blouse: Unstitched blouse included\",\"meta\":{},\"items\":[]},{\"content\":\"Work: High-quality embroidery\",\"meta\":{},\"items\":[]},{\"content\":\"Occasions: Weddings, festivals, special events\",\"meta\":{},\"items\":[]},{\"content\":\"Care Instructions: Dry cleaning is recommended for best maintenance. Store in a cool, dry place to preserve fabric quality and embroidery detailing.\",\"meta\":{},\"items\":[]}]}},{\"id\":\"p5Z0WcoJ2B\",\"type\":\"paragraph\",\"data\":{\"text\":\"This saree is perfect for creating show-stopping looks at weddings, festive celebrations, and special occasions. Pair it with minimal jewelry for an understated elegance or go bold with statement pieces for a regal presence. To maintain its quality, ensure proper care and storage.\"}},{\"id\":\"T6oMm_3y__\",\"type\":\"header\",\"data\":{\"text\":\"Package Content\",\"level\":4}},{\"id\":\"YpFbp38rXv\",\"type\":\"List\",\"data\":{\"style\":\"unordered\",\"meta\":{},\"items\":[{\"content\":\"1x Weightless Georgette Embroidery Saree\",\"meta\":{},\"items\":[]},{\"content\":\"1x Unstitched Blouse Piece\",\"meta\":{},\"items\":[]}]}},{\"id\":\"NRJzqvM_uE\",\"type\":\"header\",\"data\":{\"text\":\"Call to Action (CTA)\",\"level\":5}},{\"id\":\"mxC7ooBN-c\",\"type\":\"paragraph\",\"data\":{\"text\":\"Elevate your ethnic wardrobe with the Weightless Georgette Embroidery Saree. Don’t miss out—order your statement piece today and experience elegance like never before!\"}},{\"id\":\"sdvdZAHfPV\",\"type\":\"header\",\"data\":{\"text\":\"Top 5 SEO Tags\",\"level\":5}}],\"version\":\"2.31.0\"}', 0, 'published', '2025-12-17 21:42:41', '2025-12-18 00:04:30'),
(16, 'Green Cotton A-line Frock', 'green-cotton-a-line-frock', 6, NULL, 'PRD-84167A', 1645.00, 1645.00, 120, 20, 'Green Cotton A-line Frock', '{\"time\":1766032851720,\"blocks\":[{\"id\":\"BrgPBrFUHM\",\"type\":\"paragraph\",\"data\":{\"text\":\"Green Cotton A-line Frock\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 22:40:51', '2025-12-18 00:04:30'),
(17, 'Black & White Viscose Flared Style Frock', 'black-white-viscose-flared-style-frock', 6, NULL, 'PRD-F6338D', 995.00, 995.00, 140, 20, 'Black & White Viscose Flared Style Frock', '{\"time\":1766032920009,\"blocks\":[{\"id\":\"cwKNBNye22\",\"type\":\"paragraph\",\"data\":{\"text\":\"Black &amp; White Viscose Flared Style Frock\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 22:42:00', '2025-12-18 00:04:30'),
(18, 'Orange Cotton Short Sleeve Polo', 'orange-cotton-short-sleeve-polo', NULL, NULL, 'PRD-AD877E', 945.00, 945.00, 220, 10, 'Orange Cotton Short Sleeve Polo', '{\"time\":1766032978712,\"blocks\":[{\"id\":\"EUSsgN3UUB\",\"type\":\"paragraph\",\"data\":{\"text\":\"Orange Cotton Short Sleeve Polo\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 22:42:58', '2025-12-18 00:04:30'),
(19, 'Short Sleeve Polo-Shirt', 'short-sleeve-polo-shirt', NULL, NULL, 'PRD-D60052', 995.00, 995.00, 140, 20, 'Short Sleeve Polo-Shirt', '{\"time\":1766033034551,\"blocks\":[{\"id\":\"kQkvt6UMl3\",\"type\":\"paragraph\",\"data\":{\"text\":\"Short Sleeve Polo-Shirt\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 22:43:54', '2025-12-18 00:04:30'),
(20, 'Sky Blue Cotton Short Sleeve Casual Shirt', 'sky-blue-cotton-short-sleeve-casual-shirt', NULL, NULL, 'PRD-415254', 995.00, 995.00, 136, 3, 'Sky Blue Cotton Short Sleeve Casual Shirt', '{\"time\":1766033094544,\"blocks\":[{\"id\":\"aiLruR-bd5\",\"type\":\"paragraph\",\"data\":{\"text\":\"Sky Blue Cotton Short Sleeve Casual Shirt\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 22:44:54', '2025-12-18 00:04:30'),
(21, 'White Viscose Panjabi', 'white-viscose-panjabi', NULL, NULL, 'PRD-655BF6', 1095.00, 1095.00, 30, 4, 'White Viscose Panjabi', '{\"time\":1766033173436,\"blocks\":[{\"id\":\"JNROErf3aC\",\"type\":\"paragraph\",\"data\":{\"text\":\"White Viscose Panjabi\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-17 22:46:13', '2025-12-18 00:04:30'),
(22, 'Apple Watch SE 3 (GPS) Aluminum Case', 'apple-watch-se-3-gps-aluminum-case', 12, NULL, 'PRD-956F9B', 44999.00, 42999.00, 244, 20, 'S10 chip with 64‑bit dual core processor\r\nAlways-On Retina display with OLED and LTPO\r\nAll‑day battery life, up to 18 hours of normal use\r\nUp to 80% charge in about 45 minutes', '{\"time\":1766044331886,\"blocks\":[{\"id\":\"Lk4e4-B8ZR\",\"type\":\"paragraph\",\"data\":{\"text\":\"S10 chip with 64‑bit dual core processor\"}},{\"id\":\"vF-_AKIgkW\",\"type\":\"paragraph\",\"data\":{\"text\":\"Always-On Retina display with OLED and LTPO\"}},{\"id\":\"n139ppu6Hi\",\"type\":\"paragraph\",\"data\":{\"text\":\"All‑day battery life, up to 18 hours of normal use\"}},{\"id\":\"PVHlbF3x9D\",\"type\":\"paragraph\",\"data\":{\"text\":\"Up to 80% charge in about 45 minutes\"}}],\"version\":\"2.31.0\"}', 1, 'published', '2025-12-18 01:52:11', '2025-12-18 01:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6Dzetehq00aJEKonMtLjlhJpj4v7pITE7ye1xDj9', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS0lMVjVvR0FYRG9RdTJHYWQxVWpScUZsN1FQUVZvVHFGWHBRUjB0ayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo1OiJpbmRleCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJhbGVydCI7YTowOnt9fQ==', 1766044505);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pial Hossen', 'piyal13133@gmail.com', NULL, '$2y$12$QCwidp9VuZm1W1aUlvZvX.H303gdnAurMrib39nqdC6fBpL10YBsO', NULL, '2025-12-15 06:00:34', '2025-12-15 06:00:34');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
