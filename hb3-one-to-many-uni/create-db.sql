DROP SCHEMA IF EXISTS `hb3-one-to-many-uni`;

CREATE SCHEMA `hb3-one-to-many-uni`;

use `hb3-one-to-many-uni`;

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
  CONSTRAINT `FK_DETAIL` FOREIGN KEY (`course_detail_id`) 
  REFERENCES `course_detail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `course_section`;

CREATE TABLE `course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`),
  
  UNIQUE KEY `TITLE_UNIQUE` (`title`),
  
  KEY `FK_COURSE_idx` (`course_id`),
  
  CONSTRAINT `FK_COURSE` 
  FOREIGN KEY (`course_id`) 
  REFERENCES `course` (`id`) 
  
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(256) DEFAULT NULL,
  `course_section_id` int(11) DEFAULT NULL,

  PRIMARY KEY (`id`),

  KEY `FK_SECTIONS_ID_idx` (`course_section_id`),

  CONSTRAINT `FK_SECTIONS` 
  FOREIGN KEY (`course_section_id`) 
  REFERENCES `course_section` (`id`) 

  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


SET FOREIGN_KEY_CHECKS = 1;
