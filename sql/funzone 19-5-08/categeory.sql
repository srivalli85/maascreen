-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2009 at 12:35 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `categeory`
--

DROP TABLE IF EXISTS `categeory`;
CREATE TABLE IF NOT EXISTS `categeory` (
  `id` int(10) NOT NULL auto_increment,
  `catname` varchar(100) NOT NULL,
  `parentid` int(10) NOT NULL,
  `active` int(2) NOT NULL default '0',
  `update_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categeory`
--

INSERT INTO `categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(66, 'movies', 0, 0, '2009-05-19 13:06:57'),
(77, 'athadu', 66, 0, '2009-05-19 17:54:41'),
(78, 'good  pictures', 0, 0, '2009-05-19 17:53:10'),
(79, 'godavari', 66, 0, '2009-05-19 17:55:02');
