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
-- Table structure for table `ezpolicy_limitation_value`
--

DROP TABLE IF EXISTS `ezpolicy_limitation_value`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ezpolicy_limitation_value` (
  `id` int(11) NOT NULL auto_increment,
  `limitation_id` int(11) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ezpolicy_limitation_value_val` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ezpolicy_limitation_value`
--

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation_value` VALUES (559,272,'6'),(560,273,'39'),(561,274,'6'),(562,275,'38'),(563,276,'40'),(564,277,'6'),(565,278,'39'),(566,279,'13'),(567,280,'6'),(568,281,'16'),(569,282,'13'),(570,282,'39'),(571,282,'40'),(572,283,'6'),(573,284,'1'),(873,417,'39'),(874,418,'1'),(875,419,'38'),(876,420,'40'),(877,421,'1'),(878,422,'39'),(879,423,'13'),(880,424,'1'),(881,425,'16'),(882,425,'17'),(883,425,'20'),(884,426,'13'),(885,426,'39'),(886,426,'40'),(887,427,'1'),(888,428,'1'),(955,453,'1'),(956,453,'11'),(957,453,'16'),(958,453,'17'),(959,453,'18'),(960,453,'19'),(961,453,'21'),(962,453,'22'),(963,453,'23'),(964,453,'24'),(965,454,'20'),(966,455,'19'),(967,456,'39'),(968,457,'38'),(969,458,'41'),(970,459,'42'),(971,460,'33'),(972,461,'37'),(973,462,'1'),(974,462,'11'),(975,462,'22'),(976,462,'23'),(977,462,'24'),(978,462,'26'),(979,462,'37'),(980,462,'42'),(981,462,'44'),(982,463,'23'),(983,464,'1'),(984,464,'3'),(985,464,'6'),(986,464,'7'),(987,464,'8'),(1054,489,'1'),(1055,489,'11'),(1056,489,'16'),(1057,489,'17'),(1058,489,'18'),(1059,489,'19'),(1060,489,'21'),(1061,489,'22'),(1062,489,'23'),(1063,489,'24'),(1064,490,'20'),(1065,491,'19'),(1066,492,'39'),(1067,493,'38'),(1068,494,'41'),(1069,495,'42'),(1070,496,'33'),(1071,497,'37'),(1072,498,'1'),(1073,498,'11'),(1074,498,'22'),(1075,498,'23'),(1076,498,'24'),(1077,498,'26'),(1078,498,'37'),(1079,498,'42'),(1080,498,'44'),(1081,499,'23'),(1082,500,'1'),(1083,500,'3'),(1084,500,'6'),(1085,500,'7'),(1086,500,'8'),(1144,524,'1'),(1145,524,'7'),(1146,524,'8'),(1147,525,'482635906'),(1148,526,'3382822017'),(1149,527,'2582995467'),(1150,528,'29'),(1151,528,'33'),(1152,528,'34'),(1153,528,'35'),(1154,528,'36'),(1155,528,'43'),(1156,529,'3'),(1157,530,'7'),(1158,530,'8'),(1159,530,'1'),(1160,531,'5');
/*!40000 ALTER TABLE `ezpolicy_limitation_value` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-08-04 12:44:25
