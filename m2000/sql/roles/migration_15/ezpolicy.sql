-- MySQL dump 10.13  Distrib 5.1.55, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: eztest2
-- ------------------------------------------------------
-- Server version	5.1.55-1

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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy` (
  `function_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2024 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES ('*',308,'*',2),('read',356,'content',4),('create',357,'content',4),('create',358,'content',4),('create',359,'content',4),('edit',360,'content',4),('selfedit',361,'user',4),('use',362,'notification',4),('administrate',363,'shop',4),('login',640,'user',6),('create',641,'content',6),('create',642,'content',6),('create',643,'content',6),('create',644,'content',6),('create',645,'content',6),('create',646,'content',6),('use',647,'websitetoolbar',6),('edit',648,'content',6),('read',649,'content',6),('use',650,'notification',6),('manage_locations',651,'content',6),('*',652,'ezodf',6),('diff',653,'content',6),('versionread',654,'content',6),('versionremove',655,'content',6),('remove',656,'content',6),('translate',657,'content',6),('feed',658,'rss',6),('*',659,'*',6),('*',660,'ezoe',6),('*',661,'content',6),('login',736,'user',3),('create',737,'content',3),('create',738,'content',3),('create',739,'content',3),('create',740,'content',3),('create',741,'content',3),('create',742,'content',3),('use',743,'websitetoolbar',3),('edit',744,'content',3),('read',745,'content',3),('use',746,'notification',3),('manage_locations',747,'content',3),('*',748,'ezodf',3),('administrate',749,'shop',3),('diff',750,'content',3),('versionread',751,'content',3),('versionremove',752,'content',3),('remove',753,'content',3),('translate',754,'content',3),('feed',755,'rss',3),('pendinglist',756,'content',3),('*',757,'*',3),('*',758,'ezoe',3),('activation',759,'utils',3),('create',1711,'content',17),('create',1712,'content',17),('create',1713,'content',17),('create',1714,'content',17),('create',1715,'content',17),('use',1716,'websitetoolbar',17),('edit',1717,'content',17),('use',1718,'notification',17),('manage_locations',1719,'content',17),('*',1720,'ezodf',17),('administrate',1721,'shop',17),('diff',1722,'content',17),('versionread',1723,'content',17),('versionremove',1724,'content',17),('remove',1725,'content',17),('translate',1726,'content',17),('feed',1727,'rss',17),('pendinglist',1728,'content',17),('*',1729,'ezoe',17),('create',1730,'content',17),('edit',1731,'content',17),('assign',1732,'state',17),('view_embed',1733,'content',17),('*',1734,'ezmultiupload',17),('*',1735,'ezflow',17),('*',1736,'utils',17),('read',1737,'content',17),('activation',1740,'utils',38),('login',1741,'user',38),('list',1742,'user2',38),('read',1743,'content',1),('pdf',1744,'content',1),('feed',1745,'rss',1),('login',1746,'user',1),('login',1747,'user',1),('login',1748,'user',1),('*',1749,'ezjscore',1),('register2',1750,'user2',1),('seltype',1751,'user2',1),('login',1752,'user2',1),('create',1865,'content',39),('create',1905,'content',5),('edit',1906,'content',5),('selfedit',1907,'user',5),('use',1908,'notification',5),('buy',1909,'shop',5),('password',1910,'user',5),('*',1911,'objectrelationbrowse',5),('*',1912,'ezapprove2',5),('create',1913,'content',5),('read',1914,'content',5),('read',1915,'content',5),('*',1916,'collaboration',5),('selfedit',1917,'user2',5),('login',1918,'user2',5),('submit',1919,'subscriptions',5),('read',1920,'subscriptions',5),('login',1946,'user',20),('create',1947,'content',20),('create',1948,'content',20),('create',1949,'content',20),('use',1950,'websitetoolbar',20),('edit',1951,'content',20),('use',1952,'notification',20),('manage_locations',1953,'content',20),('*',1954,'ezodf',20),('administrate',1955,'shop',20),('diff',1956,'content',20),('versionread',1957,'content',20),('versionremove',1958,'content',20),('remove',1959,'content',20),('translate',1960,'content',20),('feed',1961,'rss',20),('pendinglist',1962,'content',20),('*',1963,'ezoe',20),('activation',1964,'utils',20),('edit',1965,'content',20),('create',1966,'content',20),('*',1967,'ezflow',20),('*',1968,'ezmultiupload',20),('view_embed',1969,'content',20),('read',1970,'content',20),('login',1972,'user',7),('create',1973,'content',7),('create',1974,'content',7),('create',1975,'content',7),('create',1976,'content',7),('create',1977,'content',7),('create',1978,'content',7),('use',1979,'websitetoolbar',7),('edit',1980,'content',7),('read',1981,'content',7),('use',1982,'notification',7),('manage_locations',1983,'content',7),('*',1984,'ezodf',7),('diff',1985,'content',7),('versionread',1986,'content',7),('versionremove',1987,'content',7),('remove',1988,'content',7),('translate',1989,'content',7),('feed',1990,'rss',7),('pendinglist',1991,'content',7),('*',1992,'ezoe',7),('create',1993,'content',7),('create',1994,'content',7),('create',1995,'content',7),('create',1996,'content',7),('*',1997,'ezflow',7),('*',1998,'utils',7),('*',1999,'ezmultiupload',7),('*',2000,'state',7),('assign',2001,'state',7),('create',2002,'content',7),('create',2003,'content',7),('view_embed',2004,'content',7),('list',2005,'objectrelationbrowse',7),('create',2006,'content',7),('create',2007,'content',7),('*',2008,'ezjscore',7),('restore',2009,'content',7),('submit',2010,'subscriptions',7),('assign',2023,'state',37);
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

-- Dump completed on 2011-03-20 14:59:14
