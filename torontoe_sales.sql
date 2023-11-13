-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2023 at 06:26 AM
-- Server version: 10.5.22-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `torontoe_sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_user`
--

CREATE TABLE `account_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `phone_No` varchar(150) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_user`
--

INSERT INTO `account_user` (`id`, `password`, `last_login`, `is_superuser`, `email`, `fullname`, `is_admin`, `phone_No`, `created_at`, `updated_at`, `is_staff`, `is_active`, `address`, `image`) VALUES
(1, 'pbkdf2_sha256$600000$4eEym3BbAvjPcnO0qSIgZP$owNmQiRdrqa7+KRnB7DV35/8dTz+YofhJgeu3jDw0yw=', '2023-11-04 14:07:01.412863', 1, 'admin@gmail.com', 'admin', 1, '9865326598', '2023-10-05', '2023-10-05', 1, 1, NULL, ''),
(11, 'pbkdf2_sha256$600000$n1QTrRcLfWDQkJpRk7flQS$jaPIw0uEH6lKSNcEb0WhvWarexfdxAvY1MTwbT20ZAg=', '2023-11-04 13:53:11.526287', 0, 'Priyanka@ricemill.com', 'Priyanka Jaiswal', 1, '9801300415', '2023-10-19', '2023-10-19', 1, 1, 'Jayrajpur', ''),
(12, 'pbkdf2_sha256$600000$w2mUlLoRXJZYLOJj10Ioft$ICiULpB0g9bqrsuWwoqvFz6XlZO+lwkpYrMnHlFbuxQ=', '2023-11-05 05:52:05.401995', 0, 'Rakesh@ricemill.com', 'Rakesh Ram', 1, '9821858475', '2023-10-19', '2023-10-19', 1, 1, 'Jayrajpur', ''),
(13, 'pbkdf2_sha256$600000$B1IK7cgRNrmdzwx6M6PoLs$sfFumF+3LIAKQlEjjJmiSNJRF7drO9aH49BSXwZU/dk=', '2023-11-02 10:46:49.490601', 0, 'Papa@ricemill.com', 'Papa', 1, '9801300415', '2023-10-20', '2023-10-20', 1, 1, 'Jayrajpur', '');

-- --------------------------------------------------------

--
-- Table structure for table `account_user_groups`
--

CREATE TABLE `account_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_user_groups`
--

INSERT INTO `account_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 11, 1),
(3, 12, 1),
(4, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_user_user_permissions`
--

CREATE TABLE `account_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_customer`
--

CREATE TABLE `app_customer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `added_date` date NOT NULL,
  `name_slug` varchar(50) NOT NULL,
  `nepali_added_date` varchar(200) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `toll_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_customer`
--

INSERT INTO `app_customer` (`id`, `name`, `address`, `email`, `added_date`, `name_slug`, `nepali_added_date`, `phone_number`, `toll_id`) VALUES
(6, 'मोबारक मिआ', 'खाजुरिया टोला', 'kundan.kr461@gmail.com', '2023-10-19', 'customer', '02-Kartik-2080', '9801300415', 22),
(7, 'तहिद', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-2', '02-Kartik-2080', '9801300415', 22),
(8, 'इनाइत', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-3', '02-Kartik-2080', '9801300415', 22),
(9, 'रोबाइदा अलिके बहिन', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-4', '02-Kartik-2080', '9801300415', 22),
(11, 'लाल बाबु मंसुरी', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-5', '02-Kartik-2080', '9801300415', 22),
(12, 'ओकिल', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-6', '02-Kartik-2080', '9801300415', 22),
(13, 'अजुब मिआ', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-7', '02-Kartik-2080', '9801300415', 22),
(14, 'मकबुल मिआ', 'Jayrajpur ', 'kundan.kr461@gmail.com', '2023-10-19', 'customer-8', '02-Kartik-2080', '9801300415', 22),
(15, 'मुनी तिवारी ', 'जोगौलिया ', '', '2023-10-19', 'customer-9', '02-Kartik-2080', '9806324545', 11),
(16, 'जितेन्द्र चौधरी', 'जोगौलिया ', '', '2023-10-19', 'customer-10', '02-Kartik-2080', '9806324545', 11),
(17, 'महमद तुजयर', 'जोगौलिया ', '', '2023-10-19', 'customer-11', '02-Kartik-2080', '9806324545', 11),
(18, 'नगिनदर माझी ', 'जोगौलिया ', '', '2023-10-19', 'customer-12', '02-Kartik-2080', '9806324545', 11),
(19, 'दिपेन्द्र साह', 'जोगौलिया ', '', '2023-10-19', 'customer-13', '02-Kartik-2080', '9806324545', 11),
(20, 'सुरीनदर मुखिया ', 'जयराजपुर ', '', '2023-10-19', 'customer-14', '02-Kartik-2080', '9806324545', 14),
(21, 'नजिर साई', 'जयराजपुर ', '', '2023-10-19', 'customer-15', '02-Kartik-2080', '9806324545', 14),
(22, 'हसन मीआ', 'जयराजपुर ', '', '2023-10-19', 'customer-16', '02-Kartik-2080', '9806324545', 14),
(23, 'इनदल चौधरी', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-17', '03-Kartik-2080', '9801300415', 11),
(24, 'दीपेन्द्र साह', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-18', '03-Kartik-2080', '9801300415', 11),
(25, 'राम नारायण महतो', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-19', '03-Kartik-2080', '9801300415', 11),
(26, 'अभिमनु', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-20', '03-Kartik-2080', '9801300415', 11),
(27, 'बासुदेव महतो', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-21', '03-Kartik-2080', '9801300415', 11),
(28, 'मंगरु माझी', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-22', '03-Kartik-2080', '9801300415', 11),
(29, 'सगिर मीआ ', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-23', '03-Kartik-2080', '9801300415', 11),
(30, 'बिलय मीआ', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-24', '03-Kartik-2080', '9801300415', 11),
(31, 'रीसिजिई', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-25', '03-Kartik-2080', '9801300415', 11),
(32, 'रुपन माझी', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-26', '03-Kartik-2080', '9801300415', 11),
(33, 'दिनेश महतो', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-27', '03-Kartik-2080', '9801300415', 11),
(34, 'जयप्रकाश चौधरी', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-28', '03-Kartik-2080', '9801300415', 11),
(35, 'संजय मनडल', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-29', '03-Kartik-2080', '9801300415', 11),
(36, 'हीरालाल चौधरी', 'जोगौलिया', 'kundan.kr461@gmail.com', '2023-10-20', 'customer-30', '03-Kartik-2080', '9801300415', 11),
(37, 'बचु माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-31', '03-Kartik-2080', '9801300415', 11),
(38, 'राम ऐकवाल साह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-32', '03-Kartik-2080', '9801300415', 11),
(39, 'ओल जाहिर', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-33', '03-Kartik-2080', '9801300415', 11),
(40, 'प्रकाश माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-34', '03-Kartik-2080', '9801300415', 11),
(41, 'ओपिनदर माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-35', '03-Kartik-2080', '9801300415', 11),
(42, 'नेक महमद', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-36', '03-Kartik-2080', '9801300415', 11),
(43, 'केवाल माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-37', '03-Kartik-2080', '9801300415', 11),
(44, 'सफराज', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-38', '03-Kartik-2080', '9801300415', 11),
(45, 'बरेश माझी इनदल के बेटा', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-39', '03-Kartik-2080', '9801300415', 11),
(46, 'ओसीअमद', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-40', '03-Kartik-2080', '9801300415', 11),
(47, 'राजिनदर साह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-41', '03-Kartik-2080', '9801300415', 11),
(48, 'माऐनोदिन', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-42', '03-Kartik-2080', '9801300415', 11),
(49, 'मोसी आलम', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-43', '03-Kartik-2080', '9801300415', 11),
(50, 'सचिनदर महतो', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-44', '03-Kartik-2080', '9801300415', 11),
(51, 'अजित ठाकुर', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-45', '03-Kartik-2080', '9801300415', 11),
(52, 'कलिम  मिआ', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-46', '03-Kartik-2080', '9801300415', 11),
(53, 'उमेश चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-47', '03-Kartik-2080', '9801300415', 11),
(54, 'अब्दुल सलाम', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-48', '03-Kartik-2080', '9801300415', 11),
(55, 'परदेशी माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-49', '03-Kartik-2080', '9801300415', 11),
(56, 'सराताज', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-50', '03-Kartik-2080', '9801300415', 11),
(57, 'बिरबल माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-51', '03-Kartik-2080', '9801300415', 11),
(58, 'रबेनदर माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-52', '03-Kartik-2080', '9801300415', 11),
(59, 'राजक कुमार', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-53', '03-Kartik-2080', '9801300415', 11),
(60, 'बिगन', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-54', '03-Kartik-2080', '9801300415', 11),
(61, 'नेमी ठाकुर', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-55', '03-Kartik-2080', '9801300415', 11),
(62, 'सरोज चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-56', '03-Kartik-2080', '9801300415', 11),
(63, 'राम ऐकवाल माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-57', '03-Kartik-2080', '9801300415', 11),
(64, 'लालबाबु माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-58', '03-Kartik-2080', '9801300415', 11),
(65, 'प्रसाद साह कानु', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-59', '03-Kartik-2080', '9801300415', 11),
(66, 'बिरेन्द्र महतो', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-60', '03-Kartik-2080', '9801300415', 11),
(67, 'दिनेश माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-61', '03-Kartik-2080', '9801300415', 11),
(68, 'अब्दुल खलीक', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-62', '03-Kartik-2080', '9801300415', 11),
(69, 'बिसाल साह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-63', '03-Kartik-2080', '9801300415', 11),
(71, 'सिताराम महतो', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-64', '03-Kartik-2080', '9801300415', 11),
(72, 'गोबिन माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-65', '03-Kartik-2080', '9801300415', 11),
(73, 'समभु माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-66', '03-Kartik-2080', '9801300415', 11),
(74, 'रामभजन', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-67', '03-Kartik-2080', '9801300415', 11),
(75, 'टइट माझि', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-68', '03-Kartik-2080', '9801300415', 11),
(76, 'अलिहसन आटोबाल', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-69', '03-Kartik-2080', '9801300415', 11),
(77, 'सकुल माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-70', '03-Kartik-2080', '9801300415', 11),
(78, 'मदन चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-71', '03-Kartik-2080', '9801300415', 11),
(79, 'राम प्रकाश', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-72', '03-Kartik-2080', '9801300415', 11),
(80, 'राम ऐकवाल साह कानु', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-73', '03-Kartik-2080', '9801300415', 11),
(81, 'मेघु माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-74', '03-Kartik-2080', '9801300415', 11),
(82, 'महेशि माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-75', '03-Kartik-2080', '9801300415', 11),
(83, 'अरबिन्द चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-76', '03-Kartik-2080', '9801300415', 11),
(84, 'बदरी चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-77', '03-Kartik-2080', '9801300415', 11),
(85, 'शेख तहिरुल', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-78', '03-Kartik-2080', '9801300415', 11),
(86, 'सलैहोदिन', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-79', '03-Kartik-2080', '9801300415', 11),
(87, 'बिजय माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-80', '03-Kartik-2080', '9801300415', 11),
(88, 'जमसैयद', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-81', '03-Kartik-2080', '9801300415', 11),
(89, 'सुबस राउत', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-82', '03-Kartik-2080', '9801300415', 11),
(90, 'सनौलह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-83', '03-Kartik-2080', '320', 11),
(91, 'चंदन चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-84', '03-Kartik-2080', '9801300415', 11),
(92, 'सफुलाह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-85', '03-Kartik-2080', '9801300415', 11),
(93, 'रमतुलाह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-86', '03-Kartik-2080', '9801300415', 11),
(94, 'ओहिर', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-87', '03-Kartik-2080', '9801300415', 11),
(95, 'बिनदेसर महतो', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-88', '03-Kartik-2080', '9801300415', 11),
(96, 'बचु महतो', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-89', '03-Kartik-2080', '9801300415', 11),
(97, 'प्रेमजित', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-90', '03-Kartik-2080', '9801300415', 11),
(98, 'दिनेश यादव', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-91', '03-Kartik-2080', '9801300415', 11),
(99, 'रामप्रसाद साह कानु', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-92', '03-Kartik-2080', '9801300415', 11),
(100, 'सुबास चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-93', '03-Kartik-2080', '9801300415', 11),
(101, 'सनतलाल', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-94', '03-Kartik-2080', '9801300415', 11),
(102, 'सोनालाल माझी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-95', '03-Kartik-2080', '9801300415', 11),
(103, 'महिन्द्रा साह', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-96', '03-Kartik-2080', '9801300415', 11),
(104, 'बिजय ठाकुर', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-97', '03-Kartik-2080', '9801300415', 11),
(105, 'मिसरीलाल चौधरी', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-98', '03-Kartik-2080', '9801300415', 11),
(106, 'मुनिजिई', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-99', '03-Kartik-2080', '9801300415', 11),
(107, 'सतार मिआ', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-100', '03-Kartik-2080', '9801300415', 11),
(108, 'राजाराम महतो', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-101', '03-Kartik-2080', '9801300415', 11),
(109, 'कलीम मिया', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-102', '03-Kartik-2080', '9801300415', 11),
(110, 'अजित ठाकुर', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-103', '03-Kartik-2080', '9801300415', 11),
(111, 'मोही आलम', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-104', '03-Kartik-2080', '9801300415', 11),
(112, 'माऐनोदीन', 'जोगौलिया', 'Priyanka@ricemill.com', '2023-10-20', 'customer-105', '03-Kartik-2080', '9801300415', 11),
(113, 'टाईट साह', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-106', '03-Kartik-2080', '9801300415', 14),
(114, 'गुल महमद लाल महमद के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-107', '03-Kartik-2080', '9801300415', 14),
(115, 'रामयजोधाय पंडित', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-108', '03-Kartik-2080', '9801300415', 14),
(116, 'सराजुल पंच', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-109', '03-Kartik-2080', '9801300415', 14),
(117, 'देवानन्द चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-110', '03-Kartik-2080', '9801300415', 14),
(118, 'समसुल मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-111', '03-Kartik-2080', '9801300415', 14),
(119, 'सहिम मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-112', '03-Kartik-2080', '9801300415', 14),
(120, 'चुनु देवान', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-113', '03-Kartik-2080', '9801300415', 14),
(121, 'भिखारी मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-114', '03-Kartik-2080', '9801300415', 14),
(122, 'पोमा मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-115', '03-Kartik-2080', '9801300415', 14),
(123, 'गुफा मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-116', '03-Kartik-2080', '9801300415', 14),
(124, 'मोजाहिर मिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-117', '03-Kartik-2080', '9801300415', 14),
(125, 'बिगु देवन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-118', '03-Kartik-2080', '9801300415', 14),
(126, 'रामदेव मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-119', '03-Kartik-2080', '9801300415', 14),
(127, 'रहुप मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-120', '03-Kartik-2080', '9801300415', 14),
(128, 'गनी महमद मास्टर', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-121', '03-Kartik-2080', '9801300415', 14),
(129, 'मुकेश चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-122', '03-Kartik-2080', '9801300415', 14),
(130, 'जंगली मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-123', '03-Kartik-2080', '9801300415', 14),
(131, 'कुइस अंसारी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-124', '03-Kartik-2080', '9801300415', 14),
(132, 'बिहारी महतो', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-125', '03-Kartik-2080', '9801300415', 14),
(133, 'शंकर साह', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-126', '03-Kartik-2080', '9801300415', 14),
(134, 'मनिर साइ फकिर', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-127', '03-Kartik-2080', '9801300415', 14),
(135, 'फुलमहमद नेक महमद के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-128', '03-Kartik-2080', '9801300415', 14),
(136, 'बिगु महतो', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-129', '03-Kartik-2080', '9801300415', 14),
(137, 'लुटन मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-130', '03-Kartik-2080', '9801300415', 14),
(138, 'अछेलाल साह', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-131', '03-Kartik-2080', '9801300415', 14),
(139, 'ब्रहम देव मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-132', '03-Kartik-2080', '9801300415', 14),
(140, 'राम पुकार चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-133', '03-Kartik-2080', '9801300415', 14),
(141, 'बिकाउ साह कलवार', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-134', '03-Kartik-2080', '9801300415', 14),
(142, 'राजाराम पंडित', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-135', '03-Kartik-2080', '9801300415', 14),
(143, 'रामजी चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-136', '03-Kartik-2080', '9801300415', 14),
(144, 'मुकती मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-137', '03-Kartik-2080', '9801300415', 14),
(145, 'नेक महमद मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-138', '03-Kartik-2080', '9801300415', 14),
(146, 'भुटा देवान', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-139', '03-Kartik-2080', '9801300415', 14),
(147, 'सुखली यादब', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-140', '03-Kartik-2080', '9801300415', 14),
(148, 'फिरोज मिआ नगिनीयाके', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-141', '03-Kartik-2080', '9801300415', 17),
(149, 'चेतन राम', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-142', '03-Kartik-2080', '9801300415', 17),
(150, 'जितेन्द्र चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-143', '03-Kartik-2080', '9801300415', 17),
(151, 'रफिक देवान', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-144', '03-Kartik-2080', '9801300415', 17),
(152, 'जियाउल जमुलाह के भाई', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-145', '03-Kartik-2080', '9801300415', 17),
(153, 'हफिज मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-146', '03-Kartik-2080', '9801300415', 17),
(154, 'मुकति चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-147', '03-Kartik-2080', '9801300415', 17),
(155, 'सफुरलाह चिक', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-148', '03-Kartik-2080', '9801300415', 17),
(156, 'तैयाब हबिब के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-149', '03-Kartik-2080', '9801300415', 17),
(157, 'किसोरी चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-150', '03-Kartik-2080', '9801300415', 17),
(158, 'रामनाथ चौधरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-151', '03-Kartik-2080', '9801300415', 17),
(159, 'सराजुल सदाम के ससुर', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-152', '03-Kartik-2080', '9801300415', 17),
(160, 'अब्दुल रहिम', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-153', '03-Kartik-2080', '9801300415', 17),
(161, 'सगिर मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-154', '03-Kartik-2080', '9801300415', 17),
(162, 'जमुलाह मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-155', '03-Kartik-2080', '9801300415', 17),
(163, 'महिन्द्रा चौधरी मुकती के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-156', '03-Kartik-2080', '9801300415', 17),
(164, 'सफिक देवान', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-157', '03-Kartik-2080', '9801300415', 17),
(165, 'सहिद अंसारी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-158', '03-Kartik-2080', '9801300415', 17),
(166, 'अइतुलाह मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-159', '03-Kartik-2080', '9801300415', 17),
(167, 'मोहिआ-मरनी के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-20', 'customer-160', '03-Kartik-2080', '9801300415', 14),
(168, 'मैरोदीन', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-161', '03-Kartik-2080', '9801300415', 12),
(169, 'मोकतार मिआ', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-162', '03-Kartik-2080', '9801300415', 12),
(170, 'इरफान अन्सारी', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-163', '03-Kartik-2080', '9801300415', 12),
(171, 'बद्री जामन', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-164', '03-Kartik-2080', '9801300415', 12),
(172, 'हरुन', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-165', '03-Kartik-2080', '9801300415', 12),
(173, 'रमतुलाह', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-166', '03-Kartik-2080', '9801300415', 12),
(174, 'सराजुल पंच', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-167', '03-Kartik-2080', '9801300415', 12),
(175, 'मेराजुल', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-168', '03-Kartik-2080', '9801300415', 12),
(176, 'मोहन', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-169', '03-Kartik-2080', '9801300415', 12),
(177, 'अदुद', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-170', '03-Kartik-2080', '9801300415', 12),
(178, 'मोसियालम', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-171', '03-Kartik-2080', '9801300415', 12),
(179, 'नेजामोदिन मसजित टोल', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-172', '03-Kartik-2080', '9801300415', 12),
(180, 'हासिम', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-173', '03-Kartik-2080', '9801300415', 12),
(181, 'साजिद', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-174', '03-Kartik-2080', '9801300415', 12),
(182, 'अरमान', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-175', '03-Kartik-2080', '9801300415', 12),
(183, 'कमरोदिन', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-176', '03-Kartik-2080', '9801300415', 12),
(184, 'नेक महमद', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-177', '03-Kartik-2080', '9801300415', 12),
(185, 'मोसताफ सैलोदिन के बेटा', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-178', '03-Kartik-2080', '9801300415', 12),
(186, 'सलिम देवान', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-179', '03-Kartik-2080', '9801300415', 12),
(187, 'सफिउलाह', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-180', '03-Kartik-2080', '9801300415', 12),
(188, 'महमद', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-181', '03-Kartik-2080', '9801300415', 12),
(189, 'समिउलाह सानो', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-182', '03-Kartik-2080', '9801300415', 12),
(190, 'अलाउदिन मोलबी', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-183', '03-Kartik-2080', '9801300415', 12),
(191, 'फिरोज मिया', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-184', '03-Kartik-2080', '9801300415', 12),
(192, 'नसिर देवान', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-185', '03-Kartik-2080', '9801300415', 12),
(193, 'शेख ओसिअमद', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-186', '03-Kartik-2080', '9801300415', 12),
(194, 'ओकिल', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-187', '03-Kartik-2080', '9801300415', 12),
(195, 'कलिम', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-188', '03-Kartik-2080', '9801300415', 12),
(196, 'जोबैर मिसतिरी', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-189', '03-Kartik-2080', '9801300415', 12),
(197, 'बिलाईत', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-190', '03-Kartik-2080', '9801300415', 12),
(198, 'रसुल मिया', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-191', '03-Kartik-2080', '9801300415', 12),
(199, 'नुर्सैद मिया', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-192', '03-Kartik-2080', '9801300415', 12),
(200, 'कासिम', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-193', '03-Kartik-2080', '9801300415', 12),
(201, 'रोज महमद', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-194', '03-Kartik-2080', '9801300415', 12),
(202, 'ओजैर', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-195', '03-Kartik-2080', '9801300415', 12),
(203, 'शेख ताहिरुल', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-196', '03-Kartik-2080', '9801300415', 12),
(204, 'समेत आलम', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-197', '03-Kartik-2080', '9801300415', 12),
(205, 'जमालोदिन मास्टर', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-198', '03-Kartik-2080', '9801300415', 12),
(206, 'इरसाद(अटो वाला)', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-199', '03-Kartik-2080', '9801300415', 12),
(207, 'मोहरम', 'Devipur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-200', '03-Kartik-2080', '9801300415', 12),
(208, 'संजय यादब', 'Jayrajpur', 'Priyanka@ricemill.com', '2023-10-20', 'customer-201', '03-Kartik-2080', '9801300415', 18),
(209, 'जुमन के पुतोह गाउँ बालि', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-202', '04-Kartik-2080', '9801300415', 18),
(210, 'उमेश राम', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-203', '04-Kartik-2080', '9801300415', 18),
(211, 'राम ऐकवाल राम', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-204', '04-Kartik-2080', '9801300415', 18),
(212, 'बिजय यादब', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-205', '04-Kartik-2080', '9801300415', 18),
(213, 'जमालोदिन चिक', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-206', '04-Kartik-2080', '9801300415', 18),
(214, 'शयाम यादब', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-207', '04-Kartik-2080', '9801300415', 18),
(215, 'अब्दुल खाएर मिआ', 'Devipur', 'Priyanka@ricemill.com', '2023-10-21', 'customer-208', '04-Kartik-2080', '9801300415', 18),
(216, 'अमरोदिन मंनसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-209', '04-Kartik-2080', '9801300415', 18),
(217, 'सैतुलाह मिया भोलाके', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-210', '04-Kartik-2080', '9801300415', 18),
(218, 'करमुलाह मीआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-211', '04-Kartik-2080', '9801300415', 19),
(219, 'सैतुलाह मिआ ओशइ के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-212', '04-Kartik-2080', '9801300415', 19),
(220, 'मजबुलह हसन के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-213', '04-Kartik-2080', '9801300415', 18),
(221, 'तहिर मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-214', '04-Kartik-2080', '9801300415', 19),
(222, 'जदुआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-215', '04-Kartik-2080', '9801300415', 19),
(223, 'सहिद हसन के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-216', '04-Kartik-2080', '9801300415', 19),
(224, 'नाओसैद मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-217', '04-Kartik-2080', '9801300415', 19),
(225, 'खैराती भाट', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-218', '04-Kartik-2080', '9801300415', 19),
(226, 'तबारक मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-219', '04-Kartik-2080', '9801300415', 19),
(227, 'बच्चु महमद हनिफ के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-220', '04-Kartik-2080', '9801300415', 19),
(228, 'रमतुलाह ओसिके', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-221', '04-Kartik-2080', '9801300415', 19),
(229, 'रहिम मिआ सफुरलाह के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-222', '04-Kartik-2080', '9801300415', 19),
(230, 'राम परताप चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-223', '04-Kartik-2080', '9801300415', 13),
(231, 'बिनोध पसावन', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-224', '04-Kartik-2080', '9801300415', 13),
(232, 'असोक चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-225', '04-Kartik-2080', '9801300415', 13),
(233, 'जितेन्द्र चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-226', '04-Kartik-2080', '9801300415', 13),
(234, 'बिजय चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-227', '04-Kartik-2080', '9801300415', 13),
(235, 'सिकिनदर चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-228', '04-Kartik-2080', '9801300415', 13),
(236, 'फुल गेन चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-229', '04-Kartik-2080', '9801300415', 13),
(237, 'रामपुकार चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-230', '04-Kartik-2080', '9801300415', 13),
(238, 'आरेयन चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-231', '04-Kartik-2080', '9801300415', 13),
(239, 'कुनज बिहारी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-232', '04-Kartik-2080', '9801300415', 13),
(240, 'राजेश चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-233', '04-Kartik-2080', '9801300415', 13),
(241, 'बिक्रम', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-234', '04-Kartik-2080', '9801300415', 13),
(242, 'किसननदन चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-235', '04-Kartik-2080', '9801300415', 13),
(243, 'अर्जुन चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-236', '04-Kartik-2080', '9801300415', 13),
(244, 'प्रकाश चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-237', '04-Kartik-2080', '9801300415', 13),
(245, 'बिसल राम', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-238', '04-Kartik-2080', '9801300415', 13),
(246, 'बिजय माझी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-239', '04-Kartik-2080', '9801300415', 13),
(247, 'दिपुराम', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-240', '04-Kartik-2080', '9801300415', 13),
(248, 'राम ऐकवाल चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-241', '04-Kartik-2080', '9801300415', 13),
(249, 'सम्भु चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-242', '04-Kartik-2080', '9801300415', 13),
(250, 'बलिराम चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-243', '04-Kartik-2080', '9801300415', 13),
(251, 'पसुराम पासवान', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-244', '04-Kartik-2080', '9801300415', 13),
(252, 'पवान चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-245', '04-Kartik-2080', '9801300415', 13),
(253, 'उमेश पसवान', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-246', '04-Kartik-2080', '9801300415', 13),
(254, 'बचु चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-247', '04-Kartik-2080', '9801300415', 13),
(255, 'मनिषा चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-248', '04-Kartik-2080', '9801300415', 13),
(256, 'दिपेन्द्र', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-249', '04-Kartik-2080', '9801300415', 13),
(257, 'शनी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-250', '04-Kartik-2080', '9801300415', 13),
(258, 'राम प्रकाश चौधारी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-251', '04-Kartik-2080', '9801300415', 13),
(259, 'जाऐराम चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-252', '04-Kartik-2080', '9801300415', 13),
(260, 'धिरज चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-253', '04-Kartik-2080', '9801300415', 13),
(261, 'जयलाल', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-254', '04-Kartik-2080', '9801300415', 13),
(262, 'राजबिर चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-255', '04-Kartik-2080', '9801300415', 13),
(263, 'सनतलाल चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-256', '04-Kartik-2080', '9801300415', 13),
(264, 'प्रेम चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-257', '04-Kartik-2080', '9801300415', 13),
(265, 'रामबाबु चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-258', '04-Kartik-2080', '9801300415', 13),
(266, 'केसवर', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-259', '04-Kartik-2080', '9801300415', 13),
(267, 'नेमीलाल चौधरी', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-260', '04-Kartik-2080', '9801300415', 13),
(268, 'अधिकलाल', 'Pipra', 'Priyanka@ricemill.com', '2023-10-21', 'customer-261', '04-Kartik-2080', '9801300415', 13),
(269, 'महमद हुसेन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-262', '04-Kartik-2080', '9801300415', 16),
(270, 'जाकिर मीआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-263', '04-Kartik-2080', '9801300415', 16),
(271, 'समिआकतर मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-264', '04-Kartik-2080', '9801300415', 16),
(272, 'हजरात देवान', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-265', '04-Kartik-2080', '9801300415', 16),
(273, 'मोकतार मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-266', '04-Kartik-2080', '9801300415', 16),
(274, 'रसुल मिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-267', '04-Kartik-2080', '9801300415', 16),
(275, 'अबदुलाह मोलबी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-268', '04-Kartik-2080', '9801300415', 16),
(276, 'मेराज हकिम के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-269', '04-Kartik-2080', '9801300415', 16),
(277, 'ननक मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-270', '04-Kartik-2080', '9801300415', 16),
(278, 'गोरखा नाथ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-271', '04-Kartik-2080', '9801300415', 16),
(279, 'जैरुलाह मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-272', '04-Kartik-2080', '9801300415', 16),
(280, 'गोपाल मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-273', '04-Kartik-2080', '9801300415', 16),
(281, 'कासिम रबेआव के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-274', '04-Kartik-2080', '9801300415', 16),
(282, 'रफिक मिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-275', '04-Kartik-2080', '9801300415', 16),
(283, 'रफिक मिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-276', '04-Kartik-2080', '9801300415', 16),
(284, 'हेफाजत के पुतोह जमसाऐद', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-277', '04-Kartik-2080', '9801300415', 16),
(285, 'जबार मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-278', '04-Kartik-2080', '9801300415', 16),
(286, 'बसिर सहिम के दमाद', 'Jayrajpur ', '', '2023-10-21', 'customer-279', '04-Kartik-2080', '9801300415', 16),
(287, 'गफुर मिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-280', '04-Kartik-2080', '9801300415', 16),
(288, 'इरसाद', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-281', '04-Kartik-2080', '9801300415', 16),
(289, 'मोतिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-282', '04-Kartik-2080', '9801300415', 16),
(290, 'बैतुलाह देवान', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-283', '04-Kartik-2080', '9801300415', 16),
(291, 'कासिम चिक', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-284', '04-Kartik-2080', '9801300415', 16),
(292, 'तैयव कल मिस्त्री', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-285', '04-Kartik-2080', '9801300415', 16),
(293, 'राम प्रबेश मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-286', '04-Kartik-2080', '9801300415', 15),
(294, 'राजिनदर मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-287', '04-Kartik-2080', '9801300415', 15),
(295, 'बिनदेसर मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-288', '04-Kartik-2080', '9801300415', 15),
(296, 'खाहेरु मिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-289', '04-Kartik-2080', '9801300415', 15),
(297, 'सलाहोदी मीआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-290', '04-Kartik-2080', '9801300415', 15),
(298, 'मदनी मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-291', '04-Kartik-2080', '9801300415', 15),
(299, 'नगिनदर मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-292', '04-Kartik-2080', '9801300415', 15),
(300, 'कूषननदन यादब', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-293', '04-Kartik-2080', '9801300415', 15),
(301, 'हरदेव मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-294', '04-Kartik-2080', '9801300415', 15),
(302, 'सुबनारायान यादब', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-295', '04-Kartik-2080', '9801300415', 15),
(303, 'जागा मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-296', '04-Kartik-2080', '9801300415', 15),
(304, 'बिकाउ यादब', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-297', '04-Kartik-2080', '9801300415', 15),
(305, 'ढोरा मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-298', '04-Kartik-2080', '9801300415', 15),
(306, 'हरि पंडित', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-299', '04-Kartik-2080', '9801300415', 15),
(307, 'धमोल मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-300', '04-Kartik-2080', '9801300415', 15),
(308, 'मोकतार मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-301', '04-Kartik-2080', '9801300415', 15),
(309, 'नेजम मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-302', '04-Kartik-2080', '9801300415', 15),
(310, 'तहिर मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-303', '04-Kartik-2080', '9801300415', 15),
(311, 'पिआराक', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-304', '04-Kartik-2080', '9801300415', 15),
(312, 'असरफि पंडित', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-305', '04-Kartik-2080', '9801300415', 15),
(313, 'सराजुल मनैवा के', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-306', '04-Kartik-2080', '9801300415', 15),
(314, 'मेराज मंसुरी ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-307', '04-Kartik-2080', '9801300415', 15),
(315, 'अलाहुदीन मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-308', '04-Kartik-2080', '9801300415', 15),
(316, 'जाजुल मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-309', '04-Kartik-2080', '9801300415', 15),
(317, 'मदन मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-310', '04-Kartik-2080', '9801300415', 15),
(318, 'बिरेन्द्र मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-311', '04-Kartik-2080', '9801300415', 15),
(319, 'रहमान मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-312', '04-Kartik-2080', '9801300415', 15),
(320, 'साफि महमद', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-313', '04-Kartik-2080', '9801300415', 15),
(321, 'सुभान मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-314', '04-Kartik-2080', '9801300415', 15),
(322, 'पनिलाल पंडित', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-315', '04-Kartik-2080', '9801300415', 14),
(323, 'हसमुलह मंसुरी', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-316', '04-Kartik-2080', '9801300415', 15),
(324, 'मनिलाल मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-317', '04-Kartik-2080', '9801300415', 15),
(325, 'गुलजार मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-318', '04-Kartik-2080', '9801300415', 15),
(326, 'लाल महमद मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-319', '04-Kartik-2080', '9801300415', 15),
(327, 'सोनलाल मुखिया', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-320', '04-Kartik-2080', '9801300415', 15),
(328, 'हरफुलह मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-321', '04-Kartik-2080', '9801300415', 15),
(329, 'गंगाराम पंडित', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-322', '04-Kartik-2080', '9801300415', 15),
(330, 'हमिद दलाल', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-323', '04-Kartik-2080', '9801300415', 15),
(331, 'इनताफ मिआ', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-324', '04-Kartik-2080', '9801300415', 15),
(332, 'दैसाइ मुखिया बिन', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-325', '04-Kartik-2080', '9801300415', 15),
(333, 'राजेश मुखिया बिन बहादुर के बेटा', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-326', '04-Kartik-2080', '9801300415', 15),
(334, 'सफुरलाह- सतार के बेटा', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-21', 'customer-327', '04-Kartik-2080', '9801300415', 16),
(335, 'महिन्द्रा ', 'जयराजपुर ', '', '2023-10-21', 'customer-328', '04-Kartik-2080', '9806324545', 14),
(336, 'Kundan Jaiswal', 'Harsaha', 'Priyanka@ricemill.com', '2023-10-22', 'kundan-jaiswal', '05-Kartik-2080', '9801300415', 20),
(337, 'ram', 'Jayrajpur ', 'Priyanka@ricemill.com', '2023-10-22', 'ram', '05-Kartik-2080', '9801300415', 20),
(338, 'पवन पासवान ', 'पिपरा ', 'rk4841797@gmail.com', '2023-10-26', 'customer-329', '09-Kartik-2080', '9821858475', 13),
(339, 'सिउरज पंडित ', 'Jayrajpur ', 'rk4841797@gmail.com', '2023-10-26', 'customer-330', '09-Kartik-2080', '9821858475', 15),
(340, 'IT', 'Company', '', '2023-10-29', 'it', '12-Kartik-2080', '9801095004', 13),
(341, 'कुन्दन ', 'जयराजपुर ', '', '2023-10-29', 'customer-331', '12-Kartik-2080', '9806324545', 14),
(342, 'कुइस चिक', 'जयराजपुर ', '', '2023-11-01', 'customer-332', '15-Kartik-2080', '9806324545', 18),
(343, 'कैमुल डाक्टर ', 'जयराजपुर ', '', '2023-11-02', 'customer-333', '16-Kartik-2080', '9806324545', 16),
(344, 'दिनेश पासवान ', 'पिपरा ', '', '2023-11-02', 'customer-334', '16-Kartik-2080', '9806324545', 13),
(345, 'सुरीनदर चौधरी ', 'पिपरा ', '', '2023-11-02', 'customer-335', '16-Kartik-2080', '9806324545', 13),
(346, 'इनरदेव महतो ', 'जोगौलिया ', '', '2023-11-02', 'customer-336', '16-Kartik-2080', '9806324545', 11),
(347, 'मोकदम ', 'देबिपुर ', '', '2023-11-02', 'customer-337', '16-Kartik-2080', '9806324545', 12),
(348, 'मेराज मीआ', 'जोगौलिया ', '', '2023-11-02', 'customer-338', '16-Kartik-2080', '9806324545', 11),
(349, 'जोगिन्दर चौधरी ', 'पिपरा ', '', '2023-11-02', 'customer-339', '16-Kartik-2080', '9806324545', 13);

-- --------------------------------------------------------

--
-- Table structure for table `app_daily`
--

CREATE TABLE `app_daily` (
  `id` bigint(20) NOT NULL,
  `nepali_date` varchar(200) NOT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_daily`
--

INSERT INTO `app_daily` (`id`, `nepali_date`, `total`) VALUES
(19, '18-Kartik-2080', 5000),
(20, '17-Kartik-2080', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `app_dailytransaction`
--

CREATE TABLE `app_dailytransaction` (
  `id` bigint(20) NOT NULL,
  `quantity` double NOT NULL,
  `remarks` longtext NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `unite_id` bigint(20) DEFAULT NULL,
  `dailyid_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_dailytransaction`
--

INSERT INTO `app_dailytransaction` (`id`, `quantity`, `remarks`, `product_id`, `unite_id`, `dailyid_id`) VALUES
(56, 50, 'no                                                \r\n                                                ', 5, 4, 19),
(57, 20, 'no', 6, 4, 19),
(58, 10, 'na', 7, 3, 19),
(59, 10, 'na                                                  \r\n                                                ', 5, 4, 20),
(60, 5.2, 'na', 6, 4, 20),
(61, 3.5, 'no', 7, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `app_expenses`
--

CREATE TABLE `app_expenses` (
  `id` bigint(20) NOT NULL,
  `create_date` date NOT NULL,
  `nepali_create_date` varchar(200) NOT NULL,
  `expenses_name` varchar(150) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_inventoryproduct`
--

CREATE TABLE `app_inventoryproduct` (
  `id` bigint(20) NOT NULL,
  `rate_retail` double DEFAULT NULL,
  `rate_wholesale` double NOT NULL,
  `rate_manu` double DEFAULT NULL,
  `created_date` date NOT NULL,
  `nepali_create_date` varchar(200) NOT NULL,
  `modified_date` date DEFAULT NULL,
  `deleted_date` date DEFAULT NULL,
  `product_name_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_payment`
--

CREATE TABLE `app_payment` (
  `id` bigint(20) NOT NULL,
  `amount` double NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `saleId_id` bigint(20) DEFAULT NULL,
  `remarks` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_product`
--

CREATE TABLE `app_product` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_product`
--

INSERT INTO `app_product` (`id`, `product_name`, `image`) VALUES
(5, 'धान', 'productimage/dhaan.jpg'),
(6, 'गहुँ', 'productimage/gahun.jpg'),
(7, 'मसाला', 'productimage/masalah.jpg'),
(8, 'दाना', ''),
(9, 'पुरानो बाकी', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_productunit`
--

CREATE TABLE `app_productunit` (
  `id` bigint(20) NOT NULL,
  `unit_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_productunit`
--

INSERT INTO `app_productunit` (`id`, `unit_name`) VALUES
(3, 'किलो'),
(4, 'मन');

-- --------------------------------------------------------

--
-- Table structure for table `app_purchase`
--

CREATE TABLE `app_purchase` (
  `id` bigint(20) NOT NULL,
  `total_amount` double DEFAULT NULL,
  `bill_no` int(10) UNSIGNED DEFAULT NULL CHECK (`bill_no` >= 0),
  `created_date` datetime(6) NOT NULL,
  `nepali_create_date` varchar(200) DEFAULT NULL,
  `party_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_purchaseitem`
--

CREATE TABLE `app_purchaseitem` (
  `id` bigint(20) NOT NULL,
  `amount_per_unit` bigint(20) UNSIGNED NOT NULL,
  `quantity` double NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `nepali_create_date` varchar(200) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `purchaseId_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `app_purchaseparty`
--

CREATE TABLE `app_purchaseparty` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `pan_no` int(10) UNSIGNED DEFAULT NULL CHECK (`pan_no` >= 0),
  `address` varchar(150) DEFAULT NULL,
  `contact_no` int(10) UNSIGNED DEFAULT NULL CHECK (`contact_no` >= 0),
  `created_date` datetime(6) NOT NULL,
  `nepali_create_date` varchar(200) NOT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `deleted_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_sales`
--

CREATE TABLE `app_sales` (
  `id` bigint(20) NOT NULL,
  `bill_no` int(11) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `payment_status` varchar(150) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `remaining_amount` int(11) DEFAULT NULL,
  `paid_amount` int(11) DEFAULT NULL,
  `nepali_create_date` varchar(200) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` date NOT NULL,
  `deleted_date` date DEFAULT NULL,
  `customer_id` bigint(20) NOT NULL,
  `remarks` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_sales`
--

INSERT INTO `app_sales` (`id`, `bill_no`, `phone_number`, `address`, `email`, `payment_status`, `total_amount`, `remaining_amount`, `paid_amount`, `nepali_create_date`, `created_date`, `modified_date`, `deleted_date`, `customer_id`, `remarks`) VALUES
(58, NULL, '9801300415', 'खाजुरिया टोला', 'kundan.kr461@gmail.com', 'unpaid', 60, 60, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 6, ''),
(60, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 15, 15, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 7, ''),
(61, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 10, 10, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 8, ''),
(62, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 95, 95, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 9, ''),
(66, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 90, 90, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 11, ''),
(67, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 45, 45, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 12, ''),
(68, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 75, 75, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 13, ''),
(69, NULL, '9801300415', 'Jayrajpur', 'kundan.kr461@gmail.com', 'unpaid', 545, 545, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 14, ''),
(70, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 60, 60, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 15, ''),
(71, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 45, 45, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 16, ''),
(72, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 160, 160, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 17, ''),
(73, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 25, 25, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 18, ''),
(74, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 365, 365, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 19, ''),
(75, NULL, '9806324545', 'जयराजपुर', NULL, 'unpaid', 125, 125, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 20, ''),
(76, NULL, '9806324545', 'जयराजपुर', NULL, 'unpaid', 140, 140, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 21, ''),
(77, NULL, '9806324545', 'जयराजपुर', NULL, 'unpaid', 120, 120, 0, '02-Kartik-2080', '2023-10-19', '2023-10-19', NULL, 22, ''),
(78, NULL, '9806324545', 'जोगौलिया', NULL, 'partially_paid', 0, -10, 10, '02-Kartik-2080', '2023-10-19', '2023-11-04', NULL, 18, 'जम्मा'),
(79, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 30, 30, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 23, ''),
(80, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 350, 350, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 24, ''),
(81, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 165, 165, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 25, ''),
(82, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 20, 20, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 26, ''),
(83, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 135, 135, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 27, ''),
(84, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 45, 45, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 28, ''),
(85, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 45, 45, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 29, ''),
(86, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 625, 625, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 30, ''),
(87, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 325, 325, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 31, ''),
(88, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 32, ''),
(89, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 30, 30, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 33, ''),
(90, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 34, ''),
(91, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 280, 280, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 35, ''),
(92, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 175, 175, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 38, ''),
(93, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 235, 235, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 39, ''),
(94, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 40, ''),
(95, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 210, 210, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 41, ''),
(96, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 35, 35, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 42, ''),
(97, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 43, ''),
(98, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 44, ''),
(99, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 45, ''),
(100, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 46, ''),
(101, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 620, 620, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 47, ''),
(102, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 500, 500, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 48, ''),
(103, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 49, ''),
(104, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 50, ''),
(105, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 785, 785, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 51, ''),
(106, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 52, ''),
(107, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 53, ''),
(108, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 135, 135, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 54, ''),
(109, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 55, ''),
(110, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 56, ''),
(111, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 195, 195, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 57, ''),
(112, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 58, ''),
(113, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 170, 170, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 59, ''),
(114, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 70, 70, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 60, ''),
(115, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 61, ''),
(116, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 130, 130, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 63, ''),
(117, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 64, ''),
(118, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 65, ''),
(119, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 230, 230, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 66, ''),
(120, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 67, ''),
(121, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 68, ''),
(122, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 69, ''),
(123, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 175, 175, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 71, ''),
(124, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 72, ''),
(125, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 105, 105, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 73, ''),
(126, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 170, 170, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 74, ''),
(127, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 115, 115, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 75, ''),
(128, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 220, 220, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 76, ''),
(129, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 77, ''),
(130, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 485, 485, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 78, ''),
(131, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 225, 225, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 79, ''),
(132, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 80, ''),
(133, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 81, ''),
(134, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 145, 145, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 82, ''),
(135, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 83, ''),
(136, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 400, 400, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 84, ''),
(137, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 420, 420, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 85, ''),
(138, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 95, 95, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 86, ''),
(139, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 87, ''),
(140, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 95, 95, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 88, ''),
(141, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 89, ''),
(142, NULL, '320', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 320, 320, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 90, ''),
(143, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 1625, 1625, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 91, ''),
(144, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 92, ''),
(145, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 93, ''),
(146, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 94, ''),
(147, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 855, 855, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 95, ''),
(148, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 340, 340, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 96, ''),
(149, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 290, 290, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 97, ''),
(150, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 98, ''),
(151, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 290, 290, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 99, ''),
(152, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 230, 230, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 100, ''),
(153, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 160, 160, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 101, ''),
(154, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 102, ''),
(155, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 103, ''),
(156, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 104, ''),
(157, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 105, ''),
(158, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 106, ''),
(159, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 107, ''),
(160, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 108, ''),
(161, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 109, ''),
(162, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 620, 620, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 110, ''),
(163, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 111, ''),
(164, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 500, 500, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 112, ''),
(165, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1860, 1860, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 113, ''),
(166, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 114, ''),
(167, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 460, 460, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 115, ''),
(168, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 480, 480, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 116, ''),
(169, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 117, ''),
(170, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 2215, 2215, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 118, ''),
(171, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 495, 495, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 119, ''),
(172, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 120, ''),
(173, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 121, ''),
(174, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 390, 390, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 122, ''),
(175, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 123, ''),
(176, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 124, ''),
(177, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 500, 500, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 125, ''),
(178, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 126, ''),
(179, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 555, 555, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 127, ''),
(180, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 3030, 3030, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 128, ''),
(181, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 580, 580, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 129, ''),
(182, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 130, 130, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 130, ''),
(183, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 131, ''),
(184, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 560, 560, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 132, ''),
(185, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 505, 505, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 133, ''),
(186, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1720, 1720, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 134, ''),
(187, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 135, ''),
(188, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 136, ''),
(189, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1770, 1770, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 137, ''),
(190, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 585, 585, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 138, ''),
(191, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 175, 175, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 139, ''),
(192, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 2530, 2530, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 140, ''),
(193, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 965, 965, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 141, ''),
(194, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 705, 705, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 142, ''),
(195, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 320, 320, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 143, ''),
(196, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 770, 770, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 144, ''),
(197, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 2475, 2475, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 145, ''),
(198, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 350, 350, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 146, ''),
(199, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 390, 390, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 147, ''),
(200, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 250, 250, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 148, ''),
(201, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 149, ''),
(202, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 115, 115, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 150, ''),
(203, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 170, 170, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 151, ''),
(204, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 70, 70, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 152, ''),
(205, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 625, 625, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 153, ''),
(206, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 3220, 3220, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 154, ''),
(207, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 95, 95, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 155, ''),
(208, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 130, 130, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 156, ''),
(209, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 157, ''),
(210, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 155, 155, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 158, ''),
(211, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 135, 135, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 159, ''),
(212, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 160, ''),
(213, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 110, 110, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 161, ''),
(214, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 162, ''),
(215, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 535, 535, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 163, ''),
(216, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 495, 495, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 164, ''),
(217, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 2235, 2235, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 165, ''),
(218, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1490, 1490, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 166, ''),
(219, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 400, 400, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 167, ''),
(220, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 168, ''),
(221, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 169, ''),
(222, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 450, 450, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 170, ''),
(223, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -30, 30, '03-Kartik-2080', '2023-10-20', '2023-11-04', NULL, 170, 'retun'),
(224, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 525, 525, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 171, ''),
(225, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 172, ''),
(226, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 135, 135, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 173, ''),
(227, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 174, ''),
(228, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 120, 120, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 175, ''),
(229, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 176, ''),
(230, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 177, ''),
(231, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 220, 220, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 178, ''),
(232, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 220, 220, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 179, ''),
(233, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 250, 250, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 180, ''),
(234, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 181, ''),
(235, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 182, ''),
(236, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 183, ''),
(237, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 184, ''),
(238, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 185, ''),
(239, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 2750, 2750, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 186, ''),
(240, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 187, ''),
(241, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 188, ''),
(242, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 175, 175, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 189, ''),
(243, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 190, ''),
(244, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 145, 145, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 191, ''),
(245, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 785, 785, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 192, ''),
(246, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 193, ''),
(247, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 1080, 1080, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 194, ''),
(248, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 1630, 1630, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 195, ''),
(249, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 160, 160, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 196, ''),
(250, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 440, 440, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 197, ''),
(251, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 198, ''),
(252, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 830, 830, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 199, ''),
(253, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 845, 845, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 200, ''),
(254, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 130, 130, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 201, ''),
(255, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 202, ''),
(256, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 203, ''),
(257, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -500, 500, '03-Kartik-2080', '2023-10-20', '2023-11-04', NULL, 112, 'असुली'),
(258, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -45, 45, '03-Kartik-2080', '2023-10-20', '2023-11-04', NULL, 12, 'घतभ'),
(259, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -495, 495, '03-Kartik-2080', '2023-10-20', '2023-11-04', NULL, 164, 'असुली'),
(260, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 204, ''),
(261, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 205, ''),
(262, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 145, 145, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 206, ''),
(263, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 115, 115, 0, '03-Kartik-2080', '2023-10-20', '2023-10-20', NULL, 207, ''),
(264, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '03-Kartik-2080', '0000-00-00', '2023-10-20', NULL, 208, ''),
(265, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -390, 390, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 122, 'असुली'),
(266, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 265, 265, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 209, ''),
(267, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 210, ''),
(268, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 310, 310, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 211, ''),
(269, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 212, ''),
(270, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1855, 1855, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 213, ''),
(271, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 805, 805, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 214, ''),
(272, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 160, 160, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 215, ''),
(273, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 945, 945, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 216, ''),
(274, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 450, 450, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 217, ''),
(275, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 218, ''),
(276, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 470, 470, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 219, ''),
(277, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 220, ''),
(278, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1020, 1020, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 221, ''),
(279, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 180, 180, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 222, ''),
(280, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 223, ''),
(281, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 410, 410, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 224, ''),
(282, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 175, 175, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 225, ''),
(283, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 226, ''),
(284, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 260, 260, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 227, ''),
(285, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 220, 220, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 228, ''),
(286, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -50, 50, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 220, 'asuli'),
(287, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1345, 1345, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 229, ''),
(288, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 230, ''),
(289, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 231, ''),
(290, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 200, 200, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 232, ''),
(291, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 233, ''),
(292, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 234, ''),
(293, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 205, 205, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 235, ''),
(294, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 145, 145, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 236, ''),
(295, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 237, ''),
(296, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 365, 365, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 238, ''),
(297, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 105, 105, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 239, ''),
(298, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 240, ''),
(299, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 120, 120, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 241, ''),
(300, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 242, ''),
(301, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 130, 130, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 243, ''),
(302, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 244, ''),
(303, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 245, ''),
(304, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 246, ''),
(305, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 247, ''),
(306, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 248, ''),
(307, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 470, 470, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 249, ''),
(308, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 380, 380, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 250, ''),
(309, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 251, ''),
(310, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 252, ''),
(311, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 155, 155, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 253, ''),
(312, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 254, ''),
(313, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 180, 180, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 255, ''),
(314, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 670, 670, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 256, ''),
(315, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 435, 435, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 257, ''),
(316, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 258, ''),
(317, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 225, 225, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 259, ''),
(318, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 270, 270, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 260, ''),
(319, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 130, 130, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 261, ''),
(320, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 770, 770, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 262, ''),
(321, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 263, ''),
(322, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 265, 265, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 264, ''),
(323, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 265, 265, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 265, ''),
(324, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 605, 605, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 266, ''),
(325, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 267, ''),
(326, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 260, 260, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 268, ''),
(327, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -130, 130, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 201, 'असुली'),
(328, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1175, 1175, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 269, ''),
(329, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 400, 400, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 270, ''),
(330, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 200, 200, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 271, ''),
(331, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 272, ''),
(332, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 805, 805, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 273, ''),
(333, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 274, ''),
(334, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 275, ''),
(335, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 276, ''),
(336, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 277, ''),
(337, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 278, ''),
(338, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 85, 85, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 279, ''),
(339, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 280, ''),
(340, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 200, 200, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 281, ''),
(341, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 283, ''),
(342, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 200, 200, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 284, ''),
(343, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 780, 780, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 285, ''),
(344, NULL, '9801300415', 'Jayrajpur', NULL, 'unpaid', 610, 610, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 286, ''),
(345, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 220, 220, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 287, ''),
(346, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 325, 325, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 288, ''),
(347, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 695, 695, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 289, ''),
(348, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 650, 650, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 290, ''),
(349, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 335, 335, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 291, ''),
(350, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 775, 775, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 292, ''),
(351, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 293, ''),
(352, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 725, 725, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 294, ''),
(353, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 2190, 2190, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 295, ''),
(354, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 225, 225, 0, '04-Kartik-2080', '0000-00-00', '2023-10-21', NULL, 296, ''),
(355, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 220, 220, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 297, ''),
(356, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 90, 90, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 298, ''),
(357, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1225, 1225, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 299, ''),
(358, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1825, 1825, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 300, ''),
(359, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 755, 755, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 301, ''),
(360, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 785, 785, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 302, ''),
(361, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 245, 245, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 303, ''),
(362, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 170, 170, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 304, ''),
(363, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 260, 260, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 305, ''),
(364, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 285, 285, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 306, ''),
(365, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 405, 405, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 307, ''),
(366, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 115, 115, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 308, ''),
(367, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 210, 210, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 309, ''),
(368, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 680, 680, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 310, ''),
(369, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 120, 120, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 311, ''),
(370, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 705, 705, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 312, ''),
(371, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 905, 905, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 313, ''),
(372, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 160, 160, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 314, ''),
(373, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 630, 630, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 315, ''),
(374, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 475, 475, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 316, ''),
(375, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 990, 990, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 317, ''),
(376, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 620, 620, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 318, ''),
(377, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 900, 900, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 319, ''),
(378, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 370, 370, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 320, ''),
(379, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 720, 720, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 321, ''),
(380, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 100, 100, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 322, ''),
(381, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 70, 70, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 323, ''),
(382, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 620, 620, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 324, ''),
(383, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 905, 905, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 325, ''),
(384, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 160, 160, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 326, ''),
(385, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1185, 1185, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 327, ''),
(386, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 325, 325, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 328, ''),
(387, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 329, ''),
(388, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 1245, 1245, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 330, ''),
(389, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 510, 510, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 331, ''),
(390, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 185, 185, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 332, ''),
(391, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 225, 225, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 333, ''),
(392, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 260, 260, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 334, ''),
(393, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -20, 20, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 23, 'असुली'),
(394, NULL, '9801300415', 'Pipra', NULL, 'partially_paid', 0, -260, 260, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 268, 'असुली'),
(395, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -85, 85, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 193, 'असुली'),
(396, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -75, 75, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 188, 'असुली'),
(397, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -135, 135, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 173, 'असुली'),
(398, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -420, 420, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 170, 'असुली'),
(399, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -25, 25, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 329, 'असुली'),
(400, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -620, 620, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 324, 'असुली'),
(401, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -500, 500, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 319, 'असुली'),
(402, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -160, 160, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 314, 'असुली'),
(403, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -680, 680, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 310, 'असुली'),
(404, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -90, 90, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 298, 'असुली'),
(405, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -620, 620, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 110, 'असुली');
INSERT INTO `app_sales` (`id`, `bill_no`, `phone_number`, `address`, `email`, `payment_status`, `total_amount`, `remaining_amount`, `paid_amount`, `nepali_create_date`, `created_date`, `modified_date`, `deleted_date`, `customer_id`, `remarks`) VALUES
(406, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -55, 55, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 108, 'असुली'),
(407, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -55, 55, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 103, 'असुली'),
(408, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -100, 100, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 98, 'असुली'),
(409, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -290, 290, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 97, 'असुली'),
(410, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 390, 390, 0, '04-Kartik-2080', '2023-10-21', '2023-10-21', NULL, 91, ''),
(411, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -80, 80, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 89, 'असुली'),
(412, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -210, 210, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 85, 'असुली'),
(413, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -400, 400, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 84, 'असुली'),
(414, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -485, 485, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 78, 'असुली'),
(415, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -70, 70, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 60, 'असुली'),
(416, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -500, 500, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 48, 'असुली'),
(417, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -100, 100, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 44, 'असुली'),
(418, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -210, 210, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 41, 'असुली'),
(419, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -175, 175, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 38, 'असुली'),
(420, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -350, 350, '04-Kartik-2080', '2023-10-21', '2023-11-04', NULL, 24, 'असुली'),
(429, NULL, '9801300415', 'Pipra', NULL, 'partially_paid', 0, -605, 605, '05-Kartik-2080', '2023-10-22', '2023-11-04', NULL, 266, 'असुली'),
(430, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '05-Kartik-2080', '2023-10-22', '2023-10-22', NULL, 208, ''),
(431, NULL, '9806324545', 'जयराजपुर', 'rk4841797@gmail.com', 'unpaid', 45, 45, 0, '05-Kartik-2080', '2023-10-22', '2023-10-22', NULL, 335, ''),
(432, NULL, '9806324545', 'जयराजपुर', NULL, 'partially_paid', 0, -45, 45, '05-Kartik-2080', '2023-10-22', '2023-11-04', NULL, 335, 'असुली'),
(433, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -100, 100, '08-Kartik-2080', '2023-10-25', '2023-11-04', NULL, 207, 'असुली'),
(434, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -145, 145, '08-Kartik-2080', '2023-10-25', '2023-11-04', NULL, 191, 'अशुली'),
(435, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 210, 210, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 85, ''),
(436, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 200, 200, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 294, ''),
(437, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 45, 45, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 117, ''),
(438, NULL, '9821858475', 'पिपरा', 'rk4841797@gmail.com', 'unpaid', 45, 45, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 338, ''),
(439, NULL, '9821858475', 'Jayrajpur', 'rk4841797@gmail.com', 'unpaid', 65, 65, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 339, ''),
(440, NULL, '9821858475', 'Jayrajpur', NULL, 'partially_paid', 0, -40, 40, '09-Kartik-2080', '2023-10-26', '2023-11-04', NULL, 339, 'असुली'),
(441, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 312, ''),
(442, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 190, 190, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 113, ''),
(443, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -20, 20, '09-Kartik-2080', '2023-10-26', '2023-11-04', NULL, 113, 'असुली'),
(444, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 950, 950, 0, '09-Kartik-2080', '0000-00-00', '2023-10-26', NULL, 147, ''),
(445, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 35, 35, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 138, ''),
(446, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 110, 110, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 51, ''),
(447, NULL, '9806324545', 'जयराजपुर', NULL, 'partially_paid', 0, -125, 125, '09-Kartik-2080', '2023-10-26', '2023-11-04', NULL, 20, 'असुल'),
(448, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 325, 325, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 213, ''),
(449, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -200, 200, '09-Kartik-2080', '2023-10-26', '2023-11-04', NULL, 213, 'असुल'),
(450, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 325, 325, 0, '09-Kartik-2080', '2023-10-26', '2023-10-26', NULL, 137, ''),
(451, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -145, 145, '10-Kartik-2080', '2023-10-27', '2023-11-04', NULL, 304, 'असुल'),
(452, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -145, 145, '10-Kartik-2080', '2023-10-27', '2023-11-04', NULL, 305, 'असुल'),
(453, NULL, '9801095004', 'Company', NULL, 'unpaid', 430, 430, 0, '12-Kartik-2080', '0000-00-00', '2023-10-29', NULL, 340, ''),
(454, NULL, '9801095004', 'Company', NULL, 'partially_paid', 0, -100, 100, '12-Kartik-2080', '2023-10-29', '2023-11-04', NULL, 340, 'aaa'),
(455, NULL, '9801095004', 'Company', NULL, 'partially_paid', 0, -100, 100, '12-Kartik-2080', '2023-10-29', '2023-11-04', NULL, 340, 'aa'),
(456, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '12-Kartik-2080', '2023-10-29', '2023-10-29', NULL, 209, ''),
(457, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -50, 50, '12-Kartik-2080', '2023-10-29', '2023-11-04', NULL, 209, 'असुल'),
(459, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 475, 475, 0, '12-Kartik-2080', '2023-10-29', '2023-10-29', NULL, 142, ''),
(461, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 60, 60, 0, '12-Kartik-2080', '2023-10-29', '2023-10-29', NULL, 203, ''),
(463, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -50, 50, '12-Kartik-2080', '2023-10-29', '2023-11-04', NULL, 203, 'असुल'),
(464, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 260, 260, 0, '12-Kartik-2080', '2023-10-29', '2023-10-29', NULL, 131, ''),
(465, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 960, 960, 0, '12-Kartik-2080', '0000-00-00', '2023-10-30', NULL, 222, ''),
(466, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -500, 500, '12-Kartik-2080', '2023-10-29', '2023-11-04', NULL, 222, 'असुल'),
(467, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 0, 0, 0, '14-Kartik-2080', '0000-00-00', '2023-10-31', NULL, 307, ''),
(468, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 75, 75, 0, '14-Kartik-2080', '2023-10-31', '2023-10-31', NULL, 131, ''),
(469, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -75, 75, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 131, 'असुल'),
(470, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 875, 875, 0, '14-Kartik-2080', '2023-10-31', '2023-10-31', NULL, 128, ''),
(471, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -20, 20, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 128, 'असुल'),
(472, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 35, 35, 0, '14-Kartik-2080', '2023-10-31', '2023-10-31', NULL, 294, ''),
(473, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -2215, 2215, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 118, 'असुल'),
(474, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -70, 70, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 323, 'असुल'),
(475, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -250, 250, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 270, 'असुल'),
(476, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -140, 140, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 132, 'असुल'),
(477, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -200, 200, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 35, 'असुल'),
(478, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -130, 130, '14-Kartik-2080', '2023-10-31', '2023-11-04', NULL, 63, 'असुल'),
(479, NULL, '9806324545', 'जयराजपुर', NULL, 'unpaid', 665, 665, 0, '15-Kartik-2080', '0000-00-00', '2023-11-01', NULL, 342, ''),
(480, NULL, '9806324545', 'जयराजपुर', NULL, 'partially_paid', 0, -50, 50, '15-Kartik-2080', '2023-11-01', '2023-11-04', NULL, 342, 'असुल'),
(481, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 875, 875, 0, '15-Kartik-2080', '2023-11-01', '2023-11-01', NULL, 318, ''),
(482, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -500, 500, '15-Kartik-2080', '2023-11-01', '2023-11-04', NULL, 318, 'असुल'),
(483, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -105, 105, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 27, 'असुली'),
(484, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 40, 40, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 127, ''),
(485, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 780, 780, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 191, ''),
(486, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -700, 700, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 191, 'असुल'),
(487, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 250, 250, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 119, ''),
(488, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 315, ''),
(489, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -120, 120, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 315, 'असुल'),
(490, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -270, 270, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 325, 'असुल'),
(491, NULL, '9806324545', 'जयराजपुर', NULL, 'unpaid', 1040, 1040, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 343, ''),
(492, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 150, 150, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 144, ''),
(493, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 70, 70, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 300, ''),
(494, NULL, '9806324545', 'पिपरा', NULL, 'unpaid', 155, 155, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 344, ''),
(495, NULL, '9806324545', 'पिपरा', NULL, 'partially_paid', 0, -120, 120, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 344, 'असुल'),
(496, NULL, '9801300415', 'जोगौलिया', 'Priyanka@ricemill.com', 'unpaid', 55, 55, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 92, ''),
(497, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -30, 30, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 92, 'असुल'),
(498, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, -160, 160, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 326, 'असुल'),
(499, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 200, 200, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 142, ''),
(500, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 80, 80, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 114, ''),
(501, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 113, ''),
(502, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 65, 65, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 221, ''),
(503, NULL, '9806324545', 'पिपरा', NULL, 'unpaid', 80, 80, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 345, ''),
(504, NULL, '9806324545', 'पिपरा', NULL, 'partially_paid', 0, -70, 70, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 345, 'असुल'),
(505, NULL, '9801300415', 'Pipra', NULL, 'partially_paid', 0, -70, 70, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 237, 'असुल'),
(506, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 237, ''),
(507, NULL, '9801300415', 'Pipra', NULL, 'partially_paid', 0, -100, 100, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 237, 'असुल'),
(508, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 140, 140, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 228, ''),
(509, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 4, 4, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 332, ''),
(510, NULL, '9801300415', 'Devipur', 'Priyanka@ricemill.com', 'unpaid', 475, 475, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 206, ''),
(511, NULL, '9801300415', 'Devipur', NULL, 'partially_paid', 0, -450, 450, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 206, 'असुल'),
(512, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 70, 70, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 305, ''),
(513, NULL, '9801300415', 'Jayrajpur', 'Priyanka@ricemill.com', 'unpaid', 25, 25, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 326, ''),
(514, NULL, '9801300415', 'जोगौलिया', 'kundan.kr461@gmail.com', 'unpaid', 65, 65, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 29, ''),
(515, NULL, '9801300415', 'जोगौलिया', NULL, 'partially_paid', 0, -50, 50, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 29, 'असुल'),
(516, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 180, 180, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 244, ''),
(517, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 300, 300, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 346, ''),
(518, NULL, '9806324545', 'जोगौलिया', NULL, 'partially_paid', 0, -70, 70, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 346, 'असुल'),
(519, NULL, '9806324545', 'देबिपुर', NULL, 'unpaid', 160, 160, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 347, ''),
(520, NULL, '9806324545', 'देबिपुर', NULL, 'partially_paid', 0, -65, 65, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 347, 'असुल'),
(521, NULL, '9806324545', 'देबिपुर', NULL, 'partially_paid', 0, -50, 50, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 347, 'असुल'),
(522, NULL, '9806324545', 'जयराजपुर', NULL, 'unpaid', 190, 190, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 20, ''),
(523, NULL, '9806324545', 'जोगौलिया', NULL, 'unpaid', 135, 135, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 348, ''),
(524, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 125, 125, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 253, ''),
(525, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 50, 50, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 256, ''),
(526, NULL, '9801300415', 'Pipra', 'Priyanka@ricemill.com', 'unpaid', 250, 250, 0, '16-Kartik-2080', '0000-00-00', '2023-11-02', NULL, 238, ''),
(527, NULL, '9801300415', 'Pipra', NULL, 'partially_paid', 0, -150, 150, '16-Kartik-2080', '2023-11-02', '2023-11-04', NULL, 238, 'असुल'),
(528, NULL, '9806324545', 'पिपरा', NULL, 'unpaid', 80, 80, 0, '16-Kartik-2080', '2023-11-02', '2023-11-02', NULL, 349, ''),
(529, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, 0, 1345, '19-Kartik-2080', '2023-11-05', '2023-11-05', NULL, 229, 'असुली'),
(530, NULL, '9801300415', 'Jayrajpur', NULL, 'partially_paid', 0, 0, 960, '19-Kartik-2080', '2023-11-05', '2023-11-05', NULL, 294, 'असुली');

-- --------------------------------------------------------

--
-- Table structure for table `app_salesitem`
--

CREATE TABLE `app_salesitem` (
  `id` bigint(20) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL CHECK (`price` >= 0),
  `quantity` double NOT NULL,
  `nepali_create_date` varchar(200) NOT NULL,
  `created_date` date NOT NULL,
  `modified_date` date DEFAULT NULL,
  `deleted_date` date DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `sales_id_id` bigint(20) NOT NULL,
  `unit_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_salesitem`
--

INSERT INTO `app_salesitem` (`id`, `price`, `quantity`, `nepali_create_date`, `created_date`, `modified_date`, `deleted_date`, `product_id`, `sales_id_id`, `unit_id`) VALUES
(53, 60, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 58, 3),
(54, 15, 1.2, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 60, 3),
(55, 10, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 61, 3),
(56, 95, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 62, 3),
(58, 90, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 66, 3),
(59, 45, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 67, 3),
(60, 75, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 68, 3),
(61, 545, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 69, 3),
(62, 60, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 70, 3),
(63, 45, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 71, 3),
(64, 160, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 72, 3),
(65, 25, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 73, 3),
(66, 365, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 74, 3),
(67, 125, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 75, 3),
(68, 140, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 76, 3),
(69, 120, 1, '02-Kartik-2080', '2023-10-19', NULL, NULL, 9, 77, 3),
(70, 30, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 79, 3),
(71, 350, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 80, 3),
(72, 165, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 81, 3),
(73, 20, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 82, 3),
(74, 135, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 83, 3),
(75, 45, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 84, 3),
(76, 45, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 85, 3),
(77, 625, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 86, 3),
(78, 325, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 87, 3),
(79, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 88, 3),
(80, 30, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 89, 3),
(81, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 90, 3),
(82, 280, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 91, 3),
(83, 175, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 92, 3),
(84, 235, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 93, 3),
(85, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 94, 3),
(86, 210, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 95, 3),
(87, 35, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 96, 3),
(88, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 97, 3),
(89, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 98, 3),
(90, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 99, 3),
(91, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 100, 3),
(92, 620, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 101, 3),
(93, 500, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 102, 3),
(94, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 103, 3),
(95, 125, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 104, 3),
(96, 785, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 105, 3),
(97, 90, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 106, 3),
(98, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 107, 3),
(99, 135, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 108, 3),
(100, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 109, 3),
(101, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 110, 3),
(102, 195, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 111, 3),
(103, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 112, 3),
(104, 170, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 113, 3),
(105, 70, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 114, 3),
(106, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 115, 3),
(107, 130, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 116, 3),
(108, 80, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 117, 3),
(109, 125, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 118, 3),
(110, 230, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 119, 3),
(111, 65, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 120, 3),
(112, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 121, 3),
(113, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 122, 3),
(114, 175, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 123, 3),
(115, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 124, 3),
(116, 105, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 125, 3),
(117, 170, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 126, 3),
(118, 115, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 127, 3),
(119, 220, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 128, 3),
(120, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 129, 3),
(121, 485, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 130, 3),
(122, 225, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 131, 3),
(123, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 132, 3),
(124, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 133, 3),
(125, 145, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 134, 3),
(126, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 135, 3),
(127, 400, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 136, 3),
(128, 420, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 137, 3),
(129, 95, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 138, 3),
(130, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 139, 3),
(131, 95, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 140, 3),
(132, 80, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 141, 3),
(133, 320, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 142, 3),
(134, 1625, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 143, 3),
(135, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 144, 3),
(136, 90, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 145, 3),
(137, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 146, 3),
(138, 855, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 147, 3),
(139, 340, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 148, 3),
(140, 290, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 149, 3),
(141, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 150, 3),
(142, 290, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 151, 3),
(143, 230, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 152, 3),
(144, 160, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 153, 3),
(145, 90, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 154, 3),
(146, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 155, 3),
(147, 140, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 156, 3),
(148, 140, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 157, 3),
(149, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 158, 3),
(150, 140, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 159, 3),
(151, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 160, 3),
(152, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 161, 3),
(153, 620, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 162, 3),
(154, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 163, 3),
(155, 500, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 164, 3),
(156, 1860, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 165, 3),
(157, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 166, 3),
(158, 460, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 167, 3),
(159, 480, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 168, 3),
(160, 150, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 169, 3),
(161, 2215, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 170, 3),
(162, 495, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 171, 3),
(163, 150, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 172, 3),
(164, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 173, 3),
(165, 390, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 174, 3),
(166, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 175, 3),
(167, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 176, 3),
(168, 500, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 177, 3),
(169, 140, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 178, 3),
(170, 555, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 179, 3),
(171, 3030, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 180, 3),
(172, 580, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 181, 3),
(173, 130, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 182, 3),
(174, 190, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 183, 3),
(175, 560, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 184, 3),
(176, 505, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 185, 3),
(177, 1720, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 186, 3),
(178, 65, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 187, 3),
(179, 65, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 188, 3),
(180, 1770, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 189, 3),
(181, 585, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 190, 3),
(182, 175, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 191, 3),
(183, 2530, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 192, 3),
(184, 965, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 193, 3),
(185, 705, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 194, 3),
(186, 320, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 195, 3),
(187, 770, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 196, 3),
(188, 2475, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 197, 3),
(189, 350, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 198, 3),
(190, 390, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 199, 3),
(191, 250, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 200, 3),
(192, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 201, 3),
(193, 115, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 202, 3),
(194, 170, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 203, 3),
(195, 70, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 204, 3),
(196, 625, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 205, 3),
(197, 3220, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 206, 3),
(198, 95, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 207, 3),
(199, 130, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 208, 3),
(200, 90, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 209, 3),
(201, 155, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 210, 3),
(202, 135, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 211, 3),
(203, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 212, 3),
(204, 110, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 213, 3),
(205, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 214, 3),
(206, 535, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 215, 3),
(207, 495, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 216, 3),
(208, 2235, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 217, 3),
(209, 1490, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 218, 3),
(210, 400, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 219, 3),
(211, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 220, 3),
(212, 60, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 221, 3),
(213, 450, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 222, 3),
(214, 525, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 224, 3),
(215, 150, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 225, 3),
(216, 135, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 226, 3),
(217, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 227, 3),
(218, 120, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 228, 3),
(219, 125, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 229, 3),
(220, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 230, 3),
(221, 220, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 231, 3),
(222, 220, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 232, 3),
(223, 250, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 233, 3),
(224, 190, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 234, 3),
(225, 60, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 235, 3),
(226, 150, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 236, 3),
(227, 50, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 237, 3),
(228, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 238, 3),
(229, 2750, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 239, 3),
(230, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 240, 3),
(231, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 241, 3),
(232, 175, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 242, 3),
(233, 55, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 243, 3),
(234, 145, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 244, 3),
(235, 785, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 245, 3),
(236, 85, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 246, 3),
(237, 1080, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 247, 3),
(238, 1630, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 248, 3),
(239, 160, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 249, 3),
(240, 440, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 250, 3),
(241, 140, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 251, 3),
(242, 830, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 252, 3),
(243, 845, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 253, 3),
(244, 130, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 254, 3),
(245, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 255, 3),
(246, 75, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 256, 3),
(247, 60, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 260, 3),
(248, 100, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 261, 3),
(249, 145, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 262, 3),
(250, 115, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 263, 3),
(251, 480, 1, '03-Kartik-2080', '2023-10-20', NULL, NULL, 9, 264, 3),
(252, 125, 2.4, '03-Kartik-2080', '2023-10-20', NULL, NULL, 5, 264, 4),
(253, 265, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 266, 3),
(254, 65, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 267, 3),
(255, 310, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 268, 3),
(256, 85, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 269, 3),
(257, 1855, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 270, 3),
(258, 805, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 271, 3),
(259, 160, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 272, 3),
(260, 945, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 273, 3),
(261, 450, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 274, 3),
(262, 75, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 275, 3),
(263, 470, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 276, 3),
(264, 50, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 277, 3),
(265, 1020, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 278, 3),
(266, 180, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 279, 3),
(267, 60, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 280, 3),
(268, 410, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 281, 3),
(269, 175, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 282, 3),
(270, 50, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 283, 3),
(271, 260, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 284, 3),
(272, 220, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 285, 3),
(273, 1345, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 287, 3),
(274, 90, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 288, 3),
(275, 50, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 289, 3),
(276, 200, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 290, 3),
(277, 190, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 291, 3),
(278, 80, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 292, 3),
(279, 205, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 293, 3),
(280, 145, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 294, 3),
(281, 140, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 295, 3),
(282, 365, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 296, 3),
(283, 105, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 297, 3),
(284, 85, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 298, 3),
(285, 120, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 299, 3),
(286, 90, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 300, 3),
(287, 130, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 301, 3),
(288, 150, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 302, 3),
(289, 80, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 303, 3),
(290, 190, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 304, 3),
(291, 100, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 305, 3),
(292, 75, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 306, 3),
(293, 470, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 307, 3),
(294, 380, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 308, 3),
(295, 190, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 309, 3),
(296, 60, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 310, 3),
(297, 155, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 311, 3),
(298, 100, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 312, 3),
(299, 180, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 313, 3),
(300, 670, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 314, 3),
(301, 435, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 315, 3),
(302, 75, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 316, 3),
(303, 225, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 317, 3),
(304, 270, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 318, 3),
(305, 130, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 319, 3),
(306, 770, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 320, 3),
(307, 190, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 321, 3),
(308, 265, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 322, 3),
(309, 265, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 323, 3),
(310, 605, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 324, 3),
(311, 140, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 325, 3),
(312, 260, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 326, 3),
(313, 1175, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 328, 3),
(314, 400, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 329, 3),
(315, 200, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 330, 3),
(316, 140, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 331, 3),
(317, 805, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 332, 3),
(318, 65, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 333, 3),
(319, 80, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 334, 3),
(320, 65, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 335, 3),
(321, 55, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 336, 3),
(322, 65, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 337, 3),
(323, 85, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 338, 3),
(324, 60, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 339, 3),
(325, 200, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 340, 3),
(326, 75, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 341, 3),
(327, 200, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 342, 3),
(328, 780, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 343, 3),
(329, 610, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 344, 3),
(330, 220, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 345, 3),
(331, 325, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 346, 3),
(332, 695, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 347, 3),
(333, 650, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 348, 3),
(334, 335, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 349, 3),
(335, 775, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 350, 3),
(336, 60, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 351, 3),
(337, 725, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 352, 3),
(338, 2190, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 353, 3),
(339, 85, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 354, 3),
(340, 220, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 355, 3),
(341, 90, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 356, 3),
(342, 1225, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 357, 3),
(343, 1825, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 358, 3),
(344, 755, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 359, 3),
(345, 785, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 360, 3),
(346, 245, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 361, 3),
(347, 170, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 362, 3),
(348, 260, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 363, 3),
(349, 285, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 364, 3),
(350, 405, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 365, 3),
(351, 225, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 354, 3),
(352, 115, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 366, 3),
(353, 210, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 367, 3),
(354, 680, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 368, 3),
(355, 120, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 369, 3),
(356, 705, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 370, 3),
(357, 905, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 371, 3),
(358, 160, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 372, 3),
(359, 630, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 373, 3),
(360, 475, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 374, 3),
(361, 990, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 375, 3),
(362, 620, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 376, 3),
(363, 900, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 377, 3),
(364, 370, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 378, 3),
(365, 720, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 379, 3),
(366, 100, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 380, 3),
(367, 70, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 381, 3),
(368, 620, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 382, 3),
(369, 905, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 383, 3),
(370, 160, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 384, 3),
(371, 1185, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 385, 3),
(372, 325, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 386, 3),
(373, 60, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 387, 3),
(374, 1245, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 388, 3),
(375, 510, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 389, 3),
(376, 185, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 390, 3),
(377, 225, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 391, 3),
(378, 260, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 392, 3),
(379, 390, 1, '04-Kartik-2080', '2023-10-21', NULL, NULL, 9, 410, 3),
(384, 125, 2.4, '05-Kartik-2080', '2023-10-22', NULL, NULL, 5, 430, 4),
(385, 45, 18, '05-Kartik-2080', '2023-10-22', NULL, NULL, 6, 431, 3),
(386, 210, 14.1, '09-Kartik-2080', '2023-10-26', NULL, NULL, 5, 435, 4),
(387, 200, 4, '09-Kartik-2080', '2023-10-26', NULL, NULL, 5, 436, 4),
(388, 45, 17, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 437, 3),
(389, 45, 18, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 438, 3),
(390, 65, 25, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 439, 3),
(391, 65, 25, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 441, 3),
(392, 190, 3.6, '09-Kartik-2080', '2023-10-26', NULL, NULL, 5, 442, 4),
(393, 50, 20, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 444, 3),
(394, 35, 14, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 445, 3),
(395, 110, 2.2, '09-Kartik-2080', '2023-10-26', NULL, NULL, 5, 446, 4),
(396, 950, 20, '09-Kartik-2080', '2023-10-26', NULL, NULL, 6, 444, 3),
(397, 325, 6.2, '09-Kartik-2080', '2023-10-26', NULL, NULL, 5, 448, 4),
(398, 325, 6.4, '09-Kartik-2080', '2023-10-26', NULL, NULL, 5, 450, 4),
(399, 50, 1, '12-Kartik-2080', '2023-10-29', NULL, NULL, 5, 453, 3),
(400, 80, 1, '12-Kartik-2080', '2023-10-29', NULL, NULL, 6, 453, 3),
(401, 150, 1, '12-Kartik-2080', '2023-10-29', NULL, NULL, 6, 453, 3),
(402, 150, 1, '12-Kartik-2080', '2023-10-29', NULL, NULL, 6, 453, 3),
(403, 80, 1.5, '12-Kartik-2080', '2023-10-29', NULL, NULL, 5, 456, 4),
(405, 475, 9.4, '12-Kartik-2080', '2023-10-29', NULL, NULL, 5, 459, 4),
(406, 60, 23, '12-Kartik-2080', '2023-10-29', NULL, NULL, 6, 461, 3),
(410, 260, 5.2, '12-Kartik-2080', '2023-10-29', NULL, NULL, 5, 464, 4),
(411, 740, 14.6, '12-Kartik-2080', '2023-10-29', NULL, NULL, 5, 465, 4),
(412, 220, 4.3, '12-Kartik-2080', '2023-10-29', NULL, NULL, 5, 465, 4),
(413, 450, 9, '14-Kartik-2080', '2023-10-31', NULL, NULL, 5, 467, 4),
(414, 75, 2.5, '14-Kartik-2080', '2023-10-31', NULL, NULL, 7, 468, 3),
(415, 875, 17.4, '14-Kartik-2080', '2023-10-31', NULL, NULL, 5, 470, 4),
(416, 35, 14, '14-Kartik-2080', '2023-10-31', NULL, NULL, 6, 472, 3),
(417, 65, 2.5, '15-Kartik-2080', '2023-11-01', NULL, NULL, 7, 479, 3),
(418, 600, 12, '15-Kartik-2080', '2023-11-01', NULL, NULL, 5, 479, 4),
(419, 875, 17.4, '15-Kartik-2080', '2023-11-01', NULL, NULL, 5, 481, 4),
(420, 40, 15, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 484, 3),
(421, 780, 17.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 485, 4),
(422, 250, 5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 487, 4),
(423, 150, 36, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 488, 3),
(424, 890, 17.6, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 491, 4),
(425, 150, 3, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 492, 4),
(426, 70, 28, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 493, 3),
(427, 155, 3.4, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 494, 4),
(428, 55, 21, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 496, 3),
(429, 200, 4, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 499, 4),
(430, 80, 1.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 500, 4),
(431, 50, 20, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 501, 3),
(432, 65, 25, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 502, 3),
(433, 80, 1.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 503, 3),
(434, 125, 2.2, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 506, 4),
(435, 70, 27, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 508, 3),
(436, 70, 27, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 508, 3),
(437, 4, 200, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 509, 4),
(438, 475, 9.4, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 510, 4),
(439, 35, 14, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 512, 3),
(440, 35, 14, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 512, 3),
(441, 25, 1, '16-Kartik-2080', '2023-11-02', NULL, NULL, 7, 513, 3),
(442, 65, 25, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 514, 3),
(443, 180, 3.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 516, 4),
(444, 220, 4.4, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 517, 4),
(445, 80, 1.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 517, 4),
(446, 90, 36, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 519, 3),
(447, 70, 28, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 519, 3),
(448, 190, 3.6, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 522, 4),
(449, 50, 20, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 523, 3),
(450, 85, 34, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 523, 3),
(451, 150, 60, '16-Kartik-2080', '2023-11-02', NULL, NULL, 6, 491, 3),
(452, 125, 2.4, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 524, 4),
(453, 50, 1, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 525, 4),
(454, 50, 1.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 526, 4),
(455, 200, 4, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 526, 4),
(456, 80, 1.5, '16-Kartik-2080', '2023-11-02', NULL, NULL, 5, 528, 4);

-- --------------------------------------------------------

--
-- Table structure for table `app_seller`
--

CREATE TABLE `app_seller` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_toll`
--

CREATE TABLE `app_toll` (
  `id` bigint(20) NOT NULL,
  `toll_name` varchar(150) NOT NULL,
  `toll_slug` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_toll`
--

INSERT INTO `app_toll` (`id`, `toll_name`, `toll_slug`) VALUES
(11, 'जोगौलिया', 'toll'),
(12, 'देबिपुर', 'toll-2'),
(13, 'पिपरा', 'toll-3'),
(14, 'अपन टोला', 'toll-4'),
(15, 'मठपर', 'toll-5'),
(16, 'टोलापर', 'toll-6'),
(17, 'चौधरी टोला', 'toll-7'),
(18, 'यादव टोला', 'toll-8'),
(19, 'मास्जित टोला', 'toll-9'),
(20, 'हरसाहा', 'toll-10'),
(21, 'अम्तावा', 'toll-11'),
(22, 'खाजुरिया टोला', 'toll-12');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 25),
(2, 1, 26),
(3, 1, 28),
(4, 1, 29),
(5, 1, 30),
(6, 1, 32),
(7, 1, 33),
(8, 1, 34),
(9, 1, 36),
(10, 1, 37),
(11, 1, 38),
(12, 1, 40),
(13, 1, 41),
(14, 1, 42),
(15, 1, 44),
(16, 1, 45),
(17, 1, 46),
(18, 1, 48),
(19, 1, 49),
(20, 1, 50),
(21, 1, 52),
(22, 1, 57),
(23, 1, 58),
(24, 1, 60),
(25, 1, 61),
(26, 1, 62),
(27, 1, 64),
(28, 1, 65),
(29, 1, 66),
(30, 1, 68),
(31, 1, 77),
(32, 1, 78),
(33, 1, 80),
(34, 1, 81),
(35, 1, 82),
(36, 1, 84);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add customer', 7, 'add_customer'),
(26, 'Can change customer', 7, 'change_customer'),
(27, 'Can delete customer', 7, 'delete_customer'),
(28, 'Can view customer', 7, 'view_customer'),
(29, 'Can add expenses', 8, 'add_expenses'),
(30, 'Can change expenses', 8, 'change_expenses'),
(31, 'Can delete expenses', 8, 'delete_expenses'),
(32, 'Can view expenses', 8, 'view_expenses'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add product unit', 10, 'add_productunit'),
(38, 'Can change product unit', 10, 'change_productunit'),
(39, 'Can delete product unit', 10, 'delete_productunit'),
(40, 'Can view product unit', 10, 'view_productunit'),
(41, 'Can add purchase', 11, 'add_purchase'),
(42, 'Can change purchase', 11, 'change_purchase'),
(43, 'Can delete purchase', 11, 'delete_purchase'),
(44, 'Can view purchase', 11, 'view_purchase'),
(45, 'Can add purchase party', 12, 'add_purchaseparty'),
(46, 'Can change purchase party', 12, 'change_purchaseparty'),
(47, 'Can delete purchase party', 12, 'delete_purchaseparty'),
(48, 'Can view purchase party', 12, 'view_purchaseparty'),
(49, 'Can add sales', 13, 'add_sales'),
(50, 'Can change sales', 13, 'change_sales'),
(51, 'Can delete sales', 13, 'delete_sales'),
(52, 'Can view sales', 13, 'view_sales'),
(53, 'Can add seller', 14, 'add_seller'),
(54, 'Can change seller', 14, 'change_seller'),
(55, 'Can delete seller', 14, 'delete_seller'),
(56, 'Can view seller', 14, 'view_seller'),
(57, 'Can add toll', 15, 'add_toll'),
(58, 'Can change toll', 15, 'change_toll'),
(59, 'Can delete toll', 15, 'delete_toll'),
(60, 'Can view toll', 15, 'view_toll'),
(61, 'Can add sales item', 16, 'add_salesitem'),
(62, 'Can change sales item', 16, 'change_salesitem'),
(63, 'Can delete sales item', 16, 'delete_salesitem'),
(64, 'Can view sales item', 16, 'view_salesitem'),
(65, 'Can add purchase item', 17, 'add_purchaseitem'),
(66, 'Can change purchase item', 17, 'change_purchaseitem'),
(67, 'Can delete purchase item', 17, 'delete_purchaseitem'),
(68, 'Can view purchase item', 17, 'view_purchaseitem'),
(69, 'Can add inventory product', 18, 'add_inventoryproduct'),
(70, 'Can change inventory product', 18, 'change_inventoryproduct'),
(71, 'Can delete inventory product', 18, 'delete_inventoryproduct'),
(72, 'Can view inventory product', 18, 'view_inventoryproduct'),
(73, 'Can add payment', 19, 'add_payment'),
(74, 'Can change payment', 19, 'change_payment'),
(75, 'Can delete payment', 19, 'delete_payment'),
(76, 'Can view payment', 19, 'view_payment'),
(77, 'Can add daily transaction', 20, 'add_dailytransaction'),
(78, 'Can change daily transaction', 20, 'change_dailytransaction'),
(79, 'Can delete daily transaction', 20, 'delete_dailytransaction'),
(80, 'Can view daily transaction', 20, 'view_dailytransaction'),
(81, 'Can add daily', 21, 'add_daily'),
(82, 'Can change daily', 21, 'change_daily'),
(83, 'Can delete daily', 21, 'delete_daily'),
(84, 'Can view daily', 21, 'view_daily');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-10-05 09:59:35.588860', '1', 'Ktm', 1, '[{\"added\": {}}]', 15, 1),
(2, '2023-10-05 09:59:42.969296', '2', 'Gwarko', 1, '[{\"added\": {}}]', 15, 1),
(3, '2023-10-05 10:00:13.839742', '1', 'Ram Shrestha', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-10-05 10:08:55.236932', '2', 'Ram Shrestha', 3, '', 13, 1),
(5, '2023-10-05 10:08:55.240932', '1', 'Ram Shrestha', 3, '', 13, 1),
(6, '2023-10-06 09:09:47.563658', '6', 'Amrit Singtan', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"sales item\", \"object\": \"SalesItem object (12)\"}}]', 13, 1),
(7, '2023-10-06 09:11:13.649075', '6', 'Amrit Singtan', 2, '[]', 13, 1),
(8, '2023-10-06 09:11:51.040062', '7', 'Ram Shrestha', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"sales item\", \"object\": \"SalesItem object (13)\"}}]', 13, 1),
(9, '2023-10-06 09:12:13.300260', '6', 'Amrit Singtan', 3, '', 13, 1),
(10, '2023-10-06 09:12:13.313522', '5', 'Amrit Singtan', 3, '', 13, 1),
(11, '2023-10-06 09:12:13.317247', '4', 'Ram Shrestha', 3, '', 13, 1),
(12, '2023-10-06 09:12:13.317247', '3', 'Ram Shrestha', 3, '', 13, 1),
(13, '2023-10-08 05:24:34.822705', '9', 'Amrit Singtan', 3, '', 13, 1),
(14, '2023-10-08 06:25:07.251901', '11', 'Amrit Singtan', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"sales item\", \"object\": \"SalesItem object (18)\"}}]', 13, 1),
(15, '2023-10-08 06:27:00.081407', '11', 'Amrit Singtan', 3, '', 13, 1),
(16, '2023-10-08 06:27:00.089398', '10', 'Amrit Singtan', 3, '', 13, 1),
(17, '2023-10-08 06:53:54.397331', '17', 'Amrit Singtan', 3, '', 13, 1),
(18, '2023-10-08 06:53:54.402536', '16', 'Amrit Singtan', 3, '', 13, 1),
(19, '2023-10-08 06:53:54.402536', '15', 'Amrit Singtan', 3, '', 13, 1),
(20, '2023-10-08 06:53:54.410548', '14', 'Amrit Singtan', 3, '', 13, 1),
(21, '2023-10-08 06:53:54.414519', '13', 'Amrit Singtan', 3, '', 13, 1),
(22, '2023-10-08 06:53:54.414519', '12', 'Amrit Singtan', 3, '', 13, 1),
(23, '2023-10-08 07:04:07.066469', '18', 'Amrit Singtan', 3, '', 13, 1),
(24, '2023-10-08 07:08:06.191924', '20', 'Amrit Singtan', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"sales item\", \"object\": \"SalesItem object (30)\"}}]', 13, 1),
(25, '2023-10-08 07:08:28.395350', '20', 'Amrit Singtan', 2, '[{\"changed\": {\"fields\": [\"Payment status\"]}}]', 13, 1),
(26, '2023-10-08 07:09:13.834383', '20', 'Amrit Singtan', 2, '[{\"changed\": {\"fields\": [\"Total amount\", \"Paid amount\"]}}]', 13, 1),
(27, '2023-10-08 07:57:38.598030', '21', 'Amrit Singtan', 1, '[{\"added\": {}}]', 13, 1),
(28, '2023-10-08 07:58:03.198038', '21', 'Amrit Singtan', 3, '', 13, 1),
(29, '2023-10-08 09:11:45.469854', '7', '300.0', 3, '', 19, 1),
(30, '2023-10-08 09:11:45.480307', '6', '300.0', 3, '', 19, 1),
(31, '2023-10-08 09:11:45.484217', '5', '200.0', 3, '', 19, 1),
(32, '2023-10-08 09:11:45.489217', '4', '200.0', 3, '', 19, 1),
(33, '2023-10-08 09:11:45.497219', '3', '200.0', 3, '', 19, 1),
(34, '2023-10-08 09:11:45.500495', '2', '200.0', 3, '', 19, 1),
(35, '2023-10-08 09:11:45.503750', '1', '200.0', 3, '', 19, 1),
(36, '2023-10-08 09:24:06.915846', '22', 'Amrit Singtan', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"sales item\", \"object\": \"SalesItem object (33)\"}}]', 13, 1),
(37, '2023-10-08 09:24:32.949267', '22', 'Amrit Singtan', 2, '[{\"changed\": {\"fields\": [\"Paid amount\"]}}]', 13, 1),
(38, '2023-10-08 10:14:40.270633', '19', 'Amrit Singtan', 2, '[{\"deleted\": {\"name\": \"sales item\", \"object\": \"SalesItem object (None)\"}}, {\"deleted\": {\"name\": \"sales item\", \"object\": \"SalesItem object (None)\"}}, {\"deleted\": {\"name\": \"sales item\", \"object\": \"SalesItem object (None)\"}}, {\"deleted\": {\"name\": \"sales item\", \"object\": \"SalesItem object (None)\"}}]', 13, 1),
(39, '2023-10-08 12:02:54.426550', '24', 'Amrit Singtan', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"sales item\", \"object\": \"SalesItem object (37)\"}}]', 13, 1),
(40, '2023-10-08 12:03:37.408382', '24', 'Amrit Singtan', 2, '[{\"changed\": {\"fields\": [\"Payment status\", \"Paid amount\"]}}]', 13, 1),
(41, '2023-10-08 12:04:03.150682', '24', 'Amrit Singtan', 2, '[{\"changed\": {\"fields\": [\"Remaining amount\"]}}]', 13, 1),
(42, '2023-10-08 13:28:45.411409', '26', 'Amrit Singtan', 3, '', 13, 1),
(43, '2023-10-08 13:28:45.415410', '25', 'Amrit Singtan', 3, '', 13, 1),
(44, '2023-10-08 13:39:55.382232', '27', 'Amrit Singtan', 3, '', 13, 1),
(45, '2023-10-09 08:50:57.879062', '30', 'Amrit Singtan', 3, '', 13, 1),
(46, '2023-10-12 08:38:17.058830', '4', 'Banepa', 3, '', 15, 1),
(47, '2023-10-12 09:10:10.656861', '7', 'Orange', 3, '', 20, 1),
(48, '2023-10-12 09:10:10.659078', '6', 'Orange-dish', 3, '', 20, 1),
(49, '2023-10-12 09:10:10.659078', '5', 'Potato', 3, '', 20, 1),
(50, '2023-10-12 09:10:10.659078', '4', 'Orange', 3, '', 20, 1),
(51, '2023-10-12 09:10:10.659078', '3', 'Orange', 3, '', 20, 1),
(52, '2023-10-12 09:48:28.924813', '2', '26-Aswin-2080', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"daily transaction\", \"object\": \"Potato\"}}, {\"added\": {\"name\": \"daily transaction\", \"object\": \"Orange\"}}]', 21, 1),
(53, '2023-10-12 09:58:40.758998', '2', '26-Aswin-2080', 3, '', 21, 1),
(54, '2023-10-12 10:15:23.639974', '1', '25-Aswin-2080', 2, '[{\"added\": {\"name\": \"daily transaction\", \"object\": \"Orange-dish\"}}]', 21, 1),
(55, '2023-10-12 10:15:58.898301', '1', '25-Aswin-2080', 2, '[{\"deleted\": {\"name\": \"daily transaction\", \"object\": \"Orange-dish\"}}]', 21, 1),
(56, '2023-10-12 10:21:07.477961', '1', '25-Aswin-2080', 2, '[]', 21, 1),
(57, '2023-10-12 10:21:21.626760', '1', '25-Aswin-2080', 3, '', 21, 1),
(58, '2023-10-12 10:23:52.668797', '3', '25-Aswin-2080', 2, '[]', 21, 1),
(59, '2023-10-12 10:24:18.611969', '3', '25-Aswin-2080', 2, '[{\"deleted\": {\"name\": \"daily transaction\", \"object\": \"Potato\"}}, {\"deleted\": {\"name\": \"daily transaction\", \"object\": \"Orange\"}}]', 21, 1),
(60, '2023-10-12 10:24:48.569669', '3', '25-Aswin-2080', 2, '[{\"added\": {\"name\": \"daily transaction\", \"object\": \"Orange\"}}, {\"added\": {\"name\": \"daily transaction\", \"object\": \"Potato\"}}]', 21, 1),
(61, '2023-10-12 10:25:45.038767', '3', '25-Aswin-2080', 2, '[{\"added\": {\"name\": \"daily transaction\", \"object\": \"Orange-dish\"}}]', 21, 1),
(62, '2023-10-12 11:19:26.916942', '3', '25-Aswin-2080', 2, '[]', 21, 1),
(63, '2023-10-12 11:19:45.296001', '3', '25-Aswin-2080', 2, '[{\"changed\": {\"name\": \"daily transaction\", \"object\": \"Orange-dish\", \"fields\": [\"Total amount\"]}}]', 21, 1),
(64, '2023-10-14 07:16:26.031195', '2', 'Amrit Singtan', 3, '', 6, 1),
(65, '2023-10-14 07:21:52.893104', '3', 'Amrit Singtan', 3, '', 6, 1),
(66, '2023-10-14 07:26:36.666643', '4', 'Amrit Singtan', 3, '', 6, 1),
(67, '2023-10-15 06:38:22.051272', '4', '27-Aswin-2080', 3, '', 21, 1),
(68, '2023-10-15 06:38:22.066087', '3', '25-Aswin-2080', 3, '', 21, 1),
(69, '2023-10-15 06:38:33.880410', '36', 'Ram Shrestha', 3, '', 13, 1),
(70, '2023-10-15 06:38:33.880410', '35', 'Ram Shrestha', 3, '', 13, 1),
(71, '2023-10-15 06:38:33.880410', '28', 'Amrit Singtan', 3, '', 13, 1),
(72, '2023-10-15 06:38:33.896235', '23', 'Amrit Singtan', 3, '', 13, 1),
(73, '2023-10-15 06:38:54.492906', '1', 'Amrit Singtan 100.0', 3, '', 11, 1),
(74, '2023-10-15 06:39:05.189209', '1', 'abccd', 3, '', 8, 1),
(75, '2023-10-15 07:11:52.176890', '5', '28-Aswin-2080', 3, '', 21, 1),
(76, '2023-10-15 07:15:59.507048', '6', '28-Aswin-2080', 3, '', 21, 1),
(77, '2023-10-15 08:54:45.456508', '48', 'Amrit Singtan', 3, '', 13, 1),
(78, '2023-10-15 09:00:41.190687', '49', 'Amrit Singtan', 3, '', 13, 1),
(79, '2023-10-15 09:25:56.284205', '50', 'Amrit Singtan', 3, '', 13, 1),
(80, '2023-10-15 10:26:29.614953', '1', 'User', 1, '[{\"added\": {}}]', 3, 1),
(81, '2023-10-15 10:51:37.940444', '1', 'User', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(82, '2023-10-15 10:52:59.780118', '1', 'User', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(83, '2023-10-15 11:42:22.871385', '7', '28-Aswin-2080', 3, '', 21, 1),
(84, '2023-10-16 03:42:49.162088', '53', 'Sunita ', 3, '', 13, 1),
(85, '2023-10-16 04:11:27.212570', '8', '28-Aswin-2080', 3, '', 21, 1),
(86, '2023-10-16 04:16:59.243552', '9', '29-Aswin-2080', 3, '', 21, 1),
(87, '2023-10-16 04:22:24.278663', '10', '29-Aswin-2080', 3, '', 21, 1),
(88, '2023-10-16 04:24:12.009693', '11', '29-Aswin-2080', 3, '', 21, 1),
(89, '2023-10-16 04:25:58.031194', '12', '29-Aswin-2080', 3, '', 21, 1),
(90, '2023-10-30 04:53:29.741788', '465', 'जदुआ', 2, '[]', 13, 1),
(91, '2023-11-04 13:41:38.270239', '14', '30-Aswin-2080', 3, '', 21, 1),
(92, '2023-11-04 13:41:38.279285', '13', '29-Aswin-2080', 3, '', 21, 1),
(93, '2023-11-04 13:41:38.280749', '16', '18-Kartik-2080', 3, '', 21, 1),
(94, '2023-11-04 13:41:38.291771', '15', '09-Kartik-2080', 3, '', 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'account', 'user'),
(1, 'admin', 'logentry'),
(7, 'app', 'customer'),
(21, 'app', 'daily'),
(20, 'app', 'dailytransaction'),
(8, 'app', 'expenses'),
(18, 'app', 'inventoryproduct'),
(19, 'app', 'payment'),
(9, 'app', 'product'),
(10, 'app', 'productunit'),
(11, 'app', 'purchase'),
(17, 'app', 'purchaseitem'),
(12, 'app', 'purchaseparty'),
(13, 'app', 'sales'),
(16, 'app', 'salesitem'),
(14, 'app', 'seller'),
(15, 'app', 'toll'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-05 09:58:25.457106'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-10-05 09:58:26.424700'),
(3, 'auth', '0001_initial', '2023-10-05 09:58:27.264708'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-10-05 09:58:27.419523'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-10-05 09:58:27.435527'),
(6, 'auth', '0004_alter_user_username_opts', '2023-10-05 09:58:27.450531'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-10-05 09:58:27.468538'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-10-05 09:58:27.474208'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-10-05 09:58:27.492215'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-10-05 09:58:27.520400'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-10-05 09:58:27.542734'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-10-05 09:58:27.588243'),
(13, 'auth', '0011_update_proxy_permissions', '2023-10-05 09:58:27.603247'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-10-05 09:58:27.618253'),
(15, 'account', '0001_initial', '2023-10-05 09:58:28.269376'),
(16, 'account', '0002_alter_user_options', '2023-10-05 09:58:28.304935'),
(17, 'account', '0003_rename_is_admin_user_is_school_admin_and_more', '2023-10-05 09:58:28.632544'),
(18, 'account', '0004_user_is_super_admin_alter_user_is_school_admin', '2023-10-05 09:58:28.767002'),
(19, 'account', '0005_alter_user_options', '2023-10-05 09:58:28.787009'),
(20, 'account', '0006_user_is_staff', '2023-10-05 09:58:28.891015'),
(21, 'account', '0007_alter_user_is_staff', '2023-10-05 09:58:28.908021'),
(22, 'account', '0008_remove_user_is_super_admin_user_is_active', '2023-10-05 09:58:29.047046'),
(23, 'account', '0009_alter_user_is_school_admin', '2023-10-05 09:58:29.064391'),
(24, 'account', '0010_rename_name_user_fullname_and_more', '2023-10-05 09:58:29.272853'),
(25, 'account', '0011_alter_user_is_staff', '2023-10-05 09:58:29.285960'),
(26, 'account', '0012_rename_is_editor_user_is_admin', '2023-10-05 09:58:29.323442'),
(27, 'admin', '0001_initial', '2023-10-05 09:58:29.547132'),
(28, 'admin', '0002_logentry_remove_auto_add', '2023-10-05 09:58:29.568214'),
(29, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-05 09:58:29.600030'),
(30, 'app', '0001_initial', '2023-10-05 09:58:29.655342'),
(31, 'app', '0002_expenses_product_productunit_purchase_purchaseparty_and_more', '2023-10-05 09:58:30.896113'),
(32, 'sessions', '0001_initial', '2023-10-05 09:58:30.957383'),
(33, 'app', '0002_alter_salesitem_nepali_create_date', '2023-10-06 09:08:56.958686'),
(34, 'app', '0003_alter_sales_nepali_create_date', '2023-10-06 09:10:35.205278'),
(35, 'app', '0004_alter_customer_nepali_added_date_and_more', '2023-10-08 04:44:35.103183'),
(36, 'app', '0005_alter_purchaseitem_nepali_create_date', '2023-10-08 04:45:44.468771'),
(37, 'app', '0006_alter_purchase_nepali_create_date', '2023-10-08 04:47:03.864681'),
(38, 'app', '0007_alter_sales_nepali_create_date', '2023-10-08 07:07:04.599113'),
(39, 'app', '0008_payment', '2023-10-08 07:49:08.854970'),
(40, 'app', '0009_payment_remarks', '2023-10-08 07:49:54.272040'),
(41, 'app', '0010_alter_sales_nepali_create_date', '2023-10-08 08:40:55.699609'),
(42, 'app', '0011_sales_remarks', '2023-10-08 12:16:14.457662'),
(43, 'app', '0012_alter_customer_nepali_added_date_and_more', '2023-10-09 09:19:30.966031'),
(44, 'app', '0013_alter_customer_nepali_added_date', '2023-10-09 09:20:02.125619'),
(45, 'app', '0014_alter_customer_nepali_added_date', '2023-10-09 10:26:50.207379'),
(46, 'app', '0015_alter_customer_phone_number', '2023-10-09 11:41:31.753297'),
(47, 'app', '0016_alter_customer_nepali_added_date_and_more', '2023-10-10 02:24:08.172192'),
(48, 'app', '0017_alter_customer_nepali_added_date_and_more', '2023-10-12 05:57:04.671308'),
(49, 'app', '0018_dailytransaction_unite_and_more', '2023-10-12 07:51:48.860133'),
(50, 'app', '0019_alter_purchaseitem_quantity_alter_salesitem_quantity', '2023-10-12 08:05:47.338387'),
(51, 'app', '0020_alter_toll_toll_slug', '2023-10-12 08:39:03.173730'),
(52, 'app', '0021_daily_alter_dailytransaction_options_and_more', '2023-10-12 09:16:48.746662'),
(53, 'app', '0022_alter_daily_nepali_date', '2023-10-12 09:24:29.283165'),
(54, 'app', '0023_alter_dailytransaction_dailyid', '2023-10-12 09:36:20.149276'),
(55, 'app', '0024_daily_total', '2023-10-12 10:08:47.850294'),
(56, 'app', '0025_alter_customer_nepali_added_date_and_more', '2023-10-15 07:11:10.654200'),
(57, 'app', '0026_alter_customer_nepali_added_date_and_more', '2023-10-16 04:10:56.047214'),
(58, 'app', '0027_alter_customer_nepali_added_date_and_more', '2023-10-17 07:18:25.430597'),
(59, 'app', '0028_alter_customer_nepali_added_date_and_more', '2023-10-19 06:10:32.027572'),
(60, 'app', '0029_alter_customer_nepali_added_date_and_more', '2023-10-30 06:18:04.750734'),
(61, 'app', '0030_alter_customer_nepali_added_date_and_more', '2023-10-31 06:31:29.938366'),
(62, 'app', '0031_alter_customer_nepali_added_date_and_more', '2023-11-01 09:48:21.660053'),
(63, 'app', '0029_alter_daily_nepali_date', '2023-11-04 13:38:36.796419'),
(64, 'app', '0030_alter_daily_nepali_date', '2023-11-04 13:38:36.801407'),
(65, 'app', '0031_alter_daily_nepali_date', '2023-11-04 13:38:36.914586'),
(66, 'app', '0032_alter_dailytransaction_total_amount_and_more', '2023-11-04 13:38:37.025063'),
(67, 'app', '0033_alter_dailytransaction_total_amount', '2023-11-04 13:38:37.043738'),
(68, 'app', '0034_alter_dailytransaction_total_amount', '2023-11-04 13:38:37.142896'),
(69, 'app', '0035_remove_dailytransaction_total_amount_and_more', '2023-11-04 13:38:37.293785'),
(70, 'app', '0036_alter_daily_total', '2023-11-04 13:38:37.351342'),
(71, 'app', '0037_alter_expenses_amount_alter_payment_amount_and_more', '2023-11-04 13:38:38.175384'),
(72, 'app', '0038_alter_expenses_amount_alter_payment_amount_and_more', '2023-11-04 13:38:38.957066'),
(73, 'app', '0039_alter_sales_bill_no_alter_sales_paid_amount_and_more', '2023-11-04 13:38:39.455627'),
(74, 'app', '0040_alter_customer_nepali_added_date_and_more', '2023-11-04 13:38:39.602040');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('03re7evq03i7rj2qu47h83mkg2kth8dt', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxODa:4j1WHDXgxXaayQEgyE4v9dopio-wGoHcvmKxPrVs46k', '2023-11-13 09:05:54.234093'),
('06tgtmlexwnyrnur254b06x3lr1sudei', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1qvpC0:jjNnJgnUKuAzoZFVyLC-QJj-N_aOae3Ls9wejiQQRGk', '2023-11-09 01:29:48.799412'),
('0cku02mdp8qlng2ze18s4rloh4ll5f56', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qx7ze:KkfqF2MU7R-95N_AmNxaM6xcdJX7dwnZqUGNTRfeFII', '2023-11-12 15:46:26.844581'),
('0s3dmlu0tf305rkvc1hw8hs5yse0ncbr', '.eJxVjMEOwiAQRP9lz4aUskDp0bvf0Cws2qqhkdKDafrvStKDXuYw8-ZtMNBaxmFdYh4mhh6kgtNv6Sk8YqoL3yndZhHmVPLkRUXEsS7iMnN8ng_2TzDSMta3jgGdYSPRdI2ioNGRRkXesVVWNYSkO-lUK5ENsbR4jZ1tdRM8enRfaaBcoN_A1HitlMpU3tDLfd8_chZAbA:1qyVGP:FE9RFIXanN4NC9Rg3SNXgSnVAsA5ZRKID06pivFYHVI', '2023-11-16 10:49:25.591135'),
('185kljxrsmnrk5qh8jpmkbwu7l90gmmn', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qtWBW:nYyCLeCwBGkCm18uDv7wn_nX7CjA9_93AK93dG3-xJA', '2023-11-02 16:47:46.607151'),
('1bame4qvguxzgup1o9p1kuccmh5k5gjt', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qyXbH:H-fX9C5LONmr_1EhLo6huI3txYxLQEtQ3UjhESgjwDM', '2023-11-16 13:19:07.812135'),
('1cis4znoug1t8dlvrzigk3kqvvjnj8wo', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1qxjtS:sKXKTmuPIu-Gc-I-VF8DyVEVJyGyaKCUVsZs6ODc0NM', '2023-11-14 08:14:34.519072'),
('1oujvhx8a396l6758uh5q2huevafv47d', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qvTc2:9Z_WfghyH7_s4vGb6RaD2qBmg_NVXqNJyz4T1S4F3yA', '2023-11-08 02:27:14.225183'),
('1wch5cjg7wrxghyxho236328zcqddu2v', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qtqNJ:ahqFC8WsER9bAYDB3tKhfWq1L92n4wteZfFoq3z0VC8', '2023-11-03 14:21:17.315725'),
('25d9f1ayvjctqq5539ve5buwhzu9101l', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qyAKB:DmGGyXjXmWXrI3snn9P86hXXozhICiL_eyge5t--TEc', '2023-11-15 12:27:55.120783'),
('25pojba830xp68jrx3vqjkh8lwfiet2r', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyUhu:fcr_GcUI7cht85VUTYFWMt2Zerqh9yCNKR3wWf5S8x4', '2023-11-16 10:13:46.894179'),
('26rk6n2l2x1chg5vuf47x2tn5nozby5f', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qwxc9:k-x4DZDnJhXYo4HCO6RCb0CD3yiCkjT7rRUSGT19yEg', '2023-11-12 04:41:29.702902'),
('29s15iiwir7e13c7kj5d5nkcd78270ah', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qu1BQ:Z8XSkrlR-MkKrKyE4pclUb3IbyM79L5Mxjen2tA51q0', '2023-11-04 01:53:44.414734'),
('2flkjpgxkicdlgmzujxl5zzgpf3vcwig', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qseFt:aN7q2MhpdYONthunIg_HixUIuiJH8MKhCiF8s3gXUwc', '2023-10-31 07:12:41.772371'),
('2jdvsdvjppz8qklce3xfsw95wbiu31l3', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qweQt:ZFBO-hEGRSIh80jIMXd2HskVD3AdPQ9dJ_Y5VgyGHNE', '2023-11-11 08:12:35.719982'),
('2qfnfnbl98kqcb0hxcxuv4fj8e0dzwj4', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1quC4X:IWmOXFJt6nxtXQAUg84evc7-lxGLuwdozpjdTeVrC9c', '2023-11-04 13:31:21.903404'),
('2qyawp1ehiq0o79kkiv03hicyul2u171', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qtOEK:RL0Apl2VRxgPe2y_izKCNQcZO9Oe2iOU98SmU4QJPZ8', '2023-11-02 08:18:08.466817'),
('2rhnigsbxhjvxbbeh3xxzfgc56lzupd1', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qyXDz:cDI2Mf3276r2h2f0UO_asbfqNNATRJkxPsEnaXP_guQ', '2023-11-16 12:55:03.203498'),
('2veq1fjvglm9jdnem318vn9bo62ue76e', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qposp:TA838ozmybC54BaGsBKFIEy3Z_VPnD6RGDilDZ-_71A', '2023-10-23 11:57:11.389143'),
('36eubn6gppeo8cqg1tcdiz09hodbhwuy', '.eJxVjsEOgjAQRP-lZ9O0XbYgR-9-A9luF0FNiVAOhvDv2oSDXuYw82Yym-pozUO3LjJ3Y1Stsladfs1A_JBUknindJs0TynPY9AF0Ue66OsU5Xk52L-BgZbh23Z97ZAracgBODBUGWEOHqIB72to4BzIGxtRrEWL_tx7DD4IN4xRyiumOat2U1jktVLKY36r1u77_gF2H0C4:1quYpt:Qbug6hwAZ8Asr6W5k-zWrQD4bGlTb_x-n8HS5_Gx01k', '2023-11-05 13:49:45.050740'),
('4685i6bfwdpotsh36bltjm11p8uqqpas', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quQBr:CcJoymRInZa93dXHfux0-Dm1vbsiIsm-yBehM2K873Q', '2023-11-05 04:35:51.832034'),
('4p4uzyn8dy8vcoembtnwlr6u4r9u3ndd', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qy8b9:3hLjZlNdgq4byciXmMiZw2EbtVD1O-NtJ5a3P6v2oPE', '2023-11-15 10:37:19.717736'),
('4zw7kr6e153yvxcoyivxkhl84qhn8rzc', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qvsWj:IbJ_8JVuf0Y-RMV4sxbx_hIkzXVQfOKa-D3JvZwMjgk', '2023-11-09 05:03:25.085228'),
('5333jwon7ucwpetox7to7pv7yv7f3xgr', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qpmCH:gVkDU-At8F7tPCOlPJf8HqGkokpVY-S9CSfAsEJtPYY', '2023-10-23 09:05:05.227769'),
('5h2uky5cls7zn9177vzytpyyib0a6v4l', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qvquh:ZHNhQn3yW7eW5qD-zivFGPQlcav2oP3utupl4G6J7TM', '2023-11-09 03:20:03.580387'),
('5pc5zrx8jbxwucfzm3jxzfgk7wa474j9', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quAUt:-W5UAwOyBU6GhUqwWGiHGTSo1HDUyR8u8w7GBfDL9-A', '2023-11-04 11:50:27.848565'),
('612ibaxkcoqaqltucdvrc0v5t9m8x244', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1quZ6F:BrgjlpymV_s3A7pNyyKrTWKhVFLPif3r-Exqf5vc9Ao', '2023-11-05 14:06:39.686908'),
('6w9wv3jzf9lgi6r6qtoe3tajrr0ey9az', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qvv8K:C02XJ623YOMLxYtxSW_QK8bN-fMoRLgAbsaYsMg1ONQ', '2023-11-09 07:50:24.562635'),
('6xliov565f07yumtcfgzolshicnveq0b', '.eJxVjMEOgjAQRP9lz6YpbWm3HL37DWTbsoKaEqEcDOHfBeNBL5PMvJlZoaWl9O0yd1M7JGigUnD6DQPFe5cPkm6Ur6OIYy7TEMRREV86i8uYusf52_076Gnu9zWydEheVUojGyTJtXMBP9ZGG4wzypsYOSBaZI9aqtrIpLXniEz7aaSpQLOCPeS5UC5DeUFTbdv2BmGuQGE:1qw0dA:HQqEhN15WgTfZsTZtvnZSojmYdZOvHOEf5uUKNL00Ek', '2023-11-09 13:42:36.002357'),
('70vuwxkaqlttxxjcw566jx55oqh9zwse', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qplsh:6kptT6V4sVpQy3IJTqEZlsC0PcTo960ZLWy7xKN3N1c', '2023-10-23 08:44:51.140183'),
('7aax2fqpxq8l7siewbsu3c2s3hor94wj', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyWaS:HgyokhZldWNqL4uLjSxhfjQRFX0-dudZSs1lD3yUBnQ', '2023-11-16 12:14:12.645928'),
('7mmkyztnrb93v4i8qj8lwt36kij9puls', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quOGt:jMxA1BQC5xr1a-g3aP_OhD-w4fuBU--U_EiSJ3tXxHo', '2023-11-05 02:32:55.378171'),
('7tdexmsaw5qanqd8dj1fd6ybg13d68py', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qumDX:TGUsiJSn6Eylu9_oQTySoHpq6btXNcxc-Ps106Ibks4', '2023-11-06 04:07:03.820311'),
('8l5ih6327p94t8yyvraaqfr5jdua45bn', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qtnra:DRm3ryYRJr5YAGO5cTWHi0KEDb_CUc0FoMHtijqWlIc', '2023-11-03 11:40:22.365153'),
('8ojyldhyw8jwt5agr270j4ojfqwpfjgs', '.eJxVjr0OwjAQg98lM4pyuSb9Gdl5hupyOWgBpaJNB1T13SFSB1g82J8tb6qnNQ_9usjcj1F1CkCdfs1A_JBUknindJs0TynPY9AF0Ue66MsU5Xk-2L-BgZbh27bX2jqupCGLaNFQZYQ5eIwGva-xwTaQNxCdADhwvr16F3wQbthFKa-Y5qy6TbVFXiulPOa36mDf9w92a0C8:1quCvL:CgRJk2lnmsJkWv7us-bvSYV3BOcWfaX98dUcfrxxiWg', '2023-11-04 14:25:55.703527'),
('93hn4n12dmq2rvlzea6wbpio93pdxuoz', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1quRno:Gqnz4Md9CM8D40SPEHrZoEobjDLnrg3PX4TFkdsno90', '2023-11-05 06:19:08.836183'),
('9i8p0jwz51a6h5pgq1fu5dawmlrlktxt', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qpmES:O08mUrHm2v6a3bMOdCc_4HXeQ7FKWPwBvBMQ01prR9c', '2023-10-23 09:07:20.706286'),
('9m36fuefzlcyan759b8aayfb6bd6nim8', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qtpv2:xQI_r4U2IX5Ng_hajnBtxNdhjMIAqlUD-mvyM5ETC4g', '2023-11-03 13:52:04.798599'),
('a9mjqqvsxm5no0g2seuk8470puprnign', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qu8Ff:H8xbASbtS7Ali_umIT3fe3w2FVgQa6bVh7YstlWI-vg', '2023-11-04 09:26:35.683891'),
('ab7jmu1z1jfs0w2kuvzi88kfc1nx3jau', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qxOSs:RUHCeEMb1n0UvdE_yN5wVMzcUM0pKKWF9uhf_sDUzJ0', '2023-11-13 09:21:42.715463'),
('abi3cyxjq8tm6i8krboa7qv55czcm6lh', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1qtUF8:9rhDz49XCHs3KKiNlDN3Yq3LeVxYLZKoo8PZ8nF9rU8', '2023-11-02 14:43:22.245385'),
('ag55jrqa92fulnu80tw4a82tlidj3kog', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1qx6Ww:d_j6FWiE3tBk7jokMcCA2qYpqFi8ajrOKyPNI7jWsVM', '2023-11-12 14:12:42.194508'),
('amcds1z48qclo4sw4juw00iovhvegnei', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1quZ8h:Ev2zYBxfdhrAxejVjT4yWvfrWuF7fn3Os0iWALn4Bog', '2023-11-05 14:09:11.948031'),
('as5zv2fgkm4yseihkyucc0s3ql2ripvj', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qq5oD:W74kukgFHvo0u5dhLZhMXQKW-JAhAdRcsT_WV-Pyq3k', '2023-10-24 06:01:33.756945'),
('asr4wp5y6l2hq2qz0p6if2nzs22d33os', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qq6nC:hQ-LWVWCMzuAl7Hr6Ij9bJPPPuKAEOy5hGaCTqn_AGs', '2023-10-24 07:04:34.259770'),
('aum1pvzcsyl5a7dts94o7ypt7co2vfcr', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxM3K:yN0qQnXXWk98qOMfhYo9HHjMrbzfjCI0CcL45h8jPwY', '2023-11-13 06:47:10.786669'),
('avswnxud2mtmzw18g2lvxtp19xf9or4k', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qoLIy:r-LNDj6MHkTd9CBLRbIbO4n6FKBHYACY1jlJexis3js', '2023-10-19 10:10:04.149667'),
('awecr0mf3cxb7u6wm2lom5xzbq1ykmbs', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qvumf:dRDn1hd__F5SztktCJ1TDBX3orvuy9NEVVeXDndDOqk', '2023-11-09 07:28:01.153100'),
('awv1qo75d0nq0sjftmw1owq2s45pnzau', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qtq0g:Ttv8eAKhs8R1l7c3ixAFpJQ9voDaK9Mrw50YtCsOTwQ', '2023-11-03 13:57:54.870137'),
('b6qsc59nce8ps87c9j74jz259i79p29l', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1qw3KD:MGC8by5WivDeXrDbjqp-_1Od9jYs3BGU8eK_uD1kQqE', '2023-11-09 16:35:13.500878'),
('bf42vso8ac9wciohbn1ehcr8nhfibdkh', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1qtdzc:-o-3uzY2qwrPNYKc6AedYMN9kEckmITidfts6U-Ow-s', '2023-11-03 01:08:00.904231'),
('bhykl71jv6sy7ygaoibz65biwcedu9e3', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qxj2o:JnoAcZvK8dycywfI4Zb72un7MaCKguGtOg09f68ugOA', '2023-11-14 07:20:10.213677'),
('d0tkrewb4kdpnt7pz9pd0gkzebyqr1k0', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qy3Hx:AnWbmBP6otbx-zIF9Z51UXRDEBBMVP6GswPR-zUXukk', '2023-11-15 04:57:09.321331'),
('df6xerdt6e0wtp517vej6j6c1bbyneex', '.eJxVjDsOwjAQBe_iGllxdv1LSc8ZorXX4ABypDipotwdLKWA9s282cVI25rHraZlnFgMQoG4_I6B4iuVRvhJ5THLOJd1mYJsijxplbeZ0_t6un-BTDW3t04RvWGj0LgOKGr0pBEoeLZgoSMk7ZSHXiEbYmXxnpztdRcDBvTfaKRlFcN-HB8l3jqS:1qx6Ih:GexH0gDGsP7MReWBORNx8qvlND2cIWYTFlD-zFnGL-k', '2023-11-12 13:57:59.311892'),
('dhp6qbqlcnzmnyiccqjf4vnzts8awr0q', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qskUz:1M6b97l6mxA0yFt_4yqRRfmeAsvn5FXIdVbLQ4yf7u8', '2023-10-31 13:52:41.897693'),
('e072dui6f7iw5mxjmqn3amkt5dbcmwz7', '.eJxVjDEOgzAQBP9ydWRhMLahTJ83oLvzOZBERgFTRIi_BySKpNlid3ZW6HDJfbfMMnVDgBY0XH47Qn5KOobwwHQfFY8pTwOpA1HnOqvbGOR1Pdk_QY9zv7-Rm6pAZ0qOVXTGGRKmktnUOuoYmsje-FrEeWe0s2zJGwmBKmctFVLsUsYpQ7tCfcR7wZSH_IFWb9v2BaEjQZc:1qy5gQ:OevZcE7SLmd4WSGZNGuq4jgVXLPOY9F2mPNm4862Jr0', '2023-11-15 07:30:34.035549'),
('e76cngx2ir2d355hie3hg5clj20xk6bk', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qxm6T:Kdflzp2hZb-X2TVGFaNPK7tESku6snAzbosxAtjlJwk', '2023-11-14 10:36:09.715369'),
('e7eu8tbushhdxdg36kics6i0qil45112', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qzUVN:HE6LpMbyRgxuVFJyWtgzN0pRwQ9iwv2qJyIr4lusjHo', '2023-11-19 04:12:57.837386'),
('ejktia06xcd1f6jy5fwapvur4gmw62ri', '.eJxVjLEOgzAQQ__l5ioKSSAXxu79BnRJuEJbBQFhqBD_XqgY2sWS_Wyv0NCSu2aZ26npI9RQKLj8hp7Cs00HiQ9K90GEIeWp9-KoiJPO4jbE9nU9u38HHc3dvkaWFsmpQmlkgyS5tNbj11ah8sYa5UwI7BErZIdaqtLIqLXjgEz7aaApQ72CO2RcKOU-v6Eutm37AGHnQGQ:1qvSeO:VpcdNx0YTw-gfFwCCqXGiNRfC1L4mgqG0wn7mW-Ni2w', '2023-11-08 01:25:36.379688'),
('elfu9smvm60vlyygkw15czkedvwer8rr', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qzHH9:Qh-mU8yGtfDa62M1ltm7Ext-o0DM3CDBzUjr09b2o0M', '2023-11-18 14:05:23.047756'),
('eoyah4n57eerlt9a1dfi0ggz6g2cqmp5', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1qymo4:YjgvjANeKzy-U8C_Fvq-l4mz3wSul4WITyu470A5m-g', '2023-11-17 05:33:20.063376'),
('epy5zff8j454rdjz994o9o3ug5grwyr2', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyTZi:x297JX72ct9RalfD84Uc2KJkzWNN6YDjpaKyoj8GSLo', '2023-11-16 09:01:14.775671'),
('etcdghu8x9tcvokagsonquss1ejahnsw', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qtp1M:L6KDLMtm_3MFikKN2W0X9KTTp4AgeYnm3L4ydCHledw', '2023-11-03 12:54:32.281894'),
('etmzqg6l9veqlldyyeuub3jes48b0n5h', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qryw6:Ehkq7yPXMLewf2pc5TJj2FJuezsSlBaHiw8EP9kyG-8', '2023-10-29 11:05:30.235336'),
('fde3fy8onw3fvqqslk08r938i9d2vmhc', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quCSs:tJgGrTFxG224VSpfhpArhL5CyH_-bPYkaxWm3UKoS84', '2023-11-04 13:56:30.757732'),
('fib0hgykw4n7pfwjqnijgkvv31dilsph', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qwawx:WmYc8wprbm1ETz7drixAU_ANwhgQadrT807S3xcbhIU', '2023-11-11 04:29:27.220200'),
('fn9pqqaxzaushye0x9bsgdriaq8m9eeq', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qw1Cy:IHR7MM0D967wlzUQVk701zM5uqzdAq8u9Yh-vVBekxo', '2023-11-09 14:19:36.179605'),
('foxv7pi1xtb8l9ll9fj9sas6ssxqr61f', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qyRgU:vB9TS-kQvt_DBS1bhbbTZsx3jthJ89YLPKoijqp8NRM', '2023-11-16 07:00:06.376113'),
('frqksw53czrgii6yu905jfgdr6bahutt', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1quj1K:h04fj8L_uGPzgsBwuXta4mpbqkypEwWX21E-Eduauow', '2023-11-06 00:42:14.718584'),
('g5k8fpxyjlqo34pebtlwgedr26bqe5ne', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qy3q1:zRyNiHmxeH8iVDXzIDHDSPYFFnGHSrLTfiogapNpijw', '2023-11-15 05:32:21.313203'),
('gdg0jdgwzvovld0umvci30jpwc0j5q2u', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qya7Y:UYL7NTpfuPKap5DaB9B84_BLOQ0f7lQj5eyYMncNmNI', '2023-11-16 16:00:36.958118'),
('ghky8nhgrnb6fw4yusx394kbrcbhhyhr', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyUgB:MJm5L3LpPBE5xVhDG7gJyFJtAZVyLjU5kjVdRyJd6bg', '2023-11-16 10:11:59.303718'),
('gmm1cjsqgzlzxzzt7sr8aivs77zv9tqv', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qzSJQ:R6wGgfivhiMfCyxqD4Z3X7Ku6GBRGcu0tgv2SxJnAhw', '2023-11-19 01:52:28.066548'),
('gz5bbkkg1yic7fbms2cwv0hqpbqtdjlj', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qvs9x:-OJX3fX5qiTDwcsIXAZJ1nHPPbx2aqNcUTxDioGehLs', '2023-11-09 04:39:53.195427'),
('h5hqv7uubebhdyw54vegq7qzvon2tlui', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qzVzN:l4AB_z4ttPscFnjsKfMSiOMB8_GvEqIquLTX_H6SOt0', '2023-11-19 05:48:01.450062'),
('h7mvfyp3lyml4jf4eaq9kl48mwo8y6qn', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxJ6I:Mn9oPZeWla7b6pkfzVbMkvoC7mBHDjGJGe8iPIoc768', '2023-11-13 03:38:02.227245'),
('h81bab4hqnyn25mkc3y81j9geg11g5ho', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qun25:WBDy8qYlAEowBi1p7r-WzFkMZFkidov3bl8iVqot8q4', '2023-11-06 04:59:17.623478'),
('hi0nxgq4orlkgh54js0txbscorakz8xp', '.eJxVjsEOgjAQRP-lZ9O0XbYgR-9-A9luF0FNiVAOhvDv2oSDXuYw82Yym-pozUO3LjJ3Y1Stsladfs1A_JBUknindJs0TynPY9AF0Ue66OsU5Xk52L-BgZbh23Z97ZAracgBODBUGWEOHqIB72to4BzIGxtRrEWL_tx7DD4IN4xRyiumOat2U1jktVLKY36r1u77_gF2H0C4:1qyCIK:7-63lXBseSe6WXt7gQNSEBDmR-UolcupGLRqCeGGhfY', '2023-11-15 14:34:08.804124'),
('ho3vmwdeas5qcuemkegt3maarxwlrprv', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qu6ys:j0CVdlNm1vbtBMVNaUnioeKHyDoZnRroCn-cCJ6GhWI', '2023-11-04 08:05:10.294851'),
('hsl3m7wqarqzxua93mrxl1up956ks3fu', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qun2U:SXmRfvuUb4tJ8vfLuQ6xUEHEzllF4cSbaSjVjKgyMfc', '2023-11-06 04:59:42.087232'),
('hx6oictef8bq92bba7fu5dqxkre6zwgu', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qzHBq:nn-VFXh6xG_VgP6mZ94epEZIi05fR4i8d_68vsMa-ys', '2023-11-18 13:59:54.504045'),
('ien0qotpbvnv109pwqbus2nkwzxly1d0', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qum8U:Zr3rvtuYOovIBLORx32N86esZfIdOlmWT3PQX0bfLt0', '2023-11-06 04:01:50.115822'),
('j00ssp1xe7iv8r4kx16qblaivg14udz8', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qveJz:JRZRDuP-ctlkWiUXiUeRSTFs6UAx9qO8LE6XGbNG4uk', '2023-11-08 13:53:19.386373'),
('j6fymadg1vgt94fbhyxuxj3wdwbzb9i2', '.eJxVjDsOwjAQBe_iGlnrv0xJzxks73qNA8iR4qRC3B0ipYD2zcx7iZS3taVt8JKmIs5CgTj9jpjpwX0n5Z77bZY093WZUO6KPOiQ17nw83K4fwctj_atNRhnkQm4cIg5OiKNUL0GF7RxXhlA52JQ2fuKlSuZapUtlUArVVC8P_7WOBk:1qryTV:xJ3l1m28y_WE_d-z3rEItspNaCiaRChWXsGdfPGpO8A', '2023-10-29 10:35:57.160767'),
('jhgnn5hij9o5nz1a80kfsa9bta2gjtpl', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyMEz:nB63RLFVKSs_J0aNyYpgQdX9GpFRBVL3PeAqt0PARXc', '2023-11-16 01:11:21.005972'),
('jkwy054sy8x1rgfijyr6mzorym3oa3q3', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1qwOsb:u4gDUcCF1xkZHhHQQPIp8D_teKmWj1pQnD9VREg83aw', '2023-11-10 15:36:09.514061'),
('k8j1i6fkw3buc2ptbolq5blz81pn1bv6', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qx8M6:fp4dbNaIZ8ia8BgJH8lbhqJZKG8vrqsYY58Z9DPGaj4', '2023-11-12 16:09:38.200477'),
('krkbiwyj3xpxdsukkexgvbnu3ldo5xgj', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyQ1a:yoRB8029szH9IK9mvsB7UwgnIdG8u86GG5uNlV572jI', '2023-11-16 05:13:46.731403'),
('kydruifsedc3tjw50ftgh6wvo5iy2fwe', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1qvzve:cNphLdIop9a6o5bUhAR7VI1Ns3wY7x91WpS1CpO45EM', '2023-11-09 12:57:38.839863'),
('lpfpb09mzei30glidjo8vxgjjghh9t3g', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qxjjV:PCxIp2hVOZRoH499dL4Z2fD73OGmfkrauGtMu7465AU', '2023-11-14 08:04:17.205979'),
('ltg73nkewnkxwehqe5cxx0m10nmimq6x', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qohgu:yn2Rkckv9UST1QLbT65ZytLk3JvzIxtcmG9tPrbwVAo', '2023-10-20 10:04:16.245911'),
('lui16c6fstad45ww97go2543uqw8ojfx', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qzW3J:kiibPZRMfVnLHweqMCJpHeFUuvX_s1f5X_OFdi2Gdw0', '2023-11-19 05:52:05.420189'),
('m0m8di5xhmhws3aq0mfxn3t9676olwzl', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1quARh:HEz7OamqrOzEZUwPNwuNiEjOyTpHeVjkkAldquSywBY', '2023-11-04 11:47:09.454742'),
('m1a7kxjw2bu587iqzv20z6srp6bjp9q9', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qu0T7:kZzLIaDDAitXDp63G6MSO0bHJDGcDThRUNq_2LqOUBk', '2023-11-04 01:07:57.567664'),
('m4zjsu6cq6l8um3bz85bpmsxr5gdmn3j', '.eJxVjsEOgjAQRP-lZ9O0XbYgR-9-A9luF0FNiVAOhvDv2oSDXuYw82Yym-pozUO3LjJ3Y1Stsladfs1A_JBUknindJs0TynPY9AF0Ue66OsU5Xk52L-BgZbh23Z97ZAracgBODBUGWEOHqIB72to4BzIGxtRrEWL_tx7DD4IN4xRyiumOat2U1jktVLKY36r1u77_gF2H0C4:1qyAq1:7kOL63LFpKDV-9ss439QddAH2DKXV-Bs8aO2lac-syA', '2023-11-15 13:00:49.844179'),
('mcl9hq9vnqtlsz10uk874wctoj6gnx0q', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qq2ZT:3NK1su9yLDux5-9ZDi85G_m8qPZ8bKnw-g4IgFlnyI8', '2023-10-24 02:34:07.537251'),
('mo2h7a0x95x89s23lz4xdqg7cixeml5c', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qwauA:m22uhbHZ8FyOpumDRceL9fkpljeSKRoEOe1cz8qXjaw', '2023-11-11 04:26:34.364228'),
('mry3wkra261k9krzvpy4ut6h4odjkfij', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qzUHK:V36yyahxkzG2kg7zQxYS_5ZZBHuDTG0H-8KLUybwwTk', '2023-11-19 03:58:26.023599'),
('mx7plrl3ucd4eh5ym8di4uh1ilgwq5rl', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quWFS:g2D2vpzYls2KJO7PD9cK6hmmTIafX2lY6FSa_P-qksA', '2023-11-05 11:03:58.251005'),
('n3khzf0x62ru8o6tnm1egn8j0w8yni2p', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qx1SC:QUw7oQY__yDH0-iN2beMXkOkz0DSPBMWwST3W_GrgII', '2023-11-12 08:47:28.345481'),
('n98iy7zthbr64zrf7ba6c8mi76b5xvjg', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qve1R:h0O8M_LR0l12oOqmgbGnKvf3XzZ3AJEHJD2991kAPK0', '2023-11-08 13:34:09.435525'),
('ng691fikuy7easzykqphw05cgsnplirg', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qplkZ:d0Fw9VL1VfL-suaXNVk6bg-RxGV0dIUeNi_Gf7S2dnw', '2023-10-23 08:36:27.779521'),
('nhu2qf07nwzpluw0rkjjgwfl1k8wj5yc', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qtW1W:gJJ0z2GX0pEnrZ--QvHXZC3fPsfUr1mYUHTMoxNfLlE', '2023-11-02 16:37:26.590575'),
('npymeyuy02qcw28uzrp9w31qx49ogs6y', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qpm7j:OYNaWQPRWMiMTLbW43VcmdlKVujrrrfpv7pqZtDoMQk', '2023-10-23 09:00:23.029560'),
('nu0jfvsxtb11dbg7hb5ouy0pv4p7x8mf', '.eJxVjsEOgjAQRP-lZ9O0XbYgR-9-A9luF0FNiVAOhvDv2oSDXuYw82Yym-pozUO3LjJ3Y1Stsladfs1A_JBUknindJs0TynPY9AF0Ue66OsU5Xk52L-BgZbh23Z97ZAracgBODBUGWEOHqIB72to4BzIGxtRrEWL_tx7DD4IN4xRyiumOat2U1jktVLKY36r1u77_gF2H0C4:1qxl6n:oAYXwt35mJM1tqpnsb8Gp5I7nB9QNY9n1TTmyMUy2WI', '2023-11-14 09:32:25.679661'),
('nw26l5pd888aa1bhi91lrut0gxmnxezk', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qulWq:nfaVsfa5BGaqEUaRXdDrVocyA2hi-Y1TO6fxOdwGZw0', '2023-11-06 03:22:56.168062'),
('o83wxhn4kljl4gn4ykjastg9v4hq4v84', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quNLW:oL5GJDflPENG2Pd28TdpagQdKo8THHKcWfVzhjJEkl8', '2023-11-05 01:33:38.515427'),
('ochg1cverb19ggzcojmh1e5or3c3fy6b', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyTf6:b8e12Tzps_dZjFTWmIuQfGdzGUXh2XJgMwirAS90_5M', '2023-11-16 09:06:48.240561'),
('oljr4i9d7v5j9odgou2aqur92ugrcldg', '.eJxVjsEOgjAQRP-lZ9N0W7ogR-9-A9luF0FNiVAOhvDv2oSDXuYw82Yym-pozUO3LjJ3Y1StAlCnXzMQPySVJN4p3SbNU8rzGHRB9JEu-jpFeV4O9m9goGX4tm1fW8-VNGSds85QZYQ5oIvGIdaucedAaCB6AfDg8dyjDxiEG_ZRyiumOat2U1jktVLKY36rFvZ9_wB2MkC5:1quZ3E:0gY5OrubsUSqGAQo2YdK0OyFgdBtZwoi9LHekm3tJkY', '2023-11-05 14:03:32.887910'),
('oo3h0098q7nh2ewxd16cvvelc1e1c44y', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qulKP:BrkXHSAbg6xBeDbfsppU5NmUPDhR1whgU60vB5YPzr8', '2023-11-06 03:10:05.844873'),
('or0dnwy574b2m5sh9linx5s91ff4qx0t', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qxO1I:efqlQWOCJNYakyc1RQIBrprn5UmH2elvA5S_7SEmM78', '2023-11-13 08:53:12.432047'),
('pm85anjirsq264nwfqreuagazzilzoav', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qvpDT:8gTo2Jnd689L9Yh9qwp3rO9-ixNw5D9Vk6VVWaVr334', '2023-11-09 01:31:19.517372'),
('pmp32zze71a21aknn5g34qntaewn297p', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qulCh:rTXOvF7ngAKJ1t1xw3a2dBaQVZPccYuQVzu75zC0qRc', '2023-11-06 03:02:07.060897'),
('pnq7wcwsk3gy7pvxbtngj22xc5u99x8f', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qxkNT:59WXq08yJ8uDAq31H5oDEhHmKxNagH0snpf4-rujhzQ', '2023-11-14 08:45:35.598098'),
('qvprhkrgh30lpb4k3llrk3zldvszw24s', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxhQq:AZefSRP92FzQwWSpqsVz5mGpvnQ14ytBXj7wJRgapXc', '2023-11-14 05:36:52.877382'),
('r1brchuxlz23kbtfjdco89d6wm1co8sd', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qx7T1:ttrFIo8bGWfWYYv8eZkCEfIP1k5mCeRLqP9cdzGjZG0', '2023-11-12 15:12:43.683567'),
('r9c4pfhhx5ugjiwqrhq2ytglie9xxqpi', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1qyCxI:T8wJjdJO2cZW8P9SHxcVS87ryoMV0dt4SVs5BMJ0ZhU', '2023-11-15 15:16:28.181068'),
('rba1n2vc2xrzjca5tdk5iqf4h8a9mgz8', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxAvE:_3AuUDN-SnGHMCbsrgAgy_q2pKBzFKi7id-6OKUEag4', '2023-11-12 18:54:04.772247'),
('rd65jnv3idabi3z0zgptvwr7dqbwram3', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qpmCu:uZKpppa-TfkOwej-YpAEXZrBVvS7Rpt8j7Irvyb2C6s', '2023-10-23 09:05:44.058011'),
('reiko16cn98otxhiup2l0w1xpo6sn9bz', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qtfqP:VKZdUcydcglej_ugyVL-O3z15EnId3ncXHhwVyaiMDE', '2023-11-03 03:06:37.364361'),
('rgrca15x72dhpunaymzgqgx2mcj5845u', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qyrG7:-9D4qGqTwqHbPy_lCdiHnzBfaJjZ8xgrTti3TIeWWwE', '2023-11-17 10:18:35.221764'),
('s5rgrrjo3fmlnjf8ls4badehqtibhp70', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxgZG:Jq4dCfVagxJgVgojFWR120-iloNq3nvxq8eLjMlKdL4', '2023-11-14 04:41:30.124190'),
('s72t84lkrksjvzok7bqk5ph8s8q5rw8s', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qxUEX:7nirZraobe8JVXut8z4c9SU62PEL4ufYj4_YxiuQsWM', '2023-11-13 15:31:17.889157'),
('sdxgbdwx5vh1emofma497klutex2v81k', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qvT6r:3dloxyp5lOC3eOLA46zqPmGaOTEHp3IzWrl-crKD508', '2023-11-08 01:55:01.430328'),
('sl0c1eh3ybb7lz237o5wqsm4i5qjhrfp', '.eJxVjjEOgzAQBP_iOrJsHz4MZXreYJ3PRyCJQDJQIf6eIFEk7c7sancVaVuHuC1S4phVq6xVt98wEb9kOkl-0vSYNc_TWsakT0VfdNHdnOV9v9y_gYGW4dt2fe08VxLIATgwVBlhTgjZAGINAZpEaGz2Yq23HpsefcIkHNhnOV8xlVW1-3F8ACSQOt8:1qx6Mi:4q5BfU4vTx5zkmQ-9jKXY0XsUhYan5DjJYi_NCOWqrk', '2023-11-12 14:02:08.196974'),
('t6hb90u6a5pmn214l8ftyp4qcx0rifiq', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quN8n:hckmCR42qVDSuTXxe6YZlEJeWJA4M_sgrTh_rqYx140', '2023-11-05 01:20:29.439564'),
('t8kpventpdwmxy91s9u1exkh2fgifimz', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qpj8p:wa_yeadJayp7-o3RVqnKX8SgbS2Da7p55Zd0Xv__lUg', '2023-10-23 05:49:19.635045'),
('tar5urxkucg9014wrqa3rofgp5tumhvz', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1quBx4:mFclnPCEAbokFFwt5nzZfva8RJch_KwV1TKyluPcsr4', '2023-11-04 13:23:38.408167'),
('tfa7j143c7yzsbz0gmsnv1i7q29y2e44', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qtqOr:3MovelMcu6QoPVGOBWyudyMX41zgdPJcwE6mhdGsrMg', '2023-11-03 14:22:53.646902'),
('tnrcrlgftjvlvkr7ealukobogkpi6tda', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qquFF:ocbb1Lj3PE4t0nbqa6KtTxQPPdSpI7cRnOSVK3IN7HI', '2023-10-26 11:52:49.360406'),
('tqdc80y8xt62gy8kujcx8m70hu7ifgo4', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1quYag:42uTWVYRJEqHdCvtZUJHm4UbEB5d_AgJc6wZxxydppA', '2023-11-05 13:34:02.673366'),
('tts4mwikoy4uabw35p22ju06upfy8kl8', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qtURJ:x73d7WElxnJzRub8yuTdKiG5c3IYaNgoqIBH3QA1nvc', '2023-11-02 14:55:57.826320'),
('u7utguq0qjp3ud4a5vk41e8x9t34blcr', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qvHob:T3gyiqpVPyRhRP8-15jHcEJC8fJBCvruNH88kkseAeg', '2023-11-07 13:51:25.588648'),
('u963fjbyeh98n7h8bcge165zwp49fql2', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qu6mR:O8OP7EcE-8GyU_qCknwjUIYG9evNKnoFtp06xvZCOuQ', '2023-11-04 07:52:19.632066'),
('ubyrlu0zhm9cssmi2e453ufnx34hfjj5', '.eJxVjMEOgyAQRP-Fc0MQEBaPvfsNZlnYattoInoy_nu18dAeZ-bN20SH69J3a8lzNyTRiEqL228ZkV55PJf0xPExSZrGZR6iPBF5rUW2U8rv-8X-CXos_fEGVh4w6EobYAuouPY-wjc6ctF6q4Ml4gjggAMYpWurkjGBCRgPKeG8iGbb9w8WPDqH:1qu88K:BKqK_nfdzPGrOA9t5Mvi2lpbwy4ep0X6B7j94_a5iNA', '2023-11-04 09:19:00.745838'),
('uno7eep5pi0ykant2tgwxm367gs9c3n4', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qvotz:rVgR3Aq0C5geyQ2YCzcig1M0Cw4XXH3lu_jWB70trlk', '2023-11-09 01:11:11.021324'),
('uomjf7s2mz06itkq57gqehmeeu8pgwar', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qyDj8:IbkON53bej8bolqVDvjT4xz_AwVY9hDx9lM0Rti-Tr0', '2023-11-15 16:05:54.350712'),
('up6yl5wwfayl67yu9kk01do4ichp7ojj', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qphpV:6AiANhxHApmey8F6ezgv-7IOH8_7qAO-pyBGWSLSSs8', '2023-10-23 04:25:17.548038'),
('uq7l5l6ejtog7niinvm3pnw0do90a1r8', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1quSSc:m2k4NPZwE0a3uuou3FuHm6kv1Xq9lBdQMLgVEuMuRlI', '2023-11-05 07:01:18.292538'),
('v3qlbi95eockdqj6o6j3fbg3tj06mzut', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qtpCF:DKtYJBJA3iuUEnND6pgtrhn5MuhFqFLTeoJwdWCdco4', '2023-11-03 13:05:47.438179'),
('vlzc1kd3kl7db3459z73mz84d62egqki', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qwfoK:UIuGXANaiPpMWFhAapvXK5j1M6ErqDYEOPD-u-w7tiU', '2023-11-11 09:40:52.786539'),
('vrpf76hn1m8e9q4s1n16c41b7all5ypq', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qrvE5:E269O_CeNsi3i5g-C_mlsfLpLnwNw6Gmgl2u52CCOF8', '2023-10-29 07:07:49.039135'),
('w6rxpk9qf1avueqivw6pet2wwy2cb96l', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qsyN1:ZWShy1aRy1dE_eqaLyNh1Zr8a7eJ0arJ7Xb5xviFqOc', '2023-11-01 04:41:23.166547'),
('wmzcs42egzdyhjtagpdp07d83im26fq4', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qrb4Y:Nix1k34l9w2xt-HdEJwa3kkPFgvQsR47sU9kAZ_It50', '2023-10-28 09:36:38.212706'),
('xbgdbj8fpfznjli4peys2wckcs9183f3', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qu11H:A7pCDdKQYcWyJVh6gtaqkB85rCwenw8hMr2jMWXYvHc', '2023-11-04 01:43:15.087177'),
('xhdzgnjk2e9v58oyprzd7mjs1enw6dww', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qzFr6:xGwDwfmLlMPrWOQaGE93nNws2iWj5vbfXZQe5IYiD-w', '2023-11-18 12:34:24.252346'),
('yabsxcq13s19lhyg5xymkalzyt9c6l0n', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qpSWp:Hq1tiypwsvSsq7IR5pr6tYG9Baw9iTsMbW4lalPjMTc', '2023-10-22 12:04:59.792543'),
('yepavastm9w0x81za51bydkz3e9ccx6r', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qxk0d:_HNl-RTvUBwREsVdrE4MkayqHNNO4ciH6kIb4-8j1S4', '2023-11-14 08:21:59.966458'),
('ynd6zahpnwj5otl33mbjetihtlywjg05', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1qslmB:3B2yVOuNHCxqCXW-XAd8O5Wz51jsdd52VYaO4IrFpCk', '2023-10-31 15:14:31.299569'),
('zbapxicmb3i9lkih9plcgwpfj3i8s245', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qthVS:OCrMzxEZqbfpBOKZqA1NCiRYFBu7l-oUz7eXjO50-4E', '2023-11-03 04:53:06.027644'),
('zd3fby8z927ihp2iyzr5dod7fqt4nlbh', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qy8cK:Dhiqw1OBUK6o9VT62CVqxifczJw2pFofNb-eR1w1gpY', '2023-11-15 10:38:32.613854'),
('zh2j4a4j6wfwa82gi0f6e5nz3cab52ig', '.eJxVjMsOwiAQRf-FtSHQGV4u3fsNZGBQqoYmpV0Z_92QdKHbe865bxFp32rce1njzOIsNIjT75goP0sbhB_U7ovMS9vWOcmhyIN2eV24vC6H-3dQqddRm5IxWLYarVdA2WAgg0ApsAMHipCM1wEmjWyJtcNb8W4yKidMGMTnC-5JN0Y:1qxRo2:uuUu6fUD87g69H1fkCB4lZGr9MI_JbDpJAvRjt9W4zM', '2023-11-13 12:55:46.490607'),
('zn1atkgtiigashvfh8q6b9rvx39ghw00', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qtfm2:cLD4LaTcEYuwr_m9I5q2Q4066HKAOvCg8Js3_-XLaLg', '2023-11-03 03:02:06.783258'),
('zr5trwa97ivugv40redolw3a5k1t263f', '.eJxVjMsOwiAURP-FtSEUKFxcuu83kMvjStVAUtqV8d-1pgtdzpwz82Qet7X4refFz4md2SDZ6bcMGO-57iTdsF4bj62uyxz4rvCDdj61lB-Xw_07KNjLZw0kLKCTg1RAGlDQaG2AbzTRBG21dDpGCgAGyIESctQiKeUoAiF7vQHfFTc7:1qvadg:OMvEmU56uHr5tprAdVib4xTzgXGrG630BZCvxkjBl7E', '2023-11-08 09:57:24.724994'),
('ztln1c0jxe952h5vn4dsegtrnkfhqnwg', '.eJxVjEEOwiAQRe_C2pBSpgx16d4zNMwwSNVAUtqV8e7apAvd_vfef6kpbGuetibLNEd1VkadfjcK_JCyg3gP5VY117IuM-ld0Qdt-lqjPC-H-3eQQ8vfOvBou4DQc7IJAYGEqWeGwSST4pjYgx9E0CMYdOzIg8RIFp2jTjr1_gD8mThy:1qy60R:AGx9UV7VOcxgnAMuWKBBjCtiNf6yeJgGRso01WGpd_o', '2023-11-15 07:51:15.630071'),
('zu5ofxv158pqjql5jafde26l5itdusah', '.eJxVjDEOgzAMRe-SuYoImDgwdu8ZkO04hbYCicCEuHtBYmjX_95_m-loXfpuzTp3QzStceb2uzHJW8cTxBeNz8nKNC7zwPZU7EWzfUxRP_fL_Qv0lPvjTdJUBSGUkqqEgMAqXIpA7ZJLsUkSINSqGBAcevEcQGPkCr3nQosjKjQvpt32_Qs_5ju-:1quAVU:htA3Bp0CGQAj9t6stUTTaz3Pt6bAM5qbREJV4_eDEwQ', '2023-11-04 11:51:04.147005'),
('zw1fdmqw81s3eyvipw8pk98fpzg5c2y4', '.eJxVjEEOgjAQRe_StWk6HToUl-49QzOdDoIaSCisjHdXEha6_e-9_zKJt3VIW9UljcWcDYA5_Y6Z5aHTTsqdp9tsZZ7WZcx2V-xBq73ORZ-Xw_07GLgO39r3rQ_SaGSP6NFx41QkExaHRC1G7DKTgxIUIECgrqeQKatECUXBvD_p-TeT:1quCwn:jmMY1xlNNizz0YysgEic6qKfR7U3dk-kIyq0MQixPrc', '2023-11-04 14:27:25.648927');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_user`
--
ALTER TABLE `account_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`),
  ADD KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`),
  ADD KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_slug` (`name_slug`),
  ADD KEY `app_customer_toll_id_798319f7_fk_app_toll_id` (`toll_id`);

--
-- Indexes for table `app_daily`
--
ALTER TABLE `app_daily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_dailytransaction`
--
ALTER TABLE `app_dailytransaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_dailytransaction_product_id_eaccbbae` (`product_id`),
  ADD KEY `app_dailytransaction_unite_id_51fbfd93` (`unite_id`),
  ADD KEY `app_dailytransaction_dailyid_id_75e267c3` (`dailyid_id`);

--
-- Indexes for table `app_expenses`
--
ALTER TABLE `app_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_inventoryproduct`
--
ALTER TABLE `app_inventoryproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_inventoryproduct_product_name_id_e2283ffd_fk_app_product_id` (`product_name_id`);

--
-- Indexes for table `app_payment`
--
ALTER TABLE `app_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_payment_customer_id_f2422c1a_fk_app_customer_id` (`customer_id`),
  ADD KEY `app_payment_saleId_id_48f7044f_fk_app_sales_id` (`saleId_id`);

--
-- Indexes for table `app_product`
--
ALTER TABLE `app_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_productunit`
--
ALTER TABLE `app_productunit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_purchase`
--
ALTER TABLE `app_purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_purchase_party_id_df2eaad3_fk_app_seller_id` (`party_id`);

--
-- Indexes for table `app_purchaseitem`
--
ALTER TABLE `app_purchaseitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_purchaseitem_product_id_6008575c_fk_app_product_id` (`product_id`),
  ADD KEY `app_purchaseitem_purchaseId_id_51db6794_fk_app_purchase_id` (`purchaseId_id`),
  ADD KEY `app_purchaseitem_unit_id_f6ac7c7e_fk_app_productunit_id` (`unit_id`);

--
-- Indexes for table `app_purchaseparty`
--
ALTER TABLE `app_purchaseparty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_sales`
--
ALTER TABLE `app_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_sales_customer_id_253001a7_fk_app_customer_id` (`customer_id`);

--
-- Indexes for table `app_salesitem`
--
ALTER TABLE `app_salesitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_salesitem_product_id_f6a2ef55_fk_app_product_id` (`product_id`),
  ADD KEY `app_salesitem_sales_id_id_05da19f7_fk_app_sales_id` (`sales_id_id`),
  ADD KEY `app_salesitem_unit_id_27174e48_fk_app_productunit_id` (`unit_id`);

--
-- Indexes for table `app_seller`
--
ALTER TABLE `app_seller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_toll`
--
ALTER TABLE `app_toll`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_toll_toll_slug_b17e0a7b_uniq` (`toll_slug`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_account_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_user`
--
ALTER TABLE `account_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_customer`
--
ALTER TABLE `app_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `app_daily`
--
ALTER TABLE `app_daily`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_dailytransaction`
--
ALTER TABLE `app_dailytransaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `app_expenses`
--
ALTER TABLE `app_expenses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_inventoryproduct`
--
ALTER TABLE `app_inventoryproduct`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_payment`
--
ALTER TABLE `app_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `app_product`
--
ALTER TABLE `app_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `app_productunit`
--
ALTER TABLE `app_productunit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app_purchase`
--
ALTER TABLE `app_purchase`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_purchaseitem`
--
ALTER TABLE `app_purchaseitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_purchaseparty`
--
ALTER TABLE `app_purchaseparty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_sales`
--
ALTER TABLE `app_sales`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;

--
-- AUTO_INCREMENT for table `app_salesitem`
--
ALTER TABLE `app_salesitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=457;

--
-- AUTO_INCREMENT for table `app_seller`
--
ALTER TABLE `app_seller`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_toll`
--
ALTER TABLE `app_toll`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_user_groups`
--
ALTER TABLE `account_user_groups`
  ADD CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `account_user_user_permissions`
--
ALTER TABLE `account_user_user_permissions`
  ADD CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);

--
-- Constraints for table `app_customer`
--
ALTER TABLE `app_customer`
  ADD CONSTRAINT `app_customer_toll_id_798319f7_fk_app_toll_id` FOREIGN KEY (`toll_id`) REFERENCES `app_toll` (`id`);

--
-- Constraints for table `app_dailytransaction`
--
ALTER TABLE `app_dailytransaction`
  ADD CONSTRAINT `app_dailytransaction_dailyid_id_75e267c3_fk_app_daily_id` FOREIGN KEY (`dailyid_id`) REFERENCES `app_daily` (`id`);

--
-- Constraints for table `app_inventoryproduct`
--
ALTER TABLE `app_inventoryproduct`
  ADD CONSTRAINT `app_inventoryproduct_product_name_id_e2283ffd_fk_app_product_id` FOREIGN KEY (`product_name_id`) REFERENCES `app_product` (`id`);

--
-- Constraints for table `app_payment`
--
ALTER TABLE `app_payment`
  ADD CONSTRAINT `app_payment_customer_id_f2422c1a_fk_app_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app_customer` (`id`),
  ADD CONSTRAINT `app_payment_saleId_id_48f7044f_fk_app_sales_id` FOREIGN KEY (`saleId_id`) REFERENCES `app_sales` (`id`);

--
-- Constraints for table `app_purchase`
--
ALTER TABLE `app_purchase`
  ADD CONSTRAINT `app_purchase_party_id_df2eaad3_fk_app_seller_id` FOREIGN KEY (`party_id`) REFERENCES `app_seller` (`id`);

--
-- Constraints for table `app_purchaseitem`
--
ALTER TABLE `app_purchaseitem`
  ADD CONSTRAINT `app_purchaseitem_product_id_6008575c_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`),
  ADD CONSTRAINT `app_purchaseitem_purchaseId_id_51db6794_fk_app_purchase_id` FOREIGN KEY (`purchaseId_id`) REFERENCES `app_purchase` (`id`),
  ADD CONSTRAINT `app_purchaseitem_unit_id_f6ac7c7e_fk_app_productunit_id` FOREIGN KEY (`unit_id`) REFERENCES `app_productunit` (`id`);

--
-- Constraints for table `app_sales`
--
ALTER TABLE `app_sales`
  ADD CONSTRAINT `app_sales_customer_id_253001a7_fk_app_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `app_customer` (`id`);

--
-- Constraints for table `app_salesitem`
--
ALTER TABLE `app_salesitem`
  ADD CONSTRAINT `app_salesitem_product_id_f6a2ef55_fk_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `app_product` (`id`),
  ADD CONSTRAINT `app_salesitem_sales_id_id_05da19f7_fk_app_sales_id` FOREIGN KEY (`sales_id_id`) REFERENCES `app_sales` (`id`),
  ADD CONSTRAINT `app_salesitem_unit_id_27174e48_fk_app_productunit_id` FOREIGN KEY (`unit_id`) REFERENCES `app_productunit` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
