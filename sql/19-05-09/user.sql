
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('admin','user') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert  into `users`(`id`,`uname`,`pass`,`type`,`active`) values (1,'admin','admin321','admin',0);
