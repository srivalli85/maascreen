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

/*Table structure for table `keywords` */

DROP TABLE IF EXISTS `keywords`;

CREATE TABLE `keywords` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `keywords` */

insert  into `keywords`(`id`,`keywords`) values (2,'మా స్క్రీన్.కాం,సినిమా.కాం,మా సినిమా వార్తలు,తెలుగు వెబ్సైటు,మొట్ట ,ొదటి తెలుగు వెబ్సైటు,మా తెలుగు,మా తెలుగు సినిమా లు,మా ,తెలుగు హీరోలు,మా తెలుగు హీరోయినేలు,తెలుగు హీరోలు,తెలుగు ,ీరోయిన్ లు,తెలుగు సినిమా పుకార్లు,సినిమా వేల,తెలుగు.కాం,తెలుగు ,వెబ్సైటు.కాం,తెలుగువారు.కాం,ఆల్ తెలుగు.కాం,సినిమా.కాం,ఆల టైం ,రికార్డు సినిమాలు,ఆల్ టైం రికార్డ్స్,మా సినిమాలు,మీ కోసం,');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
