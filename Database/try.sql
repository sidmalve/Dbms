-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2020 at 09:41 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `try`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE `abilities` (
  `player_id` int(11) NOT NULL,
  `speed` int(2) NOT NULL,
  `curve` int(2) NOT NULL,
  `pass` int(2) NOT NULL,
  `stamina` int(2) NOT NULL,
  `ball_control` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abilities`
--

INSERT INTO `abilities` (`player_id`, `speed`, `curve`, `pass`, `stamina`, `ball_control`) VALUES
(123246, 55, 55, 55, 55, 55);

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `Club_id` int(11) NOT NULL,
  `club_name` varchar(50) NOT NULL,
  `Manager` varchar(50) NOT NULL,
  `homeground` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`Club_id`, `club_name`, `Manager`, `homeground`) VALUES
(1116, 'barcelona', 'will', 'hamsterdam'),
(1122, 'kkr', 'srk', 'kolkatta');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `nationality` varchar(20) NOT NULL,
  `position` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `age` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_name`, `nationality`, `position`, `dob`, `age`) VALUES
(123246, 'lll', 'lll', 'Defender', '2004-12-26', 16);

-- --------------------------------------------------------

--
-- Table structure for table `player_stats`
--

CREATE TABLE `player_stats` (
  `player_id` int(11) NOT NULL,
  `goals` int(4) NOT NULL,
  `hgoal` int(2) NOT NULL,
  `penalty` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `player_stats`
--

INSERT INTO `player_stats` (`player_id`, `goals`, `hgoal`, `penalty`) VALUES
(123246, 555, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `playfor`
--

CREATE TABLE `playfor` (
  `player_fk` int(11) NOT NULL,
  `club_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `playfor`
--

INSERT INTO `playfor` (`player_fk`, `club_fk`) VALUES
(123246, 1122);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `Club_id` int(11) NOT NULL,
  `wins` int(10) NOT NULL,
  `losses` int(10) NOT NULL,
  `wah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`Club_id`, `wins`, `losses`, `wah`) VALUES
(1116, 15, 12, 8),
(1122, 52, 5, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`Club_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_stats`
--
ALTER TABLE `player_stats`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `playfor`
--
ALTER TABLE `playfor`
  ADD PRIMARY KEY (`player_fk`),
  ADD KEY `player_fk` (`player_fk`,`club_fk`),
  ADD KEY `club_fk` (`club_fk`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`Club_id`),
  ADD KEY `Club_id` (`Club_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `Club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1123;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123248;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abilities`
--
ALTER TABLE `abilities`
  ADD CONSTRAINT `abilities_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_stats`
--
ALTER TABLE `player_stats`
  ADD CONSTRAINT `player_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE;

--
-- Constraints for table `playfor`
--
ALTER TABLE `playfor`
  ADD CONSTRAINT `playfor_ibfk_1` FOREIGN KEY (`player_fk`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `playfor_ibfk_2` FOREIGN KEY (`club_fk`) REFERENCES `club` (`Club_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stats`
--
ALTER TABLE `stats`
  ADD CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`Club_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
