-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 29, 2009 at 01:00 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery_categeory`
--

DROP TABLE IF EXISTS `gallery_categeory`;
CREATE TABLE IF NOT EXISTS `gallery_categeory` (
  `id` int(20) NOT NULL auto_increment,
  `catname` varchar(200) NOT NULL,
  `parentid` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  `update_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `gallery_categeory`
--

INSERT INTO `gallery_categeory` (`id`, `catname`, `parentid`, `active`, `update_date`) VALUES
(5, 'fds', 0, 0, '2009-05-27 13:25:46');
