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
-- Cơ sở dữ liệu: `luckperms`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_actions`
--

CREATE TABLE `luckperms_actions` (
  `id` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `actor_uuid` varchar(36) NOT NULL,
  `actor_name` varchar(100) NOT NULL,
  `type` char(1) NOT NULL,
  `acted_uuid` varchar(36) NOT NULL,
  `acted_name` varchar(36) NOT NULL,
  `action` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `luckperms_actions`
--

INSERT INTO `luckperms_actions` (`id`, `time`, `actor_uuid`, `actor_name`, `type`, `acted_uuid`, `acted_name`, `action`) VALUES
(1, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor add prefix.100.&#FFA500&lOwner true'),
(2, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor remove worldguard.region.bypass.dungeon.__global__.give-effects false'),
(3, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor add worldguard.region.bypass.dungeon.__global__.give-effects false server=skyblock'),
(4, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor remove prefix.100.#FFA500&lOwner true'),
(5, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'builder', 'webeditor add worldguard.region.bypass.dungeon.__global__.give-effects false server=skyblock'),
(6, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'builder', 'webeditor remove worldguard.region.bypass.dungeon.__global__.give-effects false'),
(7, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add auctionhouse.cmd true server=skyblock'),
(8, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add cmi.customalias.market true server=skyblock'),
(9, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add prefix.1.{#e6ccb7}Member true server=skyblock'),
(10, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove angelchest.use true'),
(11, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove auctionhouse.cmd true'),
(12, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove cmi.customalias.market true'),
(13, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove jumppads.use true'),
(14, 1627742684, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove prefix.1.{#e6ccb7}Member true'),
(15, 1627742828, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', '8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'permission set litebans.ban true server=server:hub'),
(16, 1627742836, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', '8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'permission set litebans.ban true server=hub'),
(17, 1627742858, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', '8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'permission set litebans.ban true server=hub server=skyblock'),
(18, 1627742882, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', '8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'permission unset litebans.ban server=hub'),
(19, 1627742892, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', '8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'permission unset litebans.ban server=hub server=skyblock'),
(20, 1627742959, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'f4613258-f50c-30d9-949d-4a7f617fcabf', 'shiru', 'parent set builder'),
(21, 1627743112, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'permission set cmi.command.ctext false'),
(22, 1627743365, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor add prefix.100.{#FFA500}&lOwner true'),
(23, 1627743365, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor remove prefix.100.&#FFA500&lOwner true'),
(24, 1627743365, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'mod', 'webeditor add prefix.90.{#a082d3}&lMod true'),
(25, 1627743365, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'mod', 'webeditor remove prefix.90.#a082d3&lMod true'),
(26, 1627743580, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor add cmi.chatgroup.1 true'),
(27, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor add prefix.100.{#FFA500}&lOwner  true'),
(28, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor remove prefix.100.{#FFA500}&lOwner true'),
(29, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'builder', 'webeditor add prefix.91.&3&lBuilder  true'),
(30, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'builder', 'webeditor remove prefix.91.&3&lBuilder true'),
(31, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'mod', 'webeditor add prefix.90.{#a082d3}&lMod  true'),
(32, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'mod', 'webeditor remove prefix.90.{#a082d3}&lMod true'),
(33, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add prefix.1.{#e6ccb7}Member  true server=skyblock'),
(34, 1627743665, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove prefix.1.{#e6ccb7}Member true server=skyblock'),
(35, 1627743910, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add prefix.1.{#f5f5dc}Member  true'),
(36, 1627743910, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove prefix.1.{#e6ccb7}Member  true server=skyblock'),
(37, 1627744142, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', '8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'webeditor remove litebans.ban true server=server:hub'),
(38, 1627745272, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'owner', 'webeditor add worldguard.region.bypass.world.pvp-arena.give-effects true server=skyblock'),
(39, 1627745299, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'owner', 'webeditor add worldguard.region.bypass.world.pvp-arena.give-effects false server=skyblock'),
(40, 1627745299, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'owner', 'webeditor remove worldguard.region.bypass.world.pvp-arena.give-effects true server=skyblock'),
(41, 1627802363, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add cmi.openshulker.shift true server=skyblock'),
(42, 1627802363, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add cmi.openshulker true server=skyblock'),
(43, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add group.default true'),
(44, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.expel true server=skyblock'),
(45, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.level.* true server=skyblock'),
(46, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.reset true server=skyblock'),
(47, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.top true server=skyblock'),
(48, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.settings true server=skyblock'),
(49, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.team true server=skyblock'),
(50, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island true server=skyblock'),
(51, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.home true server=skyblock'),
(52, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.team.* true server=skyblock'),
(53, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.ban true server=skyblock'),
(54, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.settings.* true server=skyblock'),
(55, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.level true server=skyblock'),
(56, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.create true server=skyblock'),
(57, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.lock true server=skyblock'),
(58, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.name true server=skyblock'),
(59, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.sethome true server=skyblock'),
(60, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.info true server=skyblock'),
(61, 1627809119, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.spawn true server=skyblock'),
(62, 1627809388, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add group.skyblock-member true'),
(63, 1627809388, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove group.default true'),
(64, 1627809438, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.settings.* false server=skyblock'),
(65, 1627809438, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.settings.* true server=skyblock'),
(66, 1627809818, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.* false server=skyblock'),
(67, 1627809925, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.name false server=skyblock'),
(68, 1627809925, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.name true server=skyblock'),
(69, 1627809976, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.* false server=skyblock'),
(70, 1627810033, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.* false server=skyblock'),
(71, 1627810033, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.name true server=skyblock'),
(72, 1627810033, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.name false server=skyblock'),
(73, 1627815223, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.island.renamehome true server=skyblock'),
(74, 1627815634, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.bank.user true server=skyblock'),
(75, 1627815634, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.bank.user.* true server=skyblock'),
(76, 1627816726, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.controlpanel.panel.default true server=skyblock'),
(77, 1627816773, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.controlpanel true server=skyblock'),
(78, 1627817323, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.settings.ARMOR_STAND true server=skyblock'),
(79, 1627817383, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.settings.ARMOR_STAND true server=skyblock'),
(80, 1627817550, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add craftbskyblock.visit.configure true server=skyblock'),
(81, 1627817550, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.visit.setlocation true server=skyblock'),
(82, 1627817550, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add bskyblock.visit true server=skyblock'),
(83, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.bank.user.* true server=skyblock'),
(84, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.level.* true server=skyblock'),
(85, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.team.* true server=skyblock'),
(86, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.settings.* false server=skyblock'),
(87, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.* false server=skyblock'),
(88, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.controlpanel true server=skyblock'),
(89, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.bank.user true server=skyblock'),
(90, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.name true server=skyblock'),
(91, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.controlpanel.panel.default true server=skyblock'),
(92, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island true server=skyblock'),
(93, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.sethome true server=skyblock'),
(94, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.create true server=skyblock'),
(95, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.settings true server=skyblock'),
(96, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.info true server=skyblock'),
(97, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.home true server=skyblock'),
(98, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.expel true server=skyblock'),
(99, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.ban true server=skyblock'),
(100, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.visit.setlocation true server=skyblock'),
(101, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.lock true server=skyblock'),
(102, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.level true server=skyblock'),
(103, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.renamehome true server=skyblock'),
(104, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.reset true server=skyblock'),
(105, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.team true server=skyblock'),
(106, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.spawn true server=skyblock'),
(107, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.island.top true server=skyblock'),
(108, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove craftbskyblock.visit.configure true server=skyblock'),
(109, 1627821795, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove bskyblock.visit true server=skyblock'),
(110, 1628260285, '00000000-0000-0000-0000-000000000000', 'Console@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set default'),
(111, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.bypassdisabled false server=bungee'),
(112, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.clear true server=bungee'),
(113, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.set.url false server=bungee'),
(114, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.set.other false server=bungee'),
(115, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.gui false server=bungee'),
(116, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.clear.other false server=bungee'),
(117, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.update true server=bungee'),
(118, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.bypasscooldown false server=bungee'),
(119, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.update.other false server=bungee'),
(120, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command true server=bungee'),
(121, 1628260608, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor add skinsrestorer.command.set true server=bungee'),
(122, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.bypasscooldown false server=bungee'),
(123, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.bypassdisabled false server=bungee'),
(124, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command true server=bungee'),
(125, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.clear true server=bungee'),
(126, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.clear.other false server=bungee'),
(127, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.set true server=bungee'),
(128, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.set.other false server=bungee'),
(129, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.gui false server=bungee'),
(130, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.set.url false server=bungee'),
(131, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.update true server=bungee'),
(132, 1628260664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove skinsrestorer.command.update.other false server=bungee'),
(133, 1628261478, '00000000-0000-0000-0000-000000000000', 'Console@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set owner'),
(134, 1628348195, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add BeastTokens.TokenDrops.Type.Mobs.* true server=skyblock'),
(135, 1628348289, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add boosters.member true server=skyblock'),
(136, 1628396708, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.stacker.* true server=skyblock'),
(137, 1628515690, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-member'),
(138, 1628517010, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-member'),
(139, 1628521044, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'owner', 'webeditor remove cmi.chatgroup.1 true'),
(140, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor add prefix.5.{#008e5b}Venturer  true'),
(141, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor add weight.5 true'),
(142, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor add displayname.skyblock-rank1 true'),
(143, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor add group.skyblock-member true'),
(144, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add weight.10 true'),
(145, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add group.skyblock-rank1 true'),
(146, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add prefix.10.{#0091b7}Fabled  true'),
(147, 1628569821, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add displayname.skyblock-rank2 true'),
(148, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor add prefix.5.{#008e5b}Venturer  true server=skyblock'),
(149, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor add group.skyblock-member true server=skyblock'),
(150, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor remove group.skyblock-member true'),
(151, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor remove prefix.5.{#008e5b}Venturer  true'),
(152, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add displayname.skyblock-rank2 true server=skyblock'),
(153, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add prefix.10.{#0091b7}Fabled  true server=skyblock'),
(154, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor remove displayname.skyblock-rank2 true'),
(155, 1628569886, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor remove prefix.10.{#0091b7}Fabled  true'),
(156, 1628570203, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add displayname.skyblock-rank3 true'),
(157, 1628570203, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor add group.skyblock-rank1 true server=skyblock'),
(158, 1628570203, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor remove displayname.skyblock-rank2 true server=skyblock'),
(159, 1628570203, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank2', 'webeditor remove group.skyblock-rank1 true'),
(160, 1628570204, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank3', 'webeditor add displayname.skyblock-rank3 true server=skyblock'),
(161, 1628570204, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank3', 'webeditor add weight.15 true'),
(162, 1628570204, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank3', 'webeditor add prefix.15.{#53277E}Mythic  true server=skyblock'),
(163, 1628570204, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank3', 'webeditor add group.skyblock-rank2 true'),
(164, 1628570331, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank4', 'webeditor add weight.20 true'),
(165, 1628570331, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank4', 'webeditor add prefix.20.{#FF0000}Heroic  true server=skyblock'),
(166, 1628570331, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank4', 'webeditor add group.skyblock-rank3 true server=skyblock'),
(167, 1628570331, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank4', 'webeditor add displayname.skyblock-rank4 true'),
(168, 1628570408, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank5', 'webeditor add weight.25 true'),
(169, 1628570408, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank5', 'webeditor add prefix.25.{#FF6C33}Legendary  true server=skyblock'),
(170, 1628570408, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank5', 'webeditor add group.skyblock-rank4 true server=skyblock'),
(171, 1628570408, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank5', 'webeditor add displayname.skyblock-rank5 true'),
(172, 1628570468, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set default'),
(173, 1628570488, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-rank1'),
(174, 1628570528, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor add displayname.skyblock-rank2 true'),
(175, 1628570528, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor remove displayname.skyblock-rank3 true'),
(176, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor add prefix.25.{#FF6C33}&lLegendary  true server=skyblock'),
(177, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor remove prefix.25.{#FF6C33}Legendary  true server=skyblock'),
(178, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor add prefix.20.{#FF0000}&lHeroic  true server=skyblock'),
(179, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor remove prefix.20.{#FF0000}Heroic  true server=skyblock'),
(180, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor add prefix.15.{#53277E}&lMythic  true server=skyblock'),
(181, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor remove prefix.15.{#53277E}Mythic  true server=skyblock'),
(182, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor add prefix.10.{#0091b7}&lFabled  true server=skyblock'),
(183, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor remove prefix.10.{#0091b7}Fabled  true server=skyblock'),
(184, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add prefix.5.{#008e5b}&lVenturer  true server=skyblock'),
(185, 1628570566, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor remove prefix.5.{#008e5b}Venturer  true server=skyblock'),
(186, 1628571925, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-rank2'),
(187, 1628571935, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-rank3'),
(188, 1628571957, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-rank4'),
(189, 1628571966, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-rank5'),
(190, 1628572166, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor add prefix.25.{#FFD700}&lLegendary  true server=skyblock'),
(191, 1628572166, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor remove prefix.25.{#FF6C33}&lLegendary  true server=skyblock'),
(192, 1628572166, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor add prefix.20.&c&lHeroic  true server=skyblock'),
(193, 1628572166, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor remove prefix.20.{#FF0000}&lHeroic  true server=skyblock'),
(194, 1628572189, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-rank5'),
(195, 1628572352, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor add prefix.15.{#9b4de8}&lMythic  true server=skyblock'),
(196, 1628572352, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor remove prefix.15.{#53277E}&lMythic  true server=skyblock'),
(197, 1628572381, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-rank4'),
(198, 1628572822, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-rank3'),
(199, 1628572823, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-rank2'),
(200, 1628572823, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-rank1'),
(201, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add group.default true'),
(202, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add skyblock-member'),
(203, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add skyblock-rank1'),
(204, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add skyblock-rank2'),
(205, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add skyblock-rank5'),
(206, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add skyblock-rank3'),
(207, 1628572875, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add skyblock-rank4'),
(208, 1628572883, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(209, 1628574220, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(210, 1628574308, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'demote skyblock-ranks'),
(211, 1628574635, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add skyblock-rank1'),
(212, 1628574683, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove skyblock-rank1'),
(213, 1628574870, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'webeditor remove group.skyblock-member true'),
(214, 1628574989, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor add default'),
(215, 1628574989, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'T', 'null', 'skyblock-ranks', 'webeditor remove skyblock-member'),
(216, 1628575005, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(217, 1628575653, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set skyblock-rank2'),
(218, 1628575664, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set skyblock-rank1'),
(219, 1628576949, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set owner'),
(220, 1628583185, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set skyblock-rank1'),
(221, 1628583588, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(222, 1628583648, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(223, 1628583656, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(224, 1628583869, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(225, 1628589740, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'demote skyblock-ranks'),
(226, 1628589743, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'demote skyblock-ranks'),
(227, 1628589746, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'demote skyblock-ranks'),
(228, 1628589747, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'demote skyblock-ranks'),
(229, 1628589762, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(230, 1628601509, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor add group.skyblock-rank2 true server=skyblock'),
(231, 1628601509, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor remove group.skyblock-rank2 true'),
(232, 1628601820, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor remove group.skyblock-member true server=skyblock'),
(233, 1628601978, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set default'),
(234, 1628602016, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(235, 1628602054, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(236, 1628602087, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'T', 'null', 'skyblock-ranks', 'webeditor remove default'),
(237, 1628602093, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set default'),
(238, 1628602105, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(239, 1628602148, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-rank1', 'webeditor remove group.default true'),
(240, 1628602231, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank2'),
(241, 1628602240, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(242, 1628602257, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'promote skyblock-ranks'),
(243, 1628654569, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set owner'),
(244, 1628656713, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(245, 1628657625, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove owner'),
(246, 1628670712, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor add vouchers.rank5 false server=skyblock'),
(247, 1628670712, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor add vouchers.rank4 false server=skyblock'),
(248, 1628670712, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor add vouchers.rank3 false server=skyblock'),
(249, 1628670712, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor add vouchers.rank2 false server=skyblock'),
(250, 1628670712, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add vouchers.rank1 false server=skyblock'),
(251, 1628670713, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add vouchers.rank5 true server=skyblock'),
(252, 1628670713, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add vouchers.rank1 true server=skyblock'),
(253, 1628670713, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add vouchers.rank2 true server=skyblock'),
(254, 1628670713, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add vouchers.rank4 true server=skyblock'),
(255, 1628670713, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add vouchers.rank3 true server=skyblock'),
(256, 1628670882, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'demote skyblock-ranks'),
(257, 1628670896, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set default'),
(258, 1628670986, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(259, 1628671032, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove default'),
(260, 1628671036, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add owner'),
(261, 1628671969, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank5'),
(262, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove auctionhouse.cmd true server=skyblock'),
(263, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove cmi.customalias.market true server=skyblock'),
(264, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove cmi.openshulker true server=skyblock'),
(265, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'default', 'webeditor remove cmi.openshulker.shift true server=skyblock'),
(266, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-member', 'webeditor add cmi.openshulker.shift true server=skyblock'),
(267, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-member', 'webeditor add auctionhouse.cmd true server=skyblock'),
(268, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-member', 'webeditor add cmi.customalias.market true server=skyblock'),
(269, 1628743424, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-member', 'webeditor add cmi.openshulker true server=skyblock'),
(270, 1628751069, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(271, 1628751084, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove owner'),
(272, 1628751087, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add default'),
(273, 1628751110, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(274, 1628751242, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(275, 1628751326, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(276, 1628751340, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add vouchers.rank1 true server=skyblock'),
(277, 1628751340, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor remove vouchers.rank1 false server=skyblock'),
(278, 1628751342, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(279, 1628751355, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(280, 1628751582, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(281, 1628751740, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add vouchers.rank1 false server=skyblock'),
(282, 1628751740, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor remove vouchers.rank1 true server=skyblock'),
(283, 1628751755, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(284, 1628751852, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank2'),
(285, 1628753656, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank5'),
(286, 1628753662, '00000000-0000-0000-0000-000000000000', 'Console@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent settrack skyblock-ranks skyblock-rank1'),
(287, 1628924242, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'permission settemp saywut.spawnerboost true 1h server=skyblock'),
(288, 1628925212, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'webeditor remove saywut.spawnerboost true server=skyblock'),
(289, 1628925375, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'permission settemp saywut.spawnerboost true 1h server=skyblock'),
(290, 1628925447, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'webeditor remove saywut.spawnerboost true server=skyblock'),
(291, 1629126618, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.warp.pve true server=skyblock'),
(292, 1629126618, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.warp.trade true server=skyblock'),
(293, 1629126618, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.warp.pvp true server=skyblock'),
(294, 1629126618, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.warp.crate true server=skyblock'),
(295, 1629126727, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.warp true server=skyblock'),
(296, 1629127389, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.warp.showlist false server=skyblock'),
(297, 1629127562, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove cmi.command.warp.showlist false server=skyblock'),
(298, 1629128095, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.spawn true server=skyblock'),
(299, 1629128993, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.tpa true server=skyblock'),
(300, 1629128993, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.tpahere true server=skyblock'),
(301, 1629128993, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.tpaccept true server=skyblock'),
(302, 1629128993, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.tpdeny true server=skyblock'),
(303, 1629178183, '00000000-0000-0000-0000-000000000000', 'Console@hub', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent set owner'),
(304, 1629217643, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'owner', 'webeditor add worldguard.heal false'),
(305, 1629259047, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add worldguard.heal false'),
(306, 1629260580, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'permission set cmi.command.heal false'),
(307, 1629265180, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor remove worldguard.heal false');
INSERT INTO `luckperms_actions` (`id`, `time`, `actor_uuid`, `actor_name`, `type`, `acted_uuid`, `acted_name`, `action`) VALUES
(308, 1629265191, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.claim true server=skyblock'),
(309, 1629265191, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.use true server=skyblock'),
(310, 1629265191, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.history true server=skyblock'),
(311, 1629265191, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.sell true server=skyblock'),
(312, 1629265272, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.max.1 true server=skyblock'),
(313, 1629265896, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.help true server=skyblock'),
(314, 1629271206, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.paytoggle true server=skyblock'),
(315, 1629271206, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.baltop true server=skyblock'),
(316, 1629271206, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.balance true server=skyblock'),
(317, 1629271206, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.pay true server=skyblock'),
(318, 1629271630, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add zauctionhouse.search true server=skyblock'),
(319, 1629290868, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'builder', 'permission set minecraft.command.save-all true'),
(320, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.visit true server=skyblock'),
(321, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.missions true server=skyblock'),
(322, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.toggle true server=skyblock'),
(323, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.team true server=skyblock'),
(324, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.open true server=skyblock'),
(325, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.balance true server=skyblock'),
(326, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.promote true server=skyblock'),
(327, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.visitors true server=skyblock'),
(328, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.teamchat true server=skyblock'),
(329, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.value true server=skyblock'),
(330, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.teleport true server=skyblock'),
(331, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.toggle.blocks true server=skyblock'),
(332, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.create true server=skyblock'),
(333, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.help true server=skyblock'),
(334, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.setteleport true server=skyblock'),
(335, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.kick true server=skyblock'),
(336, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.upgrade true server=skyblock'),
(337, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.settings true server=skyblock'),
(338, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.invite true server=skyblock'),
(339, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.values true server=skyblock'),
(340, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.accept true server=skyblock'),
(341, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.top true server=skyblock'),
(342, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.demote true server=skyblock'),
(343, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.disband true server=skyblock'),
(344, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.deposit true server=skyblock'),
(345, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.name true server=skyblock'),
(346, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.leave true server=skyblock'),
(347, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.rankup true server=skyblock'),
(348, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.transfer true server=skyblock'),
(349, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.expel true server=skyblock'),
(350, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.mission true server=skyblock'),
(351, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.permissions true server=skyblock'),
(352, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.panel true server=skyblock'),
(353, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.close true server=skyblock'),
(354, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.withdraw true server=skyblock'),
(355, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.pardon true server=skyblock'),
(356, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.recalc true server=skyblock'),
(357, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.ban true server=skyblock'),
(358, 1629375918, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.setrole true server=skyblock'),
(359, 1629435794, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.coop false server=skyblock'),
(360, 1629435794, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add superior.island.coops false server=skyblock'),
(361, 1629436216, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add BeastTokens.TokenDrops.Type.Mining.BEACON true server=skyblock'),
(362, 1629436251, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add BeastTokens.TokenDrops.Type.Mining.* true server=skyblock'),
(363, 1629436251, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove BeastTokens.TokenDrops.Type.Mining.BEACON true server=skyblock'),
(364, 1629436265, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent add default'),
(365, 1629436840, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add beasttokens.tokendrops.type.mining.beacon true server=skyblock'),
(366, 1629437128, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add kgenerators.mine.beacon_dungeon true server=skyblock'),
(367, 1629437273, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add kgenerators.mine.iron_dungeon true server=skyblock'),
(368, 1629437461, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@hub', 'G', 'null', 'skyblock-member', 'webeditor remove beasttokens.tokendrops.type.mining.beacon true server=skyblock'),
(369, 1629442542, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add beasttokens.balance true server=skyblock'),
(370, 1629442542, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add beasttokens.balanceothers true server=skyblock'),
(371, 1629442607, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add beasttokens.withdraw true server=skyblock'),
(372, 1629442607, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add BeastTokens.Shop true server=skyblock'),
(373, 1629442607, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add BeastTokens.Shop.* true server=skyblock'),
(374, 1629454666, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add playervaults.commands.use true server=skyblock'),
(375, 1629454666, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add playervaults.size.6 true server=skyblock'),
(376, 1629454666, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add playervaults.amount.1 true server=skyblock'),
(377, 1629455257, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor add playervaults.amount.7 true server=skyblock'),
(378, 1629455257, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor add playervaults.amount.5 true server=skyblock'),
(379, 1629455257, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor add playervaults.amount.4 true server=skyblock'),
(380, 1629455257, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor add playervaults.amount.3 true server=skyblock'),
(381, 1629455257, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add playervaults.amount.2 true server=skyblock'),
(382, 1629455426, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank5', 'webeditor add minions.place.rank5 true server=skyblock'),
(383, 1629455427, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank4', 'webeditor add minions.place.rank4 true server=skyblock'),
(384, 1629455427, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank3', 'webeditor add minions.place.rank3 true server=skyblock'),
(385, 1629455427, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank2', 'webeditor add minions.place.rank2 true server=skyblock'),
(386, 1629455427, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-rank1', 'webeditor add minions.place.rank1 true server=skyblock'),
(387, 1629455427, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add minions.place.default true server=skyblock'),
(388, 1629456747, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'mod', 'webeditor add cmi.command.msg.togglebypass true'),
(389, 1629456748, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add cmi.command.msgtoggle true'),
(390, 1629456748, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add cmi.command.msg true'),
(391, 1629456868, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'owner', 'webeditor add cmi.command.msg.togglebypass true'),
(392, 1629456868, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'owner', 'webeditor add cmi.command.ignore.bypass true'),
(393, 1629456868, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'mod', 'webeditor add cmi.command.ignore.bypass true'),
(394, 1629456868, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add cmi.command.reply true'),
(395, 1629456868, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'webeditor add cmi.command.ignore true'),
(396, 1629458028, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add cmi.command.baltop.others true server=skyblock'),
(397, 1629470517, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add BeastWithdraw.XpBottle true server=skyblock'),
(398, 1629470517, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add beastwithdraw.cashnote true server=skyblock'),
(399, 1629532808, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add featherboard.toggle true server=skyblock'),
(400, 1629532808, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add litebans.mutechat true server=skyblock'),
(401, 1629532879, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add litebans.togglechat true server=skyblock'),
(402, 1629532879, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove litebans.mutechat true server=skyblock'),
(403, 1629533080, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add tab.togglebar true server=skyblock'),
(404, 1629545728, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'U', 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'parent remove default'),
(405, 1629545779, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'default', 'permission set worldedit.* false'),
(406, 1629791769, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add shopguiplus.shops.* false server=skyblock'),
(407, 1629791769, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add shopguiplus.shop true server=skyblock'),
(408, 1629791796, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor remove shopguiplus.shops.* false server=skyblock'),
(409, 1629791855, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'SayWut@skyblock', 'G', 'null', 'skyblock-member', 'webeditor add shopguiplus.shops.* true server=skyblock');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_groups`
--

CREATE TABLE `luckperms_groups` (
  `name` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `luckperms_groups`
--

INSERT INTO `luckperms_groups` (`name`) VALUES
('builder'),
('default'),
('mod'),
('owner'),
('skyblock-member'),
('skyblock-rank1'),
('skyblock-rank2'),
('skyblock-rank3'),
('skyblock-rank4'),
('skyblock-rank5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_group_permissions`
--

CREATE TABLE `luckperms_group_permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(36) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `server` varchar(36) NOT NULL,
  `world` varchar(64) NOT NULL,
  `expiry` bigint(20) NOT NULL,
  `contexts` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `luckperms_group_permissions`
--

INSERT INTO `luckperms_group_permissions` (`id`, `name`, `permission`, `value`, `server`, `world`, `expiry`, `contexts`) VALUES
(1, 'builder', 'group.mod', 1, 'global', 'global', 0, '{}'),
(2, 'builder', 'weight.91', 1, 'global', 'global', 0, '{}'),
(5, 'builder', 'displayname.Builder', 1, 'global', 'global', 0, '{}'),
(6, 'default', 'minecraft.command.*', 0, 'global', 'global', 0, '{}'),
(10, 'default', 'mv.bypass.gamemode.*', 1, 'global', 'global', 0, '{}'),
(11, 'default', 'bukkit.command.*', 0, 'global', 'global', 0, '{}'),
(14, 'mod', 'weight.90', 1, 'global', 'global', 0, '{}'),
(15, 'mod', 'group.default', 1, 'global', 'global', 0, '{}'),
(16, 'mod', 'mv.bypass.gamemode.*', 1, 'global', 'global', 0, '{}'),
(17, 'mod', 'displayname.Mod', 1, 'global', 'global', 0, '{}'),
(19, 'owner', 'mv.bypass.gamemode.*', 1, 'global', 'global', 0, '{}'),
(22, 'owner', 'displayname.Owner', 1, 'global', 'global', 0, '{}'),
(23, 'owner', 'weight.100', 1, 'global', 'global', 0, '{}'),
(25, 'owner', 'worldguard.region.bypass.dungeon.__global__.give-effects', 0, 'skyblock', 'global', 0, '{}'),
(26, 'builder', 'worldguard.region.bypass.dungeon.__global__.give-effects', 0, 'skyblock', 'global', 0, '{}'),
(30, 'default', 'cmi.command.ctext', 0, 'global', 'global', 0, '{}'),
(34, 'owner', 'prefix.100.{#FFA500}&lOwner ', 1, 'global', 'global', 0, '{}'),
(35, 'builder', 'prefix.91.&3&lBuilder ', 1, 'global', 'global', 0, '{}'),
(36, 'mod', 'prefix.90.{#a082d3}&lMod ', 1, 'global', 'global', 0, '{}'),
(38, 'default', 'prefix.1.{#f5f5dc}Member ', 1, 'global', 'global', 0, '{}'),
(40, 'owner', 'worldguard.region.bypass.world.pvp-arena.give-effects', 0, 'skyblock', 'global', 0, '{}'),
(62, 'default', 'group.skyblock-member', 1, 'global', 'global', 0, '{}'),
(88, 'skyblock-member', 'BeastTokens.TokenDrops.Type.Mobs.*', 1, 'skyblock', 'global', 0, '{}'),
(89, 'skyblock-member', 'boosters.member', 1, 'skyblock', 'global', 0, '{}'),
(90, 'skyblock-member', 'superior.island.stacker.*', 1, 'skyblock', 'global', 0, '{}'),
(91, 'skyblock-rank1', 'displayname.skyblock-rank1', 1, 'global', 'global', 0, '{}'),
(94, 'skyblock-rank1', 'weight.5', 1, 'global', 'global', 0, '{}'),
(95, 'skyblock-rank2', 'weight.10', 1, 'global', 'global', 0, '{}'),
(104, 'skyblock-rank2', 'group.skyblock-rank1', 1, 'skyblock', 'global', 0, '{}'),
(105, 'skyblock-rank3', 'displayname.skyblock-rank3', 1, 'skyblock', 'global', 0, '{}'),
(106, 'skyblock-rank3', 'weight.15', 1, 'global', 'global', 0, '{}'),
(109, 'skyblock-rank4', 'weight.20', 1, 'global', 'global', 0, '{}'),
(111, 'skyblock-rank4', 'group.skyblock-rank3', 1, 'skyblock', 'global', 0, '{}'),
(112, 'skyblock-rank4', 'displayname.skyblock-rank4', 1, 'global', 'global', 0, '{}'),
(113, 'skyblock-rank5', 'weight.25', 1, 'global', 'global', 0, '{}'),
(115, 'skyblock-rank5', 'group.skyblock-rank4', 1, 'skyblock', 'global', 0, '{}'),
(116, 'skyblock-rank5', 'displayname.skyblock-rank5', 1, 'global', 'global', 0, '{}'),
(117, 'skyblock-rank2', 'displayname.skyblock-rank2', 1, 'global', 'global', 0, '{}'),
(121, 'skyblock-rank2', 'prefix.10.{#0091b7}&lFabled ', 1, 'skyblock', 'global', 0, '{}'),
(122, 'skyblock-rank1', 'prefix.5.{#008e5b}&lVenturer ', 1, 'skyblock', 'global', 0, '{}'),
(123, 'skyblock-rank5', 'prefix.25.{#FFD700}&lLegendary ', 1, 'skyblock', 'global', 0, '{}'),
(124, 'skyblock-rank4', 'prefix.20.&c&lHeroic ', 1, 'skyblock', 'global', 0, '{}'),
(125, 'skyblock-rank3', 'prefix.15.{#9b4de8}&lMythic ', 1, 'skyblock', 'global', 0, '{}'),
(127, 'skyblock-rank3', 'group.skyblock-rank2', 1, 'skyblock', 'global', 0, '{}'),
(128, 'skyblock-rank5', 'vouchers.rank5', 0, 'skyblock', 'global', 0, '{}'),
(129, 'skyblock-rank4', 'vouchers.rank4', 0, 'skyblock', 'global', 0, '{}'),
(130, 'skyblock-rank3', 'vouchers.rank3', 0, 'skyblock', 'global', 0, '{}'),
(131, 'skyblock-rank2', 'vouchers.rank2', 0, 'skyblock', 'global', 0, '{}'),
(133, 'skyblock-member', 'vouchers.rank5', 1, 'skyblock', 'global', 0, '{}'),
(134, 'skyblock-member', 'vouchers.rank1', 1, 'skyblock', 'global', 0, '{}'),
(135, 'skyblock-member', 'vouchers.rank2', 1, 'skyblock', 'global', 0, '{}'),
(136, 'skyblock-member', 'vouchers.rank4', 1, 'skyblock', 'global', 0, '{}'),
(137, 'skyblock-member', 'vouchers.rank3', 1, 'skyblock', 'global', 0, '{}'),
(138, 'skyblock-member', 'cmi.openshulker.shift', 1, 'skyblock', 'global', 0, '{}'),
(139, 'skyblock-member', 'auctionhouse.cmd', 1, 'skyblock', 'global', 0, '{}'),
(140, 'skyblock-member', 'cmi.customalias.market', 1, 'skyblock', 'global', 0, '{}'),
(141, 'skyblock-member', 'cmi.openshulker', 1, 'skyblock', 'global', 0, '{}'),
(143, 'skyblock-rank1', 'vouchers.rank1', 0, 'skyblock', 'global', 0, '{}'),
(144, 'skyblock-member', 'cmi.command.warp.pve', 1, 'skyblock', 'global', 0, '{}'),
(145, 'skyblock-member', 'cmi.command.warp.pvp', 1, 'skyblock', 'global', 0, '{}'),
(146, 'skyblock-member', 'cmi.command.warp.trade', 1, 'skyblock', 'global', 0, '{}'),
(147, 'skyblock-member', 'cmi.command.warp.crate', 1, 'skyblock', 'global', 0, '{}'),
(148, 'skyblock-member', 'cmi.command.warp', 1, 'skyblock', 'global', 0, '{}'),
(150, 'skyblock-member', 'cmi.command.spawn', 1, 'skyblock', 'global', 0, '{}'),
(151, 'skyblock-member', 'cmi.command.tpa', 1, 'skyblock', 'global', 0, '{}'),
(152, 'skyblock-member', 'cmi.command.tpaccept', 1, 'skyblock', 'global', 0, '{}'),
(153, 'skyblock-member', 'cmi.command.tpdeny', 1, 'skyblock', 'global', 0, '{}'),
(154, 'skyblock-member', 'cmi.command.tpahere', 1, 'skyblock', 'global', 0, '{}'),
(155, 'owner', 'worldguard.heal', 0, 'global', 'global', 0, '{}'),
(157, 'default', 'cmi.command.heal', 0, 'global', 'global', 0, '{}'),
(158, 'skyblock-member', 'zauctionhouse.claim', 1, 'skyblock', 'global', 0, '{}'),
(159, 'skyblock-member', 'zauctionhouse.use', 1, 'skyblock', 'global', 0, '{}'),
(160, 'skyblock-member', 'zauctionhouse.history', 1, 'skyblock', 'global', 0, '{}'),
(161, 'skyblock-member', 'zauctionhouse.sell', 1, 'skyblock', 'global', 0, '{}'),
(162, 'skyblock-member', 'zauctionhouse.max.1', 1, 'skyblock', 'global', 0, '{}'),
(163, 'skyblock-member', 'zauctionhouse.help', 1, 'skyblock', 'global', 0, '{}'),
(164, 'skyblock-member', 'cmi.command.paytoggle', 1, 'skyblock', 'global', 0, '{}'),
(165, 'skyblock-member', 'cmi.command.baltop', 1, 'skyblock', 'global', 0, '{}'),
(166, 'skyblock-member', 'cmi.command.balance', 1, 'skyblock', 'global', 0, '{}'),
(167, 'skyblock-member', 'cmi.command.pay', 1, 'skyblock', 'global', 0, '{}'),
(168, 'skyblock-member', 'zauctionhouse.search', 1, 'skyblock', 'global', 0, '{}'),
(169, 'builder', 'minecraft.command.save-all', 1, 'global', 'global', 0, '{}'),
(170, 'skyblock-member', 'superior.island.balance', 1, 'skyblock', 'global', 0, '{}'),
(171, 'skyblock-member', 'superior.island.teamchat', 1, 'skyblock', 'global', 0, '{}'),
(172, 'skyblock-member', 'superior.island.open', 1, 'skyblock', 'global', 0, '{}'),
(173, 'skyblock-member', 'superior.island.toggle', 1, 'skyblock', 'global', 0, '{}'),
(174, 'skyblock-member', 'superior.island.visit', 1, 'skyblock', 'global', 0, '{}'),
(175, 'skyblock-member', 'superior.island.promote', 1, 'skyblock', 'global', 0, '{}'),
(176, 'skyblock-member', 'superior.island.missions', 1, 'skyblock', 'global', 0, '{}'),
(177, 'skyblock-member', 'superior.island.team', 1, 'skyblock', 'global', 0, '{}'),
(178, 'skyblock-member', 'superior.island.visitors', 1, 'skyblock', 'global', 0, '{}'),
(179, 'skyblock-member', 'superior.island.value', 1, 'skyblock', 'global', 0, '{}'),
(180, 'skyblock-member', 'superior.island.teleport', 1, 'skyblock', 'global', 0, '{}'),
(181, 'skyblock-member', 'superior.island.toggle.blocks', 1, 'skyblock', 'global', 0, '{}'),
(182, 'skyblock-member', 'superior.island.setteleport', 1, 'skyblock', 'global', 0, '{}'),
(183, 'skyblock-member', 'superior.island.upgrade', 1, 'skyblock', 'global', 0, '{}'),
(184, 'skyblock-member', 'superior.island.expel', 1, 'skyblock', 'global', 0, '{}'),
(185, 'skyblock-member', 'superior.island.invite', 1, 'skyblock', 'global', 0, '{}'),
(186, 'skyblock-member', 'superior.island.mission', 1, 'skyblock', 'global', 0, '{}'),
(187, 'skyblock-member', 'superior.island.accept', 1, 'skyblock', 'global', 0, '{}'),
(188, 'skyblock-member', 'superior.island.demote', 1, 'skyblock', 'global', 0, '{}'),
(189, 'skyblock-member', 'superior.island.disband', 1, 'skyblock', 'global', 0, '{}'),
(190, 'skyblock-member', 'superior.island.deposit', 1, 'skyblock', 'global', 0, '{}'),
(191, 'skyblock-member', 'superior.island.help', 1, 'skyblock', 'global', 0, '{}'),
(192, 'skyblock-member', 'superior.island.create', 1, 'skyblock', 'global', 0, '{}'),
(193, 'skyblock-member', 'superior.island.settings', 1, 'skyblock', 'global', 0, '{}'),
(194, 'skyblock-member', 'superior.island.kick', 1, 'skyblock', 'global', 0, '{}'),
(195, 'skyblock-member', 'superior.island.leave', 1, 'skyblock', 'global', 0, '{}'),
(196, 'skyblock-member', 'superior.island.top', 1, 'skyblock', 'global', 0, '{}'),
(197, 'skyblock-member', 'superior.island.values', 1, 'skyblock', 'global', 0, '{}'),
(198, 'skyblock-member', 'superior.island.panel', 1, 'skyblock', 'global', 0, '{}'),
(199, 'skyblock-member', 'superior.island.permissions', 1, 'skyblock', 'global', 0, '{}'),
(200, 'skyblock-member', 'superior.island.close', 1, 'skyblock', 'global', 0, '{}'),
(201, 'skyblock-member', 'superior.island.withdraw', 1, 'skyblock', 'global', 0, '{}'),
(202, 'skyblock-member', 'superior.island.name', 1, 'skyblock', 'global', 0, '{}'),
(203, 'skyblock-member', 'superior.island.pardon', 1, 'skyblock', 'global', 0, '{}'),
(204, 'skyblock-member', 'superior.island.ban', 1, 'skyblock', 'global', 0, '{}'),
(205, 'skyblock-member', 'superior.island.recalc', 1, 'skyblock', 'global', 0, '{}'),
(206, 'skyblock-member', 'superior.island.transfer', 1, 'skyblock', 'global', 0, '{}'),
(207, 'skyblock-member', 'superior.island.rankup', 1, 'skyblock', 'global', 0, '{}'),
(208, 'skyblock-member', 'superior.island.setrole', 1, 'skyblock', 'global', 0, '{}'),
(209, 'skyblock-member', 'superior.island.coops', 0, 'skyblock', 'global', 0, '{}'),
(210, 'skyblock-member', 'superior.island.coop', 0, 'skyblock', 'global', 0, '{}'),
(212, 'skyblock-member', 'BeastTokens.TokenDrops.Type.Mining.*', 1, 'skyblock', 'global', 0, '{}'),
(214, 'skyblock-member', 'kgenerators.mine.beacon_dungeon', 1, 'skyblock', 'global', 0, '{}'),
(215, 'skyblock-member', 'kgenerators.mine.iron_dungeon', 1, 'skyblock', 'global', 0, '{}'),
(216, 'skyblock-member', 'beasttokens.balance', 1, 'skyblock', 'global', 0, '{}'),
(217, 'skyblock-member', 'beasttokens.balanceothers', 1, 'skyblock', 'global', 0, '{}'),
(218, 'skyblock-member', 'beasttokens.withdraw', 1, 'skyblock', 'global', 0, '{}'),
(219, 'skyblock-member', 'BeastTokens.Shop', 1, 'skyblock', 'global', 0, '{}'),
(220, 'skyblock-member', 'BeastTokens.Shop.*', 1, 'skyblock', 'global', 0, '{}'),
(221, 'skyblock-member', 'playervaults.commands.use', 1, 'skyblock', 'global', 0, '{}'),
(222, 'skyblock-member', 'playervaults.size.6', 1, 'skyblock', 'global', 0, '{}'),
(223, 'skyblock-member', 'playervaults.amount.1', 1, 'skyblock', 'global', 0, '{}'),
(224, 'skyblock-rank5', 'playervaults.amount.7', 1, 'skyblock', 'global', 0, '{}'),
(225, 'skyblock-rank4', 'playervaults.amount.5', 1, 'skyblock', 'global', 0, '{}'),
(226, 'skyblock-rank3', 'playervaults.amount.4', 1, 'skyblock', 'global', 0, '{}'),
(227, 'skyblock-rank2', 'playervaults.amount.3', 1, 'skyblock', 'global', 0, '{}'),
(228, 'skyblock-rank1', 'playervaults.amount.2', 1, 'skyblock', 'global', 0, '{}'),
(229, 'skyblock-rank5', 'minions.place.rank5', 1, 'skyblock', 'global', 0, '{}'),
(230, 'skyblock-rank4', 'minions.place.rank4', 1, 'skyblock', 'global', 0, '{}'),
(231, 'skyblock-rank3', 'minions.place.rank3', 1, 'skyblock', 'global', 0, '{}'),
(232, 'skyblock-rank2', 'minions.place.rank2', 1, 'skyblock', 'global', 0, '{}'),
(233, 'skyblock-rank1', 'minions.place.rank1', 1, 'skyblock', 'global', 0, '{}'),
(234, 'skyblock-member', 'minions.place.default', 1, 'skyblock', 'global', 0, '{}'),
(235, 'mod', 'cmi.command.msg.togglebypass', 1, 'global', 'global', 0, '{}'),
(236, 'default', 'cmi.command.msgtoggle', 1, 'global', 'global', 0, '{}'),
(237, 'default', 'cmi.command.msg', 1, 'global', 'global', 0, '{}'),
(238, 'owner', 'cmi.command.msg.togglebypass', 1, 'global', 'global', 0, '{}'),
(239, 'owner', 'cmi.command.ignore.bypass', 1, 'global', 'global', 0, '{}'),
(240, 'mod', 'cmi.command.ignore.bypass', 1, 'global', 'global', 0, '{}'),
(241, 'default', 'cmi.command.reply', 1, 'global', 'global', 0, '{}'),
(242, 'default', 'cmi.command.ignore', 1, 'global', 'global', 0, '{}'),
(243, 'skyblock-member', 'cmi.command.baltop.others', 1, 'skyblock', 'global', 0, '{}'),
(244, 'skyblock-member', 'BeastWithdraw.XpBottle', 1, 'skyblock', 'global', 0, '{}'),
(245, 'skyblock-member', 'beastwithdraw.cashnote', 1, 'skyblock', 'global', 0, '{}'),
(247, 'skyblock-member', 'featherboard.toggle', 1, 'skyblock', 'global', 0, '{}'),
(248, 'skyblock-member', 'litebans.togglechat', 1, 'skyblock', 'global', 0, '{}'),
(249, 'skyblock-member', 'tab.togglebar', 1, 'skyblock', 'global', 0, '{}'),
(250, 'default', 'worldedit.*', 0, 'global', 'global', 0, '{}'),
(251, 'skyblock-member', 'shopguiplus.shop', 1, 'skyblock', 'global', 0, '{}'),
(253, 'skyblock-member', 'shopguiplus.shops.*', 1, 'skyblock', 'global', 0, '{}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_messenger`
--

CREATE TABLE `luckperms_messenger` (
  `id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_players`
--

CREATE TABLE `luckperms_players` (
  `uuid` varchar(36) NOT NULL,
  `username` varchar(16) NOT NULL,
  `primary_group` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `luckperms_players`
--

INSERT INTO `luckperms_players` (`uuid`, `username`, `primary_group`) VALUES
('8184b985-7074-3105-873f-f9d28033a26b', 'rsenn', 'default'),
('d89d79a1-3030-386c-b9e0-ef9f6eff035c', 'kibeno', 'default'),
('e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'saywut', 'owner'),
('f4613258-f50c-30d9-949d-4a7f617fcabf', 'shiru', 'builder');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_tracks`
--

CREATE TABLE `luckperms_tracks` (
  `name` varchar(36) NOT NULL,
  `groups` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `luckperms_tracks`
--

INSERT INTO `luckperms_tracks` (`name`, `groups`) VALUES
('skyblock-ranks', '[\"skyblock-rank1\",\"skyblock-rank2\",\"skyblock-rank3\",\"skyblock-rank4\",\"skyblock-rank5\"]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `luckperms_user_permissions`
--

CREATE TABLE `luckperms_user_permissions` (
  `id` int(11) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `server` varchar(36) NOT NULL,
  `world` varchar(64) NOT NULL,
  `expiry` bigint(20) NOT NULL,
  `contexts` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `luckperms_user_permissions`
--

INSERT INTO `luckperms_user_permissions` (`id`, `uuid`, `permission`, `value`, `server`, `world`, `expiry`, `contexts`) VALUES
(4, 'f4613258-f50c-30d9-949d-4a7f617fcabf', 'group.builder', 1, 'global', 'global', 0, '{}'),
(5, '8184b985-7074-3105-873f-f9d28033a26b', 'group.default', 1, 'global', 'global', 0, '{}'),
(55, 'e7901ee3-c22c-3cfd-8a05-d5ec319e195a', 'group.owner', 1, 'global', 'global', 0, '{}');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `luckperms_actions`
--
ALTER TABLE `luckperms_actions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `luckperms_groups`
--
ALTER TABLE `luckperms_groups`
  ADD PRIMARY KEY (`name`);

--
-- Chỉ mục cho bảng `luckperms_group_permissions`
--
ALTER TABLE `luckperms_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `luckperms_group_permissions_name` (`name`);

--
-- Chỉ mục cho bảng `luckperms_messenger`
--
ALTER TABLE `luckperms_messenger`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `luckperms_players`
--
ALTER TABLE `luckperms_players`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `luckperms_players_username` (`username`);

--
-- Chỉ mục cho bảng `luckperms_tracks`
--
ALTER TABLE `luckperms_tracks`
  ADD PRIMARY KEY (`name`);

--
-- Chỉ mục cho bảng `luckperms_user_permissions`
--
ALTER TABLE `luckperms_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `luckperms_user_permissions_uuid` (`uuid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `luckperms_actions`
--
ALTER TABLE `luckperms_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT cho bảng `luckperms_group_permissions`
--
ALTER TABLE `luckperms_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT cho bảng `luckperms_messenger`
--
ALTER TABLE `luckperms_messenger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=578;

--
-- AUTO_INCREMENT cho bảng `luckperms_user_permissions`
--
ALTER TABLE `luckperms_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
