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
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ezpolicy_limitation_value`
--

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation_value` VALUES (559,272,'6'),(560,273,'39'),(561,274,'6'),(562,275,'38'),(563,276,'40'),(564,277,'6'),(565,278,'39'),(566,279,'13'),(567,280,'6'),(568,281,'16'),(569,282,'13'),(570,282,'39'),(571,282,'40'),(572,283,'6'),(573,284,'1'),(873,417,'39'),(874,418,'1'),(875,419,'38'),(876,420,'40'),(877,421,'1'),(878,422,'39'),(879,423,'13'),(880,424,'1'),(881,425,'16'),(882,425,'17'),(883,425,'20'),(884,426,'13'),(885,426,'39'),(886,426,'40'),(887,427,'1'),(888,428,'1'),(1054,489,'1'),(1055,489,'11'),(1056,489,'16'),(1057,489,'17'),(1058,489,'18'),(1059,489,'19'),(1060,489,'21'),(1061,489,'22'),(1062,489,'23'),(1063,489,'24'),(1064,490,'20'),(1065,491,'19'),(1066,492,'39'),(1067,493,'38'),(1068,494,'41'),(1069,495,'42'),(1070,496,'33'),(1071,497,'37'),(1072,498,'1'),(1073,498,'11'),(1074,498,'22'),(1075,498,'23'),(1076,498,'24'),(1077,498,'26'),(1078,498,'37'),(1079,498,'42'),(1080,498,'44'),(1081,499,'23'),(1082,500,'1'),(1083,500,'3'),(1084,500,'6'),(1085,500,'7'),(1086,500,'8'),(1161,532,'1'),(1162,532,'7'),(1163,532,'8'),(1164,533,'5'),(1165,534,'1'),(1166,534,'7'),(1167,534,'8'),(1168,535,'482635906'),(1169,536,'3382822017'),(1170,537,'2582995467'),(1178,540,'3'),(1179,541,'1'),(1180,541,'11'),(1181,541,'16'),(1182,541,'17'),(1183,541,'18'),(1184,541,'19'),(1185,541,'21'),(1186,541,'22'),(1187,541,'23'),(1188,541,'24'),(1189,542,'20'),(1190,543,'19'),(1191,544,'39'),(1192,545,'38'),(1193,546,'41'),(1194,547,'42'),(1195,548,'33'),(1196,549,'37'),(1197,550,'1'),(1198,550,'11'),(1199,550,'22'),(1200,550,'23'),(1201,550,'24'),(1202,550,'26'),(1203,550,'37'),(1204,550,'42'),(1205,550,'44'),(1206,551,'23'),(1207,552,'1'),(1208,552,'3'),(1209,552,'6'),(1210,552,'7'),(1211,552,'8');
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

-- Dump completed on 2009-09-05  6:55:57
