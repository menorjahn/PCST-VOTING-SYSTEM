-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2022 at 09:44 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `category`) VALUES
(1, 'President'),
(3, 'Vice President'),
(4, 'Secretary'),
(5, 'Sub-Secretary'),
(6, 'Treasurer'),
(7, 'Sub-Treasurer'),
(8, 'Auditor'),
(9, 'P.R.O'),
(10, 'Business Manager'),
(11, 'Adonis'),
(12, 'Muse'),
(13, '1st Year Representative'),
(14, '2nd Year Representative'),
(15, '3rd Year Representative'),
(16, '4th Year Representative');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1+admin , 2 = users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1),
(6, 'Marielle Mamaradlo', '00030923', '6', 2),
(7, 'Marc Bugarin', '00031656', 'marc', 2),
(8, 'Jay-r Joves', '00031491', 'jayr', 2),
(9, 'Joshua Barte', '00030828', 'joshua', 2),
(10, 'Jahnelle Menor', '00030971', 'menor', 2),
(11, 'Caynalle', '00012345', 'caynalle', 2);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `voting_opt_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `voting_id`, `category_id`, `voting_opt_id`, `user_id`) VALUES
(1, 1, 1, 1, 3),
(2, 1, 3, 5, 3),
(3, 1, 4, 6, 3),
(4, 1, 4, 7, 3),
(5, 1, 4, 8, 3),
(6, 1, 4, 9, 3),
(7, 1, 1, 3, 4),
(8, 1, 3, 12, 4),
(9, 1, 4, 6, 4),
(10, 1, 4, 8, 4),
(11, 1, 4, 10, 4),
(12, 1, 4, 11, 4),
(13, 1, 1, 1, 5),
(14, 1, 3, 5, 5),
(15, 1, 4, 6, 5),
(16, 4, 1, 19, 10),
(17, 4, 3, 20, 10),
(18, 4, 4, 24, 10),
(19, 4, 5, 26, 10),
(20, 4, 6, 30, 10),
(21, 4, 7, 32, 10),
(22, 4, 8, 34, 10),
(23, 4, 8, 35, 10),
(24, 4, 9, 38, 10),
(25, 4, 9, 39, 10),
(26, 4, 10, 42, 10),
(27, 4, 10, 43, 10),
(28, 4, 11, 45, 10),
(29, 4, 12, 47, 10),
(30, 4, 13, 49, 10),
(31, 4, 14, 51, 10),
(32, 4, 15, 53, 10),
(33, 4, 16, 56, 10);

-- --------------------------------------------------------

--
-- Table structure for table `voting_cat_settings`
--

CREATE TABLE `voting_cat_settings` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `max_selection` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_cat_settings`
--

INSERT INTO `voting_cat_settings` (`id`, `voting_id`, `category_id`, `max_selection`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 1, 4, 4),
(4, 4, 1, 1),
(5, 4, 8, 2),
(6, 4, 9, 2),
(7, 4, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `voting_list`
--

CREATE TABLE `voting_list` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_list`
--

INSERT INTO `voting_list` (`id`, `title`, `description`, `is_default`) VALUES
(4, 'CCSSC Election', 'COLLEGE OF COMPUTER STUDIES STUDENT COUNCIL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `voting_opt`
--

CREATE TABLE `voting_opt` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `image_path` text NOT NULL,
  `opt_txt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_opt`
--

INSERT INTO `voting_opt` (`id`, `voting_id`, `category_id`, `image_path`, `opt_txt`) VALUES
(19, 4, 1, '1670989680_Jahnelle.jpg', 'Jahnelle Mae Menor'),
(20, 4, 3, '1670989740_Kim.jpg', 'Kim Kyle Marquez'),
(22, 4, 1, '1670989800_Adrian.jpg', 'Adrian Ken Rosario'),
(23, 4, 3, '1670989800_TIMOTHY.jpg', 'Timothy Jared Tandoc'),
(24, 4, 4, '1670989800_Alexis.jpg', 'Kim Alexis De Guzman'),
(25, 4, 4, '1670989860_Marjorie.jpg', 'Marjorie Rose Maynigo'),
(26, 4, 5, '1670989920_Jhy.jpg', 'Jhyniecel Pera Maynigo'),
(27, 4, 5, '1670989920_Nicolle.jpg', 'Nicholle Arenas'),
(28, 4, 6, '1670989980_Hannah.jpg', 'Hannah Patricia Castro'),
(30, 4, 6, '1670990040_Mari.jpg', 'Marisol De Leon'),
(31, 4, 7, '1670990040_diane.jpg', 'Dianne Nicole Tumanan'),
(32, 4, 7, '1670990100_stef.jpg', 'Stefanny Damacasin'),
(33, 4, 8, '1670990100_christine.jpg', 'Christine Angeline Aguilar'),
(34, 4, 8, '1670990100_czar.jpg', 'Czar Luna'),
(35, 4, 8, '1670990160_jamarie.jpg', 'Jemarie Cruz'),
(36, 4, 8, '1670990220_jay r.jpg', 'Jay-r Joves'),
(37, 4, 9, '1670990220_jayson.jpg', 'Jayson Laforteza'),
(38, 4, 9, '1670990280_bolinas.jpg', 'Archie Bolinas'),
(39, 4, 9, '1670990280_rymyr.jpg', 'Rymyr Poserio'),
(40, 4, 9, '1670990280_carlo.jpg', 'John Carlo Carasi'),
(41, 4, 10, '1670990340_lu.jpg', 'Mery Lovely Jana Lu'),
(42, 4, 10, '1670990400_sean.jpg', 'Kersten Sean Calimlim'),
(43, 4, 10, '1670990400_Allen.jpg', 'John Allen Villamin'),
(44, 4, 10, '1670990460_ernesto.jpg', 'Ernesto Dela Cruz Jr.'),
(45, 4, 11, '1670990460_shwan.jpg', 'Shawn Michael Delima'),
(46, 4, 11, '1670990520_randre.jpg', 'Randre Cabansag'),
(47, 4, 12, '1670990520_julianne.jpg', 'Julliane Ponio'),
(48, 4, 12, '1670990580_edelyn.jpg', 'Edelyn Malillin'),
(49, 4, 13, '1670990580_emman.jpg', 'Emmanuel Trimidal'),
(50, 4, 13, '1670990640_jenan.jpg', 'Jenan Muyargas'),
(51, 4, 14, '1670990640_joana.jpg', 'Joana Limpin'),
(52, 4, 14, '1670990700_miguel.jpg', 'Miguel Labrador'),
(53, 4, 15, '1670990700_patrick.jpg', 'Patrick De Nieva'),
(54, 4, 15, '1670990760_ferrer.jpg', 'Adriel Anthony Ferrer'),
(55, 4, 16, '1670990760_idos.jpg', 'laurynz Idos'),
(56, 4, 16, '1670990760_jessa.jpg', 'Jessa Frias');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_list`
--
ALTER TABLE `voting_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_opt`
--
ALTER TABLE `voting_opt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `voting_list`
--
ALTER TABLE `voting_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `voting_opt`
--
ALTER TABLE `voting_opt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
