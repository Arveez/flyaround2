-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: flyaround2
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nbFreeSeats` smallint(6) NOT NULL,
  `seatPrice` double NOT NULL,
  `takeOffTime` datetime NOT NULL,
  `publicationDate` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `wasDone` tinyint(1) NOT NULL,
  `departure_id` int(11) NOT NULL,
  `arrival_id` int(11) NOT NULL,
  `plane_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C257E60E7704ED06` (`departure_id`),
  KEY `IDX_C257E60E62789708` (`arrival_id`),
  KEY `IDX_C257E60EF53666A8` (`plane_id`),
  CONSTRAINT `FK_C257E60E62789708` FOREIGN KEY (`arrival_id`) REFERENCES `terrain` (`id`),
  CONSTRAINT `FK_C257E60E7704ED06` FOREIGN KEY (`departure_id`) REFERENCES `terrain` (`id`),
  CONSTRAINT `FK_C257E60EF53666A8` FOREIGN KEY (`plane_id`) REFERENCES `plane_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,100,99,'2012-01-01 00:00:00','2012-01-01 00:00:00','titanic style first flight',0,4,5,1),(2,400,45,'2012-01-01 00:00:00','2012-01-01 00:00:00','sqd',0,5,6,2),(3,2,234,'2012-01-01 00:00:00','2012-01-01 00:00:00','qsdfqsdf\r\nqmlsdkjfqsmldkfjq',1,4,4,3),(4,2,234,'2012-01-01 00:00:00','2012-01-01 00:00:00','qsdfqsdf',1,4,4,3),(5,1,2345,'2012-01-01 00:00:00','2012-01-01 00:00:00','qsdf',0,4,4,3);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_user`
--

DROP TABLE IF EXISTS `flight_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_user` (
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`flight_id`,`user_id`),
  KEY `IDX_CAD8B2E91F478C5` (`flight_id`),
  KEY `IDX_CAD8B2EA76ED395` (`user_id`),
  CONSTRAINT `FK_CAD8B2E91F478C5` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CAD8B2EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_user`
--

LOCK TABLES `flight_user` WRITE;
/*!40000 ALTER TABLE `flight_user` DISABLE KEYS */;
INSERT INTO `flight_user` VALUES (1,1),(2,1),(2,2),(2,3),(3,1),(3,2),(4,3),(5,2),(5,3);
/*!40000 ALTER TABLE `flight_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plane_model`
--

DROP TABLE IF EXISTS `plane_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plane_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cruiseSpeed` smallint(6) NOT NULL,
  `planeNbSeats` smallint(6) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plane_model`
--

LOCK TABLES `plane_model` WRITE;
/*!40000 ALTER TABLE `plane_model` DISABLE KEYS */;
INSERT INTO `plane_model` VALUES (1,'777','BOEING',900,400,1),(2,'A-343','Airbus',980,400,1),(3,'zero','mitsubishi',300,2,0);
/*!40000 ALTER TABLE `plane_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nbReservedSeats` smallint(6) NOT NULL,
  `publicationDate` datetime NOT NULL,
  `wasDone` tinyint(1) NOT NULL,
  `flight_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C8495591F478C5` (`flight_id`),
  CONSTRAINT `FK_42C8495591F478C5` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,2,'2012-01-01 00:00:00',0,1),(2,1,'2012-01-01 00:00:00',0,4),(3,3,'2012-01-01 00:00:00',0,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `publicationDate` datetime NOT NULL,
  `note` smallint(6) NOT NULL,
  `review_author_id` int(11) DEFAULT NULL,
  `user_rated_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_794381C66184681A` (`review_author_id`),
  KEY `IDX_794381C6AA3E2149` (`user_rated_id`),
  CONSTRAINT `FK_794381C66184681A` FOREIGN KEY (`review_author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_794381C6AA3E2149` FOREIGN KEY (`user_rated_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'oulala !','2012-01-01 00:00:00',2,1,2),(2,'bof','2012-01-01 00:00:00',3,3,2);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terrain`
--

DROP TABLE IF EXISTS `terrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terrain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `icao` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terrain`
--

LOCK TABLES `terrain` WRITE;
/*!40000 ALTER TABLE `terrain` DISABLE KEYS */;
INSERT INTO `terrain` VALUES (4,'Belfast International Airport','EGAA',1234,2345,'Aldergrove, county Antrim','Belfast','234','Ireland'),(5,'London City Airport','EGLC',2345,2345,'Silvertown','London','132','england'),(6,'Helsinki-Malmi Airport','EFHF',21345,245,'','Helsinki','234','Finland');
/*!40000 ALTER TABLE `terrain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `phoneNumber` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `birthDate` date NOT NULL,
  `creationDate` datetime NOT NULL,
  `role` smallint(6) DEFAULT NULL,
  `isACertifiedPilot` tinyint(1) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'JD','john','doe','qsdf@qsdf.qsdf','003 34 5689 954 33','2012-01-03','2017-09-10 00:00:00',0,1,1),(2,'PJ','Patrick','Johnson','lskqdf@sdf.qdsf','45 945 459 3','2012-01-01','2012-01-01 00:00:00',1,0,0),(3,'PK','Patrick','Kernel','qsmdlfj@qsdf.mlj','2','2012-01-01','2012-01-01 00:00:00',0,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reservation`
--

DROP TABLE IF EXISTS `user_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_reservation` (
  `user_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`reservation_id`),
  KEY `IDX_EBD380C0A76ED395` (`user_id`),
  KEY `IDX_EBD380C0B83297E7` (`reservation_id`),
  CONSTRAINT `FK_EBD380C0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_EBD380C0B83297E7` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reservation`
--

LOCK TABLES `user_reservation` WRITE;
/*!40000 ALTER TABLE `user_reservation` DISABLE KEYS */;
INSERT INTO `user_reservation` VALUES (1,1),(2,1),(2,3);
/*!40000 ALTER TABLE `user_reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-26 13:29:14
