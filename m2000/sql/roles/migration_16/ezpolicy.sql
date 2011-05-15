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
) ENGINE=InnoDB AUTO_INCREMENT=2365 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES ('*',308,'*',2),('read',356,'content',4),('create',357,'content',4),('create',358,'content',4),('create',359,'content',4),('edit',360,'content',4),('selfedit',361,'user',4),('use',362,'notification',4),('administrate',363,'shop',4),('login',640,'user',6),('create',641,'content',6),('create',642,'content',6),('create',643,'content',6),('create',644,'content',6),('create',645,'content',6),('create',646,'content',6),('use',647,'websitetoolbar',6),('edit',648,'content',6),('read',649,'content',6),('use',650,'notification',6),('manage_locations',651,'content',6),('*',652,'ezodf',6),('diff',653,'content',6),('versionread',654,'content',6),('versionremove',655,'content',6),('remove',656,'content',6),('translate',657,'content',6),('feed',658,'rss',6),('*',659,'*',6),('*',660,'ezoe',6),('*',661,'content',6),('login',736,'user',3),('create',737,'content',3),('create',738,'content',3),('create',739,'content',3),('create',740,'content',3),('create',741,'content',3),('create',742,'content',3),('use',743,'websitetoolbar',3),('edit',744,'content',3),('read',745,'content',3),('use',746,'notification',3),('manage_locations',747,'content',3),('*',748,'ezodf',3),('administrate',749,'shop',3),('diff',750,'content',3),('versionread',751,'content',3),('versionremove',752,'content',3),('remove',753,'content',3),('translate',754,'content',3),('feed',755,'rss',3),('pendinglist',756,'content',3),('*',757,'*',3),('*',758,'ezoe',3),('activation',759,'utils',3),('*',1451,'state',37),('login',1743,'user',39),('create',1744,'content',39),('create',1745,'content',39),('create',1746,'content',39),('create',1747,'content',39),('create',1748,'content',39),('create',1749,'content',39),('use',1750,'websitetoolbar',39),('edit',1751,'content',39),('read',1752,'content',39),('use',1753,'notification',39),('manage_locations',1754,'content',39),('*',1755,'ezodf',39),('diff',1756,'content',39),('versionread',1757,'content',39),('versionremove',1758,'content',39),('remove',1759,'content',39),('translate',1760,'content',39),('feed',1761,'rss',39),('*',1762,'*',39),('*',1763,'ezoe',39),('*',1764,'content',39),('create',1854,'content',17),('create',1855,'content',17),('create',1856,'content',17),('create',1857,'content',17),('create',1858,'content',17),('use',1859,'websitetoolbar',17),('edit',1860,'content',17),('use',1861,'notification',17),('manage_locations',1862,'content',17),('*',1863,'ezodf',17),('administrate',1864,'shop',17),('diff',1865,'content',17),('versionread',1866,'content',17),('versionremove',1867,'content',17),('remove',1868,'content',17),('translate',1869,'content',17),('feed',1870,'rss',17),('pendinglist',1871,'content',17),('*',1872,'ezoe',17),('create',1873,'content',17),('edit',1874,'content',17),('assign',1875,'state',17),('view_embed',1876,'content',17),('*',1877,'ezmultiupload',17),('*',1878,'ezflow',17),('*',1879,'utils',17),('read',1880,'content',17),('activation',1904,'utils',38),('login',1905,'user',38),('list',1906,'user2',38),('edit',1907,'content',38),('remove',1908,'content',38),('create',2120,'content',50),('edit',2121,'content',50),('create',2122,'content',50),('create',2123,'content',50),('create',2124,'content',50),('create',2125,'content',50),('create',2126,'content',50),('create',2127,'content',50),('*',2128,'objectrelationbrowse',50),('cache',2129,'utils',50),('create',2130,'content',5),('edit',2131,'content',5),('selfedit',2132,'user',5),('use',2133,'notification',5),('password',2134,'user',5),('*',2135,'objectrelationbrowse',5),('*',2136,'ezapprove2',5),('create',2137,'content',5),('read',2138,'content',5),('read',2139,'content',5),('*',2140,'collaboration',5),('selfedit',2141,'user2',5),('login',2142,'user2',5),('submit',2143,'subscriptions',5),('read',2144,'subscriptions',5),('edit',2149,'content',46),('create',2150,'content',46),('remove',2151,'content',46),('export',2152,'subscriptions',46),('cache',2153,'utils',46),('login',2154,'user',7),('create',2155,'content',7),('create',2156,'content',7),('create',2157,'content',7),('create',2158,'content',7),('create',2159,'content',7),('create',2160,'content',7),('use',2161,'websitetoolbar',7),('edit',2162,'content',7),('read',2163,'content',7),('use',2164,'notification',7),('manage_locations',2165,'content',7),('*',2166,'ezodf',7),('diff',2167,'content',7),('versionread',2168,'content',7),('versionremove',2169,'content',7),('remove',2170,'content',7),('translate',2171,'content',7),('feed',2172,'rss',7),('pendinglist',2173,'content',7),('*',2174,'ezoe',7),('create',2175,'content',7),('create',2176,'content',7),('create',2177,'content',7),('create',2178,'content',7),('*',2179,'ezflow',7),('*',2180,'utils',7),('*',2181,'ezmultiupload',7),('*',2182,'state',7),('assign',2183,'state',7),('create',2184,'content',7),('create',2185,'content',7),('view_embed',2186,'content',7),('list',2187,'objectrelationbrowse',7),('create',2188,'content',7),('create',2189,'content',7),('login',2230,'user',20),('create',2231,'content',20),('create',2232,'content',20),('create',2233,'content',20),('use',2234,'websitetoolbar',20),('edit',2235,'content',20),('use',2236,'notification',20),('manage_locations',2237,'content',20),('*',2238,'ezodf',20),('diff',2239,'content',20),('versionread',2240,'content',20),('versionremove',2241,'content',20),('remove',2242,'content',20),('translate',2243,'content',20),('feed',2244,'rss',20),('pendinglist',2245,'content',20),('*',2246,'ezoe',20),('activation',2247,'utils',20),('edit',2248,'content',20),('create',2249,'content',20),('*',2250,'ezflow',20),('*',2251,'ezmultiupload',20),('view_embed',2252,'content',20),('create',2253,'content',20),('read',2254,'content',20),('read',2255,'content',20),('login',2283,'user',59),('create',2284,'content',59),('create',2285,'content',59),('create',2286,'content',59),('use',2287,'websitetoolbar',59),('edit',2288,'content',59),('use',2289,'notification',59),('manage_locations',2290,'content',59),('*',2291,'ezodf',59),('diff',2292,'content',59),('versionread',2293,'content',59),('versionremove',2294,'content',59),('remove',2295,'content',59),('translate',2296,'content',59),('feed',2297,'rss',59),('pendinglist',2298,'content',59),('*',2299,'ezoe',59),('activation',2300,'utils',59),('edit',2301,'content',59),('create',2302,'content',59),('*',2303,'ezflow',59),('*',2304,'ezmultiupload',59),('view_embed',2305,'content',59),('create',2306,'content',59),('read',2307,'content',59),('read',2308,'content',59),('*',2309,'*',60),('login',2310,'user',61),('create',2311,'content',61),('create',2312,'content',61),('create',2313,'content',61),('create',2314,'content',61),('create',2315,'content',61),('create',2316,'content',61),('use',2317,'websitetoolbar',61),('edit',2318,'content',61),('read',2319,'content',61),('use',2320,'notification',61),('manage_locations',2321,'content',61),('*',2322,'ezodf',61),('diff',2323,'content',61),('versionread',2324,'content',61),('versionremove',2325,'content',61),('remove',2326,'content',61),('translate',2327,'content',61),('feed',2328,'rss',61),('pendinglist',2329,'content',61),('*',2330,'ezoe',61),('create',2331,'content',61),('create',2332,'content',61),('create',2333,'content',61),('create',2334,'content',61),('*',2335,'ezflow',61),('*',2336,'utils',61),('*',2337,'ezmultiupload',61),('*',2338,'state',61),('assign',2339,'state',61),('create',2340,'content',61),('create',2341,'content',61),('view_embed',2342,'content',61),('list',2343,'objectrelationbrowse',61),('create',2344,'content',61),('create',2345,'content',61),('create',2350,'content',40),('create',2351,'content',40),('edit',2352,'content',40),('create',2353,'content',40),('create',2354,'content',40),('read',2355,'content',1),('pdf',2356,'content',1),('feed',2357,'rss',1),('login',2358,'user',1),('login',2359,'user',1),('login',2360,'user',1),('*',2361,'ezjscore',1),('register2',2362,'user2',1),('seltype',2363,'user2',1),('login',2364,'user2',1);
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

-- Dump completed on 2011-04-30 15:48:14
