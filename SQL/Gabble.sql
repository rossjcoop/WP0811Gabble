CREATE DATABASE  IF NOT EXISTS `Gabble` /*!40100 DEFAULT CHARACTER SET big5 */;
USE `Gabble`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: Gabble
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Grumbles`
--

DROP TABLE IF EXISTS `Grumbles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grumbles` (
  `id_grumble` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `datetime` datetime DEFAULT current_timestamp(),
  `status` tinyint(4) DEFAULT 1,
  `likecount` int(11) DEFAULT 0,
  `deletebut` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id_grumble`),
  UNIQUE KEY `id_UNIQUE` (`id_grumble`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grumbles`
--

LOCK TABLES `Grumbles` WRITE;
/*!40000 ALTER TABLE `Grumbles` DISABLE KEYS */;
INSERT INTO `Grumbles` VALUES (1,'jcasid2','Stinks today. Smells like nasty tacos again.','2017-08-21 23:44:21',0,3,0),(2,'jimmyj','sorry. I ate tacos again. My bad, my blunder.','2017-08-22 20:18:41',1,1,0),(5,'jimmyj','Sorry. Know I ate a fish burrito. Lots of emissions people. Sorry','2017-08-22 21:20:51',0,3,0),(6,'jcasid2','Everything stinks here!','2017-08-23 23:28:13',0,0,0),(7,'jcasid2','I hate all of this stupid shit we have to learn','2017-08-23 23:35:15',0,0,0),(8,'jcasid2','Damn it!','2017-08-23 23:38:56',0,0,0),(9,'jcasid2','Damn it. It smells like tacos!','2017-08-23 23:39:45',0,0,0),(10,'jcasid2','Damn it. It smells so bad in class today!','2017-08-23 23:40:53',0,0,0),(11,'jcasid2','Grumble it to hell!','2017-08-23 23:42:13',0,0,0),(12,'jcasid2','Dang it','2017-08-23 23:42:49',0,0,0),(13,'jcasid2','This sucks','2017-08-23 23:42:54',0,0,0),(14,'jcasid2','Las Vegas has the worst drivers in the world. Period.','2017-08-23 23:55:54',1,1,0),(15,'jcasid2','And the worst people too!','2017-08-23 23:56:14',0,0,0);
/*!40000 ALTER TABLE `Grumbles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likers`
--

DROP TABLE IF EXISTS `Likers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Likers` (
  `idLikers` int(11) NOT NULL AUTO_INCREMENT,
  `grumbId` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT 1,
  `timestamp` datetime DEFAULT current_timestamp(),
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`idLikers`),
  UNIQUE KEY `idLikers_UNIQUE` (`idLikers`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likers`
--

LOCK TABLES `Likers` WRITE;
/*!40000 ALTER TABLE `Likers` DISABLE KEYS */;
INSERT INTO `Likers` VALUES (1,'1',NULL,1,'2017-08-21 23:31:48',1),(2,'1',NULL,1,'2017-08-21 23:32:11',1),(3,'1','jcasid2',1,'2017-08-21 23:36:06',1),(4,'1',NULL,1,'2017-08-21 23:38:10',1),(5,'1',NULL,1,'2017-08-21 23:40:35',1),(6,'1','jcasid2',1,'2017-08-21 23:44:26',1),(7,'1','jcasid2',1,'2017-08-21 23:49:05',1),(8,'4','jimmyj',1,'2017-08-22 20:19:21',1),(9,'4',NULL,1,'2017-08-22 20:20:28',1),(10,'4','jimmyj',1,'2017-08-22 20:20:52',1),(11,'4',NULL,1,'2017-08-22 20:22:11',1),(12,'3','jcasid2',1,'2017-08-22 20:22:43',1),(13,'4','jcasid2',1,'2017-08-22 20:28:34',1),(14,'3','jimmyj',1,'2017-08-22 20:30:53',1),(15,'3','jcasid2',1,'2017-08-22 20:31:45',1),(16,'3','jcasid2',1,'2017-08-22 20:32:53',1),(17,'3','jcasid2',1,'2017-08-22 21:01:07',1),(18,'3','jcasid2',1,'2017-08-22 21:07:02',1),(19,'3','jcasid2',1,'2017-08-22 21:08:30',1),(20,'1','jimmyj',1,'2017-08-22 21:16:42',1),(21,'1','jimmyj',1,'2017-08-22 21:18:23',1),(22,'2','jimmyj',1,'2017-08-22 21:18:25',1),(23,'5','jimmyj',1,'2017-08-22 21:23:34',1),(24,'5','jcasid2',1,'2017-08-22 21:36:06',1),(25,'5','jcasid2',1,'2017-08-22 22:22:43',1),(26,'14','jimmyj',1,'2017-08-24 22:17:38',1);
/*!40000 ALTER TABLE `Likers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Peeps`
--

DROP TABLE IF EXISTS `Peeps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Peeps` (
  `idPeeps` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPeeps`),
  UNIQUE KEY `id_UNIQUE` (`idPeeps`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Peeps`
--

LOCK TABLES `Peeps` WRITE;
/*!40000 ALTER TABLE `Peeps` DISABLE KEYS */;
INSERT INTO `Peeps` VALUES (1,'cooperj','Ross','Cooper','cooperj83@excite.com','702-555-5555'),(2,'jcasid','Janise','Cooper','jcasid@earthlink.net','702-360-4852'),(3,'jcasid2','Janise','Cooper','cmdesign1@cox.net','glorieta'),(4,'jimmyj','Jimmy','Jacobson','jimmy@ity.com','702-555-1234'),(5,'','','','',''),(6,'','','','',''),(7,'','','','',''),(8,'','','','',''),(9,'','','','',''),(10,'rossjcoop','Ross','Cooper','cooperj83@excite.com','702-360-4852'),(11,'rossta','Ross','','',''),(12,'rossta','','','',''),(13,'overthemike','','','',''),(14,'jhcoop','','','',''),(15,'blankman','Blankman','','','');
/*!40000 ALTER TABLE `Peeps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=big5;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jcasid2','$2a$10$vGAg7tMNCiyvodg0zfGg1OQojuyO2XBROTRKOrxB.iyzIOh27Ktze'),(2,'jimmyj','$2a$10$dmohMfFQhjTCjS3c1GUznuzj7NuIIrlZW/gfLC1zpkbMEG6fHaWdK'),(3,'','$2a$10$P6XyWtcqKka2xwi3LPRTOuobc3HmwEyDSUVgfax5wsdY1Tuil36HK'),(7,'jhcoop','$2a$10$vMBHAQ0Cfb/yNsflZssLYO5lqPJrnu3z9mmGl2vwDe3gWKXudiRZS'),(8,'blankman','$2a$10$OEZ3azB8mvQIQT7hys3.a.xWTtoXtX44Rrz2fOeZo.TRR6G8B5HF.');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-25  1:52:56
