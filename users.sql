-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2026 at 06:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bey_2a`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `student_no` varchar(30) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student') NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `student_no`, `full_name`, `username`, `password`, `role`) VALUES
(1, NULL, 'BEA PELAYO', 'bey', '$2y$12$kyGmVMqZHnhqCyh89Q9jxeVZ1Z9xoBCd4ZX/rIFo3I.laZWK0XJde', 'admin'),
(2, '2026-0001', 'Juan Dela Cruz', 'juan', '$2y$12$K2wcAyd47mAWVY5dDxRGp.yFlRKWj73Rrzvc9jgYSrgb0PI0av9vW', 'student'),
(3, '2026-0022', 'Princess Azada', 'cess', '$2y$10$RKyulEHDC/XJdWEhYugDeODsKQbBuOPnmiMKrbt7.kdULJ3Capriy', 'student'),
(4, '111', 'bea pelayo', 'mariel', '$2y$10$6BdaEevGsi98b.Se/sY.Ue1pYpfoxWtKZfgyNJ5./H1tdkpj/shrG', 'student'),
(5, '05-9902', 'jas timbol', 'jas', '$2y$10$oeemM2TG6neGjdNDk/wNy.TIUSsHLm7tTI/vDuFfksW1SqVjIYwAm', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `student_no` (`student_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
