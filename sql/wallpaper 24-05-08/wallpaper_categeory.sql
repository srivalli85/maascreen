-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 26, 2009 at 05:50 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `wallpaper_categeory`
--

DROP TABLE IF EXISTS `wallpaper_categeory`;
CREATE TABLE IF NOT EXISTS `wallpaper_categeory` (
  `id` int(20) NOT NULL auto_increment,
  `catname` varchar(100) NOT NULL,
  `parentid` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  `update_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `wallpaper_categeory`
--

INSERT INTO `wallpaper_categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(1, 'gv', 0, 0, '2009-05-25 18:00:15'),
(2, 'gv', 0, 0, '2009-05-25 18:00:36'),
(3, 'fsaf', 1, 0, '2009-05-26 09:52:06'),
(9, 'sffgjh', 2, 0, '2009-05-26 10:41:45'),
(10, 'gfjh', 2, 0, '2009-05-26 10:41:49'),
(11, 'hgjkg', 2, 0, '2009-05-26 10:41:52'),
(12, 'ghkjm', 2, 0, '2009-05-26 10:41:55');
