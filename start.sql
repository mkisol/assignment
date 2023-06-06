-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 04, 2023 at 06:41 PM
-- Server version: 8.0.27
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpms`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_01_12_072103_add_avatar_to_users_table', 1),
(7, '2022_01_12_130803_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user view', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(2, 'user create', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(3, 'user edit', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(4, 'user delete', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(5, 'role & permission view', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(6, 'role & permission create', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(7, 'role & permission edit', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(8, 'role & permission delete', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(9, 'test view', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-02-04 13:40:25', '2023-02-04 13:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'BFy73W4K1S', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(2, 'Emilio VonRueden', 'herminia.wiegand@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'sk8EE9WN9A', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(3, 'Darryl Altenwerth', 'rau.malcolm@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'rwlmHL6p44', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(4, 'Elinore Rippin Jr.', 'velda.prosacco@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'p2EWgRfR9g', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(5, 'Thelma Cremin', 'julio.gerlach@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'S79i82TFYS', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(6, 'Herman Gutkowski', 'schneider.gaetano@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'J00nLwX2X2', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(7, 'Helena Heller', 'bryana38@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'gQkHrXowLa', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(8, 'Mariane Bartoletti', 'omorar@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Qcu3rBCnJV', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(9, 'Natalie Lynch', 'jaquan.corkery@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Mdbja7bj92', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(10, 'Hellen Little', 'shea.bernier@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'SxpOEzcUMX', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(11, 'Marilie Torp', 'rmraz@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mGdXaIMobF', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(12, 'Sadye Nader', 'arielle80@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Ymy96AZrTs', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(13, 'Dr. Helga Hane', 'magali97@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'h7NSMXYxZB', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(14, 'Rosanna Mante', 'jamaal.bechtelar@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'twZyIvpZMt', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(15, 'Mrs. Miracle Heathcote', 'camren.swaniawski@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ZXzGJIlfky', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(16, 'Dr. Tianna Hilpert', 'phoebe02@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'gdlK7PUPqA', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(17, 'Nicola Schimmel', 'stoltenberg.gaetano@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Ry6q5YTigl', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(18, 'Ms. Nyah Becker II', 'dedric.hirthe@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ErH7vnwTvf', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(19, 'Candelario Mohr', 'amani.goodwin@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'CfPfCa49Ov', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(20, 'Morgan Considine', 'trystan.sipes@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Pde1c9s85u', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(21, 'Tomasa Kunze', 'hrau@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mA6T1IZBOn', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(22, 'Dr. Quinten Powlowski', 'gorn@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'xBy59Ijj44', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(23, 'Dr. Kaitlin Haley II', 'moen.neal@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Z3wUF1An3d', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(24, 'Korbin Nienow', 'micaela.wiegand@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'C2RyEb1TCq', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(25, 'Elody Emard', 'marjorie09@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '1DijYt0xEh', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(26, 'Antonietta Treutel', 'bridie.kautzer@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'OSUm1WZagn', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(27, 'Susan Franecki', 'federico.mccullough@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'pBZsSrjoQf', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(28, 'Maryse Torphy', 'eveline38@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'YpWBjoNCWY', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(29, 'Aaliyah Schiller', 'eleanore.mitchell@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'dfPVoQdCxo', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(30, 'Lolita Fahey', 'zemlak.jace@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '8Mgnw5CRmC', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(31, 'Prof. Mellie Harber', 'reyna55@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ep1c4wSciC', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(32, 'Ethelyn Roob', 'cronin.kasey@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'PTPmO9f9Sf', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(33, 'Prof. Kennith Bauch', 'lavern.schowalter@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'SPTxaFdvtw', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(34, 'Beulah Bruen', 'cdurgan@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'lBti8UlCss', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(35, 'Megane Pouros', 'cwillms@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'R03qF7JGE0', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(36, 'Daryl Gulgowski', 'whitney17@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '1sJMnVB0jo', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(37, 'Mrs. Kianna Muller', 'rcrist@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'E3fi8EDVkG', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(38, 'Miss Anissa Cole MD', 'ucronin@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'B1dlthNrPL', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(39, 'Arden Robel', 'loren.yundt@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bxN9xnaRDJ', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(40, 'Dr. Zoila Sipes PhD', 'prunte@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'hoAuiEulGW', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(41, 'Dr. Lonnie Tremblay', 'bruen.manuel@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Nu4qx6f9KH', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(42, 'Charley Kulas', 'dorothea99@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'MVqsCr1fM7', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(43, 'Lenny Gaylord II', 'monroe77@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'siSfoM4iQR', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(44, 'Rubye Monahan Sr.', 'beatty.mark@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'xHOWPiok4O', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(45, 'Mr. Chester Jacobi', 'reed44@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'SlQlcQKCpn', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(46, 'Kailee Mann MD', 'keagan38@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'QQhBw72DLS', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(47, 'Bella Goodwin Jr.', 'cathrine81@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'z5UEYXQXzt', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(48, 'Murl Zieme', 'mjenkins@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '8LAqKf3GsN', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(49, 'Prof. Michael Legros', 'schulist.linnea@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ZzbitfYodr', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(50, 'Augustus Larson', 'shayna98@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'B9sLqwhjxx', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(51, 'Mortimer Mitchell', 'patience07@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bm7QzpK49B', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(52, 'Aurelie Hand DVM', 'delores.swift@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'VHRsPazkdC', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(53, 'Green Kutch', 'xturcotte@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'trLNKK6HOA', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(54, 'Lloyd Cruickshank', 'kathlyn.spencer@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '33yuPdEM1n', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(55, 'Katrine Pfeffer', 'keanu78@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Ex4SneJMZG', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(56, 'Michale Cronin', 'minerva48@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'onB2fT3Jyk', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(57, 'Mrs. Salma Keebler', 'gerald19@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'TuZqs0IUzu', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(58, 'Mr. Cristina Trantow I', 'asporer@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'y257JEfi11', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(59, 'Beau Senger', 'wleuschke@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Z7Cj4EZrvi', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(60, 'Craig Bergstrom', 'graham.remington@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2c4RlVxhb2', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(61, 'Floy Johns', 'rory.hamill@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'LKG5wC3Jb2', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(62, 'Rosamond Huel V', 'terrance.pacocha@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ottTcBFcRg', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(63, 'Therese Gleason', 'wyman.cecilia@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'B1SrnVbTWy', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(64, 'Carroll Kerluke I', 'kristoffer84@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ewH51GgYgR', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(65, 'Makenna Gutmann', 'boyd76@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'zrVrSDfVro', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(66, 'Dr. Nels Schimmel Jr.', 'dach.will@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '7LIBklZF4R', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(67, 'Raheem Considine PhD', 'velda29@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Yu5n8baJzf', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(68, 'Sofia Leannon', 'joan80@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'mqEfTpmyvy', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(69, 'Ahmed Green', 'morar.makenna@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'YCbZcIJnta', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(70, 'Elenor Shields', 'jkautzer@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '1LR2bBm88I', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(71, 'Derrick Collins', 'delia66@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'OkKKOfJzJW', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(72, 'Pearlie Schneider', 'lilliana27@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NYRHMbyh3q', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(73, 'Prof. Mathias Hermiston V', 'beahan.madelynn@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'tuVN5F0KVE', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(74, 'Eriberto Halvorson DDS', 'kris.elaina@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'GxvVnl8WJs', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(75, 'Prof. Genevieve Metz', 'douglas.nicholaus@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'aa8I0HMSHS', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(76, 'Haylie Schmitt', 'muriel.kautzer@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NdicGKWZci', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(77, 'Eli Weimann', 'nettie.blanda@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'gaLwohiHNQ', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(78, 'Zola O\'Conner', 'gconnelly@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Fj1hU34NlC', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(79, 'Aliya Jast Sr.', 'rusty.lakin@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ZTeIMDQIA6', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(80, 'Harold Kautzer', 'hoppe.claudine@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'bOSFfqQgYt', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(81, 'Reymundo Maggio', 'katrina92@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'J3jN8tguVr', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(82, 'Estella Turner', 'zechariah90@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'IkfIiunXvO', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(83, 'Mrs. Felicia Jacobs PhD', 'mose06@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NOBFw7FTl0', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(84, 'Prof. Elisha Heathcote DDS', 'larson.tia@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '3NUd9TrqLW', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(85, 'Meta Crist DDS', 'alvera.ryan@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'q23GlQ7k8o', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(86, 'Prof. Albert Becker Sr.', 'schultz.mia@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'be4qCWfB3C', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(87, 'Kyra Fritsch', 'tremaine28@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '5JICD6nb8k', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(88, 'Prof. Lola Block DVM', 'bonita18@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'u41lMxZeUV', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(89, 'Dagmar Feeney', 'delaney63@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '4LdJljrtWh', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(90, 'Prof. Ricardo Daniel PhD', 'wehner.tre@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2JAVwmPUVh', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(91, 'Dr. Jaren Torp Jr.', 'tmarquardt@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Naozpk1SDN', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(92, 'Clark Dooley', 'zulauf.paolo@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'qmXPjqv3G4', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(93, 'Kirsten Tillman', 'pmann@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '2pNoDaobwN', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(94, 'Alene Wisozk', 'verna.lubowitz@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'jnRl5hdVs5', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(95, 'Prof. Sibyl Price V', 'rodrigo36@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '58umpFkZVy', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(96, 'Mara Bartoletti DVM', 'holson@example.com', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'iwtsKWNhS6', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(97, 'Elvie Hilpert', 'imogene.jerde@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '4P2tgce7Tt', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(98, 'Josefa Morar', 'ktremblay@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'rbiwhcsytO', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(99, 'Rubye Ferry', 'karl.mueller@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'rZxQynKufI', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(100, 'Prof. Laurel Kunze II', 'bode.emmy@example.org', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'kS8M3vXJPo', '2023-02-04 13:40:25', '2023-02-04 13:40:25'),
(101, 'Dr. Gustave Swaniawski II', 'zwelch@example.net', '2023-02-04 13:40:25', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'sSITTWiMtW', '2023-02-04 13:40:25', '2023-02-04 13:40:25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
