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
-- Table structure for table `ezpolicy_limitation`
--

DROP TABLE IF EXISTS `ezpolicy_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `policy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (272,'Section',356),(273,'Class',357),(274,'Section',357),(275,'ParentClass',357),(276,'Class',358),(277,'Section',358),(278,'ParentClass',358),(279,'Class',359),(280,'Section',359),(281,'ParentClass',359),(282,'Class',360),(283,'Section',360),(284,'Owner',360),(489,'Class',641),(490,'Class',642),(491,'ParentClass',642),(492,'Class',643),(493,'ParentClass',643),(494,'Class',644),(495,'ParentClass',644),(496,'Class',645),(497,'ParentClass',645),(498,'Class',646),(499,'ParentClass',646),(500,'Section',649),(557,'Class',738),(558,'ParentClass',738),(565,'Class',742),(566,'ParentClass',742),(568,'Class',737),(569,'Class',739),(570,'ParentClass',739),(571,'Class',740),(572,'ParentClass',740),(573,'Class',741),(574,'ParentClass',741),(575,'Section',745),(1264,'Class',1711),(1265,'ParentClass',1711),(1266,'Class',1712),(1267,'ParentClass',1712),(1268,'Class',1713),(1269,'ParentClass',1713),(1270,'Class',1714),(1271,'ParentClass',1714),(1272,'Class',1715),(1273,'ParentClass',1715),(1274,'Class',1730),(1275,'ParentClass',1730),(1276,'Class',1731),(1277,'Section',1732),(1280,'SiteAccess',1741),(1281,'Section',1743),(1282,'StateGroup_ready_workinprogress',1743),(1283,'Section',1744),(1284,'SiteAccess',1746),(1287,'SiteAccess',1747),(1288,'SiteAccess',1748),(1376,'Class',1865),(1377,'Section',1865),(1378,'ParentClass',1865),(1408,'Class',1905),(1409,'Section',1905),(1410,'ParentClass',1905),(1411,'Class',1906),(1412,'Section',1906),(1413,'Owner',1906),(1414,'Class',1913),(1415,'ParentClass',1913),(1416,'Section',1914),(1417,'StateGroup_ready_workinprogress',1915),(1434,'Class',1947),(1435,'Section',1947),(1436,'ParentOwner',1947),(1437,'ParentClass',1947),(1438,'Class',1948),(1439,'ParentOwner',1948),(1440,'ParentClass',1948),(1441,'Class',1949),(1442,'ParentOwner',1949),(1443,'ParentClass',1949),(1444,'Owner',1951),(1445,'Section',1965),(1446,'Class',1966),(1447,'Section',1966),(1448,'ParentClass',1966),(1449,'Section',1970),(1452,'Class',1974),(1453,'ParentClass',1974),(1454,'Class',1975),(1455,'ParentClass',1975),(1456,'Class',1976),(1457,'ParentClass',1976),(1458,'Class',1977),(1459,'ParentClass',1977),(1460,'Class',1978),(1461,'ParentClass',1978),(1462,'Section',1981),(1463,'Class',1993),(1464,'ParentClass',1993),(1465,'Class',1994),(1466,'ParentClass',1994),(1467,'Class',1995),(1468,'ParentClass',1995),(1469,'Class',1996),(1470,'ParentClass',1996),(1471,'Class',2002),(1472,'ParentClass',2002),(1473,'Class',2003),(1474,'ParentClass',2003),(1475,'Class',2006),(1476,'ParentClass',2006),(1477,'Class',2007),(1478,'ParentClass',2007),(1479,'Class',1973),(1480,'ParentClass',1973),(1490,'Owner',2023);
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

-- Dump completed on 2011-03-20 14:59:14
