-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- 主機： docker-spring-maraidb-restapi2-master-db-svc:3306
-- 產生時間： 2021 年 03 月 10 日 07:31
-- 伺服器版本： 10.5.9-MariaDB
-- PHP 版本： 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `todo`
--

-- --------------------------------------------------------

--
-- 資料表結構 `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `hibernate_sequence`
--

-- CREATE TABLE `hibernate_sequence` (
--   `next_not_cached_value` bigint(21) NOT NULL,
--   `minimum_value` bigint(21) NOT NULL,
--   `maximum_value` bigint(21) NOT NULL,
--   `start_value` bigint(21) NOT NULL COMMENT 'start value when sequences is created or value if RESTART is used',
--   `increment` bigint(21) NOT NULL COMMENT 'increment value',
--   `cache_size` bigint(21) UNSIGNED NOT NULL,
--   `cycle_option` tinyint(1) UNSIGNED NOT NULL COMMENT '0 if no cycles are allowed, 1 if the sequence should begin a new cycle when maximum_value is passed',
--   `cycle_count` bigint(21) NOT NULL COMMENT 'How many cycles have been done'
-- ) ENGINE=InnoDB;

--
-- 傾印資料表的資料 `hibernate_sequence`
--

-- INSERT INTO `hibernate_sequence` (`next_not_cached_value`, `minimum_value`, `maximum_value`, `start_value`, `increment`, `cache_size`, `cycle_option`, `cycle_count`) VALUES
-- (1, 1, 9223372036854775806, 1, 1, 1000, 0, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
