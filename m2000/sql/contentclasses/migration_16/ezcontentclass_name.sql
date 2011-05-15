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
-- Table structure for table `ezcontentclass_name`
--

DROP TABLE IF EXISTS `ezcontentclass_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '0',
  `language_locale` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_name`
--

LOCK TABLES `ezcontentclass_name` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_name` DISABLE KEYS */;
INSERT INTO `ezcontentclass_name` VALUES (1,0,3,'ita-IT','Folder'),(1,0,4,'eng-GB','Folder'),(3,0,3,'ita-IT','User group'),(4,0,3,'ita-IT','User'),(11,0,3,'ita-IT','Link'),(11,0,4,'eng-GB','Link'),(13,0,3,'ita-IT','Commento'),(13,0,4,'eng-GB','Comment'),(14,0,3,'ita-IT','Common ini settings'),(15,0,3,'ita-IT','Template look'),(15,0,4,'eng-GB','Template Look'),(16,0,3,'ita-IT','Articolo'),(16,0,4,'eng-GB','Articolo'),(17,0,3,'ita-IT','Articolo (pagina principale)'),(17,0,4,'eng-GB','Article (main-page)'),(18,0,3,'ita-IT','Articolo (pagina sucessiva)'),(18,0,4,'eng-GB','Article (sub-page)'),(19,0,3,'ita-IT','Diario (Blog)'),(19,0,4,'eng-GB','Blog (diario)'),(20,0,3,'ita-IT','Pagina diario (blog post)'),(20,0,4,'eng-GB','Blog post'),(22,0,3,'ita-IT','Formulario feedback'),(22,0,4,'eng-GB','Feedback form'),(23,0,3,'ita-IT','Frontpage'),(23,0,4,'eng-GB','Frontpage'),(45,0,3,'ita-IT','Frontpage scuola'),(45,0,4,'eng-GB','Copia della classe <Frontpage>'),(47,0,3,'ita-IT','professore'),(70,0,3,'ita-IT','infoProf'),(70,0,4,'eng-GB','Prof information'),(73,0,3,'ita-IT','gruppoClassi'),(73,0,4,'eng-GB','classesGroup'),(74,0,3,'ita-IT','Classe'),(74,0,4,'eng-GB','Class'),(76,0,3,'ita-IT','Professore (spazio personale)'),(76,0,4,'eng-GB','Prof personal folder'),(77,0,3,'ita-IT','gruppoDocenti'),(77,0,4,'eng-GB','progGroup'),(78,0,3,'ita-IT','alunno'),(79,0,3,'ita-IT','ata'),(80,0,3,'ita-IT','genitore'),(82,0,3,'ita-IT','Colonna info'),(82,0,4,'eng-GB','Infobox'),(83,0,3,'ita-IT','Calendario multiplo'),(83,0,4,'eng-GB','Multicalendar'),(84,0,3,'ita-IT','Questionario (breve)'),(84,0,4,'eng-GB','Poll'),(85,0,3,'ita-IT','File'),(85,0,4,'eng-GB','File'),(86,0,5,'eng-GB','Flash'),(87,0,5,'eng-GB','Flash recorder'),(88,0,3,'ita-IT','Video Flv'),(88,0,4,'eng-GB','Video/Flash Player'),(89,0,3,'ita-IT','Layout globale'),(89,0,4,'eng-GB','Global layout'),(90,0,3,'ita-IT','Immagine'),(90,0,4,'eng-GB','Image'),(91,0,5,'eng-GB','Quicktime'),(92,0,5,'eng-GB','Windows media'),(93,0,5,'eng-GB','Real video'),(94,0,3,'ita-IT','Galleria'),(94,0,4,'eng-GB','Galleria'),(95,0,3,'ita-IT','Forum'),(95,0,4,'eng-GB','Forum'),(96,0,3,'ita-IT','Forum-argomento'),(96,0,4,'eng-GB','Forum topic'),(97,0,3,'ita-IT','Forum-risposta'),(97,0,4,'eng-GB','Forum reply'),(98,0,3,'ita-IT','Evento'),(98,0,4,'eng-GB','Event'),(99,0,3,'ita-IT','Calendario'),(99,0,4,'eng-GB','Calendario'),(101,0,3,'ita-IT','Forums'),(101,0,4,'eng-GB','Forums'),(102,0,5,'eng-GB','Silverlight'),(103,0,3,'ita-IT','Macroarea'),(103,0,4,'eng-GB','Copia della classe <Frontpage>'),(104,0,3,'ita-IT','Frontpage m2000'),(104,0,4,'eng-GB','Frontpage m2000'),(105,0,3,'ita-IT','Folder Circolari'),(105,0,4,'eng-GB','Folder Circolari'),(106,0,3,'ita-IT','Ufficio'),(106,0,4,'eng-GB','Office'),(107,0,3,'ita-IT','Raccoglitore circolari'),(107,0,4,'eng-GB','Directory Circolari'),(108,0,3,'ita-IT','Contatti'),(108,0,4,'eng-GB','Contacts'),(109,0,3,'ita-IT','Libro'),(109,0,4,'eng-GB','Book'),(110,0,3,'ita-IT','Dipendenti'),(110,0,4,'eng-GB','Employee (container)'),(111,0,3,'ita-IT','Progetto'),(111,0,4,'eng-GB','Progetto'),(112,0,3,'ita-IT','Articolo Newsletter'),(112,0,4,'eng-GB','Newsletter article'),(113,0,3,'ita-IT','Uscita newsletter'),(113,0,4,'eng-GB','Newsletter issue'),(114,0,3,'ita-IT','Sondaggio'),(114,0,4,'eng-GB','Survey'),(115,0,3,'ita-IT','Attributo sondaggio'),(115,0,4,'eng-GB','Survey attribute'),(117,0,3,'ita-IT','Folder Documenti'),(117,0,4,'eng-GB','Dms Folder'),(118,0,3,'ita-IT','Corso'),(118,0,4,'eng-GB','Event'),(120,0,3,'ita-IT','Form esami ecdl'),(120,0,4,'eng-GB','Poll'),(121,0,3,'ita-IT','Centro corsi'),(121,0,4,'eng-GB','Folder'),(122,0,3,'ita-IT','Laboratorio'),(122,0,4,'eng-GB','Progetto');
/*!40000 ALTER TABLE `ezcontentclass_name` ENABLE KEYS */;
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
