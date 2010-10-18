-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: ezcssp
-- ------------------------------------------------------
-- Server version	5.1.41-3

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
-- Table structure for table `ezselection_title`
--

DROP TABLE IF EXISTS `ezselection_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezselection_title` (
  `name` char(67) DEFAULT NULL,
  `identifier` char(66) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezselection_title`
--

LOCK TABLES `ezselection_title` WRITE;
/*!40000 ALTER TABLE `ezselection_title` DISABLE KEYS */;
INSERT INTO `ezselection_title` VALUES ('Scientifico indirizzo tradizionale','scientifico_indirizzo_tradizionale'),('Perito Elettronico','perito_elettronico'),('Operatore Meccanico','operatore_meccanico'),('Perito Chimico','perito_chimico'),('Perito Industriale','perito_industriale'),('Scientifico tecnologico','scientifico_tecnologico'),('Tecnico turistico','tecnico_turistico'),('Operatore Agroambientale','operatore_agroambientale'),('Operatore Agrotecnico','operatore_agrotecnico'),('Operatore Agroindustriale','operatore_agroindustriale'),('Operatore dell\'Impresa Turistica','operatore_impresa_turistica'),('Tecnico dei Servizi Turistici','tecnico_servizi_turistici'),('Operatore della gestione Aziendale','operatore_gestione_aziendale'),('Tecnico della gestione Aziendale indirizzo linguistico','tecnico_gestione_aziendale_linguistico'),('Tecnico delle industrie Meccaniche','tecnico_industrie_meccaniche'),('Commerciale indirizzo Attività gestionali','commerciale_indirizzo_attività_gestionali'),('Perito industriale Indirizzo Chimico','perito_industriale_indirizzo_chimico'),('Perito industriale Indirizzo Elettronico Telecomunicazioni','perito_industriale_indirizzo_elettronico_telecomunicazioni'),('Commerciale indirizzo giuridico','commerciale_indirizzo_giuridico'),('Perito industriale Indirizzo Meccanico','perito_industriale_indirizzo_meccanico'),('Perito industriale Indirizzo Edilizia','perito_industriale_indirizzo_edilizia'),('Perito industriale Indirizzo Biologico','perito_industriale_indirizzo_biologico'),('Operatore Elettrico','operatore_elettrico'),('Operatore Elettronico Industriale','operatore_elettronico_industriale'),('Tecnico delle Industrie Elettriche','tecnico_industrie_elettriche'),('Tecnico delle Industrie Elettroniche','tecnico_industrie_elettroniche'),('Classico indirizzo generale','classico_indirizzo_generale'),('Socio pedagogico','socio_pedagogico'),('Linguistico','linguistico'),('Operatore Termico','operatore_termico'),('Tecnico dei sistemi Energetici','tecnico_sistemi_energetici'),('Operatore dei servizi Sociali','operatore_servizi_sociali'),('Tecnico dei servizi Sociali','tenico_servizi_sociali'),('Operatore della moda','operatore_moda'),('Tecnico della moda','tecnico_moda'),('Perito industriale indirizzo Informatico','perito_industriale_indirizzo_informatico');
/*!40000 ALTER TABLE `ezselection_title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-01-25 20:31:17
