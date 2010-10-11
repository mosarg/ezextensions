-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: eztest2
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
-- Table structure for table `ezselection_materie`
--

DROP TABLE IF EXISTS `ezselection_materie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezselection_materie` (
  `name` char(50) NOT NULL,
  `identifier` char(50) NOT NULL,
  `scuola` char(50) NOT NULL,
  PRIMARY KEY (`scuola`,`name`,`identifier`),
  KEY `nome_materie` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezselection_materie`
--

LOCK TABLES `ezselection_materie` WRITE;
/*!40000 ALTER TABLE `ezselection_materie` DISABLE KEYS */;
INSERT INTO `ezselection_materie` VALUES ('Area approfondimento','areapp','ipsia'),('Attività diverse dall\'insegnamento','altre_att','ipsia'),('Chimica organica','chimorg','ipsia'),('diritto','diritto','ipsia'),('Diritto ed economia','direco','ipsia'),('Disegno tecnico','distecnic','ipsia'),('Educazione fisica','ginnastica','ipsia'),('Elementi di meccanica','elemmec','ipsia'),('Elettrotecnica ed elettronica','elettrotelet','ipsia'),('Esercitazioni pratiche','esercpratic','ipsia'),('Fisica e laboratorio','fislab','ipsia'),('Inglese','inglese','ipsia'),('Italiano','italiano','ipsia'),('Macchine a fluido','macchfluid','ipsia'),('Matematica e informatica','matinf','ipsia'),('Meccanica applicata alle macchine','mecappmac','ipsia'),('Religione','religione','ipsia'),('Scienza natura','scienznat','ipsia'),('Scienze della terra e biologia','scienzeterbiol','ipsia'),('Sistemi di automazione','sistautom','ipsia'),('Storia','storia','ipsia'),('Tecnica della produzione e laboratorio','tecnprodlab','ipsia'),('Tecnica professionale','tecnprof','ipsia'),('Tecnologia meccanica','tecnmec','ipsia'),('Tecnologia meccanica e laboratorio','tecnmeclab','ipsia'),('Area approfondimento','areaappr','ipssct'),('Attività diverse dall\'insegnamento','altre_att','ipssct'),('Diritto ed economia','direcon','ipssct'),('Economia aziendale','econoaz','ipssct'),('Economia e tecnica turistica','econtectur','ipssct'),('Educazione fisica','edfisic','ipssct'),('Geografia','geogra','ipssct'),('Geografia delle risorse','georis','ipssct'),('Geografia economica e turistica','geoecontur','ipssct'),('Geografia turistica','geotur','ipssct'),('Informatica gestionale','infogest','ipssct'),('Italiano','italiano','ipssct'),('Laboratorio trattamento testi','labtratttest','ipssct'),('Lingua inglese','inglese','ipssct'),('Lingua straniera','lingstran','ipssct'),('Matematica e informatica','matinf','ipssct'),('Religione','religione','ipssct'),('Scienze della terra e biologia','scienzeterbio','ipssct'),('Storia','storia','ipssct'),('Storia dell\'arte','storart','ipssct'),('Tecnica turistica ed amministrazione','tecnturamm','ipssct'),('Tecniche di comunicazione','tecncomun','ipssct'),('Attività diverse dall\'insegnamento','altre_att','itc'),('Diritto economia aziendale','direconaz','itc'),('Diritto ed economia','direco','itc'),('Economia aziendale e laboratorio','econoazlab','itc'),('Economia politica','econopol','itc'),('Educazione fisica','ginnastica','itc'),('Geografia economica','geoecon','itc'),('Geografia generale e  antropologica','geoantropo','itc'),('Italiano','italiano','itc'),('Matematica','matematica','itc'),('Matematica e laboratorio','matlab','itc'),('Matematica ed informatica','matinf','itc'),('Prima lingua straniera','primlingstran','itc'),('Religione','religione','itc'),('Scienza finanze','scienfin','itc'),('Scienza matematica e laboratorio','scienzmatlab','itc'),('Scienze naturali','scienzenat','itc'),('Seconda lingua straniera','secondlingstran','itc'),('Storia','storia','itc'),('Terza lingua straniera','terzlingstran','itc'),('Trattamento testi e dati','tratttestdat','itc'),('Analisi chimica ed elaborazione dati','anachim_elabdati','iti_cervignano'),('Attività diverse dall\'insegnamento','altre_att','iti_cervignano'),('Biologia','biologia','iti_cervignano'),('Biologia e laboratorio','biolab','iti_cervignano'),('Chimica','chimica','iti_cervignano'),('Chimica delle fermentazioni','chim_ferment','iti_cervignano'),('Chimica e laboratorio','chimlab','iti_cervignano'),('Chimica fisica','chim_fis','iti_cervignano'),('Chimica organica','chim_org','iti_cervignano'),('Diritto','diritto','iti_cervignano'),('Disegno','disegno','iti_cervignano'),('Educazione fisica','ginnastica','iti_cervignano'),('Elettronica','elettronica','iti_cervignano'),('Elettrotecnica','elettrotec','iti_cervignano'),('Filosofia','filosofia','iti_cervignano'),('Fisica','fisica','iti_cervignano'),('Fisica e laboratorio','fisilab','iti_cervignano'),('Geografia','geografia','iti_cervignano'),('Informatica e sistemi automatici','info_sist_auto','iti_cervignano'),('Inglese','inglese','iti_cervignano'),('Italiano','italiano','iti_cervignano'),('Laboratorio fisica-chimica','labfischim','iti_cervignano'),('Matematica','matematica','iti_cervignano'),('Meccanica','meccanica','iti_cervignano'),('Scienze','scienze','iti_cervignano'),('Sistemi automatici','sist_autom','iti_cervignano'),('Storia','storia','iti_cervignano'),('Tecnologia e disegno','tecno_dis','iti_cervignano'),('Tecnologia, disegno e progettazione','tecdisproget','iti_cervignano'),('Tecnologie chimiche industriali','tecnchimi_indu','iti_cervignano'),('Telecomunicazioni','telecom','iti_cervignano'),('Uffico tecnico','uff_tecnico','iti_cervignano'),('Attività diverse dall\'insegnamento','altre_att','iti_san_giorgio'),('Biologia','biologia','iti_san_giorgio'),('Chimica','chimica','iti_san_giorgio'),('Diritto','diritto','iti_san_giorgio'),('Diritto ed economia','direcono','iti_san_giorgio'),('Disegno e progettazione','disprogett','iti_san_giorgio'),('Educazione fisica','ginnastica','iti_san_giorgio'),('Fisica','fisica','iti_san_giorgio'),('Geografia','geografia','iti_san_giorgio'),('Inglese','inglese','iti_san_giorgio'),('Italiano','italiano','iti_san_giorgio'),('Matematica','matematica','iti_san_giorgio'),('Meccanica e macchine','meccmac','iti_san_giorgio'),('Religione','religione','iti_san_giorgio'),('Scienze','scienze','iti_san_giorgio'),('Sistemi ed automazione','sistautom','iti_san_giorgio'),('Storia','storia','iti_san_giorgio'),('Tecnologia e disegno','tecndis','iti_san_giorgio'),('Tecnologia meccanica ed esercitazioni','tecnmecesercit','iti_san_giorgio'),('Attività diverse dall\'insegnamento','altre_att','liceo'),('Disegno','disegno','liceo'),('Educazione fisica','ginnastica','liceo'),('Filosofia','filosofia','liceo'),('Fisica','fisica','liceo'),('Geografia','geografia','liceo'),('Inglese','inglese','liceo'),('Italiano','italiano','liceo'),('Latino','latino','liceo'),('Matematica','matematica','liceo'),('Religione','religione','liceo'),('Scienze','scienze','liceo'),('Storia','storia','liceo'),('Tedesco','tedesco','liceo');
/*!40000 ALTER TABLE `ezselection_materie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-01-13 10:01:39
