/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.1.32-community-log : Database - maascreen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`maascreen` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) DEFAULT NULL,
  `punchline` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genre` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `art` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `music` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cinematography` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stunts` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editing` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `story` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenplay` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producer` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `rating` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` tinyint(1) DEFAULT '1',
  `active` tinyint(1) DEFAULT '0',
  `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
