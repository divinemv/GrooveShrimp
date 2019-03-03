-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 01, 2018 at 10:06 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.1.16

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `divinevelasquez`
--

-- --------------------------------------------------------

--
-- Table structure for table `SONG`
--

CREATE TABLE `SONG` (
  `Song_ID` int(11) NOT NULL,
  `Artist_ID` int(11) NOT NULL,
  `Song_Name` text NOT NULL,
  `Album_ID` int(11) NOT NULL,
  `Genre_ID` int(11) NOT NULL
);

--
-- Dumping data for table `SONG`
--

INSERT INTO `SONG` (`Song_ID`, `Artist_ID`, `Song_Name`, `Album_ID`, `Genre_ID`) VALUES
(100, 200, 'Pray You Catch Me', 300, 400),
(101, 200, 'Hold Up', 300, 400),
(102, 200, 'Dont Hurt Yourself', 300, 400),
(103, 200, 'Sorry ', 300, 400),
(104, 200, '6 Inch', 300, 400),
(105, 200, 'Daddy Lessons', 300, 400),
(106, 200, 'Love Drought', 300, 400),
(107, 200, 'Sandcastles', 300, 400),
(108, 200, 'Forward', 300, 400),
(109, 200, 'Freedom', 300, 400),
(110, 200, 'All Night', 300, 400),
(111, 201, 'Intro', 301, 401),
(112, 201, 'KOD', 301, 401),
(113, 201, 'Photograph', 301, 401),
(114, 201, 'The Cut Off', 301, 401),
(115, 201, 'ATM', 301, 401),
(116, 201, 'Motiv8', 301, 401),
(117, 201, 'Kevins Heart', 301, 401),
(118, 201, 'BRACKETS', 301, 401),
(119, 201, 'Once an Addict', 301, 401),
(120, 201, 'FRIENDS', 301, 401),
(121, 201, 'Window Pain', 301, 401),
(122, 201, '1985', 301, 401),
(123, 202, 'Hometown', 302, 402),
(124, 202, 'What Ifs', 302, 402),
(125, 202, 'Learning', 302, 402),
(126, 202, 'Thunder in the Rain', 302, 402),
(127, 202, 'Pull tt Off', 302, 402),
(128, 202, 'Cold Spot', 302, 402),
(129, 202, 'Aint No Stopping Us Now', 302, 402),
(130, 202, 'Comeback', 302, 402),
(131, 202, 'Rockstars', 302, 402),
(132, 202, 'Better Place', 302, 402),
(133, 202, 'Granddaddys Chair', 302, 402),
(134, 203, 'Call Out My Name', 303, 403),
(135, 203, 'Try Me', 303, 403),
(136, 203, 'Wasted Times', 303, 403),
(137, 203, 'I Was Never There', 303, 403),
(138, 203, 'Hurt You', 303, 403),
(139, 203, 'Privilege', 303, 403),
(140, 204, 'Confrontation', 304, 404),
(141, 204, 'There For You', 304, 404),
(142, 204, 'There For You', 304, 404),
(143, 204, 'Welcome To Jamrock', 304, 404);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `SONG`
--
-- ALTER TABLE `SONG`
--   ADD PRIMARY KEY (`Song_ID`);
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
