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
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1901 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (272,'Section',356),(273,'Class',357),(274,'Section',357),(275,'ParentClass',357),(276,'Class',358),(277,'Section',358),(278,'ParentClass',358),(279,'Class',359),(280,'Section',359),(281,'ParentClass',359),(282,'Class',360),(283,'Section',360),(284,'Owner',360),(489,'Class',641),(490,'Class',642),(491,'ParentClass',642),(492,'Class',643),(493,'ParentClass',643),(494,'Class',644),(495,'ParentClass',644),(496,'Class',645),(497,'ParentClass',645),(498,'Class',646),(499,'ParentClass',646),(500,'Section',649),(557,'Class',738),(558,'ParentClass',738),(565,'Class',742),(566,'ParentClass',742),(568,'Class',737),(569,'Class',739),(570,'ParentClass',739),(571,'Class',740),(572,'ParentClass',740),(573,'Class',741),(574,'ParentClass',741),(575,'Section',745),(1281,'Class',1744),(1282,'Class',1745),(1283,'ParentClass',1745),(1284,'Class',1746),(1285,'ParentClass',1746),(1286,'Class',1747),(1287,'ParentClass',1747),(1288,'Class',1748),(1289,'ParentClass',1748),(1290,'Class',1749),(1291,'ParentClass',1749),(1292,'Section',1752),(1372,'Class',1854),(1373,'ParentClass',1854),(1374,'Class',1855),(1375,'ParentClass',1855),(1376,'Class',1856),(1377,'ParentClass',1856),(1378,'Class',1857),(1379,'ParentClass',1857),(1380,'Class',1858),(1381,'ParentClass',1858),(1382,'Class',1873),(1383,'ParentClass',1873),(1384,'Class',1874),(1385,'Section',1875),(1409,'SiteAccess',1905),(1411,'Class',1907),(1412,'Class',1908),(1637,'Class',2120),(1638,'Section',2120),(1639,'ParentClass',2120),(1640,'Section',2121),(1641,'Class',2122),(1642,'ParentClass',2122),(1643,'Class',2123),(1644,'ParentClass',2123),(1645,'Class',2124),(1646,'ParentClass',2124),(1647,'Class',2125),(1648,'ParentClass',2125),(1649,'Class',2126),(1650,'ParentClass',2126),(1651,'Class',2127),(1652,'ParentClass',2127),(1653,'Class',2130),(1654,'Section',2130),(1655,'ParentClass',2130),(1656,'Class',2131),(1657,'Section',2131),(1658,'Owner',2131),(1659,'Class',2137),(1660,'ParentClass',2137),(1661,'Section',2138),(1662,'StateGroup_ready_workinprogress',2139),(1668,'Class',2149),(1669,'Class',2150),(1670,'ParentClass',2150),(1671,'Class',2151),(1672,'Owner',2151),(1675,'Class',2156),(1676,'ParentClass',2156),(1677,'Class',2157),(1678,'ParentClass',2157),(1679,'Class',2158),(1680,'ParentClass',2158),(1681,'Class',2159),(1682,'ParentClass',2159),(1683,'Class',2160),(1684,'ParentClass',2160),(1685,'Section',2163),(1686,'Class',2175),(1687,'ParentClass',2175),(1688,'Class',2176),(1689,'ParentClass',2176),(1690,'Class',2177),(1691,'ParentClass',2177),(1692,'Class',2178),(1693,'ParentClass',2178),(1694,'Class',2184),(1695,'ParentClass',2184),(1696,'Class',2185),(1697,'ParentClass',2185),(1698,'Class',2188),(1699,'ParentClass',2188),(1700,'Class',2189),(1701,'ParentClass',2189),(1702,'Class',2155),(1703,'ParentClass',2155),(1737,'Class',2231),(1738,'Section',2231),(1739,'ParentOwner',2231),(1740,'ParentClass',2231),(1741,'Class',2232),(1742,'ParentOwner',2232),(1743,'ParentClass',2232),(1744,'Class',2233),(1745,'ParentOwner',2233),(1746,'ParentClass',2233),(1747,'Owner',2235),(1748,'Owner',2237),(1749,'Owner',2239),(1750,'Owner',2242),(1751,'Owner',2243),(1752,'Section',2248),(1753,'Class',2249),(1754,'Section',2249),(1755,'ParentClass',2249),(1756,'Class',2253),(1757,'Section',2253),(1758,'ParentClass',2253),(1759,'Section',2254),(1760,'Section',2255),(1809,'Class',2284),(1810,'Section',2284),(1811,'ParentOwner',2284),(1812,'ParentClass',2284),(1813,'Class',2285),(1814,'ParentOwner',2285),(1815,'ParentClass',2285),(1816,'Class',2286),(1817,'ParentOwner',2286),(1818,'ParentClass',2286),(1819,'Owner',2288),(1820,'Owner',2290),(1821,'Owner',2292),(1822,'Owner',2295),(1823,'Owner',2296),(1824,'Section',2301),(1825,'Class',2302),(1826,'Section',2302),(1827,'ParentClass',2302),(1828,'Class',2306),(1829,'Section',2306),(1830,'ParentClass',2306),(1831,'Section',2307),(1832,'Section',2308),(1833,'Class',2311),(1834,'ParentClass',2311),(1835,'Class',2312),(1836,'ParentClass',2312),(1837,'Class',2313),(1838,'ParentClass',2313),(1839,'Class',2314),(1840,'ParentClass',2314),(1841,'Class',2315),(1842,'ParentClass',2315),(1843,'Class',2316),(1844,'ParentClass',2316),(1845,'Section',2319),(1846,'Class',2331),(1847,'ParentClass',2331),(1848,'Class',2332),(1849,'ParentClass',2332),(1850,'Class',2333),(1851,'ParentClass',2333),(1852,'Class',2334),(1853,'ParentClass',2334),(1854,'Class',2340),(1855,'ParentClass',2340),(1856,'Class',2341),(1857,'ParentClass',2341),(1858,'Class',2344),(1859,'ParentClass',2344),(1860,'Class',2345),(1861,'ParentClass',2345),(1879,'Class',2350),(1880,'Section',2350),(1881,'ParentClass',2350),(1882,'Class',2351),(1883,'Section',2351),(1884,'ParentClass',2351),(1885,'Class',2352),(1886,'Section',2352),(1887,'Class',2353),(1888,'ParentClass',2353),(1891,'Class',2354),(1892,'ParentClass',2354),(1893,'Section',2355),(1894,'StateGroup_ready_workinprogress',2355),(1895,'Section',2356),(1896,'SiteAccess',2358),(1899,'SiteAccess',2359),(1900,'SiteAccess',2360);
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

-- Dump completed on 2011-04-30 15:48:14
