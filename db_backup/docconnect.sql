-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2026 at 11:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@hotmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `dno` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `phono` varchar(15) NOT NULL,
  `expertise` varchar(20) NOT NULL,
  `experience` varchar(15) NOT NULL,
  `qualification` varchar(90) NOT NULL,
  `start_time` varchar(20) NOT NULL,
  `end_time` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `yop` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`dno`, `name`, `email`, `price`, `pass`, `phono`, `expertise`, `experience`, `qualification`, `start_time`, `end_time`, `status`, `place`, `address`, `yop`) VALUES
(2, 'sanji', 'sanji@gmail.com', '500', '123', '1234567890', 'Family Physicians', '2', 'mbbs', '19:23', '19:23', 'pending', 'clinic', 'qwertyukl', '2026-01-06'),
(4, 'test doctor', 'test@gmail.com', '500', '123', '1234567890', 'Family Physicians', '2', 'mbbs', '10:00', '15:00', 'approved', 'clinic', '123 street', '2024-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `passwords` varchar(20) DEFAULT NULL,
  `phno` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `gender` char(6) NOT NULL,
  `bloodg` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `fname`, `email`, `passwords`, `phno`, `DOB`, `gender`, `bloodg`) VALUES
(1, 'goku', 'goku@gmail.com', 'goku123', '1234567890', '1999-06-15', 'male', 'A+'),
(2, 'test user', 'test123@gmail.com', '123', '1234567890', '2005-02-16', 'male', 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `zappointments`
--

CREATE TABLE `zappointments` (
  `appointid` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `dno` int(10) NOT NULL,
  `bookdate` date NOT NULL,
  `visitdate` date NOT NULL,
  `visittime` datetime(6) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `details` varchar(100) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`dno`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `zappointments`
--
ALTER TABLE `zappointments`
  ADD PRIMARY KEY (`appointid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `dno` (`dno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `dno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zappointments`
--
ALTER TABLE `zappointments`
  MODIFY `appointid` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `zappointments`
--
ALTER TABLE `zappointments`
  ADD CONSTRAINT `zappointments_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zappointments_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `doctors` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
