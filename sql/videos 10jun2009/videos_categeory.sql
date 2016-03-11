-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2009 at 11:02 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `videos_categeory`
--

DROP TABLE IF EXISTS `videos_categeory`;
CREATE TABLE IF NOT EXISTS `videos_categeory` (
  `id` int(20) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL,
  `insert_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `active` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `videos_categeory`
--

INSERT INTO `videos_categeory` (`id`, `name`, `insert_date`, `active`) VALUES
(1, 'vodafone12', '2009-06-08 11:57:55', 0);
