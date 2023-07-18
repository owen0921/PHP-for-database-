-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 04:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_book_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'Elias', 'eliasfsdev@gmail.com', '$2y$10$Nqq/y251QX2Ccvb1Ax7hUuMqQSkG3yRLCxN2KPdetnSP3oaXVH70a'),
(2, 'Sam', 'sam@test.com', '$2y$10$w4cIHD1asfuSKJynnoL4wedJuou2LceyiDEVi6qPp/i1oLMGAvuq6');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(3, '板垣惠介');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author_id`, `description`, `category_id`, `cover`, `file`) VALUES
(15, '刃牙道189話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '6450191ec92db5.42437066.jpg', '6450191ec9b260.61594937.pdf'),
(16, '刃牙道190話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '645019f5614585.78925733.jpg', '645019f56169e9.19153940.pdf'),
(17, '刃牙道191話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '64501a89411be8.72875776.jpg', '64501a89413c33.23446400.pdf'),
(18, '刃牙道192話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '64501b01305159.41023856.jpg', '64501b01307274.62472206.pdf'),
(19, '刃牙道193話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '64501b8f8fb302.54167459.jpg', '64501b8f8fdc04.26193670.pdf'),
(20, '刃牙道194話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '64501c2c32bd86.60257885.jpg', '64501c2c32e112.37978174.pdf'),
(21, '刃牙道195話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '64501cd427b9a7.58744048.jpg', '64501cd427d792.98373207.pdf'),
(22, '刃牙道196話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '64501f03129f25.43047195.jpg', '64501f0312c0a9.09361857.pdf'),
(23, '刃牙道197話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '6450206bd0b6c3.27785656.jpg', '6450206bd0d5e6.94896317.pdf'),
(24, '刃牙道198話', 3, '板垣惠介所著的人气格斗漫画《刃牙》系列最新作品《刃牙道》，《刃牙》系列是描述地下格斗场的冠军范马刃牙及其父、冠有地上最强生命这一称呼的范马勇次郎还有作品中各格斗家的热血格斗物语。《刃牙道》也是自上部作品《范马刃牙》相隔一年半以来系列的新作。欢迎在线观看！', 5, '6450208be406d0.50547309.jpg', '6450208be42414.14172619.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `book_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`user_id`, `book_id`, `book_rating`) VALUES
(1234, 24, 5),
(1234, 23, 3),
(1234, 22, 3),
(1357, 24, 5),
(1357, 21, 5),
(1357, 18, 5),
(1357, 22, 3),
(1234, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(5, '熱血');

-- --------------------------------------------------------

--
-- Table structure for table `login_user`
--

CREATE TABLE `login_user` (
  `mId` int(40) NOT NULL,
  `pId` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `acc` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_user`
--

INSERT INTO `login_user` (`mId`, `pId`, `name`, `address`, `email`, `phone`, `acc`, `pass`) VALUES
(1, '1234', '1234', '1234', 'owen0928092110@gmail.com', '1234', '1234', '1234'),
(2, '1357', '1357', '1357', 'owen0928092110@gmail.com', '1357', '1357', '1357'),
(4, 'wef', 'wef', 'wef', '1234@gmail.com', 'wef', 'wef', 'wef'),
(5, 'abc', 'abc', 'abc', '1234@gmail.com', '1234', 'abc', 'abc'),
(6, 'u', 'u', 'u', '1357@gmail.com', 'u', 'u', 'u'),
(12, 'test', 'test', 'test', 'test@gmail.com', 'test', 'test', 'test'),
(13, '', '', '', '', '', '', ''),
(14, 'aaa', 'aaa', 'aaa', 'aaa@gmail.com', 'aaa', 'aaa', 'aaa'),
(15, 'bbb', 'bbb', 'bbb', '1357@gmail.com', 'bbb', 'bbb', 'bbb');

-- --------------------------------------------------------

--
-- Table structure for table `recommendation`
--

CREATE TABLE `recommendation` (
  `user_id` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `book_rating` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recommendation`
--

INSERT INTO `recommendation` (`user_id`, `book_name`, `book_rating`) VALUES
(1234, '刃牙道', '5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_user`
--
ALTER TABLE `login_user`
  ADD PRIMARY KEY (`mId`),
  ADD UNIQUE KEY `acc` (`acc`),
  ADD UNIQUE KEY `pId` (`pId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login_user`
--
ALTER TABLE `login_user`
  MODIFY `mId` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
