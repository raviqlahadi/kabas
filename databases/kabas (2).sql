-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2019 at 02:35 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kabas`
--

-- --------------------------------------------------------

--
-- Table structure for table `table_dialects`
--

CREATE TABLE `table_dialects` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_dialects`
--

INSERT INTO `table_dialects` (`id`, `language_id`, `name`, `description`, `status`) VALUES
(2, 1, 'Bau-bau', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_groups`
--

CREATE TABLE `table_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_groups`
--

INSERT INTO `table_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(4, 'contributor', 'Menambahkan dan mengoreksi data'),
(5, 'verificator', 'Verifikasi Data');

-- --------------------------------------------------------

--
-- Table structure for table `table_group_access`
--

CREATE TABLE `table_group_access` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `c` tinyint(1) NOT NULL,
  `r` tinyint(1) NOT NULL,
  `u` tinyint(1) NOT NULL,
  `d` tinyint(1) NOT NULL,
  `s` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_group_access`
--

INSERT INTO `table_group_access` (`id`, `group_id`, `menu_id`, `c`, `r`, `u`, `d`, `s`) VALUES
(4, 2, 18, 0, 0, 0, 0, 0),
(8, 1, 18, 0, 0, 0, 0, 0),
(9, 1, 19, 0, 0, 0, 0, 0),
(15, 1, 25, 0, 0, 0, 0, 0),
(16, 1, 26, 0, 0, 0, 0, 0),
(17, 4, 18, 0, 0, 0, 0, 0),
(18, 4, 25, 0, 0, 0, 0, 0),
(19, 4, 26, 0, 0, 0, 0, 0),
(20, 1, 27, 0, 0, 0, 0, 0),
(21, 1, 28, 0, 0, 0, 0, 0),
(22, 5, 18, 0, 0, 0, 0, 0),
(24, 5, 27, 0, 0, 0, 0, 0),
(25, 1, 29, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `table_languages`
--

CREATE TABLE `table_languages` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_languages`
--

INSERT INTO `table_languages` (`id`, `name`, `description`, `status`) VALUES
(1, 'Cia-cia', 'Bahasa daerah yang digunakan di daerah buton dan wakatobi', 1),
(2, 'Tolaki', 'Bahasa daerah yang digunakan oleh suku tolaki yang tersebar di kota konawe dan kabupaten konawe', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_locations`
--

CREATE TABLE `table_locations` (
  `id` int(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(50) NOT NULL,
  `web` varchar(200) NOT NULL,
  `tags` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `lat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_locations`
--

INSERT INTO `table_locations` (`id`, `name`, `description`, `image`, `address`, `phone`, `web`, `tags`, `status`, `lang`, `lat`) VALUES
(1, 'Lokasi 1', 'testing', '6603edf38a0996ffe430243841546c25.jpg', '', '', '', '#Hotel #Pariwisata', 0, '-', '-'),
(2, 'Lokasi 2', 'testing', '', '', '', '', '', 0, '', ''),
(3, 'Lokasi 3', 'testing', '', '', '', '', '', 1, '', ''),
(5, 'Kantor Techno\'s', 'Tempat kerja ts', '15701477542651.jpg', 'Jln. Supu Yusuf No. 9', '082296671450', 'http://technos-studio.com', '#Software House #Consultant', 1, '-', '-'),
(6, 'Dimana saja', '-', '1f537a53b0003598cd206a6ed0aa357c.jpg', '-', '-', '-', '#test #tags', 0, '-', '-'),
(7, 'Ini juga', '-', '61603480847f209e61b5665c6084e80e.jpg', 'Jln. Bunga Sakura', '082296671450', '-', '#tags #eh', 0, '-', '-'),
(8, 'adas', 'ada', '1570150171316.jpg', '-', '-', '-', '#noo #apasih', 0, '-', '-'),
(9, 'Rouvel', 'Kafe cozy', 'no_image.jpg', 'Puwatu', '92212', '-', 'Caf?', 1, '-', '-\rKedai'),
(10, 'Caf?', '', '', '', '', '', '', 0, '', ''),
(11, 'Rouvel', 'Kafe cozy', 'no_image.jpg', 'Puwatu', '92212', '-', 'Kafe', 1, '-', '-\rKedai'),
(12, 'Kafe', '', '', '', '', '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_log`
--

CREATE TABLE `table_log` (
  `log_id` int(11) NOT NULL,
  `log_action` text NOT NULL,
  `log_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_ipaddress` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_log`
--

INSERT INTO `table_log` (`log_id`, `log_action`, `log_datetime`, `log_ipaddress`, `user_id`) VALUES
(1, 'add data user', '2018-07-13 10:28:10', '::1', 1),
(2, 'update data skpd', '2018-07-13 10:39:14', '::1', 1),
(3, 'add data userprofile', '2018-07-16 03:25:17', '::1', 1),
(4, 'update data userprofile', '2018-07-16 04:11:59', '::1', 1),
(5, 'add data usulan', '2018-07-16 10:41:07', '::1', 1),
(6, 'add data menu', '2018-07-16 17:30:32', '::1', 1),
(7, 'update data menu', '2018-07-16 17:31:37', '::1', 1),
(8, 'add data submenu', '2018-07-16 18:26:16', '::1', 1),
(9, 'add data submenu', '2018-07-16 18:28:16', '::1', 1),
(10, 'add data menu', '2018-07-16 18:33:25', '::1', 1),
(11, 'add data menu', '2018-07-16 18:33:41', '::1', 1),
(12, 'add data menu', '2018-07-16 18:33:54', '::1', 1),
(13, 'add data menu', '2018-07-16 18:34:07', '::1', 1),
(14, 'add data menu', '2018-07-16 18:34:21', '::1', 1),
(15, 'add data menu', '2018-07-16 18:35:37', '::1', 1),
(16, 'add data group', '2018-07-16 18:50:39', '::1', 1),
(17, 'add data groupmenu', '2018-07-16 19:05:13', '::1', 1),
(18, 'add data groupmenu', '2018-07-16 19:14:49', '::1', 1),
(19, 'add data groupmenu', '2018-07-16 19:16:15', '::1', 1),
(20, 'add data groupmenu', '2018-07-16 19:16:20', '::1', 1),
(21, 'add data groupmenu', '2018-07-16 19:16:24', '::1', 1),
(22, 'add data groupmenu', '2018-07-16 19:16:30', '::1', 1),
(23, 'add data groupmenu', '2018-07-16 19:16:34', '::1', 1),
(24, 'add data groupmenu', '2018-07-16 19:16:56', '::1', 1),
(25, 'update data menu', '2018-07-17 04:15:15', '::1', 1),
(26, 'add data submenu', '2018-07-17 04:16:13', '::1', 1),
(27, 'add data group', '2018-07-17 05:25:11', '::1', 1),
(28, 'add data group', '2018-07-17 05:25:31', '::1', 1),
(29, 'add data user', '2018-07-17 05:34:18', '::1', 1),
(30, 'add data user', '2018-07-17 05:35:16', '::1', 1),
(31, 'update data user', '2018-07-17 05:35:25', '::1', 1),
(32, 'add data groupmenu', '2018-07-17 05:39:40', '::1', 1),
(33, 'add data groupmenu', '2018-07-17 05:39:58', '::1', 1),
(34, 'add data menu', '2018-07-17 05:40:36', '::1', 1),
(35, 'add data groupmenu', '2018-07-17 05:41:01', '::1', 1),
(36, 'add data groupmenu', '2018-07-17 05:41:30', '::1', 1),
(37, 'add data groupmenu', '2018-07-17 05:41:35', '::1', 1),
(38, 'add data groupmenu', '2018-07-17 05:41:52', '::1', 1),
(39, 'add data groupmenu', '2018-07-17 05:42:25', '::1', 1),
(40, 'add data groupmenu', '2018-07-17 05:42:30', '::1', 1),
(41, 'add data groupmenu', '2018-07-17 05:42:38', '::1', 1),
(42, 'update data user', '2018-07-17 05:44:16', '::1', 1),
(43, 'update data user', '2018-07-17 07:11:00', '::1', 1),
(44, 'update data user', '2018-07-17 07:11:16', '::1', 1),
(45, 'add data skpd', '2018-07-17 14:03:32', '::1', 1),
(46, 'add data skpd', '2018-07-17 14:03:58', '::1', 1),
(47, 'update data user', '2018-07-17 14:04:35', '::1', 1),
(48, 'add data usulan', '2018-07-17 14:23:15', '::1', 10),
(49, 'add data skpd', '2018-07-17 14:31:28', '::1', 1),
(50, 'add data user', '2018-07-17 14:32:24', '::1', 1),
(51, 'update data periksa', '2018-07-17 15:15:15', '::1', 9),
(52, 'add data menu', '2018-07-17 17:06:04', '::1', 1),
(53, 'add data groupmenu', '2018-07-17 17:06:31', '::1', 1),
(54, 'add data menu', '2018-07-17 17:08:28', '::1', 1),
(55, 'update data menu', '2018-07-17 17:08:44', '::1', 1),
(56, 'add data submenu', '2018-07-17 17:09:05', '::1', 1),
(57, 'add data submenu', '2018-07-17 17:09:44', '::1', 1),
(58, 'add data groupmenu', '2018-07-17 17:11:00', '::1', 1),
(59, 'update data menu', '2018-07-17 17:16:14', '::1', 1),
(60, 'add data submenu', '2018-07-17 17:20:41', '::1', 1),
(61, 'add data menu', '2018-07-17 17:32:54', '::1', 1),
(62, 'add data menu', '2018-07-17 17:33:20', '::1', 1),
(63, 'add data groupmenu', '2018-07-17 17:33:32', '::1', 1),
(64, 'add data groupmenu', '2018-07-17 17:33:39', '::1', 1),
(65, 'add data pengumuman', '2018-07-17 17:34:14', '::1', 1),
(66, 'add data user', '2018-07-17 17:38:07', '::1', 1),
(67, 'add data user', '2018-07-17 17:40:09', '::1', 1),
(68, 'update data periksa', '2018-07-17 18:04:43', '::1', 13),
(69, 'add data usulan', '2018-07-18 10:39:25', '::1', 12),
(70, 'update data skpd', '2018-07-18 11:19:33', '::1', 1),
(71, 'update data skpd', '2018-07-18 11:19:57', '::1', 1),
(72, 'add data skpd', '2018-07-18 11:20:19', '::1', 1),
(73, 'update data skpd', '2018-07-18 11:20:24', '::1', 1),
(74, 'update data skpd', '2018-07-18 11:20:31', '::1', 1),
(75, 'add data skpd', '2018-07-18 11:22:05', '::1', 1),
(76, 'add data skpd', '2018-07-18 11:22:34', '::1', 1),
(77, 'add data user', '2018-07-18 11:24:48', '::1', 1),
(78, 'add data usulan', '2018-07-18 11:54:06', '::1', 12),
(79, 'add data usulan', '2018-07-18 12:18:53', '::1', 12),
(80, 'update data periksa', '2018-07-18 12:20:18', '::1', 13),
(81, 'add data usulan', '2018-07-18 13:11:16', '192.168.1.25', 12),
(82, 'update data periksa', '2018-07-18 13:16:51', '192.168.1.19', 13),
(83, 'add data usulan', '2018-07-18 13:37:43', '::1', 12),
(84, 'add data usulan', '2018-07-18 13:41:25', '192.168.1.22', 12),
(85, 'add data usulan', '2018-07-18 13:56:07', '192.168.1.25', 12),
(86, 'add data usulan', '2018-07-18 14:02:50', '192.168.1.25', 12),
(87, 'add data usulan', '2018-07-18 23:00:20', '::1', 12),
(88, 'add data usulan', '2018-07-18 23:00:38', '::1', 12),
(89, 'add data usulan', '2018-07-18 23:06:40', '::1', 12),
(90, 'add data usulan', '2018-07-18 23:18:19', '::1', 14),
(91, 'add data usulan', '2018-07-18 23:23:37', '::1', 14),
(92, 'add data usulan', '2018-07-18 23:24:25', '::1', 14),
(93, 'add data usulan', '2018-07-18 23:24:57', '::1', 14),
(94, 'add data usulan', '2018-07-18 23:49:16', '::1', 14),
(95, 'add data usulan', '2018-07-19 00:14:44', '::1', 14),
(96, 'add data usulan', '2018-07-19 00:15:48', '::1', 14),
(97, 'update data periksa', '2018-07-19 00:17:15', '::1', 13),
(98, 'update data periksa', '2018-07-19 00:18:07', '::1', 13),
(99, 'add data usulan', '2018-07-19 01:42:30', '192.168.43.103', 12),
(100, 'update data periksa', '2018-07-19 01:44:35', '192.168.43.13', 13),
(101, 'add data skpd', '2018-07-19 02:40:23', '192.168.43.13', 1),
(102, 'add data skpd', '2018-07-19 02:41:21', '192.168.43.13', 1),
(103, 'add data skpd', '2018-07-19 02:41:52', '192.168.43.13', 1),
(104, 'add data skpd', '2018-07-19 02:42:09', '192.168.43.13', 1),
(105, 'add data user', '2018-07-19 02:43:13', '192.168.43.13', 1),
(106, 'add data user', '2018-07-19 02:44:33', '192.168.43.13', 1),
(107, 'add data user', '2018-07-19 02:51:52', '192.168.0.110', 1),
(108, 'add data skpd', '2018-07-19 02:52:09', '192.168.0.110', 1),
(109, 'add data skpd', '2018-07-19 02:52:26', '192.168.0.110', 1),
(110, 'add data user', '2018-07-19 02:52:48', '192.168.0.110', 1),
(111, 'add data user', '2018-07-19 02:53:09', '192.168.0.110', 1),
(112, 'add data usulan', '2018-07-19 02:58:56', '192.168.0.120', 12),
(113, 'add data usulan', '2018-07-19 02:59:52', '192.168.0.110', 12),
(114, 'add data usulan', '2018-07-19 03:00:00', '192.168.0.115', 12),
(115, 'add data usulan', '2018-07-19 03:01:59', '192.168.0.126', 18),
(116, 'update data periksa', '2018-07-19 03:02:45', '192.168.0.110', 13),
(117, 'add data usulan', '2018-07-19 03:05:44', '192.168.0.119', 15),
(118, 'add data usulan', '2018-07-19 03:06:00', '192.168.0.111', 15),
(119, 'update data periksa', '2018-07-19 03:07:49', '192.168.0.110', 13),
(120, 'add data usulan', '2018-07-19 03:08:38', '192.168.0.127', 18),
(121, 'add data usulan', '2018-07-19 03:09:33', '192.168.0.115', 12),
(122, 'add data usulan', '2018-07-19 03:09:38', '192.168.0.116', 16),
(123, 'add data usulan', '2018-07-19 03:10:22', '192.168.0.124', 17),
(124, 'update data usulan', '2018-07-19 03:11:23', '192.168.0.115', 12),
(125, 'update data periksa', '2018-07-19 03:12:04', '192.168.0.110', 13),
(126, 'add data usulan', '2018-07-19 03:12:16', '192.168.0.114', 19),
(127, 'update data periksa', '2018-07-19 03:13:00', '192.168.0.110', 13),
(128, 'update data usulan', '2018-07-19 03:13:31', '192.168.0.127', 18),
(129, 'update data periksa', '2018-07-19 03:14:07', '192.168.0.110', 13),
(130, 'add data usulan', '2018-07-19 03:15:34', '192.168.0.128', 14),
(131, 'update data usulan', '2018-07-19 03:27:42', '192.168.0.110', 16),
(132, 'update data periksa', '2018-07-19 03:29:57', '192.168.0.110', 13),
(133, 'add data userprofile', '2018-07-19 03:41:58', '192.168.0.119', 15),
(134, 'add data userprofile', '2018-07-19 03:44:20', '192.168.0.119', 15),
(135, 'add data menu', '2018-10-10 18:31:53', '::1', 1),
(136, 'add data menu', '2018-11-12 07:51:08', '::1', 1),
(137, 'update data menu', '2018-11-13 03:07:31', '::1', 1),
(138, 'update data menu', '2018-11-13 04:49:46', '::1', 1),
(139, 'update data menu', '2018-11-13 04:50:01', '::1', 1),
(140, 'update data menu', '2018-11-13 04:50:48', '::1', 1),
(141, 'add data menu', '2018-11-14 02:06:36', '::1', 1),
(142, 'update data menu', '2018-11-14 02:06:52', '::1', 1),
(143, 'add data menu', '2018-11-14 03:23:21', '::1', 1),
(144, 'update data menu', '2018-11-14 03:29:51', '::1', 1),
(145, 'update data menu', '2018-11-14 03:30:12', '::1', 1),
(146, 'update data menu', '2018-11-14 03:33:48', '::1', 1),
(147, 'add data menu', '2018-11-14 06:34:49', '::1', 1),
(148, 'add data menu', '2018-11-15 03:13:50', '::1', 1),
(149, 'update data menu', '2018-11-15 03:14:19', '::1', 1),
(150, 'update data menu', '2018-11-15 03:14:59', '::1', 1),
(151, 'add data crud', '2018-11-15 03:43:27', '::1', 1),
(152, 'add data crud', '2018-11-15 03:55:51', '::1', 1),
(153, 'update data crud', '2018-11-15 04:01:42', '::1', 1),
(154, 'update data crud', '2018-11-15 04:17:29', '::1', 1),
(155, 'update data crud', '2018-11-15 04:17:41', '::1', 1),
(156, 'update data crud', '2018-11-15 04:17:47', '::1', 1),
(157, 'add data crud', '2018-11-15 04:21:11', '::1', 1),
(158, 'add data crud', '2018-11-15 04:22:08', '::1', 1),
(159, 'add data crudfield', '2018-11-15 04:46:49', '::1', 1),
(160, 'add data crud', '2018-11-19 04:15:20', '::1', 1),
(161, 'add data crud', '2018-11-19 04:16:56', '::1', 1),
(162, 'add data crud', '2018-11-19 04:18:20', '::1', 1),
(163, 'add data crud', '2018-11-19 04:18:44', '::1', 1),
(164, 'add data crud', '2018-11-19 04:19:19', '::1', 1),
(165, 'add data crud', '2018-11-19 04:22:37', '::1', 1),
(166, 'add data crud', '2018-11-19 04:24:19', '::1', 1),
(167, 'update data crudfield', '2018-11-19 07:20:09', '::1', 1),
(168, 'add data crud', '2018-11-19 07:24:35', '::1', 1),
(169, 'add data crudfield', '2018-11-19 07:43:22', '::1', 1),
(170, 'add data crud', '2018-11-19 07:44:06', '::1', 1),
(171, 'add data crud', '2018-11-19 07:52:43', '::1', 1),
(172, 'update data crudfield', '2018-11-21 04:32:16', '::1', 1),
(173, 'update data crudfield', '2018-11-21 04:34:46', '::1', 1),
(174, 'update data crudfield', '2018-11-21 04:53:47', '::1', 1),
(175, 'update data crudfield', '2018-11-21 04:54:47', '::1', 1),
(176, 'update data crudfield', '2018-11-21 04:56:02', '::1', 1),
(177, 'add data crud', '2018-11-21 04:56:45', '::1', 1),
(178, 'update data crud', '2018-11-21 04:56:54', '::1', 1),
(179, 'update data crud', '2018-11-21 04:57:10', '::1', 1),
(180, 'update data crud', '2018-11-21 04:57:16', '::1', 1),
(181, 'add data crud', '2018-11-21 04:57:46', '::1', 1),
(182, 'update data crud', '2018-11-21 04:58:57', '::1', 1),
(183, 'update data crud', '2018-11-21 04:59:34', '::1', 1),
(184, 'add data crud', '2018-11-21 05:03:36', '::1', 1),
(185, 'update data crud', '2018-11-21 05:05:01', '::1', 1),
(186, 'update data crud', '2018-11-21 05:05:54', '::1', 1),
(187, 'update data crud', '2018-11-21 05:06:08', '::1', 1),
(188, 'add data menu', '2018-11-21 05:26:46', '::1', 1),
(189, 'update data menu', '2018-11-21 05:33:10', '::1', 1),
(190, 'add data menu', '2018-11-22 02:33:28', '::1', 1),
(191, 'add data menu', '2018-11-22 07:35:10', '::1', 1),
(192, 'update data menu', '2018-11-22 07:35:19', '::1', 1),
(193, 'add data menu', '2018-11-22 08:36:53', '::1', 1),
(194, 'update data menu', '2018-11-22 09:12:26', '::1', 1),
(195, 'add data menu', '2018-11-22 09:19:49', '::1', 1),
(196, 'add data menu', '2018-11-22 09:20:16', '::1', 1),
(197, 'add data crud', '2018-11-23 05:52:03', '::1', 1),
(198, 'add data crud', '2018-11-26 03:26:05', '::1', 1),
(199, 'add data crudfield', '2018-11-26 03:27:06', '::1', 1),
(200, 'add data crudfield', '2018-11-26 03:39:18', '::1', 1),
(201, 'add data crudfield', '2018-11-26 03:45:28', '::1', 1),
(202, 'update data crud', '2018-11-26 03:54:50', '::1', 1),
(203, 'add data crudfield', '2018-11-26 05:22:27', '::1', 1),
(204, 'update data crudfield', '2018-11-26 05:22:38', '::1', 1),
(205, 'add data menu', '2018-11-26 05:36:14', '::1', 1),
(206, 'update data menu', '2018-11-26 06:32:59', '::1', 1),
(207, 'update data menu', '2018-11-26 06:33:21', '::1', 1),
(208, 'update data menu', '2018-11-26 06:33:35', '::1', 1),
(209, 'update data menu', '2018-11-26 06:39:07', '::1', 1),
(210, 'update data crud', '2018-11-27 04:42:15', '::1', 1),
(211, 'update data crud', '2018-11-27 04:42:23', '::1', 1),
(212, 'update data crud', '2018-11-27 04:43:19', '::1', 1),
(213, 'update data crud', '2018-11-27 04:56:24', '::1', 1),
(214, 'update data crud', '2018-11-27 05:12:10', '::1', 1),
(215, 'update data crud', '2018-11-27 05:12:57', '::1', 1),
(216, 'update data crud', '2018-11-27 05:48:49', '::1', 1),
(217, 'update data crud', '2018-11-27 05:49:06', '::1', 1),
(218, 'add data menu', '2018-11-27 06:20:58', '::1', 1),
(219, 'update data menu', '2018-11-27 06:21:05', '::1', 1),
(220, 'update data menu', '2018-11-27 06:24:11', '::1', 1),
(221, 'update data menu', '2018-11-27 06:29:58', '::1', 1),
(222, 'update data menu', '2018-11-27 06:31:33', '::1', 1),
(223, 'add data menu', '2018-11-27 08:21:54', '::1', 1),
(224, 'update data menu', '2018-11-27 08:23:27', '::1', 1),
(225, 'add data menu', '2018-11-27 08:25:47', '::1', 1),
(226, 'add data crudfield', '2018-11-27 08:26:45', '::1', 1),
(227, 'update data crudfield', '2018-11-27 08:26:51', '::1', 1),
(228, 'update data crudfield', '2018-11-27 08:30:20', '::1', 1),
(229, 'add data user', '2018-11-30 03:52:01', '::1', 1),
(230, 'update data user', '2018-11-30 03:54:39', '::1', 1),
(231, 'add data crud', '2018-11-30 04:20:05', '::1', 1),
(232, 'add data group', '2018-11-30 04:32:43', '::1', 1),
(233, 'update data group', '2018-11-30 04:33:32', '::1', 1),
(234, 'update data group', '2018-11-30 04:33:45', '::1', 1),
(235, 'update data group', '2018-11-30 08:03:05', '::1', 1),
(236, 'add data group', '2018-11-30 08:04:23', '::1', 1),
(237, 'add data crud', '2018-11-30 08:11:23', '::1', 1),
(238, 'add data group', '2018-11-30 10:10:06', '::1', 1),
(239, 'add data menu', '2018-11-30 10:10:19', '::1', 1),
(240, 'update data user', '2018-12-01 00:39:57', '::1', 1),
(241, 'add data user', '2018-12-01 00:46:52', '::1', 1),
(242, 'update data user', '2018-12-01 00:57:38', '::1', 1),
(243, 'update data user', '2018-12-01 00:57:51', '::1', 1),
(244, 'add data user', '2018-12-01 01:05:47', '::1', 1),
(245, 'add data group', '2018-12-01 06:14:49', '::1', 1),
(246, 'add data menu', '2018-12-01 06:15:05', '::1', 1),
(247, 'add data crud', '2018-12-02 07:23:33', '::1', 1),
(248, 'add data userprofile', '2018-12-03 06:34:28', '::1', 1),
(249, 'add data menu', '2018-12-03 06:44:05', '::1', 1),
(250, 'add data menu', '2018-12-03 06:44:31', '::1', 1),
(251, 'update data menu', '2018-12-04 04:23:45', '::1', 1),
(252, 'update password user', '2018-12-05 03:36:43', '::1', 1),
(253, 'add data user', '2019-01-02 12:43:06', '::1', 1),
(254, 'update data user', '2019-01-02 12:52:56', '::1', 1),
(255, 'update password user', '2019-01-02 13:19:35', '::1', 1),
(256, 'add data group', '2019-01-02 13:36:34', '::1', 1),
(257, 'update data group', '2019-01-02 13:45:16', '::1', 1),
(258, 'update data menu', '2019-01-03 03:36:43', '::1', 1),
(259, 'update data menu', '2019-01-03 03:37:02', '::1', 1),
(260, 'update data group', '2019-01-03 03:38:05', '::1', 1),
(261, 'update data menu', '2019-01-03 03:39:21', '::1', 1),
(262, 'add data menu', '2019-01-03 03:48:04', '::1', 1),
(263, 'update data menu', '2019-01-03 03:48:17', '::1', 1),
(264, 'update data menu', '2019-01-03 03:56:12', '::1', 1),
(265, 'update data menu', '2019-01-03 03:59:32', '::1', 1),
(266, 'update data menu', '2019-01-03 03:59:40', '::1', 1),
(267, 'add data crud', '2019-01-03 04:14:42', '::1', 1),
(268, 'add data menugroup', '2019-01-03 04:19:18', '::1', 1),
(269, 'update data menugroup', '2019-01-03 04:19:36', '::1', 1),
(270, 'add data menugroup', '2019-01-03 04:19:51', '::1', 1),
(271, 'add data crud', '2019-01-03 04:59:03', '::1', 1),
(272, 'add data group', '2019-01-07 02:14:27', '::1', 1),
(273, 'add data group', '2019-01-07 02:15:01', '::1', 1),
(274, 'add data group', '2019-01-07 03:40:22', '::1', 1),
(275, 'update data group', '2019-01-07 04:18:20', '::1', 1),
(276, 'update data group', '2019-01-07 04:24:02', '::1', 1),
(277, 'update data group', '2019-01-07 04:25:40', '::1', 1),
(278, 'update data group', '2019-01-07 04:30:22', '::1', 1),
(279, 'update data group', '2019-01-07 04:32:30', '::1', 1),
(280, 'update data group', '2019-01-07 04:33:34', '::1', 1),
(281, 'add data group', '2019-01-07 04:48:54', '::1', 1),
(282, 'add data menu', '2019-01-07 05:06:43', '::1', 1),
(283, 'add data menu', '2019-01-07 05:09:46', '::1', 1),
(284, 'add data group', '2019-01-07 05:23:13', '::1', 1),
(285, 'add data group', '2019-01-07 05:23:21', '::1', 1),
(286, 'update data group', '2019-01-07 10:05:27', '::1', 1),
(287, 'update data group', '2019-01-07 10:06:53', '::1', 1),
(288, 'update data group', '2019-01-07 10:09:02', '::1', 1),
(289, 'update data group', '2019-01-07 10:09:15', '::1', 1),
(290, 'update data group', '2019-01-07 10:09:30', '::1', 1),
(291, 'update data group', '2019-01-07 10:09:30', '::1', 1),
(292, 'update data group', '2019-01-07 10:40:03', '::1', 1),
(293, 'update data group', '2019-01-07 10:40:43', '::1', 1),
(294, 'add data group', '2019-01-07 10:41:26', '::1', 1),
(295, 'update data group', '2019-01-07 11:03:44', '::1', 1),
(296, 'update data group', '2019-01-07 11:11:01', '::1', 1),
(297, 'update data group', '2019-01-07 11:19:13', '::1', 1),
(298, 'update data group', '2019-01-07 11:19:22', '::1', 1),
(299, 'update data group', '2019-01-07 11:19:22', '::1', 1),
(300, 'update data group', '2019-01-07 11:19:32', '::1', 1),
(301, 'update data group', '2019-01-07 11:20:06', '::1', 1),
(302, 'update data group', '2019-01-07 11:20:18', '::1', 1),
(303, 'update data group', '2019-01-07 11:23:08', '::1', 1),
(304, 'update data group', '2019-01-07 11:23:23', '::1', 1),
(305, 'update data group', '2019-01-07 11:23:35', '::1', 1),
(306, 'update data group', '2019-01-07 11:23:43', '::1', 1),
(307, 'add data group', '2019-01-07 11:39:30', '::1', 1),
(308, 'update data group', '2019-01-07 11:39:39', '::1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_login_attempts`
--

CREATE TABLE `table_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `table_menus`
--

CREATE TABLE `table_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `attribute` text NOT NULL,
  `position` tinyint(4) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_menus`
--

INSERT INTO `table_menus` (`id`, `name`, `link`, `icon`, `status`, `attribute`, `position`, `description`) VALUES
(18, 'Dashboard', 'admin', 'home', 1, 'fa fa-home', 1, 'Halaman Utama'),
(19, 'Setting', 'setting', 'settings', 1, 'fa fa-cog', 2, 'Menu pengaturan'),
(25, 'Bahasa', 'dictionary/language', 'flag', 1, '-', 1, '-'),
(26, 'Kata', 'dictionary/word', 'book', 1, '-', 1, '-'),
(27, 'Verifikasi', 'dictionary/approvement', 'assignment_turned_in', 1, '-', 4, 'Menu untuk mengapprove data yang baru dimasukkan'),
(28, 'Jenis Kata', 'dictionary/wordtype', 'chrome_reader_mode', 1, '-', 5, 'Menu jenis kata'),
(29, 'Dialek', 'dictionary/dialect', 'record_voice_over', 1, '-', 4, '-');

-- --------------------------------------------------------

--
-- Table structure for table `table_profile`
--

CREATE TABLE `table_profile` (
  `profile_id` int(11) NOT NULL,
  `profile_title` varchar(200) NOT NULL,
  `profile_content` text NOT NULL,
  `profile_postdate` date NOT NULL,
  `profile_postime` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_profile`
--

INSERT INTO `table_profile` (`profile_id`, `profile_title`, `profile_content`, `profile_postdate`, `profile_postime`, `user_id`) VALUES
(5, 'Visi & Misi', 'Konten Visi dan Misi', '2018-07-16', '0000-00-00 00:00:00', 1),
(6, 'Dasar Hukum', 'Isi Dasar Hukum 1', '2018-07-17', '0000-00-00 00:00:00', 1),
(7, 'Struktur Organisasi', 'Daftar Struktur Organisasi', '2018-07-17', '0000-00-00 00:00:00', 1),
(8, 'Tugas & Fungsi', 'Is Tugas dan Fungsi', '2018-07-17', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_submenus`
--

CREATE TABLE `table_submenus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `attribute` varchar(200) NOT NULL,
  `position` int(11) NOT NULL,
  `description` text NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_submenus`
--

INSERT INTO `table_submenus` (`id`, `name`, `link`, `status`, `icon`, `attribute`, `position`, `description`, `menu_id`) VALUES
(12, 'User', 'setting/user', 1, '#', '#', 1, 'Management User 1', 19),
(13, 'Grup User', 'setting/group', 1, '#', '#', 2, 'Manajemen Grup User', 19),
(14, 'Menu', 'setting/menu', 1, '#', '#', 3, 'Manajemen Menu', 19);

-- --------------------------------------------------------

--
-- Table structure for table `table_userprofiles`
--

CREATE TABLE `table_userprofiles` (
  `id` int(11) NOT NULL,
  `surename` varchar(200) NOT NULL,
  `birthplace` varchar(200) NOT NULL,
  `sex` enum('Pria','Wanita','','') NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_users`
--

CREATE TABLE `table_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` text NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_users`
--

INSERT INTO `table_users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `phone`, `image`, `group_id`) VALUES
(3, '::1', 'admin_test@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'admin_test@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1557662043, 1572848978, 1, 'admin', 'admin', '08233174456', '', 1),
(5, '', 'contributor@kabas.com', '21232f297a57a5a743894a0e4a801fc3', 'contributor@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1572849264, 1, 'Admin', 'Kontributor', NULL, '', 4),
(6, '', 'verificator@kabas.com', '21232f297a57a5a743894a0e4a801fc3', 'verificator@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'admin', 'admin', NULL, '', 5),
(10, '', 'tes@kabas.com', '6ad14ba9986e3615423dfca256d04e3f', 'tes@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'tes', 'kabas', NULL, '', 4),
(11, '', 'tifani@kabas.com', 'fd185573b961b03fb8925f58f367d50d', 'tifani@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Tifani', 'Hamlin', NULL, '', 4),
(12, '', 'muthia@kabas.com', 'ab250ab2e876197de1c2c98fd18873a9', 'muthia@kabas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Muthia', 'Mutmainnah', NULL, '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `table_users_groups`
--

CREATE TABLE `table_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_users_groups`
--

INSERT INTO `table_users_groups` (`id`, `user_id`, `group_id`) VALUES
(4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `table_words`
--

CREATE TABLE `table_words` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `dialect_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `translation` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `audio` text,
  `revision` text,
  `contributor_id` int(11) DEFAULT NULL,
  `verificator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_words`
--

INSERT INTO `table_words` (`id`, `parent_id`, `language_id`, `dialect_id`, `name`, `type`, `translation`, `description`, `example`, `status`, `audio`, `revision`, `contributor_id`, `verificator_id`) VALUES
(1, 0, 1, 2, 'aai', '5', 'adik', 'saudara kandung yg lebih muda (laki-laki atau perempuan)', '--nointe i sekola; anak itu pergi ke sekolah', 0, NULL, 'Hilangkan tanda &', NULL, NULL),
(2, 0, 1, 0, 'ahumelupo', '5', 'Merantau', '-', '-', 2, NULL, 'Kata kurang', NULL, NULL),
(3, 0, 1, 0, 'aalo a', '5', 'sehari', '-', '-', 0, NULL, NULL, NULL, NULL),
(4, 3, 1, 0, 'aalo-aalo', '5', 'tiap-tiap hari', '-', '-', 1, NULL, NULL, NULL, NULL),
(5, 4, 1, 0, 'adhari', '1', 'ajar', '-', '-', 0, NULL, NULL, NULL, NULL),
(6, 0, 1, 0, 'ala', '1', 'ambil', 'pegang lalu dibawa, diangkat', '-', 1, NULL, NULL, NULL, 3),
(7, 6, 1, 0, 'alaepo', '1', 'diambil; ambilkan', '-', '-', 1, NULL, NULL, NULL, 3),
(8, 6, 1, 0, 'alae', '1', 'mengambil', '-', 'ungkaungkaka no -- kundee ancu; anak itu mengambil kelapa', 1, NULL, NULL, NULL, 3),
(9, 0, 2, 0, 'Songgi', '5', 'Sagu panas', 'Makanan tradisional suku tolaki yang terbuat dari Sagu.', '-', 1, NULL, NULL, 3, 3),
(10, 0, 1, 2, 'Aidhe', '2', 'sedikit', '-', 'ndau -- maa; saya makan sedikit', 1, NULL, NULL, 11, 3),
(11, 10, 1, 0, 'aidhe-idhe', '2', 'sedikit-sedikit', '-', '-- uka; sedikit-sedikit juga', 1, NULL, NULL, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `table_wordtypes`
--

CREATE TABLE `table_wordtypes` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_wordtypes`
--

INSERT INTO `table_wordtypes` (`id`, `name`, `description`, `status`) VALUES
(1, 'Kata Kerja', '-', 1),
(2, 'Kata Sifat', '-', 1),
(3, 'Kata Keterangan', '-', 1),
(4, 'Kata Ganti', '-', 1),
(5, 'Kata Benda', '-', 1),
(6, 'Kata Sambung', '-', 1),
(7, 'Kata Bilangan', '-', 1),
(8, 'Kata Seru', '-', 1),
(9, 'Kata Depan', '-', 1),
(10, 'Kata Sandang', '-', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `table_dialects`
--
ALTER TABLE `table_dialects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_groups`
--
ALTER TABLE `table_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_group_access`
--
ALTER TABLE `table_group_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_languages`
--
ALTER TABLE `table_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_locations`
--
ALTER TABLE `table_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_log`
--
ALTER TABLE `table_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `table_login_attempts`
--
ALTER TABLE `table_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_menus`
--
ALTER TABLE `table_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_profile`
--
ALTER TABLE `table_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `table_submenus`
--
ALTER TABLE `table_submenus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_userprofiles`
--
ALTER TABLE `table_userprofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_users`
--
ALTER TABLE `table_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `table_users_groups`
--
ALTER TABLE `table_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `table_words`
--
ALTER TABLE `table_words`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_wordtypes`
--
ALTER TABLE `table_wordtypes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `table_dialects`
--
ALTER TABLE `table_dialects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_groups`
--
ALTER TABLE `table_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table_group_access`
--
ALTER TABLE `table_group_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `table_languages`
--
ALTER TABLE `table_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_locations`
--
ALTER TABLE `table_locations`
  MODIFY `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `table_log`
--
ALTER TABLE `table_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT for table `table_login_attempts`
--
ALTER TABLE `table_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_menus`
--
ALTER TABLE `table_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `table_profile`
--
ALTER TABLE `table_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `table_submenus`
--
ALTER TABLE `table_submenus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `table_userprofiles`
--
ALTER TABLE `table_userprofiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `table_users`
--
ALTER TABLE `table_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `table_users_groups`
--
ALTER TABLE `table_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_words`
--
ALTER TABLE `table_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `table_wordtypes`
--
ALTER TABLE `table_wordtypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_users_groups`
--
ALTER TABLE `table_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `table_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `table_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
