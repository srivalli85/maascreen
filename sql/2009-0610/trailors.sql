-- phpMyAdmin SQL Dump
-- version 3.1.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2009 at 05:18 AM
-- Server version: 5.1.32
-- PHP Version: 5.2.9-1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `trailors`
--

DROP TABLE IF EXISTS `trailors`;
CREATE TABLE IF NOT EXISTS `trailors` (
  `t_id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) DEFAULT NULL,
  `trailor_name` varchar(100) NOT NULL,
  `time_sec` varchar(10) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `on_date` date NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `trailors`
--

INSERT INTO `trailors` (`t_id`, `movie_id`, `trailor_name`, `time_sec`, `insert_date`, `on_date`, `active`) VALUES
(67, 6, '', '01:55:42', '2009-06-03 18:17:24', '2009-06-03', 1),
(64, 4, '', '00:10:20', '2009-06-03 18:14:02', '2009-06-03', 1),
(65, 5, '', '01:55:42', '2009-06-03 18:16:36', '2009-06-03', 1),
(70, 8, '', '02:02', '2009-06-09 17:42:03', '2009-02-02', 1),
(71, 9, '', '02:02', '2009-06-09 18:31:38', '0000-00-00', 1),
(72, 9, '', '02:02', '2009-06-09 18:32:16', '2009-02-02', 1),
(73, 10, '', '02:02', '2009-06-09 18:33:04', '2009-02-02', 1),
(60, 3, '', '01:55:42', '2009-06-02 12:25:59', '2009-06-01', 1),
(69, 8, '', '02:02', '2009-06-09 17:41:24', '2009-02-02', 1),
(74, 9, 'trailor 1', '01:55:42', '2009-06-10 10:03:25', '2009-06-10', 1),
(75, 8, 'trailor 2', '00:10:20', '2009-06-10 10:04:49', '2009-06-10', 1);
