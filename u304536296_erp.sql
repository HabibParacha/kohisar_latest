-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 17, 2025 at 12:36 PM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u304536296_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Brand One', NULL, 1, '2024-10-04 06:41:36', '2024-10-04 06:41:36'),
(2, 'Brand Two', NULL, 1, '2024-10-04 06:41:36', '2024-10-04 06:41:36'),
(3, 'Brand Three', NULL, 1, '2024-10-04 06:41:36', '2024-10-04 06:41:36'),
(4, 'Brand Four', NULL, 0, '2024-10-04 06:41:36', '2024-10-04 06:41:36'),
(5, 'test', NULL, 1, '2024-10-04 06:51:32', '2024-10-04 06:51:32'),
(6, 'tes3', NULL, 1, '2024-10-04 06:52:59', '2024-10-04 06:53:54'),
(7, 'as', '1728028454.jpg', 1, '2024-10-04 06:54:03', '2024-10-04 06:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Breeder Feed', NULL, 1, '2024-10-04 06:41:37', '2024-10-04 06:41:37'),
(2, 'Broiler Feed', NULL, 1, '2024-10-04 06:41:37', '2024-10-04 06:41:37'),
(3, 'Dairy Feed', NULL, 1, '2024-10-04 06:41:37', '2024-10-04 06:41:37'),
(4, 'Layer Feed', NULL, 1, '2024-10-04 06:41:37', '2024-10-28 06:24:29'),
(7, 'Others', NULL, 1, '2024-12-30 11:51:47', '2024-12-30 11:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('asset','liability','equity','revenue','expense') NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `is_lock` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `name`, `description`, `level`, `parent_id`, `type`, `category`, `is_lock`, `is_active`, `created_at`, `updated_at`) VALUES
(100000, 'Assets', NULL, 1, NULL, 'asset', NULL, 1, 1, NULL, NULL),
(110000, 'Current Assets', NULL, 2, 100000, 'asset', NULL, 1, 1, NULL, NULL),
(111000, 'Cash', NULL, 3, 110000, 'asset', NULL, 1, 1, NULL, NULL),
(111100, 'Cash in Hand', NULL, 4, 111000, 'asset', 'cash', 1, 1, NULL, NULL),
(111200, 'Petty Cash (Adeel Ahmad)', NULL, 4, 111000, 'asset', 'cash', 1, 1, NULL, '2024-12-03 12:12:06'),
(112000, 'Accounts Receivable', NULL, 3, 110000, 'asset', NULL, 1, 1, NULL, NULL),
(112100, 'A/R - Customers', NULL, 4, 112000, 'asset', NULL, 1, 1, NULL, '2024-11-20 06:37:26'),
(113000, 'Inventory', NULL, 3, 110000, 'asset', NULL, 1, 1, NULL, NULL),
(113001, 'Raw Material', NULL, 4, 113000, 'asset', NULL, 1, 1, '2024-11-20 06:44:53', '2024-11-20 06:44:53'),
(113002, 'Finished Goods', NULL, 4, 113000, 'asset', NULL, 1, 1, '2024-11-20 06:45:16', '2024-11-20 06:45:16'),
(114000, 'Bank', NULL, 3, 110000, 'asset', NULL, 1, 1, NULL, NULL),
(114001, 'Meezan N', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-11-15 06:42:20', '2024-12-03 12:10:04'),
(114002, 'Allied', NULL, 4, 114000, 'asset', 'card', 1, 1, '2024-11-15 06:42:26', '2024-11-15 06:42:26'),
(114003, 'FBP (Abd)', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:06:13', '2024-12-03 12:06:13'),
(114004, 'BOP (0704)', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:06:42', '2024-12-03 12:06:42'),
(114005, 'UBL (0990)', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:07:03', '2024-12-03 12:07:03'),
(114006, 'JS Bank', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:07:22', '2024-12-03 12:07:22'),
(114007, 'BAL 661', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:07:39', '2024-12-03 12:07:39'),
(114008, 'ABL 1222', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:07:55', '2024-12-03 12:07:55'),
(114009, 'FBP 824', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:08:24', '2024-12-03 12:08:24'),
(114010, 'Askari Bank', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:08:38', '2024-12-03 12:08:38'),
(114011, 'MCB', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:08:49', '2024-12-03 12:08:49'),
(114012, 'Bank Al Habib', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:09:05', '2024-12-03 12:09:05'),
(114013, 'Bank Al Habib New', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:09:21', '2024-12-03 12:09:21'),
(114014, 'Al Barka Bank', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:09:39', '2024-12-03 12:09:39'),
(114015, 'HBL', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:09:49', '2024-12-03 12:09:49'),
(114016, 'Meezan ( P )', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:10:30', '2024-12-03 12:10:30'),
(114017, 'FBP (Minhas Chicks)', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2024-12-03 12:11:23', '2024-12-03 12:11:23'),
(114018, 'LC Amount', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2025-01-06 11:31:03', '2025-01-06 11:31:03'),
(114019, 'Mezan Bank Kohisar Feeds', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2025-01-16 13:58:27', '2025-01-16 13:58:27'),
(114020, 'Dubai Islamic', NULL, 4, 114000, 'asset', 'bank', 1, 1, '2025-01-18 12:39:20', '2025-01-18 12:39:20'),
(115000, 'Solar Panels', NULL, 3, 110000, 'asset', NULL, 1, 1, '2024-12-13 15:40:17', '2024-12-13 15:40:17'),
(115001, 'Solar Panels', NULL, 4, 115000, 'asset', NULL, 1, 1, '2024-12-13 15:40:42', '2024-12-13 15:40:42'),
(116000, 'Advances', NULL, 3, 110000, 'asset', NULL, 1, 1, '2025-01-06 14:49:31', '2025-01-06 14:49:31'),
(116001, 'Dr. waqas', NULL, 4, 116000, 'asset', NULL, 1, 1, '2025-01-06 14:49:55', '2025-01-06 14:49:55'),
(116002, 'M. Khan', NULL, 4, 116000, 'asset', NULL, 1, 1, '2025-01-06 14:50:17', '2025-01-06 14:50:17'),
(116003, 'Labour Contractor (YOUNAS)', NULL, 4, 116000, 'asset', NULL, 1, 1, '2025-01-06 14:50:58', '2025-01-06 14:50:58'),
(120000, 'Fixed Assets', NULL, 2, 100000, 'asset', NULL, 1, 1, NULL, NULL),
(130000, 'Other Assets', NULL, 2, 100000, 'asset', NULL, 1, 1, NULL, NULL),
(131000, 'Movable Assets', NULL, 3, 130000, 'asset', NULL, 1, 1, '2024-12-13 17:26:03', '2025-01-06 13:09:18'),
(131001, 'Alsvin 2021', NULL, 4, 131000, 'asset', NULL, 1, 1, '2025-01-06 13:09:33', '2025-01-06 13:09:33'),
(131002, 'Mehran (RID-18-806) Jamal', NULL, 4, 131000, 'asset', NULL, 1, 1, '2024-12-13 17:26:36', '2024-12-13 17:26:36'),
(131003, 'Mehran (RID-18-225)', NULL, 4, 131000, 'asset', NULL, 1, 1, '2024-12-13 17:27:17', '2024-12-13 17:27:17'),
(131004, 'Cultas (BA-469) Chakwal', NULL, 4, 131000, 'asset', NULL, 1, 1, '2024-12-13 17:27:55', '2024-12-13 17:27:55'),
(131005, 'Alto (AUK-21-559) Qazi Umar', NULL, 4, 131000, 'asset', NULL, 1, 1, '2024-12-13 17:28:28', '2024-12-13 17:28:28'),
(131006, '3 Motor Cycle', NULL, 4, 131000, 'asset', NULL, 1, 1, '2024-12-13 17:28:48', '2024-12-13 17:28:48'),
(200000, 'Liabilities', NULL, 1, NULL, 'liability', NULL, 1, 1, NULL, NULL),
(210000, 'Current Liabilities', NULL, 2, 200000, 'liability', NULL, 1, 1, NULL, NULL),
(211000, 'Accounts Payable', NULL, 3, 210000, 'liability', NULL, 1, 1, NULL, NULL),
(211100, 'A/P - Suppliers', NULL, 4, 211000, 'liability', NULL, 1, 1, NULL, '2024-11-20 06:37:34'),
(211101, 'GST Payable', NULL, 4, 211000, 'liability', NULL, 1, 1, '2024-11-23 10:30:10', '2024-11-23 10:30:10'),
(211102, 'Withholding Payable', NULL, 4, 211000, 'liability', NULL, 1, 1, '2024-11-23 10:30:25', '2024-11-23 10:35:55'),
(211103, 'Commission Payable', NULL, 4, 211000, 'liability', NULL, 1, 1, '2024-11-23 10:34:56', '2024-11-23 10:34:56'),
(212000, 'Short-term Loans', NULL, 3, 210000, 'liability', NULL, 1, 1, NULL, NULL),
(213000, 'Salary Payable', NULL, 3, 210000, 'liability', NULL, 1, 1, '2025-01-08 16:03:04', '2025-01-08 16:03:04'),
(213001, 'Salary payable - Staff', NULL, 4, 213000, 'liability', NULL, 1, 1, '2025-01-08 16:03:53', '2025-01-08 16:03:53'),
(213002, 'Salary payable - Labour', NULL, 4, 213000, 'liability', NULL, 1, 1, '2025-01-08 16:04:07', '2025-01-08 16:04:07'),
(220000, 'Long-term Liabilities', NULL, 2, 200000, 'liability', NULL, 1, 1, NULL, NULL),
(221000, 'Long-term Loans', NULL, 3, 220000, 'liability', NULL, 1, 1, NULL, NULL),
(221001, 'Dr. Tehseen Khalid Khan', NULL, 4, 221000, 'liability', NULL, 1, 1, '2024-12-13 14:20:21', '2024-12-13 14:20:21'),
(221002, 'Dr Nadeem Qasir', NULL, 4, 221000, 'liability', NULL, 1, 1, '2024-12-13 14:20:43', '2024-12-13 14:20:43'),
(221003, 'Dr Amer Hassan Qazi', NULL, 4, 221000, 'liability', NULL, 1, 1, '2024-12-13 14:21:06', '2024-12-13 14:21:06'),
(221004, 'Shoaib sab', NULL, 4, 221000, 'liability', NULL, 1, 1, '2024-12-13 14:21:33', '2024-12-13 14:21:33'),
(221005, 'Irum Mazhar', NULL, 4, 221000, 'liability', NULL, 1, 1, '2024-12-13 14:21:50', '2024-12-13 14:21:50'),
(221006, 'Malik Sajjad Ahmed', NULL, 4, 221000, 'liability', NULL, 1, 1, '2024-12-13 14:22:04', '2024-12-13 14:22:04'),
(221007, 'Company', NULL, 4, 221000, 'liability', NULL, 1, 1, '2025-01-06 15:23:33', '2025-01-06 15:23:33'),
(221008, 'Mill Development Fund', NULL, 4, 221000, 'liability', NULL, 1, 1, '2025-01-06 15:23:54', '2025-01-06 15:23:54'),
(221009, 'Sales Tex Fund', NULL, 4, 221000, 'liability', NULL, 1, 1, '2025-01-06 15:24:09', '2025-01-06 15:24:09'),
(300000, 'Equity', NULL, 1, NULL, 'equity', NULL, 1, 1, NULL, NULL),
(310000, 'Owner\'s Equity', NULL, 2, 300000, 'equity', NULL, 1, 1, NULL, NULL),
(311000, 'Opening Accounts', NULL, 3, 310000, 'equity', NULL, 1, 1, '2024-11-27 05:06:50', '2024-11-27 05:06:50'),
(311001, 'Supplier Opening Balance', NULL, 4, 311000, 'equity', NULL, 1, 1, '2024-11-27 05:07:21', '2024-11-27 05:07:21'),
(311002, 'Customer Opeing Balance', NULL, 4, 311000, 'equity', NULL, 1, 1, '2024-11-27 05:07:37', '2024-11-27 05:07:37'),
(311003, 'Bank Opening Balance', NULL, 4, 311000, 'equity', NULL, 1, 1, '2024-12-09 14:19:00', '2024-12-09 14:19:00'),
(311004, 'Capital Account', NULL, 4, 311000, 'equity', NULL, 1, 1, '2024-12-13 15:37:20', '2024-12-13 15:37:20'),
(311005, 'Raw Material Opening', NULL, 4, 311000, 'equity', NULL, 1, 1, '2025-01-06 14:19:30', '2025-01-06 14:19:30'),
(312000, 'Retained Earnings', NULL, 3, 310000, 'equity', NULL, 1, 1, '2025-01-08 12:05:13', '2025-01-08 12:05:13'),
(312001, 'Retained Earnings', NULL, 4, 312000, 'equity', NULL, 1, 1, '2025-01-08 12:05:26', '2025-01-08 12:52:57'),
(312002, 'Retained Earnings (TK+Alam+Ajab)', NULL, 4, 312000, 'equity', NULL, 1, 1, '2025-01-08 12:05:33', '2025-01-08 12:53:43'),
(312003, 'Retained Earnings (Ahmad+Adnan+Arshid)', NULL, 4, 312000, 'equity', NULL, 1, 1, '2025-01-08 12:05:41', '2025-01-08 12:54:32'),
(400000, 'Revenue', NULL, 1, NULL, 'revenue', NULL, 1, 1, NULL, NULL),
(410000, 'Sales Revenue', NULL, 2, 400000, 'revenue', NULL, 1, 1, NULL, NULL),
(411000, 'Product Sales', NULL, 3, 410000, 'revenue', NULL, 1, 1, '2024-11-19 05:51:44', '2024-11-23 11:05:46'),
(411001, 'Finished Goods', NULL, 4, 411000, 'revenue', NULL, 1, 1, '2024-11-19 05:51:50', '2024-11-23 11:06:05'),
(420000, 'Service Revenue', NULL, 2, 400000, 'revenue', NULL, 1, 1, NULL, NULL),
(430000, 'Other Revenue', NULL, 2, 400000, 'revenue', NULL, 1, 1, NULL, NULL),
(500000, 'Expenses', NULL, 1, NULL, 'expense', NULL, 1, 1, NULL, NULL),
(510000, 'Cost of Goods Sold (COGS)', NULL, 2, 500000, 'expense', NULL, 1, 1, NULL, NULL),
(511000, 'Shipping Charges', NULL, 3, 510000, 'expense', NULL, 1, 1, '2024-11-18 05:29:49', '2024-11-18 05:29:49'),
(511001, 'Shipping', NULL, 4, 511000, 'expense', NULL, 1, 1, '2024-11-20 06:38:25', '2024-11-20 06:38:25'),
(511002, 'Input Freight', NULL, 4, 511000, 'expense', NULL, 1, 1, '2024-12-30 13:17:01', '2024-12-30 13:17:01'),
(512000, 'Taxes', NULL, 3, 510000, 'expense', NULL, 1, 1, '2024-11-20 06:33:30', '2024-11-20 06:33:30'),
(520000, 'Operating Expenses', NULL, 2, 500000, 'expense', NULL, 1, 1, NULL, NULL),
(521000, 'Employee Costs', NULL, 3, 520000, 'expense', NULL, 1, 1, '2025-01-06 14:56:01', '2025-01-06 14:56:01'),
(521001, 'Salaries - Administrative Staff', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-06 14:56:48', '2025-01-06 14:56:48'),
(521002, 'Salaries - Sales Staff', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-06 14:57:22', '2025-01-06 14:57:22'),
(521003, 'Bonus / Commision', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-06 14:58:36', '2025-01-06 14:58:36'),
(521004, 'Labour Pay', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-06 15:02:02', '2025-01-06 15:02:02'),
(521005, 'Labour Mess', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-06 15:02:25', '2025-01-06 15:02:25'),
(521006, 'Mess', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-06 15:02:44', '2025-01-06 15:02:44'),
(521007, 'Misc Exp office', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-01-18 13:46:02', '2025-01-18 13:46:02'),
(521008, 'Over Time', NULL, 4, 521000, 'expense', NULL, 1, 1, '2025-02-03 16:28:01', '2025-02-03 16:28:01'),
(530000, 'Other Expenses', NULL, 2, 500000, 'expense', NULL, 1, 1, NULL, NULL),
(531000, 'Commissions', NULL, 3, 530000, 'expense', NULL, 1, 1, '2024-11-20 06:39:57', '2024-11-20 06:39:57'),
(531001, 'Sales Commission', NULL, 4, 531000, 'expense', NULL, 1, 1, '2024-11-20 06:41:40', '2024-11-20 06:41:40'),
(531002, 'Excise Office', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:03:57', '2025-01-06 15:03:57'),
(531003, 'EOBI', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:04:08', '2025-01-06 15:04:08'),
(531004, 'ESSI', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:04:40', '2025-02-03 16:25:50'),
(531005, 'R & M', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:05:04', '2025-01-06 15:05:04'),
(531006, 'Lab Exp', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:05:26', '2025-01-06 15:05:26'),
(531007, 'Stationery & TCS', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:06:01', '2025-01-06 15:06:01'),
(531008, 'Telephone Bill', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:07:55', '2025-01-06 15:07:55'),
(531009, 'Electricity Bill', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-06 15:08:08', '2025-01-06 15:08:08'),
(531010, 'Tax (Amjid Qadoos)', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-09 13:21:21', '2025-01-09 13:22:03'),
(531011, 'Labour Department', NULL, 4, 531000, 'expense', NULL, 1, 1, '2025-01-18 13:45:23', '2025-01-18 13:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `expense_no` varchar(255) NOT NULL,
  `party_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'supplier',
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'account used to pay the expense',
  `description` longtext DEFAULT NULL,
  `amount_exclusive_tax` decimal(15,2) DEFAULT NULL,
  `tax_percentage` decimal(5,2) DEFAULT NULL,
  `calculated_tax_amount` decimal(15,2) DEFAULT NULL,
  `amount_inclusive_tax` decimal(15,2) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `creator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_details`
--

CREATE TABLE `expense_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `expense_no` varchar(255) DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `amount_exclusive_tax` decimal(15,2) DEFAULT NULL,
  `tax_percentage` decimal(5,2) DEFAULT NULL,
  `calculated_tax_amount` decimal(15,2) DEFAULT NULL,
  `amount_inclusive_tax` decimal(15,2) DEFAULT NULL,
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
-- Table structure for table `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_master_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_weight` decimal(15,2) DEFAULT NULL,
  `gross_weight` decimal(15,2) DEFAULT NULL,
  `cut_percentage` decimal(15,2) DEFAULT NULL,
  `cut_value` decimal(15,2) DEFAULT NULL,
  `after_cut_total_weight` decimal(15,2) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `per_package_weight` decimal(15,2) DEFAULT NULL,
  `total_package_weight` decimal(15,2) DEFAULT NULL,
  `net_weight` decimal(15,2) DEFAULT NULL,
  `is_surplus` int(11) DEFAULT 0,
  `per_unit_price_stock` decimal(15,2) DEFAULT NULL,
  `per_unit_price` decimal(15,2) DEFAULT NULL,
  `per_unit_price_old_value` decimal(15,2) DEFAULT NULL,
  `per_unit_price_new_value` decimal(15,2) DEFAULT NULL,
  `total_price_stock` decimal(15,2) DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` decimal(15,2) DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `discount_unit_price` decimal(15,2) DEFAULT NULL,
  `after_discount_total_price` decimal(15,2) DEFAULT NULL,
  `purchase_unit_price` decimal(15,2) DEFAULT NULL,
  `total_purchase_price` decimal(15,2) DEFAULT NULL,
  `tax_rate` decimal(15,2) DEFAULT NULL,
  `tax_value` decimal(15,2) DEFAULT NULL,
  `grand_total` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_master`
--

CREATE TABLE `invoice_master` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `batch_no` varchar(255) DEFAULT NULL,
  `vehicle_no` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `recipe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `party_id` bigint(20) UNSIGNED DEFAULT NULL,
  `saleman_id` bigint(20) UNSIGNED DEFAULT NULL,
  `party_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_total` decimal(14,2) DEFAULT NULL,
  `total` decimal(14,2) DEFAULT NULL,
  `total_bags` decimal(15,3) DEFAULT NULL,
  `empty_bag_weight` decimal(15,3) DEFAULT NULL,
  `bag_type_id` bigint(20) DEFAULT NULL,
  `bag_type_name` varchar(255) DEFAULT NULL,
  `total_net_weight` decimal(15,3) DEFAULT NULL,
  `total_gross_weight` decimal(15,3) DEFAULT NULL,
  `production_material_tons` decimal(14,4) DEFAULT NULL,
  `sub_total_stock` decimal(14,2) DEFAULT NULL,
  `sub_total` decimal(14,2) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `discount_value` decimal(14,2) DEFAULT NULL,
  `discount_amount` decimal(14,2) DEFAULT NULL,
  `tax_type` varchar(255) DEFAULT NULL,
  `tax_rate` decimal(15,2) DEFAULT NULL COMMENT 'GST or VAT',
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `wth_tax_rate` decimal(15,2) DEFAULT NULL COMMENT 'Withholdong Tax',
  `wth_tax_amount` decimal(15,2) DEFAULT NULL,
  `commission_rate` decimal(15,2) DEFAULT NULL,
  `commission_amount` decimal(15,2) DEFAULT NULL,
  `is_x_freight` varchar(2) DEFAULT NULL,
  `shipping_type` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,2) DEFAULT NULL,
  `grand_total` decimal(14,2) DEFAULT NULL,
  `total_purchase_price` decimal(15,2) DEFAULT NULL,
  `profit_loss` decimal(15,2) DEFAULT NULL,
  `production_qty` decimal(15,2) DEFAULT NULL COMMENT 'in kgs',
  `output_qty` decimal(15,2) DEFAULT NULL COMMENT 'in kgs',
  `surplus_qty` decimal(15,2) DEFAULT NULL COMMENT 'in kgs',
  `output_bags` decimal(15,2) DEFAULT NULL,
  `surplus_bags` decimal(15,2) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `is_lock` char(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sell_price` decimal(20,2) DEFAULT NULL,
  `purchase_price` decimal(20,2) DEFAULT NULL,
  `stock_alert_qty` decimal(20,2) DEFAULT NULL,
  `unit_weight` decimal(20,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sell_cart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_cart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `code`, `name`, `type`, `sell_price`, `purchase_price`, `stock_alert_qty`, `unit_weight`, `category_id`, `brand_id`, `unit_id`, `tax_id`, `warehouse_id`, `sell_cart_of_account_id`, `purchase_cart_of_account_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '1', 'Maize', 'Raw', NULL, NULL, 2500000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:13:04', '2024-12-02 11:13:04'),
(2, '2', 'Rice Broken', 'Raw', NULL, NULL, 200000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:14:00', '2024-12-02 11:14:00'),
(3, '3', 'Wheat', 'Raw', NULL, NULL, 50000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:14:46', '2024-12-02 11:14:46'),
(4, '4', 'Rice Polish 2 (Rotex )', 'Raw', NULL, NULL, 30000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:16:20', '2024-12-02 11:16:20'),
(5, '5', 'Rice Polish', 'Raw', NULL, NULL, 80000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:17:37', '2024-12-02 11:17:37'),
(6, '6', 'Wheat Bran', 'Raw', NULL, NULL, 30000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:18:32', '2024-12-02 11:18:32'),
(7, '7', 'CG 60%', 'Raw', NULL, NULL, 5000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:20:07', '2025-01-01 12:57:32'),
(8, '8', 'CG 30%', 'Raw', NULL, NULL, 10000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:20:33', '2024-12-02 11:20:33'),
(9, '9', 'PBM', 'Raw', NULL, NULL, 2000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:20:57', '2024-12-02 11:20:57'),
(10, '10', 'Fish Meal', 'Raw', NULL, NULL, 30000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:21:33', '2024-12-02 11:21:33'),
(11, '11', 'MBM (Meat & Bon Meal)', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:22:23', '2024-12-02 11:22:23'),
(12, '12', 'Canola Meal', 'Raw', NULL, NULL, 70000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:23:31', '2024-12-02 11:23:31'),
(13, '13', 'Rapeseed Meal', 'Raw', NULL, NULL, 25000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:24:15', '2025-01-01 13:00:21'),
(14, '14', 'Soyabean Meal- Low KOH', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:24:38', '2024-12-02 11:24:38'),
(15, '15', 'Soyabean Meal - HP', 'Raw', NULL, NULL, 60000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:25:23', '2024-12-02 11:25:23'),
(16, '16', 'Sesame Cake', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:26:53', '2024-12-02 11:26:53'),
(17, '17', 'Sunflower Meal', 'Raw', NULL, NULL, 10000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:27:15', '2024-12-02 11:27:15'),
(18, '18', 'Guar Meal', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:27:30', '2024-12-02 11:27:30'),
(19, '19', 'Palm Karnal Cake (PKC)', 'Raw', NULL, NULL, 35000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:28:02', '2025-01-01 13:02:13'),
(20, '20', 'Molasses', 'Raw', NULL, NULL, 25000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:28:28', '2024-12-02 11:28:28'),
(21, '21', 'Rapeseed Cake', 'Raw', NULL, NULL, 15000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:29:06', '2024-12-02 11:29:06'),
(22, '22', 'Powder Chips', 'Raw', NULL, NULL, 20000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:29:57', '2025-01-01 13:03:37'),
(23, '23', 'DCP (Local)', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:30:18', '2024-12-02 11:30:18'),
(24, '24', 'DCP (China)', 'Raw', NULL, NULL, 2000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:30:47', '2024-12-02 11:30:47'),
(25, '25', 'Chicken Oil', 'Raw', NULL, NULL, 5000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:31:13', '2025-01-01 13:04:21'),
(26, '26', 'Vegetable Oil', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:31:30', '2024-12-02 11:31:30'),
(27, '27', 'Wanda Bags (20 kg)', 'Raw', NULL, NULL, 1000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:32:47', '2024-12-02 11:32:47'),
(28, '28', 'Wanda Bags', 'Raw', NULL, NULL, 10000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:33:38', '2024-12-02 11:33:38'),
(29, '29', 'Feed Bags', 'Raw', NULL, NULL, 20000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:34:20', '2024-12-02 11:34:20'),
(30, '30', 'Lysine Sulphate', 'Raw', NULL, NULL, 3000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:37:34', '2025-01-01 13:05:52'),
(31, '31', 'Methionine', 'Raw', NULL, NULL, 2500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:38:07', '2024-12-02 11:38:07'),
(32, '32', 'Arginine', 'Raw', NULL, NULL, 3000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:38:40', '2024-12-02 11:38:40'),
(33, '33', 'Iso-Leucine', 'Raw', NULL, NULL, 2500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:39:08', '2024-12-02 11:39:08'),
(34, '34', 'Valine', 'Raw', NULL, NULL, 1000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:39:32', '2024-12-02 11:39:32'),
(35, '35', 'Tryptophane', 'Raw', NULL, NULL, 500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:39:55', '2024-12-02 11:39:55'),
(36, '36', 'Threonine', 'Raw', NULL, NULL, 1500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:40:16', '2024-12-02 11:40:16'),
(37, '37', 'Salt', 'Raw', NULL, NULL, 500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:40:37', '2024-12-02 11:40:37'),
(38, '38', 'Soda', 'Raw', NULL, NULL, 500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:41:00', '2024-12-02 11:41:00'),
(39, '39', 'Urea', 'Raw', NULL, NULL, 3000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:41:28', '2024-12-02 11:41:28'),
(40, '40', 'Betaine', 'Raw', NULL, NULL, 500.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:41:51', '2024-12-02 11:41:51'),
(41, '41', 'Magnesium Sulphate (MGSO4)', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:47:33', '2024-12-02 11:47:33'),
(42, '42', 'Choline', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:47:48', '2024-12-02 11:47:48'),
(43, '43', 'Mineral Premix', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:48:11', '2024-12-02 11:48:11'),
(44, '44', 'Vitamin Premix', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:48:40', '2024-12-02 11:48:40'),
(45, '45', 'Total Mineral Premix', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:48:57', '2024-12-02 11:48:57'),
(46, '46', 'Total Vitamin Premix', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:49:19', '2024-12-02 11:49:19'),
(47, '47', 'ECO Trace', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:49:34', '2024-12-02 11:49:34'),
(48, '48', 'Technospore', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:49:53', '2024-12-02 11:49:53'),
(49, '49', 'Diclazuril', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:50:12', '2024-12-02 11:50:12'),
(50, '50', 'Maduramycin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:50:28', '2024-12-02 11:50:28'),
(51, '51', 'Potassium Carbonate', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:51:01', '2024-12-02 11:51:01'),
(52, '52', 'Lincomycin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:51:20', '2024-12-02 11:51:20'),
(53, '53', 'Enramycin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:51:35', '2024-12-02 11:51:35'),
(54, '54', 'UMAVILA', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:51:57', '2024-12-02 11:51:57'),
(55, '55', 'XAP', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:52:19', '2024-12-02 11:52:19'),
(56, '56', 'Novatech', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:52:52', '2024-12-02 11:52:52'),
(57, '57', 'Protech', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:53:22', '2024-12-02 11:53:22'),
(58, '58', 'Phytase', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:53:42', '2024-12-02 11:53:42'),
(59, '59', 'Dairy Methionine', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:54:38', '2024-12-02 11:54:38'),
(60, '60', 'Dairy Lysine', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:54:52', '2024-12-02 11:54:52'),
(61, '61', 'Lecimax', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:55:11', '2024-12-02 11:55:11'),
(62, '62', 'Shell Boost', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:55:25', '2024-12-02 11:55:25'),
(63, '63', 'Toxin Binder', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:55:40', '2024-12-02 11:55:40'),
(64, '64', 'Kamix', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:55:54', '2024-12-02 11:55:54'),
(65, '65', 'Oxytet', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:56:09', '2024-12-02 11:56:09'),
(66, '66', 'Furazolidon', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:56:27', '2024-12-02 11:56:27'),
(67, '67', 'Acid Buff', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:57:13', '2024-12-02 11:57:13'),
(68, '68', 'Organic Acid', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:57:28', '2024-12-02 11:57:28'),
(69, '69', 'Copper Sulphate', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:57:45', '2024-12-02 11:57:45'),
(70, '70', 'Ferrous Sulphate', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:58:04', '2024-12-02 11:58:04'),
(71, '71', 'Manganese Sulphate', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:58:21', '2024-12-02 11:58:21'),
(72, '72', 'Zinc Sulphate', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:58:38', '2024-12-02 11:58:38'),
(73, '73', 'Iodine', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:58:48', '2024-12-02 11:58:48'),
(74, '74', 'Selenium', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:59:02', '2024-12-02 11:59:02'),
(75, '75', 'Organic Selenium', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:59:15', '2024-12-02 11:59:15'),
(76, '76', 'Vitamin A', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 11:59:56', '2024-12-02 11:59:56'),
(77, '77', 'Vitamin \"D 3 \"', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:00:28', '2024-12-02 12:00:28'),
(78, '78', 'Vitamin \"K3 \"', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:00:56', '2024-12-02 12:00:56'),
(79, '79', 'Vitamin \"E \"', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:01:20', '2024-12-02 12:01:20'),
(80, '80', 'Vitamin B1 Thiamine', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:01:44', '2024-12-02 12:01:44'),
(81, '81', 'Vitamin B2 Riboflavin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:02:06', '2024-12-02 12:02:06'),
(82, '82', 'Vitamin B3 Niacin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:02:34', '2024-12-02 12:02:34'),
(83, '83', 'Vitamin B5 Cal D Pan', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:02:57', '2024-12-02 12:02:57'),
(84, '84', 'Vitamin B6 Pyridoxin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:03:23', '2024-12-02 12:03:23'),
(85, '85', 'Vitamin B7 Biotin', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:03:41', '2024-12-02 12:03:41'),
(86, '86', 'Vitamin B9 Folic Acid', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:04:00', '2024-12-02 12:04:00'),
(87, '87', 'Vitamin B12 (0.1%)', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:04:23', '2024-12-02 12:04:23'),
(88, '88', 'Vitamin B12 (1.0%)', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:04:58', '2024-12-02 12:05:26'),
(89, '89', 'Antioxidant', 'Raw', NULL, NULL, 100.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:05:41', '2025-01-14 12:57:06'),
(90, '90', 'Kemvet', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 12:05:58', '2024-12-02 12:05:58'),
(91, '91', 'Dairy Premix', 'Raw', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 13:28:14', '2024-12-02 13:28:14'),
(92, '92', '10', 'Good', 6250.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 14:24:10', '2024-12-09 12:37:00'),
(93, '93', '17', 'Good', 6150.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-02 14:24:42', '2024-12-09 12:36:38'),
(94, '94', '18', 'Good', 6350.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:05:22', '2024-12-09 12:36:16'),
(95, '95', '19', 'Good', 6350.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:05:45', '2024-12-09 12:35:56'),
(96, '96', '29', 'Good', 6350.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:06:01', '2024-12-09 12:35:35'),
(97, '97', '29-B', 'Good', 6350.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:06:37', '2024-12-09 12:35:02'),
(98, '98', '14-A', 'Good', 7325.00, NULL, NULL, 50.00, 2, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:06:56', '2024-12-09 12:34:40'),
(99, '99', '14', 'Good', 7250.00, NULL, NULL, 50.00, 2, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:08:25', '2024-12-09 12:34:09'),
(100, '100', 'K 1', 'Good', 7475.00, NULL, NULL, 50.00, 2, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:08:44', '2024-12-09 12:33:39'),
(101, '101', 'K 2', 'Good', 7300.00, NULL, NULL, 50.00, 2, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:09:07', '2024-12-09 12:33:13'),
(102, '102', 'K 3', 'Good', 7350.00, NULL, NULL, 50.00, 2, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:09:29', '2024-12-09 12:32:51'),
(103, '103', '27 - P', 'Good', 4125.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:30:45', '2024-12-09 12:29:35'),
(104, '104', '26 -P', 'Good', 3820.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:31:12', '2024-12-09 12:29:17'),
(105, '105', '25 - P', 'Good', 3635.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-03 13:31:34', '2024-12-09 12:28:54'),
(106, '106', '25 - M', 'Good', 3625.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:08:10', '2024-12-09 12:08:10'),
(107, '107', '21 - P', 'Good', 4160.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:10:54', '2024-12-09 12:10:54'),
(108, '108', '22 - P', 'Good', 3635.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:11:30', '2024-12-09 12:11:30'),
(109, '109', '23 - P', 'Good', 3410.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:12:10', '2024-12-09 12:12:10'),
(110, '110', '24 - P', 'Good', 3555.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:12:42', '2025-01-27 12:59:23'),
(111, '111', '21 - M', 'Good', 4150.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:13:41', '2024-12-09 12:13:41'),
(112, '112', '22 _ M', 'Good', 3625.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:14:24', '2024-12-09 12:14:24'),
(113, '113', '23 - M', 'Good', 3400.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:14:59', '2024-12-09 12:14:59'),
(114, '114', '24 - M', 'Good', 3515.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:15:31', '2024-12-09 12:15:31'),
(115, '115', '26 - M', 'Good', 3810.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:16:07', '2024-12-09 12:16:07'),
(116, '116', '27 - M', 'Good', 4115.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:16:44', '2024-12-09 12:16:44'),
(117, '117', '25 - P (20 Kg)', 'Good', 1838.00, NULL, NULL, 20.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:21:31', '2024-12-09 13:07:48'),
(118, '118', '0', 'Good', 5100.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:38:50', '2024-12-09 12:38:50'),
(119, '119', '0 - Special', 'Good', 5300.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:39:31', '2024-12-09 12:39:31'),
(120, '120', '11', 'Good', 6550.00, NULL, NULL, 50.00, 4, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:40:44', '2024-12-09 12:59:58'),
(121, '121', '12', 'Good', 6500.00, NULL, NULL, 50.00, 4, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:41:23', '2024-12-09 13:00:15'),
(122, '122', '13', 'Good', 6425.00, NULL, NULL, 50.00, 4, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:41:49', '2024-12-09 13:00:36'),
(123, '123', '16', 'Good', 6450.00, NULL, NULL, 50.00, 1, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 12:42:27', '2024-12-09 12:42:27'),
(124, '124', 'KD - P', 'Good', 3205.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 13:04:11', '2024-12-09 13:04:11'),
(125, '125', 'KD - M', 'Good', 3195.00, NULL, NULL, 40.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-09 13:04:43', '2024-12-09 13:04:43'),
(126, '126', '804', 'Good', 3365.00, NULL, NULL, 37.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-11 11:12:44', '2024-12-11 11:12:44'),
(127, '127', '805', 'Good', 3535.00, NULL, NULL, 37.00, 3, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-11 11:13:06', '2024-12-11 11:13:06'),
(128, '128', 'Wheat Bran (Chokhar)', 'Good', 3600.00, NULL, NULL, 50.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-13 09:59:30', '2024-12-30 12:46:08'),
(129, '129', 'WOOD', 'Raw', NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-13 10:20:22', '2024-12-20 15:24:13'),
(130, '130', 'Maize (DALL)', 'Good', 4000.00, NULL, NULL, 50.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2024-12-27 14:10:58', '2024-12-30 11:52:03'),
(131, '131', 'Zero Sp', 'Good', 5300.00, NULL, NULL, 50.00, 2, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-08 14:34:09', '2025-01-22 14:41:38'),
(132, '132', 'Feeds Bags & Wood', 'Good', 0.00, NULL, NULL, 1.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-08 14:38:01', '2025-01-08 14:38:13'),
(133, '133', 'Wanda Bags & Wood', 'Good', 0.00, NULL, NULL, 1.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-08 14:40:09', '2025-01-08 14:40:09'),
(134, '134', 'Wanda Bags 20 kg & Wood', 'Good', 0.00, NULL, NULL, 1.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-09 11:24:16', '2025-01-09 11:24:16'),
(135, '135', 'Salcurb', 'Raw', NULL, NULL, 5000.00, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-18 11:53:51', '2025-01-18 11:53:51'),
(136, '136', 'Oxytetra cycline', 'Good', 5032.00, NULL, NULL, 1.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-25 15:28:32', '2025-01-25 15:28:32'),
(137, '137', 'Furazolidon', 'Good', 6377.00, NULL, NULL, 1.00, 7, NULL, 1, NULL, NULL, NULL, NULL, 1, '2025-01-27 12:14:03', '2025-01-27 12:14:03');

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `party_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Used when a client is both a customer and supplier. Represents the party entity.',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_master_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_id` bigint(20) DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `debit` decimal(20,2) DEFAULT NULL,
  `credit` decimal(20,2) DEFAULT NULL,
  `trace` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_17_143232_create_customers_table', 1),
(6, '2024_10_04_113017_create_brands_table', 1),
(7, '2024_10_04_113109_create_categories_table', 1),
(8, '2024_10_04_130906_create_media_table', 2),
(17, '2024_10_04_132415_create_taxes_table', 3),
(18, '2024_10_04_132450_create_warehouses_table', 3),
(19, '2024_10_04_132519_create_units_table', 3),
(21, '2024_10_04_132612_create_variations_table', 4),
(22, '2024_10_04_145211_create_suppliers_table', 4),
(55, '2024_10_08_112110_create_prodcuts_table', 5),
(56, '2024_10_09_150731_create_items_table', 5),
(89, '2024_10_04_150554_create_parties_table', 6),
(91, '2024_10_23_135132_create_receipe_recipe_detail_table', 6),
(92, '2024_10_31_150317_create_party_warehouses_table', 6),
(95, '2024_11_07_115358_create_voucher_types_table', 7),
(102, '2024_11_02_105133_create_chart_of_accounts_table', 9),
(105, '2024_10_14_115800_create_invoice_master_detail_table', 10),
(106, '2024_11_04_104730_create_expenses_expense_details_table', 10),
(107, '2024_11_13_095414_create_vouchers_voucher_details_table', 10),
(108, '2024_11_13_121006_create_journals_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `party_type` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `alternate_number` varchar(255) DEFAULT NULL,
  `landline` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tax_number` varchar(255) DEFAULT NULL,
  `opening_balance` decimal(22,4) DEFAULT 0.0000,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `type`, `party_type`, `business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `mobile`, `alternate_number`, `landline`, `email`, `tax_number`, `opening_balance`, `pay_term_type`, `credit_limit`, `address_line_1`, `address_line_2`, `city`, `state`, `country`, `zip_code`, `shipping_address`, `is_active`, `is_default`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'business', 'supplier', 'Stocks', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 12:07:15', '2025-01-01 12:07:39'),
(2, 'business', 'supplier', 'Opening Balance', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:02:34', '2024-12-02 14:02:34'),
(3, 'individual', 'supplier', 'Saeed  Multan', ' Saeed  Multan', NULL, 'Saeed', NULL, 'Multan', '03216341400', NULL, '0616528181', NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:39:48', '2024-12-09 16:54:03'),
(4, 'business', 'supplier', 'Iffco (Pvt) Ltd.', '   ', NULL, NULL, NULL, NULL, '03000643929', '03452397812', NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:42:02', '2024-12-09 16:54:37'),
(5, 'individual', 'supplier', 'Sheikh  Waseem Multan', ' Sheikh  Waseem Multan', NULL, 'Sheikh', NULL, 'Waseem Multan', '03008638822', NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:43:21', '2024-12-09 16:56:30'),
(6, 'business', 'supplier', 'Kausar Oil Mills', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:44:18', '2024-12-09 16:57:40'),
(7, 'business', 'supplier', 'Sufi Oil Mills', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:44:46', '2024-12-09 16:58:14'),
(8, 'business', 'supplier', 'Pak Agro Oil Mills (Pvt)Ltd', '   ', NULL, NULL, NULL, NULL, NULL, NULL, '02134750352', NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:46:37', '2024-12-09 16:58:42'),
(9, 'individual', 'supplier', 'Kashif  Fish', ' Kashif  Fish', NULL, 'Kashif', NULL, 'Fish', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:47:06', '2024-12-09 16:59:07'),
(10, 'individual', 'supplier', 'Asif Qureshi Fish', ' Asif Qureshi Fish', NULL, 'Asif', 'Qureshi', 'Fish', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:47:54', '2024-12-09 16:59:33'),
(11, 'individual', 'supplier', 'Saeed  Fish', ' Saeed  Fish', NULL, 'Saeed', NULL, 'Fish', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:48:21', '2024-12-09 17:00:27'),
(12, 'individual', 'supplier', 'Dr Asif Sheer (MD Fish)', 'Dr Asif Sheer (MD Fish)', 'Dr', 'Asif', 'Sheer', '(MD Fish)', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:49:16', '2024-12-09 16:59:47'),
(13, 'business', 'supplier', 'Mudasar Traders', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:50:51', '2024-12-09 17:00:50'),
(14, 'individual', 'supplier', 'Yasir  Maize', ' Yasir  Maize', NULL, 'Yasir', NULL, 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:51:09', '2024-12-09 17:01:12'),
(15, 'individual', 'supplier', 'Sajjad  Maize', ' Sajjad  Maize', NULL, 'Sajjad', NULL, 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:51:35', '2024-12-09 17:01:33'),
(16, 'individual', 'supplier', 'Mushtaq  Maize', ' Mushtaq  Maize', NULL, 'Mushtaq', NULL, 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:51:56', '2024-12-09 17:01:55'),
(17, 'individual', 'supplier', 'Liaqat Swabi Maize', ' Liaqat Swabi Maize', NULL, 'Liaqat', 'Swabi', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:52:18', '2024-12-09 17:02:17'),
(18, 'individual', 'supplier', 'Shani Maize', ' Shani Maize ', NULL, 'Shani', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:52:51', '2024-12-09 17:02:43'),
(19, 'individual', 'supplier', ' Muhamad Ejaz Maize', ' Muhamad Ejaz Maize', NULL, 'Muhamad', 'Ejaz', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:53:21', '2025-01-01 15:08:38'),
(20, 'individual', 'supplier', 'Haji Ghaffar  Maize', 'Haji Ghaffar  Maize', 'Haji', 'Ghaffar', NULL, 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:53:52', '2024-12-09 17:05:40'),
(21, 'individual', 'supplier', 'M Ashfaq  Maize', 'M Ashfaq  Maize', 'M', 'Ashfaq', NULL, 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:54:29', '2024-12-09 17:06:38'),
(22, 'individual', 'supplier', 'Mazhar Hussain Maize', ' Mazhar Hussain Maize', NULL, 'Mazhar', 'Hussain', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:56:26', '2024-12-09 17:09:07'),
(23, 'individual', 'supplier', ' Umair zhar Shah Maize', ' Umair zhar Shah Maize', NULL, 'Umair', 'zhar Shah', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:57:02', '2025-01-01 15:07:29'),
(24, 'business', 'supplier', 'Zawar Commission Agent ( Maize)', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:57:49', '2024-12-09 17:14:06'),
(25, 'individual', 'supplier', 'Sijad Shah ( Rice Broken)', ' Sijad Shah ( Rice Broken)', NULL, 'Sijad', 'Shah', '( Rice Broken)', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:58:41', '2024-12-09 17:15:38'),
(26, 'business', 'supplier', 'Roshan Traders (Maize)', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:58:57', '2024-12-09 17:16:04'),
(27, 'individual', 'supplier', 'Umer Farook Maize', ' Umer Farook Maize', NULL, 'Umer', 'Farook', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:59:24', '2024-12-09 17:16:52'),
(28, 'individual', 'supplier', 'Saleem  Swabi', ' Saleem  Swabi', NULL, 'Saleem', NULL, 'Swabi', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 14:59:39', '2024-12-09 17:17:15'),
(29, 'individual', 'supplier', 'Haji Abdul Razaq Maize', 'Haji Abdul Razaq Maize', 'Haji', 'Abdul', 'Razaq', 'Maize', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:00:11', '2024-12-09 17:04:48'),
(30, 'individual', 'supplier', 'Mian Fiaz Wattoo ( Maize)', 'Mian Fiaz Wattoo ( Maize)', 'Mian', 'Fiaz', 'Wattoo', '( Maize)', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:00:51', '2024-12-09 17:17:43'),
(31, 'business', 'supplier', 'Madni Flour Mills', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:01:15', '2024-12-09 17:18:04'),
(32, 'individual', 'supplier', 'Dawood Maize ( Swat)', ' Dawood Maize ( Swat)', NULL, 'Dawood', 'Maize', '( Swat)', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:01:45', '2024-12-09 17:18:25'),
(33, 'individual', 'supplier', 'Zulfiqar / Zawar  Polish', ' Zulfiqar / Zawar  Polish', NULL, 'Zulfiqar / Zawar', NULL, 'Polish', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:02:23', '2024-12-09 17:14:22'),
(34, 'individual', 'supplier', 'Ilyas  ( Rapeseed )', ' Ilyas  ( Rapeseed )', NULL, 'Ilyas', NULL, '( Rapeseed )', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:03:26', '2024-12-09 17:19:08'),
(35, 'business', 'supplier', 'Imran Traders', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:03:47', '2024-12-09 17:19:26'),
(36, 'individual', 'supplier', 'Zia ur Rehman  ( Rice Broken)', ' Zia ur Rehman  ( Rice Broken)', NULL, 'Zia ur Rehman', NULL, '( Rice Broken)', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:04:24', '2024-12-09 17:19:50'),
(37, 'business', 'supplier', 'Ali Traders (Polish)', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:05:02', '2024-12-09 17:20:10'),
(38, 'business', 'supplier', 'Ali Noor Traders (Polish)', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:05:35', '2024-12-09 17:20:23'),
(39, 'business', 'supplier', 'Ali Commision Shop', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:05:57', '2024-12-09 17:20:37'),
(40, 'individual', 'supplier', 'Sufi Broker ( Rapeseed )', ' Sufi Broker ( Rapeseed )', NULL, 'Sufi', 'Broker', '( Rapeseed )', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:06:39', '2024-12-09 17:21:09'),
(41, 'individual', 'supplier', 'Haseeb Guar Meal', ' Haseeb Guar Meal ', NULL, 'Haseeb', 'Guar Meal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:07:15', '2024-12-09 17:21:40'),
(42, 'business', 'supplier', 'G.N Foods', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:07:43', '2024-12-09 17:22:34'),
(43, 'business', 'supplier', 'Rehmat PBM', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:08:13', '2024-12-09 17:22:54'),
(44, 'business', 'supplier', 'A S Enterprises', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:08:32', '2024-12-09 17:24:24'),
(45, 'business', 'supplier', 'U M Enterprises', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:08:48', '2024-12-09 17:25:08'),
(46, 'business', 'supplier', 'Agro Vision', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:09:08', '2024-12-09 17:24:39'),
(47, 'business', 'supplier', 'Qemin Pharma', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:09:28', '2024-12-09 17:25:28'),
(48, 'business', 'supplier', 'The Nutriline', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:09:46', '2024-12-09 17:25:52'),
(49, 'business', 'supplier', 'HMZ Neutrions', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:10:07', '2024-12-09 17:26:15'),
(50, 'business', 'supplier', 'BRO Med', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:10:31', '2024-12-09 17:26:43'),
(51, 'business', 'supplier', 'Orient Animal Health', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:10:54', '2024-12-09 17:27:15'),
(52, 'business', 'supplier', 'Orient Traders International', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:11:17', '2024-12-09 17:27:03'),
(53, 'business', 'supplier', 'Nizami Traders', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:11:32', '2024-12-09 17:27:54'),
(54, 'business', 'supplier', 'Polaris Life Sciences', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:11:55', '2024-12-09 17:28:28'),
(55, 'business', 'supplier', 'Horizone International', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:12:19', '2024-12-09 17:27:32'),
(56, 'individual', 'supplier', 'Haji Khawar  (Urea)', 'Haji Khawar  (Urea)', 'Haji', 'Khawar', NULL, '(Urea)', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:13:13', '2024-12-09 17:06:00'),
(57, 'individual', 'supplier', 'Haji Dosa Guar Meal', 'Haji Dosa Guar Meal ', 'Haji', 'Dosa', 'Guar Meal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:13:44', '2024-12-09 17:05:11'),
(58, 'business', 'supplier', 'Bild Agro', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:14:03', '2024-12-09 17:29:03'),
(59, 'business', 'supplier', 'Crystal Feed', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:14:24', '2024-12-09 17:29:22'),
(60, 'business', 'supplier', 'GEO Feeds', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:14:37', '2024-12-09 16:21:09'),
(61, 'business', 'supplier', 'Top Star Polymers', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:15:03', '2024-12-09 17:28:40'),
(62, 'business', 'supplier', 'Nadeem Traders', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:15:18', '2024-12-09 17:29:41'),
(63, 'business', 'supplier', 'Al- Rehman Traders', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:15:40', '2024-12-09 17:23:28'),
(64, 'individual', 'supplier', 'M Akhter ( Coal Dealer)', 'M Akhter ( Coal Dealer) ', 'M', 'Akhter', '( Coal Dealer)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:16:13', '2024-12-09 17:30:16'),
(65, 'business', 'supplier', 'Roshan Chips', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:16:28', '2024-12-09 17:16:21'),
(66, 'individual', 'supplier', 'Sultan Molasses', ' Sultan Molasses ', NULL, 'Sultan', 'Molasses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:17:05', '2024-12-09 17:30:36'),
(67, 'individual', 'supplier', 'H M Nasir Molasses', ' H M Nasir Molasses', NULL, 'H M', 'Nasir', 'Molasses', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:17:36', '2024-12-09 17:30:56'),
(68, 'individual', 'supplier', 'Aurangzaib Molasses', ' Aurangzaib Molasses ', NULL, 'Aurangzaib', 'Molasses', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:18:00', '2024-12-09 17:31:25'),
(70, 'business', 'supplier', 'Al Nasr Enterprises', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3800000.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:20:01', '2024-12-09 13:44:20'),
(71, 'individual', 'supplier', 'Haji Muhamad Saleem (Urea) Tarnool', 'Haji Muhamad Saleem (Urea) Tarnool', 'Haji', 'Muhamad', 'Saleem', '(Urea) Tarnool', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:20:44', '2024-12-09 16:16:56'),
(72, 'individual', 'supplier', 'Mirza Imran ( PKC / Fish Meal)', 'Mirza Imran ( PKC / Fish Meal) ', 'Mirza', 'Imran', '( PKC / Fish Meal)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:21:24', '2024-12-09 16:17:32'),
(73, 'business', 'supplier', 'Nexus', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:21:38', '2024-12-09 16:18:01'),
(74, 'business', 'supplier', 'Mehta Brothers', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:21:52', '2024-12-09 16:18:26'),
(75, 'business', 'supplier', 'IBKB', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-02 15:22:10', '2024-12-09 16:19:38'),
(83, 'individual', 'supplier', ' LOCAL PURCHASE  ', NULL, NULL, 'LOCAL PURCHASE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-03 15:14:24', '2024-12-03 15:14:24'),
(84, 'individual', 'supplier', 'Khuram Polish', ' Khuram Polish  ', NULL, 'Khuram Polish', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-03 16:19:28', '2024-12-09 17:18:44'),
(85, 'business', 'supplier', 'ICI Soda', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-03 16:37:43', '2024-12-09 16:16:00'),
(92, 'individual', 'supplier', 'Aqil Ur Rehman', ' Aqil Ur Rehman', NULL, 'Aqil', 'Ur', 'Rehman', NULL, NULL, NULL, NULL, NULL, NULL, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-04 11:29:51', '2024-12-09 17:23:12'),
(93, 'business', 'supplier', 'Akbari store Lahore', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 14:59:09', '2024-12-09 14:59:09'),
(94, 'business', 'supplier', 'Ayan Traders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 15:45:56', '2024-12-09 15:45:56'),
(95, 'business', 'supplier', 'RUB Associates', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 16:46:07', '2024-12-09 16:46:55'),
(96, 'business', 'supplier', 'Noveltai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 17:38:47', '2024-12-09 17:38:47'),
(97, 'business', 'supplier', 'Ghulam Rahim Khan Battal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 17:52:36', '2024-12-09 17:52:36'),
(98, 'business', 'supplier', 'Doctor Aqeel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 17:57:07', '2024-12-09 17:57:07'),
(99, 'business', 'supplier', 'Shamshad Commission Shop', '   ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 18:44:36', '2024-12-09 18:54:59'),
(100, 'business', 'supplier', 'UM Enterprises', '   ', NULL, NULL, NULL, NULL, '03007893716', '03097770091', NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-09 18:44:58', '2024-12-13 11:32:20'),
(101, 'business', 'customer', 'Grand Chicks', '   ', NULL, NULL, NULL, NULL, NULL, NULL, '0997544103', NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:09:40', '2024-12-20 12:03:59'),
(102, 'business', 'customer', 'Head Office', '   ', NULL, NULL, NULL, NULL, NULL, NULL, '0997544104', NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:10:01', '2024-12-20 12:03:38'),
(103, 'business', 'customer', 'Zahoor Ahmad (Wanda)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:11:34', '2024-12-10 12:11:34'),
(104, 'business', 'customer', 'Dr Zia Wanda (Chakwal)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:12:22', '2024-12-10 12:12:22'),
(105, 'business', 'customer', 'Kohisar Traders (wanda)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:13:04', '2024-12-10 12:13:04'),
(106, 'business', 'customer', 'Dr Zia', '   ', NULL, NULL, NULL, NULL, '03226212376', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:13:39', '2024-12-20 12:03:04'),
(107, 'business', 'customer', 'RUB Enterprises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:14:21', '2024-12-10 12:14:21'),
(108, 'individual', 'customer', 'Raas P/S', ' Raas P/S  ', NULL, 'Raas P/S', NULL, NULL, '03247721753', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:15:08', '2024-12-20 12:00:54'),
(109, 'individual', 'customer', 'Shoaib RWP', ' Shoaib RWP  ', NULL, 'Shoaib RWP', NULL, NULL, '03459628238', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:15:46', '2024-12-20 12:00:14'),
(110, 'individual', 'customer', 'Tufail Tanoli P/S', ' Tufail Tanoli P/S ', NULL, 'Tufail', 'Tanoli P/S', NULL, '03009111446', '03449477234', NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:16:16', '2024-12-20 11:59:27'),
(111, 'individual', 'customer', 'Haseeb RWP', ' Haseeb RWP  ', NULL, 'Haseeb RWP', NULL, NULL, '03139450515', '03005126567', NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:16:41', '2024-12-20 12:02:21'),
(112, 'individual', 'customer', 'Dr Shahid', 'Dr Shahid  ', 'Dr', 'Shahid', NULL, NULL, '03115050509', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:17:15', '2024-12-20 12:01:33'),
(113, 'individual', 'customer', 'Dr Asif Sheer (MD Fish) ', NULL, 'Dr', 'Asif Sheer', '(MD Fish)', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:17:53', '2025-01-11 14:21:42'),
(114, 'individual', 'customer', ' Zahir P/S  ', ' Zahir P/S  ', NULL, 'Zahir P/S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:18:16', '2025-01-06 11:19:34'),
(115, 'individual', 'customer', ' Naeem P/F  ', NULL, NULL, 'Naeem P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:18:37', '2024-12-10 12:18:37'),
(116, 'business', 'customer', 'Alam P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:20:58', '2024-12-10 12:20:58'),
(117, 'business', 'customer', 'TK P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:21:32', '2024-12-10 12:21:32'),
(118, 'business', 'customer', 'Ajab P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:21:48', '2024-12-10 12:21:48'),
(119, 'business', 'customer', 'Ahmad Nawaz P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:22:10', '2024-12-10 12:22:10'),
(120, 'business', 'customer', 'Adnan P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:22:27', '2024-12-10 12:22:27'),
(121, 'business', 'customer', 'Arshid P/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:24:45', '2024-12-10 12:24:45'),
(122, 'business', 'customer', 'Abbasi P/S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:25:09', '2024-12-10 12:25:09'),
(123, 'business', 'customer', 'Lal Khan P/S', '   ', NULL, NULL, NULL, NULL, '03005620904', '03008567874', '03138144197', NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:26:52', '2024-12-20 11:57:41'),
(124, 'individual', 'customer', 'Haji Banaras  P/F', 'Haji Banaras  P/F', 'Haji', 'Banaras', NULL, 'P/F', '03429515400', '03018702378', NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:27:35', '2024-12-20 11:56:52'),
(125, 'business', 'customer', 'GEO Feeds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-10 12:27:54', '2024-12-10 12:27:54'),
(126, 'business', 'supplier', 'Shafiq Brother', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-11 12:19:12', '2024-12-11 12:19:12'),
(127, 'business', 'customer', 'Shani Jhari Kas', '   ', NULL, NULL, NULL, NULL, '03465458211', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-12 11:40:29', '2024-12-20 11:56:05'),
(128, 'individual', 'customer', 'Yasir  Khan(Wanda)', ' Yasir  Khan(Wanda)', NULL, 'Yasir', NULL, 'Khan(Wanda)', '03115948810', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-12 12:30:52', '2024-12-20 11:55:35'),
(129, 'business', 'supplier', 'Unity Foods Ltd (Karachi)', NULL, NULL, NULL, NULL, NULL, '03332908501', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-13 11:24:40', '2024-12-13 11:24:40'),
(130, 'individual', 'supplier', ' KOHISAR  GODOWN', NULL, NULL, 'KOHISAR', NULL, 'GODOWN', NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-13 14:30:56', '2024-12-13 14:30:56'),
(131, 'business', 'supplier', 'IBEX Tours', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-13 15:54:12', '2024-12-13 15:54:12'),
(132, 'individual', 'supplier', ' Amber Protine ', NULL, NULL, 'Amber', 'Protine', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-13 17:20:47', '2025-01-25 10:40:01'),
(133, 'business', 'supplier', 'Ghazi Brothers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-13 17:21:36', '2025-01-30 16:51:37'),
(134, 'business', 'supplier', 'Asian Trading', NULL, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-13 17:21:55', '2025-02-14 21:56:29'),
(135, 'individual', 'supplier', ' Khan Broker/Rasheed  ', NULL, NULL, 'Khan Broker/Rasheed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-20 08:09:19', '2024-12-20 08:09:19'),
(136, 'business', 'supplier', 'A.S Enterprises (Salt)', NULL, NULL, NULL, NULL, NULL, '03335128191', NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-24 12:08:46', '2025-01-28 11:05:09'),
(137, 'individual', 'supplier', ' Audit Kohisar  GODOWN', NULL, NULL, 'Audit Kohisar', NULL, 'GODOWN', NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2024-12-24 13:13:05', '2024-12-24 13:13:05'),
(138, 'business', 'supplier', 'Maan\'s Enterprises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-06 11:46:08', '2025-01-06 11:46:08'),
(139, 'business', 'supplier', 'Zamak International', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-06 11:46:34', '2025-01-06 11:46:34'),
(140, 'individual', 'supplier', ' Own Import  ', NULL, NULL, 'Own Import', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-09 14:51:28', '2025-01-09 14:51:28'),
(141, 'business', 'supplier', 'Jawad Impex', NULL, NULL, 'OPEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-09 14:53:41', '2025-02-07 15:15:34'),
(142, 'individual', 'customer', ' Muhamad Jameel ', NULL, NULL, 'Muhamad', 'Jameel', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-16 11:41:58', '2025-01-16 11:41:58'),
(143, 'business', 'supplier', 'Kemin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-18 11:52:16', '2025-01-18 11:52:16'),
(144, 'individual', 'supplier', ' Haris Marble Chips  ', NULL, NULL, 'Haris Marble Chips', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-23 09:48:08', '2025-01-23 09:48:08'),
(145, 'individual', 'customer', 'Haji Ilyas Karak ', NULL, 'Haji', 'Ilyas', 'Karak', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-24 14:52:15', '2025-01-24 14:52:15'),
(146, 'individual', 'supplier', ' Hammad Urea ', NULL, NULL, 'Hammad', 'Urea', NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-24 16:17:15', '2025-01-24 16:17:15'),
(147, 'business', 'supplier', 'Zaheer Traders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-28 11:03:51', '2025-01-28 11:03:51'),
(148, 'business', 'supplier', 'ASB Enterprises', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-01-29 09:13:49', '2025-01-29 09:13:49'),
(149, 'individual', 'supplier', 'Dr Shehzad (Broker) ', NULL, 'Dr', 'Shehzad', '(Broker)', NULL, '03008575038', '03218575038', NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-02-03 13:03:20', '2025-02-03 13:03:20'),
(150, 'individual', 'customer', ' Dr Asif (RWP)  ', NULL, NULL, 'Dr Asif (RWP)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 'days', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2025-02-15 10:46:23', '2025-02-15 10:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `party_warehouses`
--

CREATE TABLE `party_warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `party_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `party_warehouses`
--

INSERT INTO `party_warehouses` (`id`, `party_id`, `name`, `location`, `city`, `created_at`, `updated_at`) VALUES
(25, 102, 'Ayub Farm', 'Khanpur', NULL, '2024-12-10 13:07:00', '2024-12-10 13:07:00'),
(26, 102, 'safaida farm', 'mansehra', NULL, '2024-12-10 13:07:18', '2024-12-10 13:07:18'),
(27, 102, 'Qila Farm', 'Qila Sitar Shah', 'Lahore', '2024-12-10 13:07:54', '2024-12-10 13:07:54'),
(28, 102, 'Jahangeer Farm', 'Lahore', NULL, '2024-12-10 13:08:14', '2024-12-10 13:08:14'),
(29, 102, 'Dhankay Farm', 'Lahore', NULL, '2024-12-10 13:08:38', '2024-12-10 13:08:38'),
(30, 101, 'Baffa Farm', 'Mansehra', NULL, '2024-12-10 13:09:22', '2024-12-10 13:09:22'),
(31, 101, 'Oghi Farm', 'Oghi', NULL, '2024-12-10 13:10:23', '2024-12-10 13:10:23'),
(32, 101, 'Bahatar Farm', 'Bahatar', 'Attock', '2024-12-10 13:10:43', '2024-12-10 13:10:43'),
(33, 101, 'Data Farm', 'Data', 'Mansehra', '2024-12-10 13:11:02', '2024-12-10 13:11:02'),
(34, 101, 'Bao Bandi', 'Mansehra', NULL, '2024-12-10 13:11:45', '2024-12-10 13:11:45'),
(35, 101, 'Madan Farm', 'Mansehra', NULL, '2024-12-10 13:12:11', '2024-12-10 13:12:11'),
(36, 101, 'Malik Farm', 'Dabgran', 'Mansehra', '2024-12-10 13:12:31', '2024-12-10 13:12:31'),
(37, 117, 'Zamindar Farm', 'Mansehra', NULL, '2024-12-11 15:13:25', '2024-12-11 15:13:25'),
(38, 118, 'ajab farm', 'Mansehra', NULL, '2024-12-11 15:17:07', '2024-12-11 15:17:07'),
(39, 106, 'Havelian', 'Havelian', NULL, '2024-12-11 15:31:51', '2024-12-11 15:31:51'),
(40, 106, 'Mandian', 'Abbottabad', NULL, '2024-12-11 15:32:19', '2024-12-11 15:32:19'),
(41, 106, 'Qalandarabad', 'Qalandarabad', NULL, '2024-12-11 15:32:40', '2024-12-11 15:32:40'),
(42, 106, 'Lorah Chowk', 'Havelian', NULL, '2024-12-11 15:33:06', '2024-12-11 15:33:06'),
(43, 106, 'Baldhair', 'Havelian', NULL, '2024-12-11 15:33:21', '2024-12-11 15:33:21'),
(44, 106, 'Kholian', 'Havelian', NULL, '2024-12-11 15:33:34', '2024-12-11 15:33:34'),
(45, 106, 'Havelian Bypass', 'Havelian', NULL, '2024-12-11 15:33:52', '2024-12-11 15:33:52'),
(46, 103, 'Chinnar Road', 'Mansehra', NULL, '2024-12-11 15:34:31', '2024-12-11 15:34:31'),
(47, 105, 'Thakra', 'Mansehra', NULL, '2024-12-11 15:35:22', '2024-12-11 15:35:22'),
(48, 106, 'Karlan', 'Havelain', NULL, '2024-12-11 15:36:05', '2024-12-11 15:36:05'),
(49, 106, 'Do Nalian', 'Havelian', NULL, '2024-12-11 15:36:33', '2024-12-11 15:36:33'),
(50, 106, 'Sara e Salah', 'Havelian', NULL, '2024-12-11 15:36:54', '2024-12-11 15:36:54'),
(51, 113, 'Sherpao', 'Sherpao', NULL, '2024-12-11 16:14:01', '2024-12-11 16:14:01'),
(52, 119, 'Ahmed Nawaz Farm', 'Baidra', 'Mansehra', '2024-12-11 16:22:36', '2024-12-11 16:22:36'),
(53, 124, 'Rumi Farm', 'Tariha', 'Mansehra', '2024-12-11 16:34:15', '2024-12-11 16:34:15'),
(54, 124, 'Paracha Farm', 'Jaloo', 'Mansehra', '2024-12-11 16:34:29', '2024-12-11 16:34:29'),
(55, 124, 'Adil Farm', 'Jaloo', 'Mansehra', '2024-12-11 16:34:48', '2024-12-11 16:34:48'),
(56, 107, 'Eastern Farm (Smoot Farm)', 'Kalar syedan', NULL, '2024-12-11 16:43:37', '2024-12-11 16:43:37'),
(57, 123, 'Abbasi Farm ( College Doraha)', 'College Doraha', 'Mansehra', '2024-12-11 16:53:24', '2024-12-11 16:53:24'),
(58, 106, 'Dabgaran', 'Mansehra', NULL, '2024-12-11 17:45:10', '2024-12-11 17:45:10'),
(59, 110, 'Al Makkah Poultry', 'Mansehra', NULL, '2024-12-12 08:13:06', '2024-12-12 08:13:06'),
(60, 127, 'Jhari kas', 'Jhari kas', NULL, '2024-12-12 11:41:02', '2024-12-12 11:41:02'),
(61, 112, 'Oghi', 'Oghi', NULL, '2024-12-12 11:57:33', '2024-12-12 11:57:33'),
(62, 112, 'mian zahid attar shesha', 'mian zahid attar shesha', NULL, '2024-12-12 11:58:43', '2024-12-12 11:58:43'),
(63, 104, 'Chakwal', 'Chakwal', NULL, '2024-12-12 12:09:48', '2024-12-12 12:09:48'),
(64, 109, 'Amjad Khan', 'Mangal', NULL, '2024-12-12 12:28:20', '2024-12-12 12:28:20'),
(65, 111, 'Haji Altaf', 'Pindi Ghiap', NULL, '2024-12-12 12:29:26', '2024-12-12 12:29:26'),
(66, 111, 'Haji Khalid', 'Pindi Ghaip', NULL, '2024-12-12 12:29:45', '2024-12-12 12:29:45'),
(67, 128, 'Kot Najeeb Ullah', 'Haripur', NULL, '2024-12-12 12:31:25', '2024-12-12 12:31:25'),
(68, 116, 'township', 'Mansehra', NULL, '2024-12-12 13:24:23', '2024-12-12 13:24:23'),
(69, 102, 'Ehtisham Minhas', 'Ehtisham Minhas', NULL, '2024-12-13 10:24:11', '2024-12-13 10:24:11'),
(70, 102, 'Local Sale', 'Local Sale', NULL, '2024-12-13 10:24:29', '2024-12-13 10:24:29'),
(71, 102, 'Aqeel Ur Rehman', 'Mansehra (H/O)', NULL, '2024-12-13 10:25:04', '2024-12-13 10:25:04'),
(72, 120, 'Adnan Farm', 'Adnan Farm', NULL, '2024-12-13 16:37:25', '2024-12-13 16:37:25'),
(73, 106, 'Baffa Doraha', 'Mansehra', NULL, '2024-12-19 12:07:37', '2024-12-19 12:07:37'),
(74, 106, 'JHARIKAS', NULL, NULL, '2024-12-19 15:48:34', '2024-12-19 15:48:34'),
(75, 106, 'Abbottabad', 'Abbottabad', NULL, '2024-12-20 11:41:13', '2024-12-20 11:41:13'),
(76, 112, 'Ali Poultry', 'Punjab Chowk', 'Mansehra', '2025-01-08 15:25:14', '2025-01-08 15:25:14'),
(77, 121, 'Arshad Farm BAffa', 'Arshad Farm BAFFA', NULL, '2025-01-09 13:53:42', '2025-01-09 13:54:35'),
(78, 106, 'Mansehra', 'Mansehra', NULL, '2025-01-10 13:44:04', '2025-01-10 13:54:25'),
(79, 106, 'OGHI', NULL, NULL, '2025-01-11 09:08:07', '2025-01-11 09:08:07'),
(80, 112, 'Mansehra', 'Mansehra', NULL, '2025-01-13 11:12:48', '2025-01-13 11:12:48'),
(81, 122, 'Abbasi', 'Abbasi', 'College Doraha', '2025-01-15 14:34:58', '2025-01-15 14:34:58'),
(82, 142, 'Naeem Farm', 'Mangil', 'Mansehra', '2025-01-16 11:43:05', '2025-01-16 11:45:19'),
(83, 142, 'Zamindar Farm(TK Farm)', 'Mansehra', 'Mansehra', '2025-01-16 11:43:47', '2025-01-16 11:44:47'),
(84, 107, 'Dena', NULL, 'Rawalpindi', '2025-01-18 11:25:53', '2025-01-18 11:28:07'),
(85, 107, 'Chakwal', NULL, NULL, '2025-01-18 11:28:30', '2025-01-18 11:28:30'),
(86, 113, 'Shergarh', NULL, NULL, '2025-01-18 11:39:30', '2025-01-18 11:39:30'),
(87, 107, 'ATTOCK', NULL, NULL, '2025-01-23 11:11:16', '2025-01-23 11:11:16'),
(88, 145, 'KURAM', NULL, NULL, '2025-01-30 10:16:57', '2025-01-30 10:20:28'),
(89, 128, 'Mansehra', NULL, NULL, '2025-02-06 08:18:31', '2025-02-06 08:18:31'),
(90, 112, 'Balakot', NULL, NULL, '2025-02-10 15:05:38', '2025-02-10 15:05:38'),
(91, 150, 'ATTOCK', NULL, NULL, '2025-02-15 10:46:55', '2025-02-15 10:46:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodcuts`
--

CREATE TABLE `prodcuts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `start_date`, `start_time`, `item_id`, `name`, `description`, `total_quantity`, `is_active`, `end_date`, `end_time`, `created_by`, `created_at`, `updated_at`) VALUES
(2, '2024-08-05', '16:44:00', 92, '10', 'Broiler Breeder Male', 1000.2500, 0, '2025-01-21', '11:26:00', 1, NULL, '2025-01-21 11:26:38'),
(3, '2024-08-05', '16:46:00', 93, '17', 'Broiler Breeder Grower', 999.8200, 0, '2025-01-21', '11:29:00', 1, NULL, '2025-01-21 11:29:29'),
(4, '2024-11-06', NULL, 94, '18', 'Broiler Breeder Pre Lay', 1000.2500, 0, NULL, NULL, 1, NULL, NULL),
(5, '2024-12-02', NULL, 95, '19', 'Broiler Breeder Layer (Till 35 - 40 weeks)', 1000.0400, 0, '2025-01-21', '11:28:00', 1, NULL, '2025-01-21 11:28:37'),
(6, '2024-12-02', NULL, 96, '29', 'Broiler Breeder Layer (35th week to 50th week)', 1000.2200, 0, '2025-01-21', '11:29:00', 1, NULL, '2025-01-21 11:29:05'),
(7, '2024-12-02', NULL, 97, '29 - B', 'Broiler Breeder Layer (50th week onwards)', 1000.2000, 1, NULL, NULL, 1, NULL, NULL),
(8, '2024-11-18', NULL, 98, '14-A', 'Broiler Starter (Open House)', 999.9150, 0, NULL, NULL, 1, NULL, NULL),
(9, '2024-12-02', NULL, 99, '14', 'Broiler Grower (Open House)', 999.8350, 0, NULL, NULL, 1, NULL, NULL),
(10, '2024-12-02', NULL, 100, 'K 1', 'Broiler Starter (ECH)', 1000.0550, 0, NULL, NULL, 1, NULL, NULL),
(11, '2024-12-02', NULL, 101, 'K 2', 'Broiler Grower (ECH)', 1000.1650, 0, NULL, NULL, 1, NULL, NULL),
(12, '2024-12-02', NULL, 102, 'K 3', 'Broiler Finisher (ECH)', 1000.2350, 0, NULL, NULL, 1, NULL, NULL),
(13, '2024-11-04', NULL, 103, '27 -P', 'Wanda', 800.4000, 0, '2025-01-21', '11:35:00', 1, NULL, '2025-01-21 11:35:15'),
(14, '2024-11-05', NULL, 104, '26 - P', 'Wanda Diamond', 800.0000, 0, '2025-01-21', '11:34:00', 1, NULL, '2025-01-21 11:34:48'),
(15, '2024-11-05', NULL, 105, '25 - P', 'Wanda Gold', 800.0000, 0, '2025-01-21', '11:33:00', 1, NULL, '2025-01-21 11:33:40'),
(17, '2024-11-05', NULL, 106, '25 - M', 'Wanda Gold', 800.0000, 1, NULL, NULL, 1, NULL, NULL),
(18, '2024-11-05', NULL, 115, '26 - M', 'Wanda Diamond', 800.0000, 1, NULL, NULL, 1, NULL, NULL),
(19, '2024-11-05', NULL, 117, '25 - P20', 'Wanda Gold', 400.0000, 1, NULL, NULL, 1, NULL, NULL),
(20, '2024-08-27', NULL, 108, '22 - P', 'Wanda Rustam', 800.1000, 1, NULL, NULL, 1, NULL, NULL),
(22, '2024-08-28', NULL, 110, '24 - P', 'Wanda Silver', 800.1000, 1, NULL, NULL, 1, NULL, NULL),
(23, '2024-11-05', NULL, 109, '23 - P', 'Wanda Super', 799.9000, 0, '2024-12-09', '13:50:00', 1, NULL, '2024-12-09 13:50:35'),
(24, '2024-08-27', NULL, 113, '23 - M', 'Wanda Super', 799.9000, 1, NULL, NULL, 1, NULL, NULL),
(25, '2024-08-28', NULL, 114, '24 - M', 'Wanda Silver', 800.1000, 1, NULL, NULL, 1, NULL, NULL),
(26, '2024-08-27', NULL, 112, '22 - M', 'Wanda Rustam', 800.1000, 1, NULL, NULL, 1, NULL, NULL),
(27, '2024-12-04', NULL, NULL, '14-A', 'Broiler Starter (Open House)', 1000.0250, 0, NULL, NULL, 1, NULL, NULL),
(28, '2024-10-18', NULL, 124, 'KD - P', 'Wanda Kisan Dost', 601.1000, 0, '2024-12-09', '13:52:00', 1, NULL, '2024-12-09 13:52:57'),
(29, '2024-10-18', NULL, 125, 'KD - M', 'Wanda Kisan Dost', 601.1000, 0, '2024-12-09', '13:54:00', 1, NULL, '2024-12-09 13:54:42'),
(30, '2024-10-18', NULL, 124, 'KD - P', 'Wanda Kisan Dost', 601.1000, 0, '2024-12-09', '13:55:00', 1, NULL, '2024-12-09 13:55:34'),
(31, '2024-10-19', NULL, 125, 'KD - M', 'Wanda Kisan Dost', 601.1000, 1, NULL, NULL, 1, NULL, NULL),
(32, '2024-10-18', NULL, 124, 'KD - P', 'Wanda Kisan Dost', 601.1000, 1, NULL, NULL, 1, NULL, NULL),
(33, '2024-08-28', NULL, 109, '23 - P', 'Wanda Super', 799.9000, 1, NULL, NULL, 1, NULL, NULL),
(34, '2024-12-13', '14:20:00', NULL, 'Mineral Premix', 'Breeder', 375.0000, 1, NULL, NULL, 1, NULL, NULL),
(35, '2024-12-13', '14:24:00', NULL, 'Vitamin Premix', 'Breeder', 240.0000, 1, NULL, NULL, 1, NULL, NULL),
(36, '2024-12-13', '14:44:00', NULL, 'Wheat Bran', NULL, 50.0000, 1, NULL, NULL, 1, NULL, NULL),
(37, '2024-12-23', '09:29:00', 98, '14-A', 'Broiler Starter Open', 1000.0650, 0, NULL, NULL, 1, NULL, NULL),
(38, '2024-12-23', '09:38:00', 99, '14', 'Broiler Grower Open', 1000.0450, 0, NULL, NULL, 1, NULL, NULL),
(39, '2024-12-23', '09:43:00', 100, 'K 1', 'Broiler Starter ECH', 1000.3450, 0, NULL, NULL, 1, NULL, NULL),
(40, '2024-12-23', '09:49:00', 101, 'K 2', 'Brolier Grower ECH', 1000.2150, 0, NULL, NULL, 1, NULL, NULL),
(41, '2024-12-23', '09:52:00', 102, 'K 3', 'Broiler Finisher ECH', 999.9550, 0, NULL, NULL, 1, NULL, NULL),
(42, '2024-12-23', '09:57:00', 123, '16', 'Broiler Breeder Starter', 1000.1800, 0, '2025-01-21', '11:29:00', 1, NULL, '2025-01-21 11:29:55'),
(43, '2024-06-23', '10:06:00', 120, '11', 'Layer Starter', 999.7550, 0, '2025-01-21', '11:30:00', 1, NULL, '2025-01-21 11:30:18'),
(44, '2024-12-23', '10:15:00', 122, '13', 'Layer', 999.8350, 0, '2025-01-21', '11:30:00', 1, NULL, '2025-01-21 11:30:42'),
(45, '2024-12-23', '14:29:00', 130, 'Maize (Dall)', NULL, 50.0000, 1, NULL, NULL, 1, NULL, NULL),
(46, '2024-05-24', NULL, NULL, 'Zero Sp', 'Cage Feed', 1000.0000, 1, NULL, NULL, 1, NULL, NULL),
(47, '2025-01-01', '14:16:00', NULL, 'Feed Bags & Wood', 'Feed Bags & Wood', 40.0000, 1, NULL, NULL, 1, NULL, NULL),
(48, '2025-01-01', '14:30:00', NULL, 'Wanda Bags & Wood', 'Wanda Bags & Wood', 40.0000, 1, NULL, NULL, 1, NULL, NULL),
(49, '2025-01-02', '11:24:00', 134, 'Wanda Bags 20 Kg & Wood', 'Wanda Bags 20 Kg & Wood', 80.0000, 1, NULL, NULL, 1, NULL, NULL),
(50, '2025-01-04', NULL, NULL, 'Stock report 04-01-25', NULL, 2015.5000, 0, NULL, NULL, 1, NULL, NULL),
(51, '2025-01-06', NULL, 98, '14-A', 'Broiler Starter Open', 1000.0000, 0, '2025-01-21', '11:31:00', 1, NULL, '2025-01-21 11:31:11'),
(52, '2025-01-06', NULL, 99, '14', 'Broiler Grower Open', 1000.0000, 0, '2025-01-21', '11:31:00', 1, NULL, '2025-01-21 11:31:36'),
(53, '2025-01-06', NULL, 100, 'K-1', 'Broiler Starter ECH', 1000.0000, 0, '2025-01-21', '11:32:00', 1, NULL, '2025-01-21 11:32:06'),
(54, '2025-01-06', NULL, 101, 'K-2', 'Broiler Grower ECH', 1000.0000, 0, '2025-01-21', '11:32:00', 1, NULL, '2025-01-21 11:32:34'),
(55, '2025-01-06', NULL, 102, 'K-3', 'Broiler Finisher ECH', 1000.0000, 0, '2025-01-21', '11:33:00', 1, NULL, '2025-01-21 11:33:02'),
(56, '2025-01-11', NULL, NULL, 'Stock Report 11-01-2025', 'Maize Issued against Surplus amount', 2625.0000, 0, NULL, NULL, 1, NULL, NULL),
(57, '2025-01-18', NULL, NULL, 'STOCK REPORT 18-JAN-2025', NULL, 6248.8300, 0, NULL, NULL, 1, NULL, NULL),
(58, '2025-01-20', NULL, 92, '10', 'Broiler Breeder Male', 1000.3300, 1, NULL, NULL, 1, NULL, NULL),
(59, '2025-01-20', NULL, 95, '19', 'Broiler Breeder Layer (Till 35 - 40 weeks)', 1000.1100, 1, NULL, NULL, 1, NULL, NULL),
(60, '2025-01-20', NULL, 96, '29', 'Broiler Breeder Layer (35th week to 50th week)', 1000.2800, 1, NULL, NULL, 1, NULL, NULL),
(61, '2025-01-20', NULL, 93, '17', 'Broiler Breeder Grower', 999.8800, 1, NULL, NULL, 1, NULL, NULL),
(62, '2025-01-20', NULL, 123, '16', 'Broiler Breeder Starter', 1000.2900, 1, NULL, NULL, 1, NULL, NULL),
(63, '2025-01-20', NULL, 120, '11', 'Layer Starter', 999.8350, 1, NULL, NULL, 1, NULL, NULL),
(64, '2025-01-20', NULL, 122, '13', 'Layer', 999.9050, 1, NULL, NULL, 1, NULL, NULL),
(65, '2025-01-20', NULL, 98, '14-A', 'Broiler Starter Open', 1000.1400, 0, NULL, NULL, 1, NULL, NULL),
(66, '2025-01-20', NULL, 99, '14', 'Broiler Grower Open', 1000.1500, 0, NULL, NULL, 1, NULL, NULL),
(67, '2025-01-20', NULL, 100, 'K-1', 'Broiler Starter ECH', 1000.1500, 0, NULL, NULL, 1, NULL, NULL),
(68, '2025-01-20', NULL, 101, 'K-2', 'Broiler Grower ECH', 1000.1600, 0, NULL, NULL, 1, NULL, NULL),
(69, '2025-01-20', NULL, 102, 'K-3', 'Broiler Finisher ECH', 1000.1600, 0, NULL, NULL, 1, NULL, NULL),
(70, '2025-01-20', NULL, 105, '25 - P', 'Wanda Gold', 800.0000, 0, NULL, NULL, 1, NULL, NULL),
(71, '2025-01-20', NULL, 104, '26 - P', 'Wanda Diamond', 800.0000, 0, NULL, NULL, 1, NULL, NULL),
(72, '2025-01-20', NULL, 103, '27 -P', 'Wanda', 800.4000, 0, NULL, NULL, 1, NULL, NULL),
(73, '2025-01-23', NULL, 107, '21-P', 'Calf Starter', 800.0000, 1, NULL, NULL, 1, NULL, NULL),
(74, '2025-01-25', NULL, NULL, 'Stock Level Report 25-01-2025', 'Stock Level Report 25-01-2025', 3466.0000, 0, NULL, NULL, 1, NULL, NULL),
(75, '2025-01-27', NULL, 94, '18', 'Breeder Pre Layer', 1000.0500, 1, NULL, NULL, 1, NULL, NULL),
(76, '2025-01-27', NULL, 98, '14-A', 'Broiler Starter Open', 1000.0450, 1, NULL, NULL, 1, NULL, NULL),
(77, '2025-01-27', NULL, 99, '14', 'Broiler Grower Open', 1000.0750, 0, NULL, NULL, 1, NULL, NULL),
(78, '2025-01-27', NULL, 100, 'K-1', 'Broiler Starter ECH', 1000.0850, 1, NULL, NULL, 1, NULL, NULL),
(79, '2025-01-27', NULL, 101, 'K-2', 'Broiler Grower ECH', 1000.0750, 1, NULL, NULL, 1, NULL, NULL),
(80, '2025-01-27', NULL, 102, 'K-3', 'Broiler Finisher ECH', 1000.0150, 0, NULL, NULL, 1, NULL, NULL),
(81, '2025-01-31', '10:09:00', NULL, 'Stock Level 31-01-2025', 'Stock Level 31-01-2025', 2514.1400, 0, NULL, NULL, 1, NULL, NULL),
(82, '2025-02-01', '10:12:00', 105, '25-P', 'Kohisar Gold', 800.0000, 1, NULL, NULL, 1, NULL, NULL),
(83, '2025-02-01', '10:19:00', 104, '26-P', NULL, 800.0000, 1, NULL, NULL, 1, NULL, NULL),
(84, '2025-02-03', NULL, 103, '27-P', NULL, 800.0000, 1, NULL, NULL, 1, NULL, NULL),
(86, '2025-02-11', NULL, 102, 'K-3', NULL, 1000.0250, 1, NULL, NULL, 1, NULL, NULL),
(87, '2025-02-12', NULL, 99, '14', NULL, 999.9850, 1, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_detail`
--

CREATE TABLE `recipe_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_detail`
--

INSERT INTO `recipe_detail` (`id`, `recipe_id`, `item_id`, `unit_id`, `quantity`, `created_at`, `updated_at`) VALUES
(711, 3, 1, 1, 614.0000, NULL, NULL),
(712, 3, 5, 1, 100.0000, NULL, NULL),
(713, 3, 6, 1, 48.0000, NULL, NULL),
(714, 3, 8, 1, 20.0000, NULL, NULL),
(715, 3, 12, 1, 50.0000, NULL, NULL),
(716, 3, 15, 1, 82.0000, NULL, NULL),
(717, 3, 17, 1, 50.0000, NULL, NULL),
(718, 3, 22, 1, 12.0000, NULL, NULL),
(719, 3, 24, 1, 11.7000, NULL, NULL),
(720, 3, 30, 1, 0.3100, NULL, NULL),
(721, 3, 31, 1, 1.4400, NULL, NULL),
(722, 3, 36, 1, 0.7500, NULL, NULL),
(723, 3, 37, 1, 2.0700, NULL, NULL),
(724, 3, 38, 1, 3.0000, NULL, NULL),
(725, 3, 42, 1, 1.5000, NULL, NULL),
(726, 3, 43, 1, 1.2500, NULL, NULL),
(727, 3, 44, 1, 0.8000, NULL, NULL),
(728, 3, 47, 1, 0.2000, NULL, NULL),
(729, 3, 48, 1, 0.2000, NULL, NULL),
(730, 3, 58, 1, 0.1000, NULL, NULL),
(731, 3, 68, 1, 0.5000, NULL, NULL),
(753, 5, 1, 1, 640.0000, NULL, NULL),
(754, 5, 5, 1, 70.0000, NULL, NULL),
(755, 5, 7, 1, 25.0000, NULL, NULL),
(756, 5, 10, 1, 40.0000, NULL, NULL),
(757, 5, 12, 1, 50.0000, NULL, NULL),
(758, 5, 15, 1, 72.5000, NULL, NULL),
(759, 5, 22, 1, 79.0000, NULL, NULL),
(760, 5, 24, 1, 2.4500, NULL, NULL),
(761, 5, 25, 1, 5.0000, NULL, NULL),
(762, 5, 30, 1, 1.4300, NULL, NULL),
(763, 5, 31, 1, 1.7300, NULL, NULL),
(764, 5, 32, 1, 1.3200, NULL, NULL),
(765, 5, 33, 1, 0.4100, NULL, NULL),
(766, 5, 34, 1, 0.5700, NULL, NULL),
(767, 5, 35, 1, 0.3500, NULL, NULL),
(768, 5, 36, 1, 1.1000, NULL, NULL),
(769, 5, 37, 1, 1.7900, NULL, NULL),
(770, 5, 38, 1, 2.7400, NULL, NULL),
(771, 5, 42, 1, 1.5000, NULL, NULL),
(772, 5, 43, 1, 1.2500, NULL, NULL),
(773, 5, 44, 1, 0.8000, NULL, NULL),
(774, 5, 47, 1, 0.2000, NULL, NULL),
(775, 5, 48, 1, 0.2000, NULL, NULL),
(776, 5, 56, 1, 0.1000, NULL, NULL),
(777, 5, 58, 1, 0.1000, NULL, NULL),
(778, 5, 68, 1, 0.5000, NULL, NULL),
(779, 6, 1, 1, 675.0000, NULL, NULL),
(780, 6, 5, 1, 70.0000, NULL, NULL),
(781, 6, 7, 1, 17.0000, NULL, NULL),
(782, 6, 10, 1, 50.0000, NULL, NULL),
(783, 6, 12, 1, 34.0000, NULL, NULL),
(784, 6, 15, 1, 50.0000, NULL, NULL),
(785, 6, 22, 1, 85.0000, NULL, NULL),
(786, 6, 24, 1, 1.1700, NULL, NULL),
(787, 6, 30, 1, 1.5900, NULL, NULL),
(788, 6, 31, 1, 1.5300, NULL, NULL),
(789, 6, 32, 1, 1.7500, NULL, NULL),
(790, 6, 33, 1, 0.7400, NULL, NULL),
(791, 6, 34, 1, 0.6900, NULL, NULL),
(792, 6, 35, 1, 0.4000, NULL, NULL),
(793, 6, 36, 1, 1.3100, NULL, NULL),
(794, 6, 37, 1, 1.6600, NULL, NULL),
(795, 6, 38, 1, 2.7300, NULL, NULL),
(796, 6, 42, 1, 1.5000, NULL, NULL),
(797, 6, 43, 1, 1.2500, NULL, NULL),
(798, 6, 44, 1, 0.8000, NULL, NULL),
(799, 6, 47, 1, 0.2000, NULL, NULL),
(800, 6, 48, 1, 0.2000, NULL, NULL),
(801, 6, 56, 1, 0.1000, NULL, NULL),
(802, 6, 58, 1, 0.1000, NULL, NULL),
(803, 6, 62, 1, 1.0000, NULL, NULL),
(804, 6, 68, 1, 0.5000, NULL, NULL),
(980, 13, 1, 1, 290.0000, NULL, NULL),
(981, 13, 3, 1, 40.0000, NULL, NULL),
(982, 13, 4, 1, 80.0000, NULL, NULL),
(983, 13, 5, 1, 80.0000, NULL, NULL),
(984, 13, 7, 1, 24.0000, NULL, NULL),
(985, 13, 8, 1, 60.0000, NULL, NULL),
(986, 13, 13, 1, 23.0000, NULL, NULL),
(987, 13, 15, 1, 28.0000, NULL, NULL),
(988, 13, 19, 1, 56.0000, NULL, NULL),
(989, 13, 20, 1, 40.0000, NULL, NULL),
(990, 13, 21, 1, 35.0000, NULL, NULL),
(991, 13, 22, 1, 10.0000, NULL, NULL),
(992, 13, 24, 1, 4.0000, NULL, NULL),
(993, 13, 37, 1, 8.0000, NULL, NULL),
(994, 13, 38, 1, 2.0000, NULL, NULL),
(995, 13, 39, 1, 16.0000, NULL, NULL),
(996, 13, 41, 1, 2.4000, NULL, NULL),
(997, 13, 42, 1, 0.5000, NULL, NULL),
(998, 13, 59, 1, 0.4000, NULL, NULL),
(999, 13, 60, 1, 0.4000, NULL, NULL),
(1000, 13, 91, 1, 0.5000, NULL, NULL),
(1001, 13, 64, 1, 0.2000, NULL, NULL),
(1002, 14, 1, 1, 164.0000, NULL, NULL),
(1003, 14, 3, 1, 40.0000, NULL, NULL),
(1004, 14, 4, 1, 80.0000, NULL, NULL),
(1005, 14, 5, 1, 120.0000, NULL, NULL),
(1006, 14, 6, 1, 130.0000, NULL, NULL),
(1007, 14, 8, 1, 60.0000, NULL, NULL),
(1008, 14, 12, 1, 13.0000, NULL, NULL),
(1009, 14, 13, 1, 30.0000, NULL, NULL),
(1010, 14, 19, 1, 48.0000, NULL, NULL),
(1011, 14, 20, 1, 40.0000, NULL, NULL),
(1012, 14, 21, 1, 34.0000, NULL, NULL),
(1013, 14, 22, 1, 8.0000, NULL, NULL),
(1014, 14, 24, 1, 4.0000, NULL, NULL),
(1015, 14, 37, 1, 8.0000, NULL, NULL),
(1016, 14, 38, 1, 2.0000, NULL, NULL),
(1017, 14, 39, 1, 16.0000, NULL, NULL),
(1018, 14, 41, 1, 2.3000, NULL, NULL),
(1019, 14, 91, 1, 0.5000, NULL, NULL),
(1020, 14, 64, 1, 0.2000, NULL, NULL),
(1021, 15, 1, 1, 185.0000, NULL, NULL),
(1022, 15, 3, 1, 40.0000, NULL, NULL),
(1023, 15, 4, 1, 80.0000, NULL, NULL),
(1024, 15, 5, 1, 160.0000, NULL, NULL),
(1025, 15, 6, 1, 120.0000, NULL, NULL),
(1026, 15, 8, 1, 60.0000, NULL, NULL),
(1027, 15, 19, 1, 48.0000, NULL, NULL),
(1028, 15, 20, 1, 40.0000, NULL, NULL),
(1029, 15, 21, 1, 17.0000, NULL, NULL),
(1030, 15, 22, 1, 11.0000, NULL, NULL),
(1031, 15, 24, 1, 3.0000, NULL, NULL),
(1032, 15, 37, 1, 15.0000, NULL, NULL),
(1033, 15, 38, 1, 2.0000, NULL, NULL),
(1034, 15, 39, 1, 16.0000, NULL, NULL),
(1035, 15, 41, 1, 2.3000, NULL, NULL),
(1036, 15, 91, 1, 0.5000, NULL, NULL),
(1037, 15, 64, 1, 0.2000, NULL, NULL),
(1038, 17, 1, 1, 185.0000, NULL, NULL),
(1039, 17, 3, 1, 40.0000, NULL, NULL),
(1040, 17, 4, 1, 80.0000, NULL, NULL),
(1041, 17, 5, 1, 160.0000, NULL, NULL),
(1042, 17, 6, 1, 120.0000, NULL, NULL),
(1043, 17, 8, 1, 60.0000, NULL, NULL),
(1044, 17, 19, 1, 48.0000, NULL, NULL),
(1045, 17, 20, 1, 40.0000, NULL, NULL),
(1046, 17, 21, 1, 17.0000, NULL, NULL),
(1047, 17, 22, 1, 11.0000, NULL, NULL),
(1048, 17, 24, 1, 3.0000, NULL, NULL),
(1049, 17, 37, 1, 15.0000, NULL, NULL),
(1050, 17, 38, 1, 2.0000, NULL, NULL),
(1051, 17, 39, 1, 16.0000, NULL, NULL),
(1052, 17, 41, 1, 2.3000, NULL, NULL),
(1053, 17, 91, 1, 0.5000, NULL, NULL),
(1054, 17, 64, 1, 0.2000, NULL, NULL),
(1055, 18, 1, 1, 164.0000, NULL, NULL),
(1056, 18, 3, 1, 40.0000, NULL, NULL),
(1057, 18, 4, 1, 80.0000, NULL, NULL),
(1058, 18, 5, 1, 120.0000, NULL, NULL),
(1059, 18, 6, 1, 130.0000, NULL, NULL),
(1060, 18, 8, 1, 60.0000, NULL, NULL),
(1061, 18, 12, 1, 13.0000, NULL, NULL),
(1062, 18, 13, 1, 30.0000, NULL, NULL),
(1063, 18, 19, 1, 48.0000, NULL, NULL),
(1064, 18, 20, 1, 40.0000, NULL, NULL),
(1065, 18, 21, 1, 34.0000, NULL, NULL),
(1066, 18, 22, 1, 8.0000, NULL, NULL),
(1067, 18, 24, 1, 4.0000, NULL, NULL),
(1068, 18, 37, 1, 8.0000, NULL, NULL),
(1069, 18, 38, 1, 2.0000, NULL, NULL),
(1070, 18, 39, 1, 16.0000, NULL, NULL),
(1071, 18, 41, 1, 2.3000, NULL, NULL),
(1072, 18, 91, 1, 0.5000, NULL, NULL),
(1073, 18, 64, 1, 0.2000, NULL, NULL),
(1074, 19, 1, 1, 92.5000, NULL, NULL),
(1075, 19, 3, 1, 20.0000, NULL, NULL),
(1076, 19, 4, 1, 40.0000, NULL, NULL),
(1077, 19, 5, 1, 80.0000, NULL, NULL),
(1078, 19, 6, 1, 60.0000, NULL, NULL),
(1079, 19, 8, 1, 30.0000, NULL, NULL),
(1080, 19, 19, 1, 24.0000, NULL, NULL),
(1081, 19, 20, 1, 20.0000, NULL, NULL),
(1082, 19, 21, 1, 8.5000, NULL, NULL),
(1083, 19, 22, 1, 5.5000, NULL, NULL),
(1084, 19, 24, 1, 1.5000, NULL, NULL),
(1085, 19, 37, 1, 7.5000, NULL, NULL),
(1086, 19, 38, 1, 1.0000, NULL, NULL),
(1087, 19, 39, 1, 8.0000, NULL, NULL),
(1088, 19, 41, 1, 1.1500, NULL, NULL),
(1089, 19, 91, 1, 0.2500, NULL, NULL),
(1090, 19, 64, 1, 0.1000, NULL, NULL),
(1119, 23, 1, 1, 213.0000, NULL, NULL),
(1120, 23, 4, 1, 160.0000, NULL, NULL),
(1121, 23, 5, 1, 80.0000, NULL, NULL),
(1122, 23, 6, 1, 224.0000, NULL, NULL),
(1123, 23, 8, 1, 20.0000, NULL, NULL),
(1124, 23, 20, 1, 50.0000, NULL, NULL),
(1125, 23, 22, 1, 16.0000, NULL, NULL),
(1126, 23, 24, 1, 0.8000, NULL, NULL),
(1127, 23, 37, 1, 16.0000, NULL, NULL),
(1128, 23, 38, 1, 2.0000, NULL, NULL),
(1129, 23, 39, 1, 16.0000, NULL, NULL),
(1130, 23, 41, 1, 2.0000, NULL, NULL),
(1131, 23, 64, 1, 0.1000, NULL, NULL),
(1212, 28, 1, 1, 100.0000, NULL, NULL),
(1213, 28, 4, 1, 210.0000, NULL, NULL),
(1214, 28, 6, 1, 180.0000, NULL, NULL),
(1215, 28, 20, 1, 68.0000, NULL, NULL),
(1216, 28, 22, 1, 30.0000, NULL, NULL),
(1217, 28, 37, 1, 10.0000, NULL, NULL),
(1218, 28, 39, 1, 3.0000, NULL, NULL),
(1219, 28, 64, 1, 0.1000, NULL, NULL),
(1250, 29, 1, 1, 100.0000, NULL, NULL),
(1251, 29, 4, 1, 210.0000, NULL, NULL),
(1252, 29, 6, 1, 180.0000, NULL, NULL),
(1253, 29, 20, 1, 68.0000, NULL, NULL),
(1254, 29, 22, 1, 30.0000, NULL, NULL),
(1255, 29, 37, 1, 10.0000, NULL, NULL),
(1256, 29, 39, 1, 3.0000, NULL, NULL),
(1257, 29, 64, 1, 0.1000, NULL, NULL),
(1258, 30, 1, 1, 100.0000, NULL, NULL),
(1259, 30, 4, 1, 210.0000, NULL, NULL),
(1260, 30, 6, 1, 180.0000, NULL, NULL),
(1261, 30, 20, 1, 68.0000, NULL, NULL),
(1262, 30, 22, 1, 30.0000, NULL, NULL),
(1263, 30, 37, 1, 10.0000, NULL, NULL),
(1264, 30, 39, 1, 3.0000, NULL, NULL),
(1265, 30, 64, 1, 0.1000, NULL, NULL),
(1274, 32, 1, 1, 100.0000, NULL, NULL),
(1275, 32, 4, 1, 210.0000, NULL, NULL),
(1276, 32, 6, 1, 180.0000, NULL, NULL),
(1277, 32, 20, 1, 68.0000, NULL, NULL),
(1278, 32, 22, 1, 30.0000, NULL, NULL),
(1279, 32, 37, 1, 10.0000, NULL, NULL),
(1280, 32, 39, 1, 3.0000, NULL, NULL),
(1281, 32, 64, 1, 0.1000, NULL, NULL),
(1282, 31, 1, 1, 100.0000, NULL, NULL),
(1283, 31, 4, 1, 210.0000, NULL, NULL),
(1284, 31, 6, 1, 180.0000, NULL, NULL),
(1285, 31, 20, 1, 68.0000, NULL, NULL),
(1286, 31, 22, 1, 30.0000, NULL, NULL),
(1287, 31, 37, 1, 10.0000, NULL, NULL),
(1288, 31, 39, 1, 3.0000, NULL, NULL),
(1289, 31, 64, 1, 0.1000, NULL, NULL),
(1290, 33, 1, 1, 213.0000, NULL, NULL),
(1291, 33, 4, 1, 160.0000, NULL, NULL),
(1292, 33, 5, 1, 80.0000, NULL, NULL),
(1293, 33, 6, 1, 224.0000, NULL, NULL),
(1294, 33, 8, 1, 20.0000, NULL, NULL),
(1295, 33, 20, 1, 50.0000, NULL, NULL),
(1296, 33, 22, 1, 16.0000, NULL, NULL),
(1297, 33, 24, 1, 0.8000, NULL, NULL),
(1298, 33, 37, 1, 16.0000, NULL, NULL),
(1299, 33, 38, 1, 2.0000, NULL, NULL),
(1300, 33, 39, 1, 16.0000, NULL, NULL),
(1301, 33, 41, 1, 2.0000, NULL, NULL),
(1302, 33, 64, 1, 0.1000, NULL, NULL),
(1303, 20, 1, 1, 240.0000, NULL, NULL),
(1304, 20, 4, 1, 40.0000, NULL, NULL),
(1305, 20, 5, 1, 184.0000, NULL, NULL),
(1306, 20, 6, 1, 160.0000, NULL, NULL),
(1307, 20, 8, 1, 40.0000, NULL, NULL),
(1308, 20, 20, 1, 40.0000, NULL, NULL),
(1309, 20, 21, 1, 43.0000, NULL, NULL),
(1310, 20, 22, 1, 16.0000, NULL, NULL),
(1311, 20, 24, 1, 3.0000, NULL, NULL),
(1312, 20, 37, 1, 13.5000, NULL, NULL),
(1313, 20, 38, 1, 2.0000, NULL, NULL),
(1314, 20, 39, 1, 16.0000, NULL, NULL),
(1315, 20, 41, 1, 2.0000, NULL, NULL),
(1316, 20, 91, 1, 0.5000, NULL, NULL),
(1317, 20, 64, 1, 0.1000, NULL, NULL),
(1318, 26, 1, 1, 240.0000, NULL, NULL),
(1319, 26, 4, 1, 40.0000, NULL, NULL),
(1320, 26, 5, 1, 184.0000, NULL, NULL),
(1321, 26, 6, 1, 160.0000, NULL, NULL),
(1322, 26, 8, 1, 40.0000, NULL, NULL),
(1323, 26, 20, 1, 40.0000, NULL, NULL),
(1324, 26, 21, 1, 43.0000, NULL, NULL),
(1325, 26, 22, 1, 16.0000, NULL, NULL),
(1326, 26, 24, 1, 3.0000, NULL, NULL),
(1327, 26, 37, 1, 13.5000, NULL, NULL),
(1328, 26, 38, 1, 2.0000, NULL, NULL),
(1329, 26, 39, 1, 16.0000, NULL, NULL),
(1330, 26, 41, 1, 2.0000, NULL, NULL),
(1331, 26, 91, 1, 0.5000, NULL, NULL),
(1332, 26, 64, 1, 0.1000, NULL, NULL),
(1333, 24, 1, 1, 213.0000, NULL, NULL),
(1334, 24, 4, 1, 160.0000, NULL, NULL),
(1335, 24, 5, 1, 80.0000, NULL, NULL),
(1336, 24, 6, 1, 224.0000, NULL, NULL),
(1337, 24, 8, 1, 20.0000, NULL, NULL),
(1338, 24, 20, 1, 50.0000, NULL, NULL),
(1339, 24, 22, 1, 16.0000, NULL, NULL),
(1340, 24, 24, 1, 0.8000, NULL, NULL),
(1341, 24, 37, 1, 16.0000, NULL, NULL),
(1342, 24, 38, 1, 2.0000, NULL, NULL),
(1343, 24, 39, 1, 16.0000, NULL, NULL),
(1344, 24, 41, 1, 2.0000, NULL, NULL),
(1345, 24, 64, 1, 0.1000, NULL, NULL),
(1346, 25, 1, 1, 160.0000, NULL, NULL),
(1347, 25, 4, 1, 40.0000, NULL, NULL),
(1348, 25, 5, 1, 200.0000, NULL, NULL),
(1349, 25, 6, 1, 255.0000, NULL, NULL),
(1350, 25, 8, 1, 40.0000, NULL, NULL),
(1351, 25, 20, 1, 50.0000, NULL, NULL),
(1352, 25, 22, 1, 16.0000, NULL, NULL),
(1353, 25, 24, 1, 4.0000, NULL, NULL),
(1354, 25, 37, 1, 15.0000, NULL, NULL),
(1355, 25, 38, 1, 2.0000, NULL, NULL),
(1356, 25, 39, 1, 16.0000, NULL, NULL),
(1357, 25, 41, 1, 2.0000, NULL, NULL),
(1358, 25, 64, 1, 0.1000, NULL, NULL),
(1359, 22, 1, 1, 160.0000, NULL, NULL),
(1360, 22, 4, 1, 40.0000, NULL, NULL),
(1361, 22, 5, 1, 200.0000, NULL, NULL),
(1362, 22, 6, 1, 255.0000, NULL, NULL),
(1363, 22, 8, 1, 40.0000, NULL, NULL),
(1364, 22, 20, 1, 50.0000, NULL, NULL),
(1365, 22, 22, 1, 16.0000, NULL, NULL),
(1366, 22, 24, 1, 4.0000, NULL, NULL),
(1367, 22, 37, 1, 15.0000, NULL, NULL),
(1368, 22, 38, 1, 2.0000, NULL, NULL),
(1369, 22, 39, 1, 16.0000, NULL, NULL),
(1370, 22, 41, 1, 2.0000, NULL, NULL),
(1371, 22, 64, 1, 0.1000, NULL, NULL),
(1402, 7, 1, 1, 680.5000, NULL, NULL),
(1403, 7, 5, 1, 70.0000, NULL, NULL),
(1404, 7, 7, 1, 15.6000, NULL, NULL),
(1405, 7, 10, 1, 50.0000, NULL, NULL),
(1406, 7, 12, 1, 28.0000, NULL, NULL),
(1407, 7, 15, 1, 50.0000, NULL, NULL),
(1408, 7, 22, 1, 88.0000, NULL, NULL),
(1409, 7, 24, 1, 0.6900, NULL, NULL),
(1410, 7, 30, 1, 1.3800, NULL, NULL),
(1411, 7, 31, 1, 1.4100, NULL, NULL),
(1412, 7, 32, 1, 1.6600, NULL, NULL),
(1413, 7, 33, 1, 0.7200, NULL, NULL),
(1414, 7, 34, 1, 0.6800, NULL, NULL),
(1415, 7, 35, 1, 0.3200, NULL, NULL),
(1416, 7, 36, 1, 1.1800, NULL, NULL),
(1417, 7, 37, 1, 1.6700, NULL, NULL),
(1418, 7, 38, 1, 2.7400, NULL, NULL),
(1419, 7, 42, 1, 1.5000, NULL, NULL),
(1420, 7, 43, 1, 1.2500, NULL, NULL),
(1421, 7, 44, 1, 0.8000, NULL, NULL),
(1422, 7, 47, 1, 0.2000, NULL, NULL),
(1423, 7, 48, 1, 0.2000, NULL, NULL),
(1424, 7, 56, 1, 0.1000, NULL, NULL),
(1425, 7, 58, 1, 0.1000, NULL, NULL),
(1426, 7, 62, 1, 1.0000, NULL, NULL),
(1427, 7, 68, 1, 0.5000, NULL, NULL),
(1550, 8, 1, 1, 563.0000, NULL, NULL),
(1551, 8, 5, 1, 70.0000, NULL, NULL),
(1552, 8, 8, 1, 20.0000, NULL, NULL),
(1553, 8, 9, 1, 30.0000, NULL, NULL),
(1554, 8, 10, 1, 50.0000, NULL, NULL),
(1555, 8, 12, 1, 70.0000, NULL, NULL),
(1556, 8, 13, 1, 30.0000, NULL, NULL),
(1557, 8, 15, 1, 107.5000, NULL, NULL),
(1558, 8, 17, 1, 20.0000, NULL, NULL),
(1559, 8, 22, 1, 11.5000, NULL, NULL),
(1560, 8, 30, 1, 7.9400, NULL, NULL),
(1561, 8, 31, 1, 3.5200, NULL, NULL),
(1562, 8, 32, 1, 2.4900, NULL, NULL),
(1563, 8, 33, 1, 2.0000, NULL, NULL),
(1564, 8, 34, 1, 1.5000, NULL, NULL),
(1565, 8, 35, 1, 0.2900, NULL, NULL),
(1566, 8, 36, 1, 2.2700, NULL, NULL),
(1567, 8, 37, 1, 1.7100, NULL, NULL),
(1568, 8, 38, 1, 2.7800, NULL, NULL),
(1569, 8, 40, 1, 0.3000, NULL, NULL),
(1570, 8, 42, 1, 0.7000, NULL, NULL),
(1571, 8, 45, 1, 0.5000, NULL, NULL),
(1572, 8, 46, 1, 0.5000, NULL, NULL),
(1573, 8, 49, 1, 0.2000, NULL, NULL),
(1574, 8, 51, 1, 0.2900, NULL, NULL),
(1575, 8, 54, 1, 0.1000, NULL, NULL),
(1576, 8, 55, 1, 0.1000, NULL, NULL),
(1577, 8, 57, 1, 0.1500, NULL, NULL),
(1578, 8, 58, 1, 0.2000, NULL, NULL),
(1579, 8, 89, 1, 0.1250, NULL, NULL),
(1580, 8, 61, 1, 0.2500, NULL, NULL),
(1581, 34, 69, 1, 24.0000, NULL, NULL),
(1582, 34, 70, 1, 75.0000, NULL, NULL),
(1583, 34, 71, 1, 120.0000, NULL, NULL),
(1584, 34, 72, 1, 105.0000, NULL, NULL),
(1585, 34, 73, 1, 1.8000, NULL, NULL),
(1586, 34, 74, 1, 22.5000, NULL, NULL),
(1587, 34, 75, 1, 3.0000, NULL, NULL),
(1588, 34, 6, 1, 23.7000, NULL, NULL),
(1589, 35, 76, 1, 5.4000, NULL, NULL),
(1590, 35, 77, 1, 3.6000, NULL, NULL),
(1591, 35, 78, 1, 7.5000, NULL, NULL),
(1592, 35, 79, 1, 90.0000, NULL, NULL),
(1593, 35, 80, 1, 2.4000, NULL, NULL),
(1594, 35, 81, 1, 9.0000, NULL, NULL),
(1595, 35, 82, 1, 24.0000, NULL, NULL),
(1596, 35, 83, 1, 9.0000, NULL, NULL),
(1597, 35, 84, 1, 3.0000, NULL, NULL),
(1598, 35, 85, 1, 9.0000, NULL, NULL),
(1599, 35, 86, 1, 1.8000, NULL, NULL),
(1600, 35, 88, 1, 2.7000, NULL, NULL),
(1601, 35, 89, 1, 37.5000, NULL, NULL),
(1602, 35, 6, 1, 35.1000, NULL, NULL),
(1603, 36, 6, 1, 50.0000, NULL, NULL),
(1635, 27, 1, 1, 560.0000, NULL, NULL),
(1636, 27, 5, 1, 70.0000, NULL, NULL),
(1637, 27, 8, 1, 20.0000, NULL, NULL),
(1638, 27, 9, 1, 30.0000, NULL, NULL),
(1639, 27, 10, 1, 50.0000, NULL, NULL),
(1640, 27, 12, 1, 70.0000, NULL, NULL),
(1641, 27, 13, 1, 30.0000, NULL, NULL),
(1642, 27, 15, 1, 111.0000, NULL, NULL),
(1643, 27, 17, 1, 20.0000, NULL, NULL),
(1644, 27, 22, 1, 11.5000, NULL, NULL),
(1645, 27, 30, 1, 7.9100, NULL, NULL),
(1646, 27, 31, 1, 3.5300, NULL, NULL),
(1647, 27, 32, 1, 2.4600, NULL, NULL),
(1648, 27, 33, 1, 1.9800, NULL, NULL),
(1649, 27, 34, 1, 1.4900, NULL, NULL),
(1650, 27, 35, 1, 0.2800, NULL, NULL),
(1651, 27, 36, 1, 2.2600, NULL, NULL),
(1652, 27, 37, 1, 1.7100, NULL, NULL),
(1653, 27, 38, 1, 2.7800, NULL, NULL),
(1654, 27, 40, 1, 0.3000, NULL, NULL),
(1655, 27, 42, 1, 0.7000, NULL, NULL),
(1656, 27, 45, 1, 0.5000, NULL, NULL),
(1657, 27, 46, 1, 0.5000, NULL, NULL),
(1658, 27, 49, 1, 0.2000, NULL, NULL),
(1659, 27, 54, 1, 0.1000, NULL, NULL),
(1660, 27, 55, 1, 0.1000, NULL, NULL),
(1661, 27, 57, 1, 0.1500, NULL, NULL),
(1662, 27, 58, 1, 0.2000, NULL, NULL),
(1663, 27, 89, 1, 0.1250, NULL, NULL),
(1664, 27, 61, 1, 0.2500, NULL, NULL),
(1786, 42, 1, 1, 571.5000, NULL, NULL),
(1787, 42, 5, 1, 80.0000, NULL, NULL),
(1788, 42, 7, 1, 20.0000, NULL, NULL),
(1789, 42, 12, 1, 80.0000, NULL, NULL),
(1790, 42, 15, 1, 152.0000, NULL, NULL),
(1791, 42, 17, 1, 50.0000, NULL, NULL),
(1792, 42, 22, 1, 11.0000, NULL, NULL),
(1793, 42, 24, 1, 14.3700, NULL, NULL),
(1794, 42, 30, 1, 5.5100, NULL, NULL),
(1795, 42, 31, 1, 2.5900, NULL, NULL),
(1796, 42, 32, 1, 1.4000, NULL, NULL),
(1797, 42, 33, 1, 0.4600, NULL, NULL),
(1798, 42, 34, 1, 0.3100, NULL, NULL),
(1799, 42, 35, 1, 0.2400, NULL, NULL),
(1800, 42, 36, 1, 1.1500, NULL, NULL),
(1801, 42, 37, 1, 2.4800, NULL, NULL),
(1802, 42, 38, 1, 2.8400, NULL, NULL),
(1803, 42, 40, 1, 0.5000, NULL, NULL),
(1804, 42, 42, 1, 1.0000, NULL, NULL),
(1805, 42, 43, 1, 1.2500, NULL, NULL),
(1806, 42, 44, 1, 0.8000, NULL, NULL),
(1807, 42, 47, 1, 0.2000, NULL, NULL),
(1808, 42, 48, 1, 0.2000, NULL, NULL),
(1809, 42, 56, 1, 0.1300, NULL, NULL),
(1810, 42, 57, 1, 0.1500, NULL, NULL),
(1811, 42, 58, 1, 0.1000, NULL, NULL),
(1812, 9, 1, 1, 612.0000, NULL, NULL),
(1813, 9, 5, 1, 70.0000, NULL, NULL),
(1814, 9, 9, 1, 50.0000, NULL, NULL),
(1815, 9, 10, 1, 50.0000, NULL, NULL),
(1816, 9, 12, 1, 49.0000, NULL, NULL),
(1817, 9, 13, 1, 35.0000, NULL, NULL),
(1818, 9, 15, 1, 80.0000, NULL, NULL),
(1819, 9, 17, 1, 18.0000, NULL, NULL),
(1820, 9, 22, 1, 7.5000, NULL, NULL),
(1821, 9, 30, 1, 8.1000, NULL, NULL),
(1822, 9, 31, 1, 3.5200, NULL, NULL),
(1823, 9, 32, 1, 2.6900, NULL, NULL),
(1824, 9, 33, 1, 2.1100, NULL, NULL),
(1825, 9, 34, 1, 1.5200, NULL, NULL),
(1826, 9, 35, 1, 0.3500, NULL, NULL),
(1827, 9, 36, 1, 2.2300, NULL, NULL),
(1828, 9, 37, 1, 1.3300, NULL, NULL),
(1829, 9, 38, 1, 2.5200, NULL, NULL),
(1830, 9, 40, 1, 0.3000, NULL, NULL),
(1831, 9, 42, 1, 0.7000, NULL, NULL),
(1832, 9, 45, 1, 0.5000, NULL, NULL),
(1833, 9, 46, 1, 0.5000, NULL, NULL),
(1834, 9, 49, 1, 0.2000, NULL, NULL),
(1835, 9, 51, 1, 0.8400, NULL, NULL),
(1836, 9, 54, 1, 0.1000, NULL, NULL),
(1837, 9, 55, 1, 0.1000, NULL, NULL),
(1838, 9, 57, 1, 0.1500, NULL, NULL),
(1839, 9, 58, 1, 0.2000, NULL, NULL),
(1840, 9, 89, 1, 0.1250, NULL, NULL),
(1841, 9, 61, 1, 0.2500, NULL, NULL),
(1903, 10, 1, 1, 564.0000, NULL, NULL),
(1904, 10, 5, 1, 50.0000, NULL, NULL),
(1905, 10, 7, 1, 20.0000, NULL, NULL),
(1906, 10, 9, 1, 30.0000, NULL, NULL),
(1907, 10, 10, 1, 50.0000, NULL, NULL),
(1908, 10, 12, 1, 70.0000, NULL, NULL),
(1909, 10, 13, 1, 30.0000, NULL, NULL),
(1910, 10, 15, 1, 149.0000, NULL, NULL),
(1911, 10, 22, 1, 11.5000, NULL, NULL),
(1912, 10, 30, 1, 7.4100, NULL, NULL),
(1913, 10, 31, 1, 3.4400, NULL, NULL),
(1914, 10, 32, 1, 2.2300, NULL, NULL),
(1915, 10, 33, 1, 1.5000, NULL, NULL),
(1916, 10, 34, 1, 1.1500, NULL, NULL),
(1917, 10, 35, 1, 0.2100, NULL, NULL),
(1918, 10, 36, 1, 1.9900, NULL, NULL),
(1919, 10, 37, 1, 1.7900, NULL, NULL),
(1920, 10, 38, 1, 2.7600, NULL, NULL),
(1921, 10, 40, 1, 0.3000, NULL, NULL),
(1922, 10, 42, 1, 0.7000, NULL, NULL),
(1923, 10, 45, 1, 0.5000, NULL, NULL),
(1924, 10, 46, 1, 0.5000, NULL, NULL),
(1925, 10, 49, 1, 0.2000, NULL, NULL),
(1926, 10, 54, 1, 0.1000, NULL, NULL),
(1927, 10, 55, 1, 0.0500, NULL, NULL),
(1928, 10, 57, 1, 0.1500, NULL, NULL),
(1929, 10, 58, 1, 0.2000, NULL, NULL),
(1930, 10, 89, 1, 0.1250, NULL, NULL),
(1931, 10, 61, 1, 0.2500, NULL, NULL),
(1932, 11, 1, 1, 612.0000, NULL, NULL),
(1933, 11, 5, 1, 60.0000, NULL, NULL),
(1934, 11, 9, 1, 50.0000, NULL, NULL),
(1935, 11, 10, 1, 50.0000, NULL, NULL),
(1936, 11, 12, 1, 70.0000, NULL, NULL),
(1937, 11, 13, 1, 30.0000, NULL, NULL),
(1938, 11, 15, 1, 89.5000, NULL, NULL),
(1939, 11, 22, 1, 9.0000, NULL, NULL),
(1940, 11, 30, 1, 8.3500, NULL, NULL),
(1941, 11, 31, 1, 3.7400, NULL, NULL),
(1942, 11, 32, 1, 2.9900, NULL, NULL),
(1943, 11, 33, 1, 2.2600, NULL, NULL),
(1944, 11, 34, 1, 1.7000, NULL, NULL),
(1945, 11, 35, 1, 0.3800, NULL, NULL),
(1946, 11, 36, 1, 2.3700, NULL, NULL),
(1947, 11, 37, 1, 1.3500, NULL, NULL),
(1948, 11, 38, 1, 2.4700, NULL, NULL),
(1949, 11, 40, 1, 0.3000, NULL, NULL),
(1950, 11, 42, 1, 0.7000, NULL, NULL),
(1951, 11, 45, 1, 0.5000, NULL, NULL),
(1952, 11, 46, 1, 0.5000, NULL, NULL),
(1953, 11, 50, 1, 0.2500, NULL, NULL),
(1954, 11, 51, 1, 0.8300, NULL, NULL),
(1955, 11, 52, 1, 0.1500, NULL, NULL),
(1956, 11, 55, 1, 0.1000, NULL, NULL),
(1957, 11, 57, 1, 0.1500, NULL, NULL),
(1958, 11, 58, 1, 0.2000, NULL, NULL),
(1959, 11, 89, 1, 0.1250, NULL, NULL),
(1960, 11, 61, 1, 0.2500, NULL, NULL),
(1961, 12, 1, 1, 633.0000, NULL, NULL),
(1962, 12, 5, 1, 60.0000, NULL, NULL),
(1963, 12, 9, 1, 50.0000, NULL, NULL),
(1964, 12, 10, 1, 44.0000, NULL, NULL),
(1965, 12, 12, 1, 51.0000, NULL, NULL),
(1966, 12, 13, 1, 35.0000, NULL, NULL),
(1967, 12, 15, 1, 80.0000, NULL, NULL),
(1968, 12, 22, 1, 7.0000, NULL, NULL),
(1969, 12, 25, 1, 10.0000, NULL, NULL),
(1970, 12, 30, 1, 8.4200, NULL, NULL),
(1971, 12, 31, 1, 3.8500, NULL, NULL),
(1972, 12, 32, 1, 3.0500, NULL, NULL),
(1973, 12, 33, 1, 2.4700, NULL, NULL),
(1974, 12, 34, 1, 1.8200, NULL, NULL),
(1975, 12, 35, 1, 0.4000, NULL, NULL),
(1976, 12, 36, 1, 2.3500, NULL, NULL),
(1977, 12, 37, 1, 1.6000, NULL, NULL),
(1978, 12, 38, 1, 2.2700, NULL, NULL),
(1979, 12, 40, 1, 0.3000, NULL, NULL),
(1980, 12, 42, 1, 0.6000, NULL, NULL),
(1981, 12, 45, 1, 0.5000, NULL, NULL),
(1982, 12, 46, 1, 0.5000, NULL, NULL),
(1983, 12, 50, 1, 0.2500, NULL, NULL),
(1984, 12, 51, 1, 0.8800, NULL, NULL),
(1985, 12, 52, 1, 0.1500, NULL, NULL),
(1986, 12, 55, 1, 0.1000, NULL, NULL),
(1987, 12, 57, 1, 0.1500, NULL, NULL),
(1988, 12, 58, 1, 0.2000, NULL, NULL),
(1989, 12, 89, 1, 0.1250, NULL, NULL),
(1990, 12, 61, 1, 0.2500, NULL, NULL),
(2051, 43, 1, 1, 637.0000, NULL, NULL),
(2052, 43, 5, 1, 60.0000, NULL, NULL),
(2053, 43, 7, 1, 25.0000, NULL, NULL),
(2054, 43, 9, 1, 30.0000, NULL, NULL),
(2055, 43, 10, 1, 50.0000, NULL, NULL),
(2056, 43, 12, 1, 80.0000, NULL, NULL),
(2057, 43, 13, 1, 20.0000, NULL, NULL),
(2058, 43, 15, 1, 43.0000, NULL, NULL),
(2059, 43, 17, 1, 20.0000, NULL, NULL),
(2060, 43, 22, 1, 12.0000, NULL, NULL),
(2061, 43, 24, 1, 1.4200, NULL, NULL),
(2062, 43, 30, 1, 6.7400, NULL, NULL),
(2063, 43, 31, 1, 1.9800, NULL, NULL),
(2064, 43, 32, 1, 1.9200, NULL, NULL),
(2065, 43, 33, 1, 1.3700, NULL, NULL),
(2066, 43, 34, 1, 0.7500, NULL, NULL),
(2067, 43, 36, 1, 1.3200, NULL, NULL),
(2068, 43, 37, 1, 1.7300, NULL, NULL),
(2069, 43, 38, 1, 3.0000, NULL, NULL),
(2070, 43, 40, 1, 0.3000, NULL, NULL),
(2071, 43, 42, 1, 0.7000, NULL, NULL),
(2072, 43, 45, 1, 0.5000, NULL, NULL),
(2073, 43, 46, 1, 0.5000, NULL, NULL),
(2074, 43, 49, 1, 0.2000, NULL, NULL),
(2075, 43, 54, 1, 0.1000, NULL, NULL),
(2076, 43, 58, 1, 0.1000, NULL, NULL),
(2077, 43, 89, 1, 0.1250, NULL, NULL),
(2101, 44, 1, 1, 596.0000, NULL, NULL),
(2102, 44, 5, 1, 61.0000, NULL, NULL),
(2103, 44, 7, 1, 25.0000, NULL, NULL),
(2104, 44, 9, 1, 25.0000, NULL, NULL),
(2105, 44, 10, 1, 60.0000, NULL, NULL),
(2106, 44, 12, 1, 50.0000, NULL, NULL),
(2107, 44, 15, 1, 80.0000, NULL, NULL),
(2108, 44, 22, 1, 91.0000, NULL, NULL),
(2109, 44, 30, 1, 2.1100, NULL, NULL),
(2110, 44, 31, 1, 1.7100, NULL, NULL),
(2111, 44, 33, 1, 0.5600, NULL, NULL),
(2112, 44, 35, 1, 0.3900, NULL, NULL),
(2113, 44, 36, 1, 0.1700, NULL, NULL),
(2114, 44, 37, 1, 1.6000, NULL, NULL),
(2115, 44, 38, 1, 2.2700, NULL, NULL),
(2116, 44, 40, 1, 0.3000, NULL, NULL),
(2117, 44, 42, 1, 0.7000, NULL, NULL),
(2118, 44, 45, 1, 0.7500, NULL, NULL),
(2119, 44, 46, 1, 0.7500, NULL, NULL),
(2120, 44, 53, 1, 0.2000, NULL, NULL),
(2121, 44, 55, 1, 0.1000, NULL, NULL),
(2122, 44, 58, 1, 0.1000, NULL, NULL),
(2123, 44, 89, 1, 0.1250, NULL, NULL),
(2124, 45, 1, 1, 50.0000, NULL, NULL),
(2199, 47, 29, 1, 20.0000, NULL, NULL),
(2200, 47, 129, 1, 20.0000, NULL, NULL),
(2201, 48, 28, 1, 20.0000, NULL, NULL),
(2202, 48, 129, 1, 20.0000, NULL, NULL),
(2203, 49, 27, 1, 40.0000, NULL, NULL),
(2204, 49, 129, 1, 40.0000, NULL, NULL),
(3165, 38, 1, 1, 464.5000, NULL, NULL),
(3166, 38, 2, 1, 150.0000, NULL, NULL),
(3167, 38, 5, 1, 70.0000, NULL, NULL),
(3168, 38, 9, 1, 50.0000, NULL, NULL),
(3169, 38, 10, 1, 49.0000, NULL, NULL),
(3170, 38, 12, 1, 36.0000, NULL, NULL),
(3171, 38, 13, 1, 35.0000, NULL, NULL),
(3172, 38, 15, 1, 90.0000, NULL, NULL),
(3173, 38, 17, 1, 20.0000, NULL, NULL),
(3174, 38, 22, 1, 8.6000, NULL, NULL),
(3175, 38, 30, 1, 7.9400, NULL, NULL),
(3176, 38, 31, 1, 3.4500, NULL, NULL),
(3177, 38, 32, 1, 2.1800, NULL, NULL),
(3178, 38, 33, 1, 2.0000, NULL, NULL),
(3179, 38, 34, 1, 1.4000, NULL, NULL),
(3180, 38, 35, 1, 0.2400, NULL, NULL),
(3181, 38, 36, 1, 2.2100, NULL, NULL),
(3182, 38, 37, 1, 1.4000, NULL, NULL),
(3183, 38, 38, 1, 2.4000, NULL, NULL),
(3184, 38, 40, 1, 0.3000, NULL, NULL),
(3185, 38, 42, 1, 0.7000, NULL, NULL),
(3186, 38, 45, 1, 0.5000, NULL, NULL),
(3187, 38, 46, 1, 0.5000, NULL, NULL),
(3188, 38, 49, 1, 0.2000, NULL, NULL),
(3189, 38, 51, 1, 0.6000, NULL, NULL),
(3190, 38, 54, 1, 0.1000, NULL, NULL),
(3191, 38, 55, 1, 0.1000, NULL, NULL),
(3192, 38, 57, 1, 0.1500, NULL, NULL),
(3193, 38, 58, 1, 0.2000, NULL, NULL),
(3194, 38, 89, 1, 0.1250, NULL, NULL),
(3195, 38, 61, 1, 0.2500, NULL, NULL),
(3196, 37, 1, 1, 361.0000, NULL, NULL),
(3197, 37, 2, 1, 200.0000, NULL, NULL),
(3198, 37, 5, 1, 70.0000, NULL, NULL),
(3199, 37, 8, 1, 20.0000, NULL, NULL),
(3200, 37, 9, 1, 30.0000, NULL, NULL),
(3201, 37, 10, 1, 50.0000, NULL, NULL),
(3202, 37, 12, 1, 70.0000, NULL, NULL),
(3203, 37, 13, 1, 30.0000, NULL, NULL),
(3204, 37, 15, 1, 111.0000, NULL, NULL),
(3205, 37, 17, 1, 20.0000, NULL, NULL),
(3206, 37, 22, 1, 11.7000, NULL, NULL),
(3207, 37, 30, 1, 7.8400, NULL, NULL),
(3208, 37, 31, 1, 3.3900, NULL, NULL),
(3209, 37, 32, 1, 1.9200, NULL, NULL),
(3210, 37, 33, 1, 1.9200, NULL, NULL),
(3211, 37, 34, 1, 1.3600, NULL, NULL),
(3212, 37, 35, 1, 0.1600, NULL, NULL),
(3213, 37, 36, 1, 2.2700, NULL, NULL),
(3214, 37, 37, 1, 1.7700, NULL, NULL),
(3215, 37, 38, 1, 2.6100, NULL, NULL),
(3216, 37, 40, 1, 0.3000, NULL, NULL),
(3217, 37, 42, 1, 0.7000, NULL, NULL),
(3218, 37, 45, 1, 0.5000, NULL, NULL),
(3219, 37, 46, 1, 0.5000, NULL, NULL),
(3220, 37, 49, 1, 0.2000, NULL, NULL),
(3221, 37, 54, 1, 0.1000, NULL, NULL),
(3222, 37, 55, 1, 0.1000, NULL, NULL),
(3223, 37, 57, 1, 0.1500, NULL, NULL),
(3224, 37, 58, 1, 0.2000, NULL, NULL),
(3225, 37, 89, 1, 0.1250, NULL, NULL),
(3226, 37, 61, 1, 0.2500, NULL, NULL),
(3258, 40, 1, 1, 463.5000, NULL, NULL),
(3259, 40, 2, 1, 150.0000, NULL, NULL),
(3260, 40, 5, 1, 60.0000, NULL, NULL),
(3261, 40, 9, 1, 50.0000, NULL, NULL),
(3262, 40, 10, 1, 50.0000, NULL, NULL),
(3263, 40, 12, 1, 70.0000, NULL, NULL),
(3264, 40, 13, 1, 30.0000, NULL, NULL),
(3265, 40, 15, 1, 89.0000, NULL, NULL),
(3266, 40, 22, 1, 9.0000, NULL, NULL),
(3267, 40, 30, 1, 8.3500, NULL, NULL),
(3268, 40, 31, 1, 3.6400, NULL, NULL),
(3269, 40, 32, 1, 2.5800, NULL, NULL),
(3270, 40, 33, 1, 2.2100, NULL, NULL),
(3271, 40, 34, 1, 1.6000, NULL, NULL),
(3272, 40, 35, 1, 0.2000, NULL, NULL),
(3273, 40, 36, 1, 2.3700, NULL, NULL),
(3274, 40, 37, 1, 1.4000, NULL, NULL),
(3275, 40, 38, 1, 2.3500, NULL, NULL),
(3276, 40, 40, 1, 0.3000, NULL, NULL),
(3277, 40, 42, 1, 0.7000, NULL, NULL),
(3278, 40, 45, 1, 0.5000, NULL, NULL),
(3279, 40, 46, 1, 0.5000, NULL, NULL),
(3280, 40, 50, 1, 0.2500, NULL, NULL),
(3281, 40, 51, 1, 0.7900, NULL, NULL),
(3282, 40, 52, 1, 0.1500, NULL, NULL),
(3283, 40, 55, 1, 0.1000, NULL, NULL),
(3284, 40, 57, 1, 0.1500, NULL, NULL),
(3285, 40, 58, 1, 0.2000, NULL, NULL),
(3286, 40, 89, 1, 0.1250, NULL, NULL),
(3287, 40, 61, 1, 0.2500, NULL, NULL),
(3288, 39, 1, 1, 356.2000, NULL, NULL),
(3289, 39, 2, 1, 200.0000, NULL, NULL),
(3290, 39, 5, 1, 50.0000, NULL, NULL),
(3291, 39, 9, 1, 30.0000, NULL, NULL),
(3292, 39, 10, 1, 50.0000, NULL, NULL),
(3293, 39, 12, 1, 70.0000, NULL, NULL),
(3294, 39, 13, 1, 30.0000, NULL, NULL),
(3295, 39, 15, 1, 179.6000, NULL, NULL),
(3296, 39, 22, 1, 11.4000, NULL, NULL),
(3297, 39, 30, 1, 6.3500, NULL, NULL),
(3298, 39, 31, 1, 3.4400, NULL, NULL),
(3299, 39, 32, 1, 1.1400, NULL, NULL),
(3300, 39, 33, 1, 1.3600, NULL, NULL),
(3301, 39, 34, 1, 0.9800, NULL, NULL),
(3302, 39, 35, 1, 0.2100, NULL, NULL),
(3303, 39, 36, 1, 1.9900, NULL, NULL),
(3304, 39, 37, 1, 1.7900, NULL, NULL),
(3305, 39, 38, 1, 2.7600, NULL, NULL),
(3306, 39, 40, 1, 0.3000, NULL, NULL),
(3307, 39, 42, 1, 0.7000, NULL, NULL),
(3308, 39, 45, 1, 0.5000, NULL, NULL),
(3309, 39, 46, 1, 0.5000, NULL, NULL),
(3310, 39, 49, 1, 0.2000, NULL, NULL),
(3311, 39, 54, 1, 0.1000, NULL, NULL),
(3312, 39, 55, 1, 0.1000, NULL, NULL),
(3313, 39, 57, 1, 0.1500, NULL, NULL),
(3314, 39, 58, 1, 0.2000, NULL, NULL),
(3315, 39, 89, 1, 0.1250, NULL, NULL),
(3316, 39, 61, 1, 0.2500, NULL, NULL),
(3317, 52, 1, 1, 469.0150, NULL, NULL),
(3318, 52, 2, 1, 150.0000, NULL, NULL),
(3319, 52, 5, 1, 60.0000, NULL, NULL),
(3320, 52, 9, 1, 40.0000, NULL, NULL),
(3321, 52, 10, 1, 40.0000, NULL, NULL),
(3322, 52, 12, 1, 36.0000, NULL, NULL),
(3323, 52, 13, 1, 35.0000, NULL, NULL),
(3324, 52, 15, 1, 116.0000, NULL, NULL),
(3325, 52, 17, 1, 17.3000, NULL, NULL),
(3326, 52, 22, 1, 9.0000, NULL, NULL),
(3327, 52, 25, 1, 2.0000, NULL, NULL),
(3328, 52, 30, 1, 7.5500, NULL, NULL),
(3329, 52, 31, 1, 3.4700, NULL, NULL),
(3330, 52, 32, 1, 1.9700, NULL, NULL),
(3331, 52, 33, 1, 1.8600, NULL, NULL),
(3332, 52, 34, 1, 1.3600, NULL, NULL),
(3333, 52, 35, 1, 0.1800, NULL, NULL),
(3334, 52, 36, 1, 2.1500, NULL, NULL),
(3335, 52, 37, 1, 1.5600, NULL, NULL),
(3336, 52, 38, 1, 2.4600, NULL, NULL),
(3337, 52, 40, 1, 0.3000, NULL, NULL),
(3338, 52, 42, 1, 0.7000, NULL, NULL),
(3339, 52, 45, 1, 0.5000, NULL, NULL),
(3340, 52, 46, 1, 0.5000, NULL, NULL),
(3341, 52, 49, 1, 0.2000, NULL, NULL),
(3342, 52, 54, 1, 0.1000, NULL, NULL),
(3343, 52, 55, 1, 0.1000, NULL, NULL),
(3344, 52, 57, 1, 0.1500, NULL, NULL),
(3345, 52, 58, 1, 0.2000, NULL, NULL),
(3346, 52, 89, 1, 0.1250, NULL, NULL),
(3347, 52, 61, 1, 0.2500, NULL, NULL),
(3348, 51, 1, 1, 357.0450, NULL, NULL),
(3349, 51, 2, 1, 200.0000, NULL, NULL),
(3350, 51, 5, 1, 70.0000, NULL, NULL),
(3351, 51, 8, 1, 20.0000, NULL, NULL),
(3352, 51, 9, 1, 30.0000, NULL, NULL),
(3353, 51, 10, 1, 40.0000, NULL, NULL),
(3354, 51, 12, 1, 70.0000, NULL, NULL),
(3355, 51, 13, 1, 30.0000, NULL, NULL),
(3356, 51, 15, 1, 123.5000, NULL, NULL),
(3357, 51, 17, 1, 20.0000, NULL, NULL),
(3358, 51, 22, 1, 12.0000, NULL, NULL),
(3359, 51, 24, 1, 1.3000, NULL, NULL),
(3360, 51, 30, 1, 7.7800, NULL, NULL),
(3361, 51, 31, 1, 3.4000, NULL, NULL),
(3362, 51, 32, 1, 1.7800, NULL, NULL),
(3363, 51, 33, 1, 1.8500, NULL, NULL),
(3364, 51, 34, 1, 1.3200, NULL, NULL),
(3365, 51, 35, 1, 0.1200, NULL, NULL),
(3366, 51, 36, 1, 2.2400, NULL, NULL),
(3367, 51, 37, 1, 1.9000, NULL, NULL),
(3368, 51, 38, 1, 2.6400, NULL, NULL),
(3369, 51, 40, 1, 0.3000, NULL, NULL),
(3370, 51, 42, 1, 0.7000, NULL, NULL),
(3371, 51, 45, 1, 0.5000, NULL, NULL),
(3372, 51, 46, 1, 0.5000, NULL, NULL),
(3373, 51, 49, 1, 0.2000, NULL, NULL),
(3374, 51, 54, 1, 0.1000, NULL, NULL),
(3375, 51, 55, 1, 0.1000, NULL, NULL),
(3376, 51, 57, 1, 0.1500, NULL, NULL),
(3377, 51, 58, 1, 0.2000, NULL, NULL),
(3378, 51, 89, 1, 0.1250, NULL, NULL),
(3379, 51, 61, 1, 0.2500, NULL, NULL),
(3380, 53, 1, 1, 355.5750, NULL, NULL),
(3381, 53, 2, 1, 200.0000, NULL, NULL),
(3382, 53, 5, 1, 50.0000, NULL, NULL),
(3383, 53, 9, 1, 30.0000, NULL, NULL),
(3384, 53, 10, 1, 40.0000, NULL, NULL),
(3385, 53, 12, 1, 60.0000, NULL, NULL),
(3386, 53, 13, 1, 30.0000, NULL, NULL),
(3387, 53, 15, 1, 200.0000, NULL, NULL),
(3388, 53, 22, 1, 10.5000, NULL, NULL),
(3389, 53, 24, 1, 1.5200, NULL, NULL),
(3390, 53, 30, 1, 6.2000, NULL, NULL),
(3391, 53, 31, 1, 3.4700, NULL, NULL),
(3392, 53, 32, 1, 0.9500, NULL, NULL),
(3393, 53, 33, 1, 1.2400, NULL, NULL),
(3394, 53, 34, 1, 0.9200, NULL, NULL),
(3395, 53, 36, 1, 1.9000, NULL, NULL),
(3396, 53, 37, 1, 1.9900, NULL, NULL),
(3397, 53, 38, 1, 2.6100, NULL, NULL),
(3398, 53, 40, 1, 0.3000, NULL, NULL),
(3399, 53, 42, 1, 0.7000, NULL, NULL),
(3400, 53, 45, 1, 0.5000, NULL, NULL),
(3401, 53, 46, 1, 0.5000, NULL, NULL),
(3402, 53, 49, 1, 0.2000, NULL, NULL),
(3403, 53, 54, 1, 0.1000, NULL, NULL),
(3404, 53, 55, 1, 0.1000, NULL, NULL),
(3405, 53, 57, 1, 0.1500, NULL, NULL),
(3406, 53, 58, 1, 0.2000, NULL, NULL),
(3407, 53, 89, 1, 0.1250, NULL, NULL),
(3408, 53, 61, 1, 0.2500, NULL, NULL),
(3409, 54, 1, 1, 472.0050, NULL, NULL),
(3410, 54, 2, 1, 150.0000, NULL, NULL),
(3411, 54, 5, 1, 50.0000, NULL, NULL),
(3412, 54, 9, 1, 40.0000, NULL, NULL),
(3413, 54, 10, 1, 40.0000, NULL, NULL),
(3414, 54, 12, 1, 52.6000, NULL, NULL),
(3415, 54, 13, 1, 30.0000, NULL, NULL),
(3416, 54, 15, 1, 128.7000, NULL, NULL),
(3417, 54, 22, 1, 8.8000, NULL, NULL),
(3418, 54, 24, 1, 0.5600, NULL, NULL),
(3419, 54, 30, 1, 7.7600, NULL, NULL),
(3420, 54, 31, 1, 3.7000, NULL, NULL),
(3421, 54, 32, 1, 2.2400, NULL, NULL),
(3422, 54, 33, 1, 1.9900, NULL, NULL),
(3423, 54, 34, 1, 1.5200, NULL, NULL),
(3424, 54, 35, 1, 0.1200, NULL, NULL),
(3425, 54, 36, 1, 2.2800, NULL, NULL),
(3426, 54, 37, 1, 1.5800, NULL, NULL),
(3427, 54, 38, 1, 2.4200, NULL, NULL),
(3428, 54, 40, 1, 0.3000, NULL, NULL),
(3429, 54, 42, 1, 0.7000, NULL, NULL),
(3430, 54, 45, 1, 0.5000, NULL, NULL),
(3431, 54, 46, 1, 0.5000, NULL, NULL),
(3432, 54, 50, 1, 0.2500, NULL, NULL),
(3433, 54, 51, 1, 0.5000, NULL, NULL),
(3434, 54, 52, 1, 0.1500, NULL, NULL),
(3435, 54, 55, 1, 0.1000, NULL, NULL),
(3436, 54, 57, 1, 0.1500, NULL, NULL),
(3437, 54, 58, 1, 0.2000, NULL, NULL),
(3438, 54, 89, 1, 0.1250, NULL, NULL),
(3439, 54, 61, 1, 0.2500, NULL, NULL),
(3440, 55, 1, 1, 481.0550, NULL, NULL),
(3441, 55, 2, 1, 150.0000, NULL, NULL),
(3442, 55, 5, 1, 60.0000, NULL, NULL),
(3443, 55, 9, 1, 40.0000, NULL, NULL),
(3444, 55, 10, 1, 40.0000, NULL, NULL),
(3445, 55, 12, 1, 41.7000, NULL, NULL),
(3446, 55, 13, 1, 35.0000, NULL, NULL),
(3447, 55, 15, 1, 103.5000, NULL, NULL),
(3448, 55, 22, 1, 7.8000, NULL, NULL),
(3449, 55, 25, 1, 12.0000, NULL, NULL),
(3450, 55, 30, 1, 8.1900, NULL, NULL),
(3451, 55, 31, 1, 3.8900, NULL, NULL),
(3452, 55, 32, 1, 2.5600, NULL, NULL),
(3453, 55, 33, 1, 2.3900, NULL, NULL),
(3454, 55, 34, 1, 1.7900, NULL, NULL),
(3455, 55, 35, 1, 0.2700, NULL, NULL),
(3456, 55, 36, 1, 2.3900, NULL, NULL),
(3457, 55, 37, 1, 1.7500, NULL, NULL),
(3458, 55, 38, 1, 2.1900, NULL, NULL),
(3459, 55, 40, 1, 0.3000, NULL, NULL),
(3460, 55, 42, 1, 0.6000, NULL, NULL),
(3461, 55, 45, 1, 0.5000, NULL, NULL),
(3462, 55, 46, 1, 0.5000, NULL, NULL),
(3463, 55, 50, 1, 0.2500, NULL, NULL),
(3464, 55, 51, 1, 0.5000, NULL, NULL),
(3465, 55, 52, 1, 0.1500, NULL, NULL),
(3466, 55, 55, 1, 0.1000, NULL, NULL),
(3467, 55, 57, 1, 0.1500, NULL, NULL),
(3468, 55, 58, 1, 0.1000, NULL, NULL),
(3469, 55, 89, 1, 0.1250, NULL, NULL),
(3470, 55, 61, 1, 0.2500, NULL, NULL),
(3502, 41, 1, 1, 484.0000, NULL, NULL),
(3503, 41, 2, 1, 150.0000, NULL, NULL),
(3504, 41, 5, 1, 60.0000, NULL, NULL),
(3505, 41, 9, 1, 50.0000, NULL, NULL),
(3506, 41, 10, 1, 40.0000, NULL, NULL),
(3507, 41, 12, 1, 42.7000, NULL, NULL),
(3508, 41, 13, 1, 35.0000, NULL, NULL),
(3509, 41, 15, 1, 90.0000, NULL, NULL),
(3510, 41, 22, 1, 8.8000, NULL, NULL),
(3511, 41, 25, 1, 10.0000, NULL, NULL),
(3512, 41, 30, 1, 8.5100, NULL, NULL),
(3513, 41, 31, 1, 3.8800, NULL, NULL),
(3514, 41, 32, 1, 2.6800, NULL, NULL),
(3515, 41, 33, 1, 2.4600, NULL, NULL),
(3516, 41, 34, 1, 1.8000, NULL, NULL),
(3517, 41, 35, 1, 0.3100, NULL, NULL),
(3518, 41, 36, 1, 2.4200, NULL, NULL),
(3519, 41, 37, 1, 1.7100, NULL, NULL),
(3520, 41, 38, 1, 2.1600, NULL, NULL),
(3521, 41, 40, 1, 0.3000, NULL, NULL),
(3522, 41, 42, 1, 0.6000, NULL, NULL),
(3523, 41, 45, 1, 0.5000, NULL, NULL),
(3524, 41, 46, 1, 0.5000, NULL, NULL),
(3525, 41, 50, 1, 0.2500, NULL, NULL),
(3526, 41, 51, 1, 0.5000, NULL, NULL),
(3527, 41, 52, 1, 0.1500, NULL, NULL),
(3528, 41, 55, 1, 0.1000, NULL, NULL),
(3529, 41, 57, 1, 0.1500, NULL, NULL),
(3530, 41, 58, 1, 0.1000, NULL, NULL),
(3531, 41, 89, 1, 0.1250, NULL, NULL),
(3532, 41, 61, 1, 0.2500, NULL, NULL),
(3544, 57, 1, 1, 6335.0000, NULL, NULL),
(3545, 57, 15, 1, 150.0000, NULL, NULL),
(3546, 57, 24, 1, 200.0000, NULL, NULL),
(3547, 57, 31, 1, -430.0000, NULL, NULL),
(3548, 57, 43, 1, 39.0000, NULL, NULL),
(3549, 57, 44, 1, 26.0000, NULL, NULL),
(3550, 57, 45, 1, -10.9000, NULL, NULL),
(3551, 57, 46, 1, -32.0500, NULL, NULL),
(3552, 57, 1, 1, -12.2200, NULL, NULL),
(3553, 57, 29, 1, -14.0000, NULL, NULL),
(3554, 57, 28, 1, -2.0000, NULL, NULL),
(3555, 50, 1, 1, 2000.0000, NULL, NULL),
(3556, 50, 65, 1, 5.0000, NULL, NULL),
(3557, 50, 66, 1, 10.5000, NULL, NULL),
(3558, 56, 1, 1, 2625.0000, NULL, NULL),
(3578, 2, 1, 1, 645.0000, NULL, NULL),
(3579, 2, 5, 1, 120.0000, NULL, NULL),
(3580, 2, 6, 1, 110.0000, NULL, NULL),
(3581, 2, 15, 1, 86.5000, NULL, NULL),
(3582, 2, 22, 1, 16.0000, NULL, NULL),
(3583, 2, 24, 1, 9.8000, NULL, NULL),
(3584, 2, 31, 1, 1.8400, NULL, NULL),
(3585, 2, 32, 1, 0.2300, NULL, NULL),
(3586, 2, 35, 1, 0.2200, NULL, NULL),
(3587, 2, 36, 1, 0.6100, NULL, NULL),
(3588, 2, 37, 1, 2.2000, NULL, NULL),
(3589, 2, 38, 1, 3.0000, NULL, NULL),
(3590, 2, 42, 1, 1.5000, NULL, NULL),
(3591, 2, 43, 1, 1.2500, NULL, NULL),
(3592, 2, 44, 1, 1.0000, NULL, NULL),
(3593, 2, 47, 1, 0.3000, NULL, NULL),
(3594, 2, 48, 1, 0.2000, NULL, NULL),
(3595, 2, 58, 1, 0.1000, NULL, NULL),
(3596, 2, 68, 1, 0.5000, NULL, NULL),
(3597, 58, 1, 1, 645.0000, NULL, NULL),
(3598, 58, 5, 1, 120.0000, NULL, NULL),
(3599, 58, 6, 1, 110.0000, NULL, NULL),
(3600, 58, 15, 1, 86.5000, NULL, NULL),
(3601, 58, 22, 1, 16.0000, NULL, NULL),
(3602, 58, 24, 1, 9.8000, NULL, NULL),
(3603, 58, 31, 1, 1.9200, NULL, NULL),
(3604, 58, 32, 1, 0.2300, NULL, NULL),
(3605, 58, 35, 1, 0.2200, NULL, NULL),
(3606, 58, 36, 1, 0.6100, NULL, NULL),
(3607, 58, 37, 1, 2.2000, NULL, NULL),
(3608, 58, 38, 1, 3.0000, NULL, NULL),
(3609, 58, 42, 1, 1.5000, NULL, NULL),
(3610, 58, 43, 1, 1.2500, NULL, NULL),
(3611, 58, 44, 1, 1.0000, NULL, NULL),
(3612, 58, 47, 1, 0.3000, NULL, NULL),
(3613, 58, 48, 1, 0.2000, NULL, NULL),
(3614, 58, 58, 1, 0.1000, NULL, NULL),
(3615, 58, 68, 1, 0.5000, NULL, NULL),
(3616, 59, 1, 1, 640.0000, NULL, NULL),
(3617, 59, 5, 1, 70.0000, NULL, NULL),
(3618, 59, 7, 1, 25.0000, NULL, NULL),
(3619, 59, 10, 1, 40.0000, NULL, NULL),
(3620, 59, 12, 1, 50.0000, NULL, NULL),
(3621, 59, 15, 1, 72.5000, NULL, NULL),
(3622, 59, 22, 1, 79.0000, NULL, NULL),
(3623, 59, 24, 1, 2.4500, NULL, NULL),
(3624, 59, 25, 1, 5.0000, NULL, NULL),
(3625, 59, 30, 1, 1.4300, NULL, NULL),
(3626, 59, 31, 1, 1.8000, NULL, NULL),
(3627, 59, 32, 1, 1.3200, NULL, NULL),
(3628, 59, 33, 1, 0.4100, NULL, NULL),
(3629, 59, 34, 1, 0.5700, NULL, NULL),
(3630, 59, 35, 1, 0.3500, NULL, NULL),
(3631, 59, 36, 1, 1.1000, NULL, NULL),
(3632, 59, 37, 1, 1.7900, NULL, NULL),
(3633, 59, 38, 1, 2.7400, NULL, NULL),
(3634, 59, 42, 1, 1.5000, NULL, NULL),
(3635, 59, 43, 1, 1.2500, NULL, NULL),
(3636, 59, 44, 1, 0.8000, NULL, NULL),
(3637, 59, 47, 1, 0.2000, NULL, NULL),
(3638, 59, 48, 1, 0.2000, NULL, NULL),
(3639, 59, 56, 1, 0.1000, NULL, NULL),
(3640, 59, 58, 1, 0.1000, NULL, NULL),
(3641, 59, 68, 1, 0.5000, NULL, NULL),
(3642, 60, 1, 1, 675.0000, NULL, NULL),
(3643, 60, 5, 1, 70.0000, NULL, NULL),
(3644, 60, 7, 1, 17.0000, NULL, NULL),
(3645, 60, 10, 1, 50.0000, NULL, NULL),
(3646, 60, 12, 1, 34.0000, NULL, NULL),
(3647, 60, 15, 1, 50.0000, NULL, NULL),
(3648, 60, 22, 1, 85.0000, NULL, NULL),
(3649, 60, 24, 1, 1.1700, NULL, NULL),
(3650, 60, 30, 1, 1.5900, NULL, NULL),
(3651, 60, 31, 1, 1.5900, NULL, NULL),
(3652, 60, 32, 1, 1.7500, NULL, NULL),
(3653, 60, 33, 1, 0.7400, NULL, NULL),
(3654, 60, 34, 1, 0.6900, NULL, NULL),
(3655, 60, 35, 1, 0.4000, NULL, NULL),
(3656, 60, 36, 1, 1.3100, NULL, NULL),
(3657, 60, 37, 1, 1.6600, NULL, NULL),
(3658, 60, 38, 1, 2.7300, NULL, NULL),
(3659, 60, 42, 1, 1.5000, NULL, NULL),
(3660, 60, 43, 1, 1.2500, NULL, NULL),
(3661, 60, 44, 1, 0.8000, NULL, NULL),
(3662, 60, 47, 1, 0.2000, NULL, NULL),
(3663, 60, 48, 1, 0.2000, NULL, NULL),
(3664, 60, 56, 1, 0.1000, NULL, NULL),
(3665, 60, 58, 1, 0.1000, NULL, NULL),
(3666, 60, 62, 1, 1.0000, NULL, NULL),
(3667, 60, 68, 1, 0.5000, NULL, NULL),
(3668, 61, 1, 1, 614.0000, NULL, NULL),
(3669, 61, 5, 1, 100.0000, NULL, NULL),
(3670, 61, 6, 1, 48.0000, NULL, NULL),
(3671, 61, 8, 1, 20.0000, NULL, NULL),
(3672, 61, 12, 1, 50.0000, NULL, NULL),
(3673, 61, 15, 1, 82.0000, NULL, NULL),
(3674, 61, 17, 1, 50.0000, NULL, NULL),
(3675, 61, 22, 1, 12.0000, NULL, NULL),
(3676, 61, 24, 1, 11.7000, NULL, NULL),
(3677, 61, 30, 1, 0.3100, NULL, NULL),
(3678, 61, 31, 1, 1.5000, NULL, NULL),
(3679, 61, 36, 1, 0.7500, NULL, NULL),
(3680, 61, 37, 1, 2.0700, NULL, NULL),
(3681, 61, 38, 1, 3.0000, NULL, NULL),
(3682, 61, 42, 1, 1.5000, NULL, NULL),
(3683, 61, 43, 1, 1.2500, NULL, NULL),
(3684, 61, 44, 1, 0.8000, NULL, NULL),
(3685, 61, 47, 1, 0.2000, NULL, NULL),
(3686, 61, 48, 1, 0.2000, NULL, NULL),
(3687, 61, 58, 1, 0.1000, NULL, NULL),
(3688, 61, 68, 1, 0.5000, NULL, NULL),
(3689, 62, 1, 1, 571.5000, NULL, NULL),
(3690, 62, 5, 1, 80.0000, NULL, NULL),
(3691, 62, 7, 1, 20.0000, NULL, NULL),
(3692, 62, 12, 1, 80.0000, NULL, NULL),
(3693, 62, 15, 1, 152.0000, NULL, NULL),
(3694, 62, 17, 1, 50.0000, NULL, NULL),
(3695, 62, 22, 1, 11.0000, NULL, NULL),
(3696, 62, 24, 1, 14.3700, NULL, NULL),
(3697, 62, 30, 1, 5.5100, NULL, NULL),
(3698, 62, 31, 1, 2.7000, NULL, NULL),
(3699, 62, 32, 1, 1.4000, NULL, NULL),
(3700, 62, 33, 1, 0.4600, NULL, NULL),
(3701, 62, 34, 1, 0.3100, NULL, NULL),
(3702, 62, 35, 1, 0.2400, NULL, NULL),
(3703, 62, 36, 1, 1.1500, NULL, NULL),
(3704, 62, 37, 1, 2.4800, NULL, NULL),
(3705, 62, 38, 1, 2.8400, NULL, NULL),
(3706, 62, 40, 1, 0.5000, NULL, NULL),
(3707, 62, 42, 1, 1.0000, NULL, NULL),
(3708, 62, 43, 1, 1.2500, NULL, NULL),
(3709, 62, 44, 1, 0.8000, NULL, NULL),
(3710, 62, 47, 1, 0.2000, NULL, NULL),
(3711, 62, 48, 1, 0.2000, NULL, NULL),
(3712, 62, 56, 1, 0.1300, NULL, NULL),
(3713, 62, 57, 1, 0.1500, NULL, NULL),
(3714, 62, 58, 1, 0.1000, NULL, NULL),
(3715, 63, 1, 1, 637.0000, NULL, NULL),
(3716, 63, 5, 1, 60.0000, NULL, NULL),
(3717, 63, 7, 1, 25.0000, NULL, NULL),
(3718, 63, 9, 1, 30.0000, NULL, NULL),
(3719, 63, 10, 1, 50.0000, NULL, NULL),
(3720, 63, 12, 1, 80.0000, NULL, NULL),
(3721, 63, 13, 1, 20.0000, NULL, NULL),
(3722, 63, 15, 1, 43.0000, NULL, NULL),
(3723, 63, 17, 1, 20.0000, NULL, NULL),
(3724, 63, 22, 1, 12.0000, NULL, NULL),
(3725, 63, 24, 1, 1.4200, NULL, NULL),
(3726, 63, 30, 1, 6.7400, NULL, NULL),
(3727, 63, 31, 1, 2.0600, NULL, NULL),
(3728, 63, 32, 1, 1.9200, NULL, NULL),
(3729, 63, 33, 1, 1.3700, NULL, NULL),
(3730, 63, 34, 1, 0.7500, NULL, NULL),
(3731, 63, 36, 1, 1.3200, NULL, NULL),
(3732, 63, 37, 1, 1.7300, NULL, NULL),
(3733, 63, 38, 1, 3.0000, NULL, NULL),
(3734, 63, 40, 1, 0.3000, NULL, NULL),
(3735, 63, 42, 1, 0.7000, NULL, NULL),
(3736, 63, 45, 1, 0.5000, NULL, NULL),
(3737, 63, 46, 1, 0.5000, NULL, NULL),
(3738, 63, 49, 1, 0.2000, NULL, NULL),
(3739, 63, 54, 1, 0.1000, NULL, NULL),
(3740, 63, 58, 1, 0.1000, NULL, NULL),
(3741, 63, 89, 1, 0.1250, NULL, NULL),
(3742, 64, 1, 1, 596.0000, NULL, NULL),
(3743, 64, 5, 1, 61.0000, NULL, NULL),
(3744, 64, 7, 1, 25.0000, NULL, NULL),
(3745, 64, 9, 1, 25.0000, NULL, NULL),
(3746, 64, 10, 1, 60.0000, NULL, NULL),
(3747, 64, 12, 1, 50.0000, NULL, NULL),
(3748, 64, 15, 1, 80.0000, NULL, NULL),
(3749, 64, 22, 1, 91.0000, NULL, NULL),
(3750, 64, 30, 1, 2.1100, NULL, NULL),
(3751, 64, 31, 1, 1.7800, NULL, NULL),
(3752, 64, 33, 1, 0.5600, NULL, NULL),
(3753, 64, 35, 1, 0.3900, NULL, NULL),
(3754, 64, 36, 1, 0.1700, NULL, NULL),
(3755, 64, 37, 1, 1.6000, NULL, NULL),
(3756, 64, 38, 1, 2.2700, NULL, NULL),
(3757, 64, 40, 1, 0.3000, NULL, NULL),
(3758, 64, 42, 1, 0.7000, NULL, NULL),
(3759, 64, 45, 1, 0.7500, NULL, NULL),
(3760, 64, 46, 1, 0.7500, NULL, NULL),
(3761, 64, 53, 1, 0.2000, NULL, NULL),
(3762, 64, 55, 1, 0.1000, NULL, NULL),
(3763, 64, 58, 1, 0.1000, NULL, NULL),
(3764, 64, 89, 1, 0.1250, NULL, NULL),
(3977, 73, 1, 1, 350.0000, NULL, NULL),
(3978, 73, 5, 1, 40.0000, NULL, NULL),
(3979, 73, 6, 1, 200.0000, NULL, NULL),
(3980, 73, 21, 1, 70.0000, NULL, NULL),
(3981, 73, 12, 1, 26.0000, NULL, NULL),
(3982, 73, 15, 1, 24.0000, NULL, NULL),
(3983, 73, 17, 1, 40.0000, NULL, NULL),
(3984, 73, 20, 1, 24.0000, NULL, NULL),
(3985, 73, 22, 1, 13.0000, NULL, NULL),
(3986, 73, 37, 1, 10.0000, NULL, NULL),
(3987, 73, 38, 1, 1.0000, NULL, NULL),
(3988, 73, 41, 1, 1.3000, NULL, NULL),
(3989, 73, 91, 1, 0.5000, NULL, NULL),
(3990, 73, 64, 1, 0.2000, NULL, NULL),
(3994, 46, 1, 1, 650.0000, NULL, NULL),
(3995, 46, 5, 1, 100.0000, NULL, NULL),
(3996, 46, 6, 1, 46.0000, NULL, NULL),
(3997, 46, 9, 1, 50.0000, NULL, NULL),
(3998, 46, 12, 1, 67.0000, NULL, NULL),
(3999, 46, 17, 1, 50.0000, NULL, NULL),
(4000, 46, 22, 1, 32.0000, NULL, NULL),
(4001, 46, 37, 1, 2.0000, NULL, NULL),
(4002, 46, 38, 1, 3.0000, NULL, NULL),
(4003, 74, 1, 1, 3450.0000, NULL, NULL),
(4004, 74, 65, 1, 10.0000, NULL, NULL),
(4005, 74, 66, 1, 6.0000, NULL, NULL),
(4006, 75, 1, 1, 651.5000, NULL, NULL),
(4007, 75, 5, 1, 70.0000, NULL, NULL),
(4008, 75, 6, 1, 35.0000, NULL, NULL),
(4009, 75, 7, 1, 20.0000, NULL, NULL),
(4010, 75, 12, 1, 50.0000, NULL, NULL),
(4011, 75, 15, 1, 91.6000, NULL, NULL),
(4012, 75, 17, 1, 30.0000, NULL, NULL),
(4013, 75, 22, 1, 29.3000, NULL, NULL),
(4014, 75, 24, 1, 9.3800, NULL, NULL),
(4015, 75, 31, 1, 1.7200, NULL, NULL),
(4016, 75, 35, 1, 0.2300, NULL, NULL),
(4017, 75, 36, 1, 1.5600, NULL, NULL),
(4018, 75, 37, 1, 2.3300, NULL, NULL),
(4019, 75, 38, 1, 2.7800, NULL, NULL),
(4020, 75, 42, 1, 1.5000, NULL, NULL),
(4021, 75, 43, 1, 1.2500, NULL, NULL),
(4022, 75, 44, 1, 0.8000, NULL, NULL),
(4023, 75, 47, 1, 0.2000, NULL, NULL),
(4024, 75, 48, 1, 0.2000, NULL, NULL),
(4025, 75, 56, 1, 0.1000, NULL, NULL),
(4026, 75, 58, 1, 0.1000, NULL, NULL),
(4027, 75, 68, 1, 0.5000, NULL, NULL),
(4209, 79, 1, 1, 470.0000, NULL, NULL),
(4210, 79, 2, 1, 150.0000, NULL, NULL),
(4211, 79, 5, 1, 40.0000, NULL, NULL),
(4212, 79, 7, 1, 10.0000, NULL, NULL),
(4213, 79, 9, 1, 40.0000, NULL, NULL),
(4214, 79, 10, 1, 40.0000, NULL, NULL),
(4215, 79, 13, 1, 32.5000, NULL, NULL),
(4216, 79, 15, 1, 181.6000, NULL, NULL),
(4217, 79, 22, 1, 9.0000, NULL, NULL),
(4218, 79, 24, 1, 1.3900, NULL, NULL),
(4219, 79, 30, 1, 7.3100, NULL, NULL),
(4220, 79, 31, 1, 4.0300, NULL, NULL),
(4221, 79, 32, 1, 1.8600, NULL, NULL),
(4222, 79, 33, 1, 1.6100, NULL, NULL),
(4223, 79, 34, 1, 1.2900, NULL, NULL),
(4224, 79, 35, 1, 0.1400, NULL, NULL),
(4225, 79, 36, 1, 2.1200, NULL, NULL),
(4226, 79, 37, 1, 1.6200, NULL, NULL),
(4227, 79, 38, 1, 2.3800, NULL, NULL),
(4228, 79, 40, 1, 0.3000, NULL, NULL),
(4229, 79, 42, 1, 0.7000, NULL, NULL),
(4230, 79, 45, 1, 0.5000, NULL, NULL),
(4231, 79, 46, 1, 0.5000, NULL, NULL),
(4232, 79, 50, 1, 0.2500, NULL, NULL),
(4233, 79, 52, 1, 0.1500, NULL, NULL),
(4234, 79, 55, 1, 0.1000, NULL, NULL),
(4235, 79, 57, 1, 0.1500, NULL, NULL),
(4236, 79, 58, 1, 0.2000, NULL, NULL),
(4237, 79, 89, 1, 0.1250, NULL, NULL),
(4238, 79, 61, 1, 0.2500, NULL, NULL),
(4239, 76, 1, 1, 358.3000, NULL, NULL),
(4240, 76, 2, 1, 200.0000, NULL, NULL),
(4241, 76, 5, 1, 70.0000, NULL, NULL),
(4242, 76, 8, 1, 20.0000, NULL, NULL),
(4243, 76, 9, 1, 30.0000, NULL, NULL),
(4244, 76, 10, 1, 30.0000, NULL, NULL),
(4245, 76, 13, 1, 30.0000, NULL, NULL),
(4246, 76, 15, 1, 203.6000, NULL, NULL),
(4247, 76, 17, 1, 18.2000, NULL, NULL),
(4248, 76, 22, 1, 11.0000, NULL, NULL),
(4249, 76, 24, 1, 4.1700, NULL, NULL),
(4250, 76, 30, 1, 7.0500, NULL, NULL),
(4251, 76, 31, 1, 3.9000, NULL, NULL),
(4252, 76, 32, 1, 1.2000, NULL, NULL),
(4253, 76, 33, 1, 1.4700, NULL, NULL),
(4254, 76, 34, 1, 1.1900, NULL, NULL),
(4255, 76, 36, 1, 2.1400, NULL, NULL),
(4256, 76, 37, 1, 2.0700, NULL, NULL),
(4257, 76, 38, 1, 2.6300, NULL, NULL),
(4258, 76, 40, 1, 0.3000, NULL, NULL),
(4259, 76, 42, 1, 0.7000, NULL, NULL),
(4260, 76, 45, 1, 0.5000, NULL, NULL),
(4261, 76, 46, 1, 0.5000, NULL, NULL),
(4262, 76, 49, 1, 0.2000, NULL, NULL),
(4263, 76, 54, 1, 0.1000, NULL, NULL),
(4264, 76, 55, 1, 0.1000, NULL, NULL),
(4265, 76, 57, 1, 0.1500, NULL, NULL),
(4266, 76, 58, 1, 0.2000, NULL, NULL),
(4267, 76, 89, 1, 0.1250, NULL, NULL),
(4268, 76, 61, 1, 0.2500, NULL, NULL),
(4269, 78, 1, 1, 362.6000, NULL, NULL),
(4270, 78, 2, 1, 200.0000, NULL, NULL),
(4271, 78, 5, 1, 40.0000, NULL, NULL),
(4272, 78, 7, 1, 10.0000, NULL, NULL),
(4273, 78, 9, 1, 30.0000, NULL, NULL),
(4274, 78, 10, 1, 30.0000, NULL, NULL),
(4275, 78, 12, 1, 14.0000, NULL, NULL),
(4276, 78, 13, 1, 30.0000, NULL, NULL),
(4277, 78, 15, 1, 246.0000, NULL, NULL),
(4278, 78, 22, 1, 10.8000, NULL, NULL),
(4279, 78, 24, 1, 4.2400, NULL, NULL),
(4280, 78, 30, 1, 6.2100, NULL, NULL),
(4281, 78, 31, 1, 3.8300, NULL, NULL),
(4282, 78, 32, 1, 0.7900, NULL, NULL),
(4283, 78, 33, 1, 1.0100, NULL, NULL),
(4284, 78, 34, 1, 0.8500, NULL, NULL),
(4285, 78, 36, 1, 1.8700, NULL, NULL),
(4286, 78, 37, 1, 2.1400, NULL, NULL),
(4287, 78, 38, 1, 2.6200, NULL, NULL),
(4288, 78, 40, 1, 0.3000, NULL, NULL),
(4289, 78, 42, 1, 0.7000, NULL, NULL),
(4290, 78, 45, 1, 0.5000, NULL, NULL),
(4291, 78, 46, 1, 0.5000, NULL, NULL),
(4292, 78, 49, 1, 0.2000, NULL, NULL),
(4293, 78, 54, 1, 0.1000, NULL, NULL),
(4294, 78, 55, 1, 0.1000, NULL, NULL),
(4295, 78, 57, 1, 0.1500, NULL, NULL),
(4296, 78, 58, 1, 0.2000, NULL, NULL),
(4297, 78, 89, 1, 0.1250, NULL, NULL),
(4298, 78, 61, 1, 0.2500, NULL, NULL),
(4330, 66, 1, 1, 469.0150, NULL, NULL),
(4331, 66, 2, 1, 150.0000, NULL, NULL),
(4332, 66, 5, 1, 60.0000, NULL, NULL),
(4333, 66, 9, 1, 40.0000, NULL, NULL),
(4334, 66, 10, 1, 40.0000, NULL, NULL),
(4335, 66, 12, 1, 36.0000, NULL, NULL),
(4336, 66, 13, 1, 35.0000, NULL, NULL),
(4337, 66, 15, 1, 116.0000, NULL, NULL),
(4338, 66, 17, 1, 17.3000, NULL, NULL),
(4339, 66, 22, 1, 9.0000, NULL, NULL),
(4340, 66, 25, 1, 2.0000, NULL, NULL),
(4341, 66, 30, 1, 7.5500, NULL, NULL),
(4342, 66, 31, 1, 3.6200, NULL, NULL),
(4343, 66, 32, 1, 1.9700, NULL, NULL),
(4344, 66, 33, 1, 1.8600, NULL, NULL),
(4345, 66, 34, 1, 1.3600, NULL, NULL),
(4346, 66, 35, 1, 0.1800, NULL, NULL),
(4347, 66, 36, 1, 2.1500, NULL, NULL),
(4348, 66, 37, 1, 1.5600, NULL, NULL),
(4349, 66, 38, 1, 2.4600, NULL, NULL),
(4350, 66, 40, 1, 0.3000, NULL, NULL),
(4351, 66, 42, 1, 0.7000, NULL, NULL),
(4352, 66, 45, 1, 0.5000, NULL, NULL),
(4353, 66, 46, 1, 0.5000, NULL, NULL),
(4354, 66, 49, 1, 0.2000, NULL, NULL),
(4355, 66, 54, 1, 0.1000, NULL, NULL),
(4356, 66, 55, 1, 0.1000, NULL, NULL),
(4357, 66, 57, 1, 0.1500, NULL, NULL),
(4358, 66, 58, 1, 0.2000, NULL, NULL),
(4359, 66, 89, 1, 0.1250, NULL, NULL),
(4360, 66, 61, 1, 0.2500, NULL, NULL),
(4361, 65, 1, 1, 357.0450, NULL, NULL),
(4362, 65, 2, 1, 200.0000, NULL, NULL),
(4363, 65, 5, 1, 70.0000, NULL, NULL),
(4364, 65, 8, 1, 20.0000, NULL, NULL),
(4365, 65, 9, 1, 30.0000, NULL, NULL),
(4366, 65, 10, 1, 40.0000, NULL, NULL),
(4367, 65, 12, 1, 70.0000, NULL, NULL),
(4368, 65, 13, 1, 30.0000, NULL, NULL),
(4369, 65, 15, 1, 123.5000, NULL, NULL),
(4370, 65, 17, 1, 20.0000, NULL, NULL),
(4371, 65, 22, 1, 12.0000, NULL, NULL),
(4372, 65, 24, 1, 1.3000, NULL, NULL),
(4373, 65, 30, 1, 7.7800, NULL, NULL),
(4374, 65, 31, 1, 3.5400, NULL, NULL),
(4375, 65, 32, 1, 1.7800, NULL, NULL),
(4376, 65, 33, 1, 1.8500, NULL, NULL),
(4377, 65, 34, 1, 1.3200, NULL, NULL),
(4378, 65, 35, 1, 0.1200, NULL, NULL),
(4379, 65, 36, 1, 2.2400, NULL, NULL),
(4380, 65, 37, 1, 1.9000, NULL, NULL),
(4381, 65, 38, 1, 2.6400, NULL, NULL),
(4382, 65, 40, 1, 0.3000, NULL, NULL),
(4383, 65, 42, 1, 0.7000, NULL, NULL),
(4384, 65, 45, 1, 0.5000, NULL, NULL),
(4385, 65, 46, 1, 0.5000, NULL, NULL),
(4386, 65, 49, 1, 0.2000, NULL, NULL),
(4387, 65, 54, 1, 0.1000, NULL, NULL),
(4388, 65, 55, 1, 0.1000, NULL, NULL),
(4389, 65, 57, 1, 0.1500, NULL, NULL),
(4390, 65, 58, 1, 0.2000, NULL, NULL),
(4391, 65, 89, 1, 0.1250, NULL, NULL),
(4392, 65, 61, 1, 0.2500, NULL, NULL),
(4393, 67, 1, 1, 355.5750, NULL, NULL),
(4394, 67, 2, 1, 200.0000, NULL, NULL),
(4395, 67, 5, 1, 50.0000, NULL, NULL),
(4396, 67, 9, 1, 30.0000, NULL, NULL);
INSERT INTO `recipe_detail` (`id`, `recipe_id`, `item_id`, `unit_id`, `quantity`, `created_at`, `updated_at`) VALUES
(4397, 67, 10, 1, 40.0000, NULL, NULL),
(4398, 67, 12, 1, 60.0000, NULL, NULL),
(4399, 67, 13, 1, 30.0000, NULL, NULL),
(4400, 67, 15, 1, 200.0000, NULL, NULL),
(4401, 67, 22, 1, 10.5000, NULL, NULL),
(4402, 67, 24, 1, 1.5200, NULL, NULL),
(4403, 67, 30, 1, 6.2000, NULL, NULL),
(4404, 67, 31, 1, 3.6200, NULL, NULL),
(4405, 67, 32, 1, 0.9500, NULL, NULL),
(4406, 67, 33, 1, 1.2400, NULL, NULL),
(4407, 67, 34, 1, 0.9200, NULL, NULL),
(4408, 67, 36, 1, 1.9000, NULL, NULL),
(4409, 67, 37, 1, 1.9900, NULL, NULL),
(4410, 67, 38, 1, 2.6100, NULL, NULL),
(4411, 67, 40, 1, 0.3000, NULL, NULL),
(4412, 67, 42, 1, 0.7000, NULL, NULL),
(4413, 67, 45, 1, 0.5000, NULL, NULL),
(4414, 67, 46, 1, 0.5000, NULL, NULL),
(4415, 67, 49, 1, 0.2000, NULL, NULL),
(4416, 67, 54, 1, 0.1000, NULL, NULL),
(4417, 67, 55, 1, 0.1000, NULL, NULL),
(4418, 67, 57, 1, 0.1500, NULL, NULL),
(4419, 67, 58, 1, 0.2000, NULL, NULL),
(4420, 67, 89, 1, 0.1250, NULL, NULL),
(4421, 67, 61, 1, 0.2500, NULL, NULL),
(4422, 68, 1, 1, 472.0050, NULL, NULL),
(4423, 68, 2, 1, 150.0000, NULL, NULL),
(4424, 68, 5, 1, 50.0000, NULL, NULL),
(4425, 68, 9, 1, 40.0000, NULL, NULL),
(4426, 68, 10, 1, 40.0000, NULL, NULL),
(4427, 68, 12, 1, 52.6000, NULL, NULL),
(4428, 68, 13, 1, 30.0000, NULL, NULL),
(4429, 68, 15, 1, 128.7000, NULL, NULL),
(4430, 68, 22, 1, 8.8000, NULL, NULL),
(4431, 68, 24, 1, 0.5600, NULL, NULL),
(4432, 68, 30, 1, 7.7600, NULL, NULL),
(4433, 68, 31, 1, 3.8600, NULL, NULL),
(4434, 68, 32, 1, 2.2400, NULL, NULL),
(4435, 68, 33, 1, 1.9900, NULL, NULL),
(4436, 68, 34, 1, 1.5200, NULL, NULL),
(4437, 68, 35, 1, 0.1200, NULL, NULL),
(4438, 68, 36, 1, 2.2800, NULL, NULL),
(4439, 68, 37, 1, 1.5800, NULL, NULL),
(4440, 68, 38, 1, 2.4200, NULL, NULL),
(4441, 68, 40, 1, 0.3000, NULL, NULL),
(4442, 68, 42, 1, 0.7000, NULL, NULL),
(4443, 68, 45, 1, 0.5000, NULL, NULL),
(4444, 68, 46, 1, 0.5000, NULL, NULL),
(4445, 68, 50, 1, 0.2500, NULL, NULL),
(4446, 68, 51, 1, 0.5000, NULL, NULL),
(4447, 68, 52, 1, 0.1500, NULL, NULL),
(4448, 68, 55, 1, 0.1000, NULL, NULL),
(4449, 68, 57, 1, 0.1500, NULL, NULL),
(4450, 68, 58, 1, 0.2000, NULL, NULL),
(4451, 68, 89, 1, 0.1250, NULL, NULL),
(4452, 68, 61, 1, 0.2500, NULL, NULL),
(4453, 69, 1, 1, 481.0550, NULL, NULL),
(4454, 69, 2, 1, 150.0000, NULL, NULL),
(4455, 69, 5, 1, 60.0000, NULL, NULL),
(4456, 69, 9, 1, 40.0000, NULL, NULL),
(4457, 69, 10, 1, 40.0000, NULL, NULL),
(4458, 69, 12, 1, 41.7000, NULL, NULL),
(4459, 69, 13, 1, 35.0000, NULL, NULL),
(4460, 69, 15, 1, 103.5000, NULL, NULL),
(4461, 69, 22, 1, 7.8000, NULL, NULL),
(4462, 69, 25, 1, 12.0000, NULL, NULL),
(4463, 69, 30, 1, 8.1900, NULL, NULL),
(4464, 69, 31, 1, 4.0500, NULL, NULL),
(4465, 69, 32, 1, 2.5600, NULL, NULL),
(4466, 69, 33, 1, 2.3900, NULL, NULL),
(4467, 69, 34, 1, 1.7900, NULL, NULL),
(4468, 69, 35, 1, 0.2700, NULL, NULL),
(4469, 69, 36, 1, 2.3900, NULL, NULL),
(4470, 69, 37, 1, 1.7500, NULL, NULL),
(4471, 69, 38, 1, 2.1900, NULL, NULL),
(4472, 69, 40, 1, 0.3000, NULL, NULL),
(4473, 69, 42, 1, 0.6000, NULL, NULL),
(4474, 69, 45, 1, 0.5000, NULL, NULL),
(4475, 69, 46, 1, 0.5000, NULL, NULL),
(4476, 69, 50, 1, 0.2500, NULL, NULL),
(4477, 69, 51, 1, 0.5000, NULL, NULL),
(4478, 69, 52, 1, 0.1500, NULL, NULL),
(4479, 69, 55, 1, 0.1000, NULL, NULL),
(4480, 69, 57, 1, 0.1500, NULL, NULL),
(4481, 69, 58, 1, 0.1000, NULL, NULL),
(4482, 69, 89, 1, 0.1250, NULL, NULL),
(4483, 69, 61, 1, 0.2500, NULL, NULL),
(4484, 4, 1, 1, 640.0000, NULL, NULL),
(4485, 4, 5, 1, 80.0000, NULL, NULL),
(4486, 4, 6, 1, 39.0000, NULL, NULL),
(4487, 4, 7, 1, 20.0000, NULL, NULL),
(4488, 4, 12, 1, 50.0000, NULL, NULL),
(4489, 4, 15, 1, 90.0000, NULL, NULL),
(4490, 4, 17, 1, 30.0000, NULL, NULL),
(4491, 4, 22, 1, 29.0000, NULL, NULL),
(4492, 4, 24, 1, 9.2500, NULL, NULL),
(4493, 4, 31, 1, 1.6500, NULL, NULL),
(4494, 4, 35, 1, 0.2300, NULL, NULL),
(4495, 4, 36, 1, 1.4000, NULL, NULL),
(4496, 4, 37, 1, 2.1700, NULL, NULL),
(4497, 4, 38, 1, 3.0000, NULL, NULL),
(4498, 4, 42, 1, 1.5000, NULL, NULL),
(4499, 4, 43, 1, 1.2500, NULL, NULL),
(4500, 4, 44, 1, 0.8000, NULL, NULL),
(4501, 4, 47, 1, 0.2000, NULL, NULL),
(4502, 4, 48, 1, 0.2000, NULL, NULL),
(4503, 4, 58, 1, 0.1000, NULL, NULL),
(4504, 4, 68, 1, 0.5000, NULL, NULL),
(4538, 81, 1, 1, 2498.1400, NULL, NULL),
(4539, 81, 28, 1, 2.0000, NULL, NULL),
(4540, 81, 29, 1, 14.0000, NULL, NULL),
(4541, 82, 1, 1, 240.0000, NULL, NULL),
(4542, 82, 3, 1, 40.0000, NULL, NULL),
(4543, 82, 4, 1, 80.0000, NULL, NULL),
(4544, 82, 5, 1, 160.0000, NULL, NULL),
(4545, 82, 6, 1, 53.0000, NULL, NULL),
(4546, 82, 8, 1, 60.0000, NULL, NULL),
(4547, 82, 13, 1, 30.0000, NULL, NULL),
(4548, 82, 19, 1, 48.0000, NULL, NULL),
(4549, 82, 20, 1, 40.0000, NULL, NULL),
(4550, 82, 22, 1, 10.0000, NULL, NULL),
(4551, 82, 24, 1, 3.0000, NULL, NULL),
(4552, 82, 37, 1, 15.0000, NULL, NULL),
(4553, 82, 38, 1, 2.0000, NULL, NULL),
(4554, 82, 39, 1, 16.0000, NULL, NULL),
(4555, 82, 41, 1, 2.3000, NULL, NULL),
(4556, 82, 91, 1, 0.5000, NULL, NULL),
(4557, 82, 64, 1, 0.2000, NULL, NULL),
(4577, 84, 1, 1, 260.0000, NULL, NULL),
(4578, 84, 3, 1, 40.0000, NULL, NULL),
(4579, 84, 4, 1, 76.0000, NULL, NULL),
(4580, 84, 5, 1, 80.0000, NULL, NULL),
(4581, 84, 6, 1, 40.0000, NULL, NULL),
(4582, 84, 8, 1, 60.0000, NULL, NULL),
(4583, 84, 13, 1, 19.0000, NULL, NULL),
(4584, 84, 15, 1, 64.0000, NULL, NULL),
(4585, 84, 19, 1, 56.0000, NULL, NULL),
(4586, 84, 20, 1, 40.0000, NULL, NULL),
(4587, 84, 13, 1, 20.0000, NULL, NULL),
(4588, 84, 22, 1, 10.0000, NULL, NULL),
(4589, 84, 24, 1, 4.0000, NULL, NULL),
(4590, 84, 37, 1, 8.0000, NULL, NULL),
(4591, 84, 38, 1, 2.0000, NULL, NULL),
(4592, 84, 39, 1, 16.0000, NULL, NULL),
(4593, 84, 41, 1, 2.4000, NULL, NULL),
(4594, 84, 42, 1, 0.8000, NULL, NULL),
(4595, 84, 59, 1, 0.4000, NULL, NULL),
(4596, 84, 60, 1, 0.4000, NULL, NULL),
(4597, 84, 91, 1, 0.8000, NULL, NULL),
(4598, 84, 64, 1, 0.2000, NULL, NULL),
(4734, 70, 1, 1, 145.0000, NULL, NULL),
(4735, 70, 3, 1, 80.0000, NULL, NULL),
(4736, 70, 4, 1, 80.0000, NULL, NULL),
(4737, 70, 5, 1, 160.0000, NULL, NULL),
(4738, 70, 6, 1, 120.0000, NULL, NULL),
(4739, 70, 8, 1, 60.0000, NULL, NULL),
(4740, 70, 19, 1, 48.0000, NULL, NULL),
(4741, 70, 20, 1, 40.0000, NULL, NULL),
(4742, 70, 21, 1, 17.0000, NULL, NULL),
(4743, 70, 22, 1, 11.0000, NULL, NULL),
(4744, 70, 24, 1, 3.0000, NULL, NULL),
(4745, 70, 37, 1, 15.0000, NULL, NULL),
(4746, 70, 38, 1, 2.0000, NULL, NULL),
(4747, 70, 39, 1, 16.0000, NULL, NULL),
(4748, 70, 41, 1, 2.3000, NULL, NULL),
(4749, 70, 91, 1, 0.5000, NULL, NULL),
(4750, 70, 64, 1, 0.2000, NULL, NULL),
(4751, 71, 1, 1, 124.0000, NULL, NULL),
(4752, 71, 3, 1, 80.0000, NULL, NULL),
(4753, 71, 4, 1, 80.0000, NULL, NULL),
(4754, 71, 5, 1, 120.0000, NULL, NULL),
(4755, 71, 6, 1, 130.0000, NULL, NULL),
(4756, 71, 8, 1, 60.0000, NULL, NULL),
(4757, 71, 12, 1, 13.0000, NULL, NULL),
(4758, 71, 13, 1, 30.0000, NULL, NULL),
(4759, 71, 19, 1, 48.0000, NULL, NULL),
(4760, 71, 20, 1, 40.0000, NULL, NULL),
(4761, 71, 21, 1, 34.0000, NULL, NULL),
(4762, 71, 22, 1, 8.0000, NULL, NULL),
(4763, 71, 24, 1, 4.0000, NULL, NULL),
(4764, 71, 37, 1, 8.0000, NULL, NULL),
(4765, 71, 38, 1, 2.0000, NULL, NULL),
(4766, 71, 39, 1, 16.0000, NULL, NULL),
(4767, 71, 41, 1, 2.3000, NULL, NULL),
(4768, 71, 91, 1, 0.5000, NULL, NULL),
(4769, 71, 64, 1, 0.2000, NULL, NULL),
(4770, 72, 1, 1, 250.0000, NULL, NULL),
(4771, 72, 3, 1, 80.0000, NULL, NULL),
(4772, 72, 4, 1, 80.0000, NULL, NULL),
(4773, 72, 5, 1, 80.0000, NULL, NULL),
(4774, 72, 7, 1, 24.0000, NULL, NULL),
(4775, 72, 8, 1, 60.0000, NULL, NULL),
(4776, 72, 13, 1, 23.0000, NULL, NULL),
(4777, 72, 15, 1, 28.0000, NULL, NULL),
(4778, 72, 19, 1, 56.0000, NULL, NULL),
(4779, 72, 20, 1, 40.0000, NULL, NULL),
(4780, 72, 21, 1, 35.0000, NULL, NULL),
(4781, 72, 22, 1, 10.0000, NULL, NULL),
(4782, 72, 24, 1, 4.0000, NULL, NULL),
(4783, 72, 37, 1, 8.0000, NULL, NULL),
(4784, 72, 38, 1, 2.0000, NULL, NULL),
(4785, 72, 39, 1, 16.0000, NULL, NULL),
(4786, 72, 41, 1, 2.4000, NULL, NULL),
(4787, 72, 42, 1, 0.5000, NULL, NULL),
(4788, 72, 59, 1, 0.4000, NULL, NULL),
(4789, 72, 60, 1, 0.4000, NULL, NULL),
(4790, 72, 91, 1, 0.5000, NULL, NULL),
(4791, 72, 64, 1, 0.2000, NULL, NULL),
(4792, 83, 1, 1, 236.0000, NULL, NULL),
(4793, 83, 3, 1, 40.0000, NULL, NULL),
(4794, 83, 3, 1, 80.0000, NULL, NULL),
(4795, 83, 5, 1, 120.0000, NULL, NULL),
(4796, 83, 6, 1, 40.0000, NULL, NULL),
(4797, 83, 8, 1, 60.0000, NULL, NULL),
(4798, 83, 12, 1, 15.0000, NULL, NULL),
(4799, 83, 13, 1, 30.0000, NULL, NULL),
(4800, 83, 19, 1, 48.0000, NULL, NULL),
(4801, 83, 20, 1, 40.0000, NULL, NULL),
(4802, 83, 21, 1, 50.0000, NULL, NULL),
(4803, 83, 22, 1, 8.0000, NULL, NULL),
(4804, 83, 24, 1, 4.0000, NULL, NULL),
(4805, 83, 37, 1, 8.0000, NULL, NULL),
(4806, 83, 38, 1, 2.0000, NULL, NULL),
(4807, 83, 39, 1, 16.0000, NULL, NULL),
(4808, 83, 41, 1, 2.3000, NULL, NULL),
(4809, 83, 91, 1, 0.5000, NULL, NULL),
(4810, 83, 64, 1, 0.2000, NULL, NULL),
(4824, 86, 1, 1, 462.0000, NULL, NULL),
(4825, 86, 2, 1, 150.0000, NULL, NULL),
(4826, 86, 5, 1, 50.0000, NULL, NULL),
(4827, 86, 9, 1, 40.0000, NULL, NULL),
(4828, 86, 10, 1, 29.0000, NULL, NULL),
(4829, 86, 12, 1, 54.5000, NULL, NULL),
(4830, 86, 13, 1, 30.0000, NULL, NULL),
(4831, 86, 15, 1, 130.9000, NULL, NULL),
(4832, 86, 22, 1, 9.0000, NULL, NULL),
(4833, 86, 25, 1, 17.5000, NULL, NULL),
(4834, 86, 30, 1, 7.6700, NULL, NULL),
(4835, 86, 31, 1, 4.0000, NULL, NULL),
(4836, 86, 32, 1, 2.1200, NULL, NULL),
(4837, 86, 33, 1, 2.1200, NULL, NULL),
(4838, 86, 34, 1, 1.5800, NULL, NULL),
(4839, 86, 35, 1, 0.1800, NULL, NULL),
(4840, 86, 36, 1, 2.2200, NULL, NULL),
(4841, 86, 37, 1, 1.9000, NULL, NULL),
(4842, 86, 38, 1, 2.2100, NULL, NULL),
(4843, 86, 40, 1, 0.3000, NULL, NULL),
(4844, 86, 42, 1, 0.6000, NULL, NULL),
(4845, 86, 45, 1, 0.5000, NULL, NULL),
(4846, 86, 46, 1, 0.5000, NULL, NULL),
(4847, 86, 50, 1, 0.2500, NULL, NULL),
(4848, 86, 52, 1, 0.1500, NULL, NULL),
(4849, 86, 55, 1, 0.1000, NULL, NULL),
(4850, 86, 57, 1, 0.1500, NULL, NULL),
(4851, 86, 58, 1, 0.2000, NULL, NULL),
(4852, 86, 89, 1, 0.1250, NULL, NULL),
(4853, 86, 61, 1, 0.2500, NULL, NULL),
(4884, 87, 1, 1, 448.7000, NULL, NULL),
(4885, 87, 2, 1, 150.0000, NULL, NULL),
(4886, 87, 5, 1, 50.0000, NULL, NULL),
(4887, 87, 5, 1, 40.0000, NULL, NULL),
(4888, 87, 10, 1, 40.0000, NULL, NULL),
(4889, 87, 12, 1, 63.0000, NULL, NULL),
(4890, 87, 13, 1, 30.0000, NULL, NULL),
(4891, 87, 15, 1, 117.0000, NULL, NULL),
(4892, 87, 17, 1, 20.0000, NULL, NULL),
(4893, 87, 22, 1, 8.5000, NULL, NULL),
(4894, 87, 25, 1, 8.0000, NULL, NULL),
(4895, 87, 30, 1, 7.2600, NULL, NULL),
(4896, 87, 31, 1, 3.5000, NULL, NULL),
(4897, 87, 32, 1, 1.7700, NULL, NULL),
(4898, 87, 33, 1, 1.7400, NULL, NULL),
(4899, 87, 34, 1, 1.2200, NULL, NULL),
(4900, 87, 35, 1, 0.1300, NULL, NULL),
(4901, 87, 36, 1, 2.0400, NULL, NULL),
(4902, 87, 37, 1, 1.5600, NULL, NULL),
(4903, 87, 38, 1, 2.4400, NULL, NULL),
(4904, 87, 40, 1, 0.3000, NULL, NULL),
(4905, 87, 42, 1, 0.7000, NULL, NULL),
(4906, 87, 45, 1, 0.5000, NULL, NULL),
(4907, 87, 46, 1, 0.5000, NULL, NULL),
(4908, 87, 49, 1, 0.2000, NULL, NULL),
(4909, 87, 54, 1, 0.1000, NULL, NULL),
(4910, 87, 55, 1, 0.1000, NULL, NULL),
(4911, 87, 57, 1, 0.1500, NULL, NULL),
(4912, 87, 58, 1, 0.2000, NULL, NULL),
(4913, 87, 89, 1, 0.1250, NULL, NULL),
(4914, 87, 61, 1, 0.2500, NULL, NULL),
(5007, 80, 1, 1, 484.4000, NULL, NULL),
(5008, 80, 2, 1, 150.0000, NULL, NULL),
(5009, 80, 5, 1, 50.0000, NULL, NULL),
(5010, 80, 9, 1, 40.0000, NULL, NULL),
(5011, 80, 10, 1, 40.0000, NULL, NULL),
(5012, 80, 13, 1, 30.0000, NULL, NULL),
(5013, 80, 15, 1, 156.0000, NULL, NULL),
(5014, 80, 22, 1, 9.0000, NULL, NULL),
(5015, 80, 25, 1, 13.2000, NULL, NULL),
(5016, 80, 30, 1, 7.4600, NULL, NULL),
(5017, 80, 31, 1, 4.2400, NULL, NULL),
(5018, 80, 32, 1, 2.0900, NULL, NULL),
(5019, 80, 33, 1, 2.0600, NULL, NULL),
(5020, 80, 34, 1, 1.6300, NULL, NULL),
(5021, 80, 35, 1, 0.2100, NULL, NULL),
(5022, 80, 36, 1, 2.2500, NULL, NULL),
(5023, 80, 37, 1, 1.7900, NULL, NULL),
(5024, 80, 38, 1, 2.1600, NULL, NULL),
(5025, 80, 40, 1, 0.3000, NULL, NULL),
(5026, 80, 42, 1, 0.6000, NULL, NULL),
(5027, 80, 45, 1, 0.5000, NULL, NULL),
(5028, 80, 46, 1, 0.5000, NULL, NULL),
(5029, 80, 50, 1, 0.2500, NULL, NULL),
(5030, 80, 51, 1, 0.4000, NULL, NULL),
(5031, 80, 52, 1, 0.1500, NULL, NULL),
(5032, 80, 55, 1, 0.1000, NULL, NULL),
(5033, 80, 57, 1, 0.1500, NULL, NULL),
(5034, 80, 58, 1, 0.2000, NULL, NULL),
(5035, 80, 89, 1, 0.1250, NULL, NULL),
(5036, 80, 61, 1, 0.2500, NULL, NULL),
(5192, 77, 1, 1, 472.0000, NULL, NULL),
(5193, 77, 2, 1, 150.0000, NULL, NULL),
(5194, 77, 5, 1, 50.0000, NULL, NULL),
(5195, 77, 9, 1, 40.0000, NULL, NULL),
(5196, 77, 10, 1, 40.0000, NULL, NULL),
(5197, 77, 13, 1, 30.0000, NULL, NULL),
(5198, 77, 15, 1, 164.0000, NULL, NULL),
(5199, 77, 17, 1, 16.7000, NULL, NULL),
(5200, 77, 22, 1, 9.0000, NULL, NULL),
(5201, 77, 24, 1, 0.7500, NULL, NULL),
(5202, 77, 25, 1, 3.3000, NULL, NULL),
(5203, 77, 30, 1, 6.9000, NULL, NULL),
(5204, 77, 31, 1, 3.7900, NULL, NULL),
(5205, 77, 32, 1, 1.5600, NULL, NULL),
(5206, 77, 33, 1, 1.5700, NULL, NULL),
(5207, 77, 34, 1, 1.2100, NULL, NULL),
(5208, 77, 35, 1, 0.1200, NULL, NULL),
(5209, 77, 36, 1, 2.0300, NULL, NULL),
(5210, 77, 37, 1, 1.5900, NULL, NULL),
(5211, 77, 38, 1, 2.4300, NULL, NULL),
(5212, 77, 40, 1, 0.3000, NULL, NULL),
(5213, 77, 42, 1, 0.7000, NULL, NULL),
(5214, 77, 45, 1, 0.5000, NULL, NULL),
(5215, 77, 46, 1, 0.5000, NULL, NULL),
(5216, 77, 49, 1, 0.2000, NULL, NULL),
(5217, 77, 54, 1, 0.1000, NULL, NULL),
(5218, 77, 55, 1, 0.1000, NULL, NULL),
(5219, 77, 57, 1, 0.1500, NULL, NULL),
(5220, 77, 58, 1, 0.2000, NULL, NULL),
(5221, 77, 89, 1, 0.1250, NULL, NULL),
(5222, 77, 61, 1, 0.2500, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Tax Free', 0.00, 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(2, 'GST', 18.00, 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(4, 'Breeder feed', 150.00, 1, '2024-12-03 16:00:35', '2024-12-03 16:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `base_unit` char(50) DEFAULT NULL,
  `child_unit` char(50) DEFAULT NULL,
  `base_unit_value` decimal(10,2) UNSIGNED DEFAULT NULL,
  `operator` char(1) DEFAULT NULL,
  `child_unit_value` decimal(10,2) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `base_unit`, `child_unit`, `base_unit_value`, `operator`, `child_unit_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'KG', 'g', 1.00, '*', 1000.00, 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(2, 'L', 'ml', 1.00, '*', 1000.00, 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(3, 'Dozen', 'pc', 12.00, '*', 1.00, 0, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(10, 'Mann (50KG)', 'KG', 50.00, '*', 1.00, 1, '2024-10-15 05:57:49', '2024-10-15 05:57:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_super_admin` int(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `is_super_admin`, `name`, `mobile_no`, `email`, `type`, `email_verified_at`, `password`, `hint`, `image`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'admin', '033309874587', 'demo@extbooks.com', 'admin', NULL, '$2y$10$8ZS3Fcdhsuh69e6YzuHJEejN9tmpYgKUsGza6OyYUJ19GtrvfMqau', '123456', NULL, '1', NULL, NULL, NULL),
(2, 0, 'Afzal', '030052546', '030052546', 'saleman', NULL, '$2y$10$p/sOxN5pPxOPg7x07RyV9ePaqMnKMZxNGKDnthKKbMHV/Xk3h11S6', '12345678', NULL, '1', NULL, '2024-10-30 06:05:13', '2024-10-30 06:08:29'),
(3, 0, 'Umar', '123456', 'saleman@extbooks.com', 'saleman', NULL, '$2y$10$koq.bikfs1Ua6QRY7KSrgObVpWnDGnCkwVGoXJzjg3iJLhB.chSTS', '12345678', NULL, '1', NULL, '2024-10-30 06:08:17', '2024-11-25 11:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`values`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `values`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Color', '[\"Red\",\"Blue\",\"Green\"]', 1, '2024-10-09 11:43:08', '2024-10-09 11:43:08'),
(2, 'Size', '[\"Small\",\"Medium\",\"Large\"]', 1, '2024-10-09 11:43:08', '2024-10-09 11:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_master_id` bigint(20) DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `total_amount` decimal(20,2) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_details`
--

CREATE TABLE `voucher_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `voucher_no` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `invoice_master_id` bigint(20) DEFAULT NULL,
  `party_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Used when a client is both a customer and supplier. Represents the party entity.',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `narration` text DEFAULT NULL,
  `reference_no` varchar(255) DEFAULT NULL,
  `debit` decimal(20,2) DEFAULT NULL,
  `credit` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_types`
--

CREATE TABLE `voucher_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voucher_types`
--

INSERT INTO `voucher_types` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'BP', 'Bank Payment', NULL, NULL),
(2, 'BR', 'Bank Receipt', NULL, NULL),
(3, 'CP', 'Cash Payment', NULL, NULL),
(4, 'CR', 'Cash Receipt', NULL, NULL),
(5, 'JV', 'Journal Voucher', NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_finished_goods_stock_report`
-- (See below for the actual view)
--
CREATE TABLE `v_finished_goods_stock_report` (
`id` bigint(20) unsigned
,`name` varchar(255)
,`code` varchar(255)
,`unit_weight` decimal(20,2)
,`sell_price` decimal(20,2)
,`qty_in` decimal(37,2)
,`qty_out` decimal(37,2)
,`balance` decimal(38,2)
,`category_id` bigint(20) unsigned
,`category_name` varchar(255)
,`purchase_price` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_item_stock_report`
-- (See below for the actual view)
--
CREATE TABLE `v_item_stock_report` (
`item_id` bigint(20) unsigned
,`qty_in` decimal(37,2)
,`qty_out` decimal(37,2)
,`balance` decimal(38,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_production_output_items`
-- (See below for the actual view)
--
CREATE TABLE `v_production_output_items` (
`id` bigint(20) unsigned
,`invoice_master_id` bigint(20) unsigned
,`date` date
,`invoice_no` varchar(255)
,`type` varchar(255)
,`item_id` bigint(20) unsigned
,`unit_weight` decimal(15,2)
,`total_quantity` decimal(15,2)
,`net_weight` decimal(15,2)
,`is_surplus` int(11)
,`per_unit_price` decimal(15,2)
,`total_price` decimal(15,2)
,`category_id` bigint(20) unsigned
,`grand_total` decimal(15,2)
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_raw_material_avg_unit_price`
-- (See below for the actual view)
--
CREATE TABLE `v_raw_material_avg_unit_price` (
`name` varchar(255)
,`item_id` bigint(20) unsigned
,`category_id` bigint(20) unsigned
,`category_name` varchar(255)
,`qty_in` decimal(37,2)
,`qty_out` decimal(37,2)
,`balance` decimal(38,2)
,`base_unit` char(50)
,`unit_id` bigint(20) unsigned
,`purchase_unit_price` decimal(15,2)
,`average_unit_price` decimal(43,6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_raw_material_stock_report`
-- (See below for the actual view)
--
CREATE TABLE `v_raw_material_stock_report` (
`name` varchar(255)
,`item_id` bigint(20) unsigned
,`category_id` bigint(20) unsigned
,`category_name` varchar(255)
,`qty_in` decimal(37,2)
,`qty_out` decimal(37,2)
,`balance` decimal(38,2)
,`base_unit` char(50)
,`unit_id` bigint(20) unsigned
,`purchase_unit_price` decimal(15,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_recipe_detail_stock`
-- (See below for the actual view)
--
CREATE TABLE `v_recipe_detail_stock` (
`name` varchar(255)
,`recipe_id` bigint(20) unsigned
,`item_id` bigint(20) unsigned
,`qty_in` decimal(37,2)
,`qty_out` decimal(37,2)
,`balance` decimal(38,2)
,`base_unit` char(50)
,`unit_id` bigint(20) unsigned
,`quantity` decimal(15,4)
,`purchase_unit_price` decimal(15,2)
,`last_purchase_unit_price` decimal(43,6)
);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Main Warehouse', '123-456-7890', 'mainwarehouse@example.com', '123 Main St, Cityville, Country', 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(2, 'Secondary Warehouse', '098-765-4321', 'secondarywarehouse@example.com', '456 Secondary St, Townsville, Country', 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(3, 'Overseas Warehouse', '555-123-4567', 'overseaswarehouse@example.com', '789 Overseas Rd, Metropolis, Country', 1, '2024-10-04 09:10:26', '2024-10-04 09:10:26'),
(4, 'Backup Warehouse', NULL, 'backupwarehouse@example.com', '101 Backup Lane, Hamlet, Country', 0, '2024-10-04 09:10:26', '2024-12-26 23:06:39'),
(5, 'T/K Farm', NULL, NULL, NULL, 1, '2024-12-03 15:21:47', '2024-12-03 15:21:47');

-- --------------------------------------------------------

--
-- Structure for view `v_finished_goods_stock_report`
--
DROP TABLE IF EXISTS `v_finished_goods_stock_report`;

CREATE OR REPLACE VIEW `v_finished_goods_stock_report`  AS SELECT `items`.`id` AS `id`, `items`.`name` AS `name`, `items`.`code` AS `code`, `items`.`unit_weight` AS `unit_weight`, `items`.`sell_price` AS `sell_price`, sum(if(`invoice_detail`.`type` = 'output',`invoice_detail`.`total_quantity`,0)) AS `qty_in`, sum(if(`invoice_detail`.`type` = 'invoice',`invoice_detail`.`total_quantity`,0)) AS `qty_out`, sum(if(`invoice_detail`.`type` = 'output',`invoice_detail`.`total_quantity`,0)) - sum(if(`invoice_detail`.`type` = 'invoice',`invoice_detail`.`total_quantity`,0)) AS `balance`, `items`.`category_id` AS `category_id`, `categories`.`name` AS `category_name`, `items`.`purchase_price` AS `purchase_price` FROM ((`items` left join `invoice_detail` on(`invoice_detail`.`item_id` = `items`.`id`)) join `categories` on(`items`.`category_id` = `categories`.`id`)) WHERE `items`.`type` = 'Good' GROUP BY `items`.`id`, `items`.`name`, `items`.`code`, `items`.`sell_price`, `items`.`purchase_price`, `items`.`unit_weight`, `items`.`category_id`, `categories`.`name` ;

-- --------------------------------------------------------

--
-- Structure for view `v_item_stock_report`
--
DROP TABLE IF EXISTS `v_item_stock_report`;

CREATE OR REPLACE VIEW `v_item_stock_report`  AS SELECT `invoice_detail`.`item_id` AS `item_id`, sum(if(`invoice_detail`.`type` = 'receipt',`invoice_detail`.`net_weight`,0)) AS `qty_in`, sum(if(`invoice_detail`.`type` = 'production',`invoice_detail`.`net_weight`,0)) AS `qty_out`, sum(if(`invoice_detail`.`type` = 'receipt',`invoice_detail`.`net_weight`,0)) - sum(if(`invoice_detail`.`type` = 'production',`invoice_detail`.`net_weight`,0)) AS `balance` FROM `invoice_detail` GROUP BY `invoice_detail`.`item_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_production_output_items`
--
DROP TABLE IF EXISTS `v_production_output_items`;

CREATE OR REPLACE VIEW `v_production_output_items`  AS SELECT `invoice_detail`.`id` AS `id`, `invoice_detail`.`invoice_master_id` AS `invoice_master_id`, `invoice_detail`.`date` AS `date`, `invoice_detail`.`invoice_no` AS `invoice_no`, `invoice_detail`.`type` AS `type`, `invoice_detail`.`item_id` AS `item_id`, `invoice_detail`.`unit_weight` AS `unit_weight`, `invoice_detail`.`total_quantity` AS `total_quantity`, `invoice_detail`.`net_weight` AS `net_weight`, `invoice_detail`.`is_surplus` AS `is_surplus`, `invoice_detail`.`per_unit_price` AS `per_unit_price`, `invoice_detail`.`total_price` AS `total_price`, `items`.`category_id` AS `category_id`, `invoice_detail`.`grand_total` AS `grand_total`, `items`.`name` AS `name` FROM (`invoice_detail` join `items` on(`invoice_detail`.`item_id` = `items`.`id`)) WHERE `invoice_detail`.`type` = 'output' ;

-- --------------------------------------------------------

--
-- Structure for view `v_raw_material_avg_unit_price`
--
DROP TABLE IF EXISTS `v_raw_material_avg_unit_price`;

CREATE OR REPLACE VIEW `v_raw_material_avg_unit_price`  AS SELECT `items`.`name` AS `name`, `items`.`id` AS `item_id`, `items`.`category_id` AS `category_id`, `categories`.`name` AS `category_name`, ifnull(`v_item_stock_report`.`qty_in`,0) AS `qty_in`, ifnull(`v_item_stock_report`.`qty_out`,0) AS `qty_out`, ifnull(`v_item_stock_report`.`balance`,0) AS `balance`, `units`.`base_unit` AS `base_unit`, `items`.`unit_id` AS `unit_id`, (select `invoice_detail`.`per_unit_price` from `invoice_detail` where `invoice_detail`.`type` = 'receipt' and `invoice_detail`.`item_id` = `items`.`id` order by `invoice_detail`.`date` desc limit 1) AS `purchase_unit_price`, (select sum(`invoice_detail`.`total_price_stock`) / sum(`invoice_detail`.`net_weight`) from `invoice_detail` where `invoice_detail`.`type` = 'receipt' and `invoice_detail`.`item_id` = `items`.`id`) AS `average_unit_price` FROM (((`items` left join `v_item_stock_report` on(`items`.`id` = `v_item_stock_report`.`item_id`)) join `units` on(`units`.`id` = `items`.`unit_id`)) left join `categories` on(`categories`.`id` = `items`.`category_id`)) WHERE `items`.`type` = 'Raw' ;

-- --------------------------------------------------------

--
-- Structure for view `v_raw_material_stock_report`
--
DROP TABLE IF EXISTS `v_raw_material_stock_report`;

CREATE OR REPLACE VIEW `v_raw_material_stock_report`  AS SELECT `items`.`name` AS `name`, `items`.`id` AS `item_id`, `items`.`category_id` AS `category_id`, `categories`.`name` AS `category_name`, ifnull(`v_item_stock_report`.`qty_in`,0) AS `qty_in`, ifnull(`v_item_stock_report`.`qty_out`,0) AS `qty_out`, ifnull(`v_item_stock_report`.`balance`,0) AS `balance`, `units`.`base_unit` AS `base_unit`, `items`.`unit_id` AS `unit_id`, (select `invoice_detail`.`per_unit_price` from `invoice_detail` where `invoice_detail`.`type` = 'receipt' and `invoice_detail`.`item_id` = `items`.`id` order by `invoice_detail`.`date` desc limit 1) AS `purchase_unit_price` FROM (((`items` left join `v_item_stock_report` on(`items`.`id` = `v_item_stock_report`.`item_id`)) join `units` on(`units`.`id` = `items`.`unit_id`)) left join `categories` on(`categories`.`id` = `items`.`category_id`)) WHERE `items`.`type` = 'Raw' ;

-- --------------------------------------------------------

--
-- Structure for view `v_recipe_detail_stock`
--
DROP TABLE IF EXISTS `v_recipe_detail_stock`;

CREATE OR REPLACE VIEW `v_recipe_detail_stock`  AS SELECT `items`.`name` AS `name`, `recipe_detail`.`recipe_id` AS `recipe_id`, `recipe_detail`.`item_id` AS `item_id`, ifnull(`v_item_stock_report`.`qty_in`,0) AS `qty_in`, ifnull(`v_item_stock_report`.`qty_out`,0) AS `qty_out`, ifnull(`v_item_stock_report`.`balance`,0) AS `balance`, `units`.`base_unit` AS `base_unit`, `recipe_detail`.`unit_id` AS `unit_id`, `recipe_detail`.`quantity` AS `quantity`, (select `invoice_detail`.`per_unit_price` from `invoice_detail` where `invoice_detail`.`type` = 'receipt' and `invoice_detail`.`item_id` = `recipe_detail`.`item_id` order by `invoice_detail`.`date` desc limit 1) AS `purchase_unit_price`, (select sum(`invoice_detail`.`grand_total`) / sum(`invoice_detail`.`net_weight`) from `invoice_detail` where `invoice_detail`.`type` = 'receipt' and `invoice_detail`.`item_id` = `items`.`id`) AS `last_purchase_unit_price` FROM (((`recipe_detail` join `items` on(`items`.`id` = `recipe_detail`.`item_id`)) left join `v_item_stock_report` on(`recipe_detail`.`item_id` = `v_item_stock_report`.`item_id`)) join `units` on(`units`.`id` = `recipe_detail`.`unit_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chart_of_accounts_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_expense_no_unique` (`expense_no`);

--
-- Indexes for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_details_expense_id_foreign` (`expense_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_detail_invoice_master_id_foreign` (`invoice_master_id`);

--
-- Indexes for table `invoice_master`
--
ALTER TABLE `invoice_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_master_invoice_no_unique` (`invoice_no`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journals_voucher_id_foreign` (`voucher_id`),
  ADD KEY `journals_expense_id_foreign` (`expense_id`);

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
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parties_type_index` (`type`);

--
-- Indexes for table `party_warehouses`
--
ALTER TABLE `party_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `party_warehouses_party_id_foreign` (`party_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prodcuts`
--
ALTER TABLE `prodcuts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_detail_recipe_id_foreign` (`recipe_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vouchers_voucher_no_unique` (`voucher_no`);

--
-- Indexes for table `voucher_details`
--
ALTER TABLE `voucher_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_details_voucher_id_foreign` (`voucher_id`);

--
-- Indexes for table `voucher_types`
--
ALTER TABLE `voucher_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531012;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_details`
--
ALTER TABLE `expense_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_master`
--
ALTER TABLE `invoice_master`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `party_warehouses`
--
ALTER TABLE `party_warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prodcuts`
--
ALTER TABLE `prodcuts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5223;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_details`
--
ALTER TABLE `voucher_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_types`
--
ALTER TABLE `voucher_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_details`
--
ALTER TABLE `expense_details`
  ADD CONSTRAINT `expense_details_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `invoice_detail_invoice_master_id_foreign` FOREIGN KEY (`invoice_master_id`) REFERENCES `invoice_master` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `journals`
--
ALTER TABLE `journals`
  ADD CONSTRAINT `journals_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `journals_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `party_warehouses`
--
ALTER TABLE `party_warehouses`
  ADD CONSTRAINT `party_warehouses_party_id_foreign` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  ADD CONSTRAINT `recipe_detail_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `voucher_details`
--
ALTER TABLE `voucher_details`
  ADD CONSTRAINT `voucher_details_voucher_id_foreign` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
