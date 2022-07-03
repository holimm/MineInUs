-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 03, 2022 lúc 09:55 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `authme`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounttemp`
--

CREATE TABLE `accounttemp` (
  `NICKNAME` varchar(255) NOT NULL,
  `LOWERCASENICKNAME` varchar(255) NOT NULL,
  `HASH` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `IP` varchar(40) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `REGDATE` bigint(20) NOT NULL DEFAULT 0,
  `EMAIL` varchar(255) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `exp_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `mycode` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth`
--

INSERT INTO `auth` (`id`, `username`, `mycode`) VALUES
(1, 'SayWut', '$SHA$55694951ce05f8db$a5e4c1324867ceb1e5f99a3b1a571c36aea43928e315a997d6375bd5bcea5936'),
(3, 'Shiru', '$SHA$b7c98502712557bd$ea850f3ec52516455a5288badbd933b2c031adb69bece1fba44a936bb3ce3750');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authme`
--

CREATE TABLE `authme` (
  `NICKNAME` varchar(255) NOT NULL,
  `LOWERCASENICKNAME` varchar(255) NOT NULL,
  `HASH` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `IP` varchar(40) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `TOTPTOKEN` varchar(32) DEFAULT NULL,
  `REGDATE` bigint(20) NOT NULL DEFAULT 0,
  `UUID` varchar(255) NOT NULL,
  `PREMIUMUUID` varchar(255) NOT NULL,
  `LASTLOGIN` bigint(20) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `exp_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `authme`
--

INSERT INTO `authme` (`NICKNAME`, `LOWERCASENICKNAME`, `HASH`, `IP`, `TOTPTOKEN`, `REGDATE`, `UUID`, `PREMIUMUUID`, `LASTLOGIN`, `EMAIL`, `token`, `exp_date`) VALUES
('Kimmy', 'kimmy', '$SHA$0d3530a911c7e144$80ad75beff4afa312d776248ee96a898bb3c3262ff880a30f28cc78970426f9a', '::1', NULL, 1648201247000, '', '', NULL, 'kahn12345@gmail.com', '173c156882b8a11516448aba002006f1297', '2022-03-25 17:06:10'),
('KimmyNguyen', 'kimmynguyen', '$2a$14$MTk5NDc5MzQ3MjYyNTNmNOk04OKTfbfmb11vf0m6iD3kxdMF17T6.', '::1', NULL, 1649649947000, '', '', NULL, 'kahn1234567841243@gmail.com', '', ''),
('rSenn', 'rsenn', '$SHA$b7c98502712557bd$5f413be8a3fa4cfaa3f552663cca79e35fba55a889f5fd860d122576690e14bd', '127.0.0.1', NULL, 1625296735311, '', '', 1627460554117, NULL, '', ''),
('SayWut', 'saywut', '$SHA$55694951ce05f8db$d0dacb00798f2064ed96e189920e308cf90074ec482062bd2f0a5ac801f509c1', '127.0.0.1', '', 1625294578263, '', '', 1627466929416, 'saywut@gmail.com', '', ''),
('Shiru', 'shiru', '$SHA$b7c98502712557bd$5f413be8a3fa4cfaa3f552663cca79e35fba55a889f5fd860d122576690e14bd', '103.199.32.15', '', 1627201061908, '', '', 1627222134284, 'kahn12345678@gmail.com', '173c156882b8a11516448aba002006f18750', '2022-07-03 14:46:23'),
('Shiruu', 'shiruu', '$2a$12$PqSEOH.WcHojOhmjn3XG5u0GM1GnXQ6MCuXTSgyLbImGbEeSxoNKy', '::1', NULL, 1647164209000, '', '', NULL, 'kahn123@gmail.com', '173c156882b8a11516448aba002006f16891', '2022-03-13 16:46:36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounttemp`
--
ALTER TABLE `accounttemp`
  ADD PRIMARY KEY (`LOWERCASENICKNAME`);

--
-- Chỉ mục cho bảng `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `authme`
--
ALTER TABLE `authme`
  ADD PRIMARY KEY (`LOWERCASENICKNAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
