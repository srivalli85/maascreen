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
-- Table structure for table `wallpaper_images`
--

DROP TABLE IF EXISTS `wallpaper_images`;
CREATE TABLE IF NOT EXISTS `wallpaper_images` (
  `id` int(20) NOT NULL auto_increment,
  `parentid` int(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `active` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `wallpaper_images`
--

