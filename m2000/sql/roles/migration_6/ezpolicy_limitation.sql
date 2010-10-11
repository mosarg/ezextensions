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
-- Table structure for table `ezpolicy_limitation`
--

DROP TABLE IF EXISTS `ezpolicy_limitation`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL auto_increment,
  `identifier` varchar(255) NOT NULL default '',
  `policy_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=541 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (272,'Section',356),(273,'Class',357),(274,'Section',357),(275,'ParentClass',357),(276,'Class',358),(277,'Section',358),(278,'ParentClass',358),(279,'Class',359),(280,'Section',359),(281,'ParentClass',359),(282,'Class',360),(283,'Section',360),(284,'Owner',360),(417,'Class',511),(418,'Section',511),(419,'ParentClass',511),(420,'Class',512),(421,'Section',512),(422,'ParentClass',512),(423,'Class',513),(424,'Section',513),(425,'ParentClass',513),(426,'Class',514),(427,'Section',514),(428,'Owner',514),(453,'Class',569),(454,'Class',570),(455,'ParentClass',570),(456,'Class',571),(457,'ParentClass',571),(458,'Class',572),(459,'ParentClass',572),(460,'Class',573),(461,'ParentClass',573),(462,'Class',574),(463,'ParentClass',574),(464,'Section',577),(489,'Class',641),(490,'Class',642),(491,'ParentClass',642),(492,'Class',643),(493,'ParentClass',643),(494,'Class',644),(495,'ParentClass',644),(496,'Class',645),(497,'ParentClass',645),(498,'Class',646),(499,'ParentClass',646),(500,'Section',649),(532,'Section',702),(533,'StateGroup_ready_workinprogress',702),(534,'Section',703),(535,'SiteAccess',705),(536,'SiteAccess',706),(537,'SiteAccess',707),(540,'Section',708);
/*!40000 ALTER TABLE `ezpolicy_limitation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-12 15:13:19
