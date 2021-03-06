-- phpMyAdmin SQL Dump
-- version 3.1.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2009 at 12:34 PM
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
-- Table structure for table `int_goss_media`
--

DROP TABLE IF EXISTS `int_goss_media`;
CREATE TABLE IF NOT EXISTS `int_goss_media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `int_goss_id` int(10) DEFAULT NULL,
  `media_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_type` enum('Image','Video') COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;
