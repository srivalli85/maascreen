/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.0.51a-community-nt : Database - maascreen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(10) NOT NULL auto_increment,
  `movie_id` int(10) default NULL,
  `punchline` varchar(70) collate utf8_unicode_ci default NULL,
  `genre` varchar(70) collate utf8_unicode_ci default NULL,
  `type` varchar(100) collate utf8_unicode_ci default NULL,
  `banner` varchar(100) collate utf8_unicode_ci default NULL,
  `cast` varchar(100) collate utf8_unicode_ci default NULL,
  `art` varchar(100) collate utf8_unicode_ci default NULL,
  `music` varchar(100) collate utf8_unicode_ci default NULL,
  `cinematography` varchar(500) collate utf8_unicode_ci default NULL,
  `editing` varchar(100) collate utf8_unicode_ci default NULL,
  `story` varchar(100) collate utf8_unicode_ci default NULL,
  `screenplay` varchar(100) collate utf8_unicode_ci default NULL,
  `direction` varchar(100) collate utf8_unicode_ci default NULL,
  `producer` varchar(100) collate utf8_unicode_ci default NULL,
  `summary` text collate utf8_unicode_ci,
  `description` text collate utf8_unicode_ci,
  `image` tinyint(1) default '1',
  `active` tinyint(1) default '0',
  `insert_data` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
