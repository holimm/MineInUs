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
-- Cơ sở dữ liệu: `mineinus`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card_value`
--

CREATE TABLE `card_value` (
  `id` int(1) NOT NULL,
  `name` varchar(20) NOT NULL,
  `percent` int(3) DEFAULT NULL,
  `desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `card_value`
--

INSERT INTO `card_value` (`id`, `name`, `percent`, `desc`) VALUES
(1, 'commission', 20, ''),
(2, 'percent_bonus', 50, ''),
(3, 'desc', 0, 'Bonus 50%');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `litebans_bans`
--

CREATE TABLE `litebans_bans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reason` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `banned_by_uuid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banned_by_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `removed_by_uuid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `removed_by_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `removed_by_reason` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `removed_by_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `time` bigint(20) NOT NULL,
  `until` bigint(20) NOT NULL,
  `server_scope` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_origin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `silent` bit(1) NOT NULL,
  `ipban` bit(1) NOT NULL,
  `ipban_wildcard` bit(1) NOT NULL,
  `active` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `litebans_bans`
--

INSERT INTO `litebans_bans` (`id`, `uuid`, `ip`, `reason`, `banned_by_uuid`, `banned_by_name`, `removed_by_uuid`, `removed_by_name`, `removed_by_reason`, `removed_by_date`, `time`, `until`, `server_scope`, `server_origin`, `silent`, `ipban`, `ipban_wildcard`, `active`) VALUES
(337, '40452319-be2e-3e4b-b616-27d120df2c88', '14.176.47.138', '§8§l[§c§lObserver§8§l] §cHack Improbable', 'CONSOLE', 'Console', 'CONSOLE', 'Console', 'No reason specified.', '2022-04-11 09:27:18', 1646371536331, 0, '*', 'smp', b'1', b'0', b'0', b'0'),
(339, 'f9143451-d781-33a6-ae2a-13f4aa4515f7', '14.244.219.189', '§8§l[§c§lObserver§8§l] §cHack Speed', 'CONSOLE', 'Console', NULL, NULL, NULL, '2022-03-02 14:15:12', 1646230512010, 0, '*', 'hub', b'1', b'0', b'0', b'1'),
(358, 'bdc36b98-e7aa-327d-85e8-3714a586b1c2', '171.247.156.112', 'Vi phạm luật!', 'd89d79a1-3030-386c-b9e0-ef9f6eff035c', 'kibeno', NULL, '#expired', NULL, '2022-03-04 11:57:36', 1646371536331, 1646371563331, '*', 'lobby', b'1', b'0', b'0', b'0'),
(361, '3c2edcd7-ddc2-3ef7-b92e-a99870d3d7c7', '58.186.111.254', 'clone viprosinhton', '09cd1229-7855-3bec-9629-c16f2603f61f', 'altf9', NULL, NULL, NULL, '2022-03-04 06:12:05', 1646374325032, 0, '*', 'smp', b'0', b'0', b'0', b'1'),
(365, 'fb0f13e3-88d3-3f81-9613-76858b31b2dc', '58.187.215.240', '§8§l[§c§lObserver§8§l] §cHack Speed', 'CONSOLE', 'Console', NULL, NULL, NULL, '2022-03-04 12:04:49', 1646395498755, 0, '*', 'smp', b'1', b'0', b'0', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playerpoints_migrations`
--

CREATE TABLE `playerpoints_migrations` (
  `migration_version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `playerpoints_migrations`
--

INSERT INTO `playerpoints_migrations` (`migration_version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `playerpoints_points`
--

CREATE TABLE `playerpoints_points` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `points` int(11) NOT NULL,
  `top_points` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `playerpoints_points`
--

INSERT INTO `playerpoints_points` (`id`, `uuid`, `points`, `top_points`) VALUES
(1, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 140, 0),
(2, '8184b985-7074-3105-873f-f9d28033a26b', 0, 0),
(13, 'f4613258-f50c-30d9-949d-4a7f617fcabf', 40, 0),
(14, '0892328d-5292-365e-9d8c-c7c8c10cfddc', 0, 0),
(15, 'b5a3a15e-6c0c-3da8-b4b7-d06069e3b6ae', 0, 0),
(16, 'bd971ec5-1047-38ab-8ca2-e19694762102', 0, 0),
(17, '40452319-be2e-3e4b-b616-27d120df2c88', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socialmedia`
--

CREATE TABLE `socialmedia` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `socialmedia`
--

INSERT INTO `socialmedia` (`id`, `name`, `link`) VALUES
(1, 'Facebook', 'https://www.facebook.com/mineinusmc/'),
(2, 'Discord', 'https://discord.com/invite/S8cgNxwcSV?fbclid=IwAR0F0XssRt21F1OYBdShWhcFKLEy1I7oInTDfVy8Cfrp6JsgQiBNj');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trans_log`
--

CREATE TABLE `trans_log` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `amount` bigint(20) NOT NULL,
  `seri` text NOT NULL,
  `pin` text NOT NULL,
  `type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `trans_id` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `trans_log`
--

INSERT INTO `trans_log` (`id`, `name`, `amount`, `seri`, `pin`, `type`, `status`, `trans_id`, `date`) VALUES
(1, 'test', 20000, '8654235125432', '436346252225', 'Viettel', 2, '3316', '2019-05-17 10:11:03'),
(15, 'Shiru', 10000, '20000098600457', '620571120641993', 'Viettel', 0, '70dd3eb6016d333a4b0a665336fedf97', '2021-07-31 12:08:26'),
(16, 'Shiru', 10000, '20000098547554', '223068286878590', 'Viettel', 0, '2245fbced846415a0a30c9f04e2129e2', '2021-08-02 11:41:42'),
(17, 'Shiru', 10000, '20000142714858', '322601663791173', 'Viettel', 0, '30b35477f6598788577cc7722c63f970', '2021-08-05 12:18:55'),
(18, 'Shiru', 10000, '20000142732470', '425024406816256', 'Viettel', 0, '9de533d561e2394d44210e0572f1c99f', '2021-08-05 13:21:29'),
(19, 'Shiru', 10000, '20000097248213', '824774383515170', 'Viettel', 0, '19a6b65df65b45c9271288412a110b43', '2021-08-06 08:34:01'),
(20, 'Shiru', 10000, '20000098526584', '128572651275158', 'Vietnamobile', 0, 'f665c6b156dc309a9552a9bbbb709f02', '2021-08-06 08:50:41'),
(21, 'Shiru', 50000, '20000152714748', '821827598558095', 'Viettel', 0, '755d1f404f758f6b188ccf351c7b1f80', '2021-08-06 09:28:24'),
(22, 'Shiru', 10000, '20000142933493', '627315322327876', 'Viettel', 0, 'ed0f1a533edeac564ed421a5ef520b9d', '2021-08-06 09:52:28'),
(23, 'Shiru', 10000, '20000142932845', '625028381688570', 'Viettel', 0, 'f52685396ea23041b6ae1f63f4ae96e3', '2021-08-06 09:57:25'),
(24, 'Shiru', 10000, '20000142625590', '226675406317416', 'Viettel', 0, '17bb213a6ffc3bed6ddd6af47f9d958a', '2021-08-06 11:30:48'),
(25, 'Shiru', 10000, '20000172231991', '927898009258150', 'Viettel', 0, '5224cfbc943b0dee01869e22b1656e0d', '2022-03-15 05:41:10'),
(26, 'Shiru', 10000, '10008853105012 ', '115867677099037', 'Viettel', 0, '810cd9e63da306b6b0fb21ad153a0180', '2022-03-15 05:43:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trans_log_other`
--

CREATE TABLE `trans_log_other` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `amount` bigint(20) NOT NULL,
  `type` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `dateput` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `trans_log_other`
--

INSERT INTO `trans_log_other` (`id`, `name`, `amount`, `type`, `status`, `dateput`) VALUES
(69, 'Shiru', 100000, 'Momo', 0, '2022-04-01 10:36:17'),
(70, 'Shiru', 100000, 'ATM', 0, '2022-04-01 10:36:42'),
(71, 'Shiru', 100000, 'Momo', 0, '2022-04-01 10:37:05'),
(72, 'Shiru', 10000, 'Momo', 0, '2022-04-09 16:24:35'),
(73, 'Shiru', 10000, 'Momo', 1, '2022-04-09 16:25:39'),
(74, 'Shiru', 10000, 'Momo', 1, '2022-04-09 16:26:54'),
(75, 'Shiru', 10000, 'Momo', 1, '2022-04-09 16:27:51'),
(76, 'Shiru', 10000, 'ATM', 1, '2022-04-09 18:53:55'),
(77, 'Shiru', 10000, 'ATM', 1, '2022-04-09 18:54:09'),
(78, 'Shiru', 10000, 'ATM', 1, '2022-04-09 18:55:08'),
(79, 'Shiru', 10000, 'Momo', 0, '2022-04-09 18:56:35'),
(80, 'Shiru', 10000, 'ATM', 0, '2022-04-09 18:56:44'),
(81, 'Shiru', 10000, 'ATM', 0, '2022-04-09 18:57:58'),
(82, 'Shiru', 10000, 'Momo', 0, '2022-07-03 07:44:07');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `card_value`
--
ALTER TABLE `card_value`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `litebans_bans`
--
ALTER TABLE `litebans_bans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `idx_litebans_bans_uuid` (`uuid`),
  ADD KEY `idx_litebans_bans_ip` (`ip`),
  ADD KEY `idx_litebans_bans_banned_by_uuid` (`banned_by_uuid`),
  ADD KEY `idx_litebans_bans_time` (`time`),
  ADD KEY `idx_litebans_bans_until` (`until`),
  ADD KEY `idx_litebans_bans_ipban` (`ipban`),
  ADD KEY `idx_litebans_bans_ipban_wildcard` (`ipban_wildcard`),
  ADD KEY `idx_litebans_bans_active` (`active`);

--
-- Chỉ mục cho bảng `playerpoints_points`
--
ALTER TABLE `playerpoints_points`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Chỉ mục cho bảng `socialmedia`
--
ALTER TABLE `socialmedia`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `trans_log`
--
ALTER TABLE `trans_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `trans_log_other`
--
ALTER TABLE `trans_log_other`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `litebans_bans`
--
ALTER TABLE `litebans_bans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT cho bảng `playerpoints_points`
--
ALTER TABLE `playerpoints_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `trans_log`
--
ALTER TABLE `trans_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `trans_log_other`
--
ALTER TABLE `trans_log_other`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
