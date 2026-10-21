-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 21, 2026 at 03:14 AM
-- Server version: 26.7.0
-- PHP Version: 8.3.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pretest24`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_commit`
--

CREATE TABLE `tb_commit` (
  `id_commit` int NOT NULL,
  `id_member` int NOT NULL,
  `id_eva` int NOT NULL,
  `status_commit` varchar(1) NOT NULL,
  `level_commit` varchar(100) NOT NULL,
  `detail_commit` text,
  `signature` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_doc`
--

CREATE TABLE `tb_doc` (
  `id_doc` int NOT NULL,
  `name_doc` varchar(100) NOT NULL,
  `day_doc` int NOT NULL,
  `file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_eva`
--

CREATE TABLE `tb_eva` (
  `id_eva` int NOT NULL,
  `id_member` int NOT NULL,
  `id_sys` int NOT NULL,
  `status_eva` int NOT NULL,
  `day_eva` date NOT NULL,
  `total_eva` decimal(10,2) DEFAULT NULL,
  `total_commit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_eva`
--

INSERT INTO `tb_eva` (`id_eva`, `id_member`, `id_sys`, `status_eva`, `day_eva`, `total_eva`, `total_commit`) VALUES
(1, 2, 1, 2, '2026-10-04', 16.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_evadetail`
--

CREATE TABLE `tb_evadetail` (
  `id_detail` int NOT NULL,
  `id_eva` int NOT NULL,
  `id_indicate` int NOT NULL,
  `status_eva` int NOT NULL,
  `detail_eva` text,
  `score_member` int DEFAULT NULL,
  `score_commit` int DEFAULT NULL,
  `file_eva` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_evadetail`
--

INSERT INTO `tb_evadetail` (`id_detail`, `id_eva`, `id_indicate`, `status_eva`, `detail_eva`, `score_member`, `score_commit`, `file_eva`) VALUES
(25, 1, 1, 1, 'test', 2, NULL, '1792489643089x0t06202tj.jpg'),
(26, 1, 2, 1, 'test', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_indicate`
--

CREATE TABLE `tb_indicate` (
  `id_indicate` int NOT NULL,
  `id_topic` int NOT NULL,
  `name_indicate` varchar(100) NOT NULL,
  `detail_indicate` text,
  `point_indicate` int NOT NULL,
  `check_indicate` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_indicate`
--

INSERT INTO `tb_indicate` (`id_indicate`, `id_topic`, `name_indicate`, `detail_indicate`, `point_indicate`, `check_indicate`) VALUES
(1, 1, 'กายภาพร่างกาย', 'ให้เท่าไหร่', 2, 'y'),
(2, 1, 'การประเมินร่างกาย', 'ขนาดใหญ่', 3, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE `tb_member` (
  `id_member` int NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('ฝ่ายบุคลากร','กรรมการประเมิน','ผู้รับการประเมินผล') NOT NULL,
  `pic_user` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_member`
--

INSERT INTO `tb_member` (`id_member`, `fname`, `lname`, `username`, `password`, `email`, `role`, `pic_user`) VALUES
(1, 'supimon', 'supimon', 'supimon', '123456', 'supimon@gmail.com', 'ผู้รับการประเมินผล', '1792485187356.jpg'),
(2, 'eva', 'eva', 'evalua', '$2b$10$V.Nw.pSOxo4TUyTXaMTOcuRxN1C9XglnGvSNITDgbIcQluay.J2tG', 'eva@gmail.com', 'ผู้รับการประเมินผล', '1792485835017.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_system`
--

CREATE TABLE `tb_system` (
  `id_sys` int NOT NULL,
  `day_open` date NOT NULL,
  `day_out` date NOT NULL,
  `year_sys` int NOT NULL,
  `round_sys` int NOT NULL,
  `status_sys` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_system`
--

INSERT INTO `tb_system` (`id_sys`, `day_open`, `day_out`, `year_sys`, `round_sys`, `status_sys`) VALUES
(1, '2026-10-01', '2035-10-11', 2569, 1, 'y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_topic`
--

CREATE TABLE `tb_topic` (
  `id_topic` int NOT NULL,
  `name_topic` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_topic`
--

INSERT INTO `tb_topic` (`id_topic`, `name_topic`) VALUES
(1, 'กายภาพ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_commit`
--
ALTER TABLE `tb_commit`
  ADD PRIMARY KEY (`id_commit`);

--
-- Indexes for table `tb_doc`
--
ALTER TABLE `tb_doc`
  ADD PRIMARY KEY (`id_doc`);

--
-- Indexes for table `tb_eva`
--
ALTER TABLE `tb_eva`
  ADD PRIMARY KEY (`id_eva`);

--
-- Indexes for table `tb_evadetail`
--
ALTER TABLE `tb_evadetail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `tb_indicate`
--
ALTER TABLE `tb_indicate`
  ADD PRIMARY KEY (`id_indicate`);

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `tb_system`
--
ALTER TABLE `tb_system`
  ADD PRIMARY KEY (`id_sys`);

--
-- Indexes for table `tb_topic`
--
ALTER TABLE `tb_topic`
  ADD PRIMARY KEY (`id_topic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_commit`
--
ALTER TABLE `tb_commit`
  MODIFY `id_commit` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_doc`
--
ALTER TABLE `tb_doc`
  MODIFY `id_doc` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_eva`
--
ALTER TABLE `tb_eva`
  MODIFY `id_eva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_evadetail`
--
ALTER TABLE `tb_evadetail`
  MODIFY `id_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_indicate`
--
ALTER TABLE `tb_indicate`
  MODIFY `id_indicate` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id_member` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_system`
--
ALTER TABLE `tb_system`
  MODIFY `id_sys` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_topic`
--
ALTER TABLE `tb_topic`
  MODIFY `id_topic` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
