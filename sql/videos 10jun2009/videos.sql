-- phpMyAdmin SQL Dump
-- version 2.11.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2009 at 10:59 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `maascreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(20) NOT NULL auto_increment,
  `video_cat_id` int(20) NOT NULL,
  `name` varchar(400) NOT NULL,
  `videouploaded` tinyint(10) NOT NULL default '0',
  `no_of_views` int(20) NOT NULL,
  `active` int(10) NOT NULL,
  `insert_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `last_viewed` date NOT NULL,
  `time` varchar(10) NOT NULL default '00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_cat_id`, `name`, `videouploaded`, `no_of_views`, `active`, `insert_date`, `last_viewed`, `time`) VALUES
(24, 3, 'katrina', 1, 12000, 0, '2009-03-06 18:56:04', '0000-00-00', '00:00'),
(25, 1, 'vodafone1', 1, 1200, 0, '2009-06-06 11:13:51', '0000-00-00', '00:00'),
(27, 4, 'burru pitta', 1, 12000, 0, '2009-04-10 11:16:35', '0000-00-00', '00:00'),
(29, 5, 'vana', 1, 12000, 0, '2009-04-10 11:17:38', '0000-00-00', '00:00'),
(30, 4, 'chitti miriyalu', 1, 1200, 0, '2009-03-10 11:59:12', '0000-00-00', '00:00');
