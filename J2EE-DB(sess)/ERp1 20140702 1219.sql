-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.68-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema erprac2
--

CREATE DATABASE IF NOT EXISTS erprac2;
USE erprac2;

--
-- Definition of table `interfaces`
--

DROP TABLE IF EXISTS `interfaces`;
CREATE TABLE `interfaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(45) NOT NULL,
  `display_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interfaces`
--

/*!40000 ALTER TABLE `interfaces` DISABLE KEYS */;
INSERT INTO `interfaces` (`id`,`url`,`display_name`) VALUES 
 (1,'admin.jsp','Hello'),
 (2,'cart.jsp','My Cart'),
 (3,'product.jsp','My Products'),
 (4,'usermanage.jsp','My User management');
/*!40000 ALTER TABLE `interfaces` ENABLE KEYS */;


--
-- Definition of table `login_session`
--

DROP TABLE IF EXISTS `login_session`;
CREATE TABLE `login_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `in_time` date NOT NULL,
  `out_time` date NOT NULL,
  `user_login_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_session_user_login1_idx` (`user_login_id`),
  CONSTRAINT `fk_login_session_user_login1` FOREIGN KEY (`user_login_id`) REFERENCES `user_login` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_session`
--

/*!40000 ALTER TABLE `login_session` DISABLE KEYS */;
INSERT INTO `login_session` (`id`,`ip_address`,`in_time`,`out_time`,`user_login_id`) VALUES 
 (1,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (2,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (3,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (4,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (5,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (6,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (7,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1),
 (8,'0:0:0:0:0:0:0:1','2014-07-02','2014-07-02',1);
/*!40000 ALTER TABLE `login_session` ENABLE KEYS */;


--
-- Definition of table `privilage`
--

DROP TABLE IF EXISTS `privilage`;
CREATE TABLE `privilage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `interfaces_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_privilage_user_type1_idx` (`user_type_id`),
  KEY `fk_privilage_interfaces1_idx` (`interfaces_id`),
  CONSTRAINT `fk_privilage_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_privilage_interfaces1` FOREIGN KEY (`interfaces_id`) REFERENCES `interfaces` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `privilage`
--

/*!40000 ALTER TABLE `privilage` DISABLE KEYS */;
INSERT INTO `privilage` (`id`,`user_type_id`,`interfaces_id`) VALUES 
 (1,1,1),
 (2,2,1),
 (3,2,2),
 (4,2,3),
 (5,2,4),
 (6,3,3),
 (7,4,2);
/*!40000 ALTER TABLE `privilage` ENABLE KEYS */;


--
-- Definition of table `session_activities`
--

DROP TABLE IF EXISTS `session_activities`;
CREATE TABLE `session_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_des` varchar(45) NOT NULL,
  `login_session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_session_activities_login_session1_idx` (`login_session_id`),
  CONSTRAINT `fk_session_activities_login_session1` FOREIGN KEY (`login_session_id`) REFERENCES `login_session` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session_activities`
--

/*!40000 ALTER TABLE `session_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_activities` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`u_name`,`password`,`first_name`,`last_name`,`email`,`address`,`mobile`,`user_type_id`) VALUES 
 (1,'lak','123','l','n','n@gmail.com','asd','234',1),
 (2,'nav','45','na','va','na@gmail.com','cvb','890',4);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_login_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_login_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login`
--

/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` (`id`,`username`,`password`,`user_id`) VALUES 
 (1,'lak','123',1),
 (2,'nav','456',2);
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;


--
-- Definition of table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE `user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` (`id`,`type_name`) VALUES 
 (1,'admin'),
 (2,'both'),
 (3,'seller'),
 (4,'buyer');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
