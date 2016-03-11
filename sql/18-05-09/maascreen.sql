/*Table structure for table `int_goss` */

DROP TABLE IF EXISTS `int_goss`;

CREATE TABLE `int_goss` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `on_date` date DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `type` enum('Interview','Gossips') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `int_goss_media` */

DROP TABLE IF EXISTS `int_goss_media`;

CREATE TABLE `int_goss_media` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `int_goss_id` int(10) DEFAULT NULL,
  `media_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_type` enum('Image','Video') COLLATE utf8_unicode_ci DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


