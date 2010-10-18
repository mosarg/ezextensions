-- MySQL dump 10.11
--
-- Host: localhost    Database: m2000
-- ------------------------------------------------------
-- Server version	5.0.77-1-log

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
-- Table structure for table `ezcontentclass_classgroup`
--

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL default '0',
  `contentclass_version` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  `group_name` varchar(255) default NULL,
  PRIMARY KEY  (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ezcontentclass_classgroup`
--

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclass_classgroup` VALUES (1,0,1,'Content'),(3,0,2,'Users'),(4,0,2,'Users'),(11,0,1,'Content'),(13,0,1,'Content'),(14,0,4,'Setup'),(15,0,4,'Setup'),(16,0,1,'Content'),(17,0,1,'Content'),(18,0,1,'Content'),(19,0,1,'Content'),(20,0,1,'Content'),(21,0,1,'Content'),(22,0,1,'Content'),(23,0,1,'Content'),(24,0,1,'Content'),(45,0,1,'Content'),(47,0,2,'Users'),(61,1,5,'Helpers'),(70,0,5,'Helpers'),(73,0,1,'Content'),(73,1,1,'Content'),(74,0,1,'Content'),(76,0,1,'Content'),(77,0,1,'Content'),(78,0,2,'Users'),(79,0,2,'Users'),(80,0,2,'Users'),(82,0,1,'Content'),(83,0,1,'Content'),(84,0,1,'Content'),(85,0,3,'Media'),(86,0,3,'Media'),(87,0,3,'Media'),(88,0,3,'Media'),(89,0,1,'Content'),(90,0,3,'Media'),(91,0,3,'Media'),(92,0,3,'Media'),(93,0,3,'Media'),(94,0,1,'Content'),(95,0,1,'Content'),(96,0,1,'Content'),(97,0,1,'Content'),(98,0,1,'Content'),(99,0,1,'Content'),(100,0,1,'Content'),(101,0,1,'Content'),(102,0,3,'Media'),(103,0,1,'Content'),(104,0,1,'Content'),(105,0,1,'Content'),(106,0,1,'Content'),(107,0,1,'Content'),(108,0,1,'Content'),(109,0,1,'Content'),(110,0,1,'Content'),(111,0,1,'Content');
/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-01  9:41:11
