-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 03, 2018 at 07:41 PM
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
-- Table structure for table `ALBUM`
--

CREATE TABLE `ALBUM` (
  `Album_ID` int(11) NOT NULL,
  `Artist_ID` int(11) NOT NULL,
  `Album_Name` text NOT NULL,
  `Year` int(4) NOT NULL
);

--
-- Dumping data for table `ALBUM`
--

INSERT INTO `ALBUM` (`Album_ID`, `Artist_ID`, `Album_Name`, `Year`) VALUES
(300, 200, 'Lemonade', 2016),
(301, 201, 'KOD', 2018),
(302, 202, 'Kane Brown', 2016),
(303, 203, 'My Dear Melancholy', 2018),
(304, 204, 'Welcome To Jamrock', 2005),
(305, 205, 'Purpose', 2015),
(306, 206, 'Hopeless Fountain Kingdom', 2017),
(307, 208, 'Fifteen', 2005);

-- --------------------------------------------------------

--
-- Table structure for table `ARTIST`
--

CREATE TABLE `ARTIST` (
  `Artist_ID` int(11) NOT NULL,
  `Artist_Name` text NOT NULL
);

--
-- Dumping data for table `ARTIST`
--

INSERT INTO `ARTIST` (`Artist_ID`, `Artist_Name`) VALUES
(200, 'Beyonce'),
(201, 'J. Cole'),
(202, 'Kane Brown'),
(203, 'The Weeknd'),
(204, 'Damien Marley'),
(205, 'Justin Bieber'),
(206, 'Halsey'),
(207, 'Drake'),
(208, 'Buckcherry');

-- --------------------------------------------------------

--
-- Table structure for table `COVERS`
--

CREATE TABLE `COVERS` (
  `Cover_Song_ID` int(11) NOT NULL,
  `Artist_ID` int(11) NOT NULL,
  `Song_ID` int(11) NOT NULL,
  `Video_Link` text NOT NULL
);

--
-- Dumping data for table `COVERS`
--

INSERT INTO `COVERS` (`Cover_Song_ID`, `Artist_ID`, `Song_ID`, `Video_Link`) VALUES
(900, 200, 103, 'https://www.youtube.com/watch?v=Avk_fhlMXYk'),
(901, 205, 145, 'https://www.youtube.com/watch?v=AD6yT4HmShI'),
(902, 206, 146, 'https://www.youtube.com/watch?v=Z61IuRDCC54'),
(903, 208, 147, 'https://www.youtube.com/watch?v=UW37MNg8jYs');

-- --------------------------------------------------------

--
-- Table structure for table `GENRE`
--

CREATE TABLE `GENRE` (
  `Genre_ID` int(11) NOT NULL,
  `Genre_Name` text NOT NULL
);

--
-- Dumping data for table `GENRE`
--

INSERT INTO `GENRE` (`Genre_ID`, `Genre_Name`) VALUES
(400, 'Pop'),
(401, 'Rap'),
(402, 'Country'),
(403, 'R&B'),
(404, 'Disco'),
(405, 'Alternative/Indie'),
(406, 'Reggae'),
(407, 'Rock'),
(408, 'Blues'),
(409, 'Hip-Hop');

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
(143, 204, 'Welcome To Jamrock', 304, 404),
(144, 207, 'Nice For What', 0, 401),
(145, 205, 'Sorry', 305, 400),
(146, 206, 'Sorry', 306, 405),
(147, 208, 'Sorry', 307, 407);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ALBUM`
--
-- ALTER TABLE `ALBUM`
--   ADD PRIMARY KEY (`Album_ID`);

-- --
-- -- Indexes for table `ARTIST`
-- --
-- ALTER TABLE `ARTIST`
--   ADD PRIMARY KEY (`Artist_ID`);

-- --
-- -- Indexes for table `COVERS`
-- --
-- ALTER TABLE `COVERS`
--   ADD PRIMARY KEY (`Cover_Song_ID`);

-- --
-- -- Indexes for table `GENRE`
-- --
-- ALTER TABLE `GENRE`
--   ADD PRIMARY KEY (`Genre_ID`);

-- --
-- -- Indexes for table `SONG`
-- --
-- ALTER TABLE `SONG`
--   ADD PRIMARY KEY (`Song_ID`);
-- COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
