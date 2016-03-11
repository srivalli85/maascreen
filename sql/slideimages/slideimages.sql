-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 04, 2009 at 07:09 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `slideimages`
--

DROP TABLE IF EXISTS `slideimages`;
CREATE TABLE IF NOT EXISTS `slideimages` (
  `id` int(10) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `slideimages`
--

INSERT INTO `slideimages` (`id`, `title`) VALUES
(13, 'hello'),
(15, 'octavio funny show'),
(16, 'ravi teja kick movie'),
(18, '');
