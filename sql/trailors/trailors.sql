-- phpMyAdmin SQL Dump
-- version 3.1.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 02, 2009 at 07:21 AM
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

CREATE TABLE IF NOT EXISTS `trailors` (
  `t_id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) DEFAULT NULL,
  `time_sec` varchar(10) DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `on_date` date NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `trailors`
--

INSERT INTO `trailors` (`t_id`, `movie_id`, `time_sec`, `insert_date`, `on_date`, `active`) VALUES
(60, 3, '01:55:42', '2009-06-02 12:25:59', '2009-06-01', 1);
