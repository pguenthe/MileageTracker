CREATE DATABASE  IF NOT EXISTS `mileage` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mileage`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: mileage
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `mileage`
--

DROP TABLE IF EXISTS `mileage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mileage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `mileage` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `gallons` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mileage`
--

LOCK TABLES `mileage` WRITE;
/*!40000 ALTER TABLE `mileage` DISABLE KEYS */;
INSERT INTO `mileage` VALUES (5,17,'2016-09-18 04:00:00',1000,1,10,10),(6,17,'2016-09-19 04:00:00',1290,1.2,9.8,11),(7,17,'2016-09-20 04:00:00',1610,1.2,10.1,12.12),(8,17,'2016-09-22 04:00:00',1990,1.4,10.9,17),(9,17,'2016-09-13 04:00:00',696,1.1,9.87,11),(13,17,'2016-10-10 04:00:00',2600,2.199,10,21.99),(14,17,'2016-10-09 04:00:00',2300,2.349,10.1,23.73),(15,17,'2016-10-11 04:00:00',2750,2.159,6,13),(19,17,'2016-10-13 04:00:00',3301,2.299,10.1,23.3),(20,17,'2016-10-12 04:00:00',3010,2.349,8.9,19),(21,17,'2016-10-14 04:00:00',3605,2.149,10.1,21.7),(22,17,'2016-10-15 04:00:00',3875,1.999,9.1,18.1),(23,17,'2016-10-15 04:00:00',4150,2.199,9.999,21.89),(24,17,'2016-10-16 04:00:00',4440,2.399,10.2,24.45);
/*!40000 ALTER TABLE `mileage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (15,'blank','DEqSrgjvKNfX/BCKrUau3gnAmCdQqaLzg4SdB36j/sh1+FEcYGgkm2ALAvLyx7H5','Peter'),(16,'bad','2Nm//rELzpLOoD/Nwyws9B2VZv2307xBIvSo5fr8EUW7rOLwAiMFqmp7nJSS6t48','Peter'),(17,'peter@grandcircus.co','hFky2b2c77krGcZkP3xVBnfBIkjokck2k+Xm+HHdZ2CDGD3T5f9uJBbQJ5/OBF8l','Peter');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-11 14:43:59
