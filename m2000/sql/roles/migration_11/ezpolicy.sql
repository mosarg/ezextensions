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
-- Table structure for table `ezpolicy`
--

DROP TABLE IF EXISTS `ezpolicy`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ezpolicy` (
  `function_name` varchar(255) default NULL,
  `id` int(11) NOT NULL auto_increment,
  `module_name` varchar(255) default NULL,
  `role_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=710 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES ('*',308,'*',2),('read',356,'content',4),('create',357,'content',4),('create',358,'content',4),('create',359,'content',4),('edit',360,'content',4),('selfedit',361,'user',4),('use',362,'notification',4),('administrate',363,'shop',4),('create',511,'content',5),('create',512,'content',5),('create',513,'content',5),('edit',514,'content',5),('selfedit',515,'user',5),('use',516,'notification',5),('buy',517,'shop',5),('password',518,'user',5),('*',519,'objectrelationbrowse',5),('*',520,'ezapprove2',5),('login',568,'user',3),('create',569,'content',3),('create',570,'content',3),('create',571,'content',3),('create',572,'content',3),('create',573,'content',3),('create',574,'content',3),('use',575,'websitetoolbar',3),('edit',576,'content',3),('read',577,'content',3),('use',578,'notification',3),('manage_locations',579,'content',3),('*',580,'ezodf',3),('administrate',581,'shop',3),('diff',582,'content',3),('versionread',583,'content',3),('versionremove',584,'content',3),('remove',585,'content',3),('translate',586,'content',3),('feed',587,'rss',3),('pendinglist',588,'content',3),('*',589,'*',3),('*',590,'ezoe',3),('activation',591,'utils',3),('login',640,'user',6),('create',641,'content',6),('create',642,'content',6),('create',643,'content',6),('create',644,'content',6),('create',645,'content',6),('create',646,'content',6),('use',647,'websitetoolbar',6),('edit',648,'content',6),('read',649,'content',6),('use',650,'notification',6),('manage_locations',651,'content',6),('*',652,'ezodf',6),('diff',653,'content',6),('versionread',654,'content',6),('versionremove',655,'content',6),('remove',656,'content',6),('translate',657,'content',6),('feed',658,'rss',6),('*',659,'*',6),('*',660,'ezoe',6),('*',661,'content',6),('read',702,'content',1),('pdf',703,'content',1),('feed',704,'rss',1),('login',705,'user',1),('login',706,'user',1),('login',707,'user',1),('read',708,'content',1),('*',709,'user2',1);
/*!40000 ALTER TABLE `ezpolicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-23 11:55:36
