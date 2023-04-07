DROP SCHEMA IF EXISTS `hb1-one-to-one`;

CREATE SCHEMA `hb1-one-to-one`;

use `hb1-one-to-one`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `course_detail`;

CREATE TABLE `course_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_price` varchar(128) DEFAULT NULL,
  `course_channel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  `course_website` varchar(45) DEFAULT NULL,
  `course_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DETAIL_idx` (`course_detail_id`),
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`course_detail_id`) REFERENCES `course_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
