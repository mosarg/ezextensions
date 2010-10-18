-- MySQL dump 10.11
--
-- Host: localhost    Database: ezlinussio
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
-- Table structure for table `ezselection_materie`
--

DROP TABLE IF EXISTS `ezselection_materie`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ezselection_materie` (
  `name` char(50) NOT NULL,
  `identifier` char(50) NOT NULL,
  `scuola` char(50) NOT NULL,
  PRIMARY KEY  (`scuola`,`name`,`identifier`),
  KEY `nome_materie` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ezselection_materie`
--

LOCK TABLES `ezselection_materie` WRITE;
/*!40000 ALTER TABLE `ezselection_materie` DISABLE KEYS */;
INSERT INTO `ezselection_materie` VALUES ('Lingua inglese','linguaingl',''),('ContabilitÃ  agraria','contagr','ipsaa'),('ContabilitÃ  e tecnica amministrativa','conttecnamm','ipsaa'),('Diritto e legislazione','dirleg','ipsaa'),('Ecologia agraria e tutela ambientale','ecoloagrtutamb','ipsaa'),('Ecologia agraria e tutela ambiente','ecoloaggrtutamb','ipsaa'),('Ecologia applicata','ecoappl','ipsaa'),('Economia agraria','econoagr','ipsaa'),('Economia azienda agraria','econoazagr','ipsaa'),('Economia dei mercati agricoli','economercagr','ipsaa'),('Educazione fisica','ginnastica','ipsaa'),('Elementi di disegno professionale','disproff','ipsaa'),('Esercitazioni di ecologia applicata','ecoloappl','ipsaa'),('Fisica e laboratorio','fislab','ipsaa'),('Genio rurale','geniorur','ipsaa'),('Italiano','italiano','ipsaa'),('Lingua straniera','linguastraniera','ipsaa'),('Matematica','matematica','ipsaa'),('Matematica ed informatica','matinf','ipsaa'),('Principi di agricoltura, tecniche delle produzioni','princtecprodagric','ipsaa'),('Principi di chimica e pedologia','princchimpedo','ipsaa'),('Religione','religione','ipsaa'),('Scienze della terra e biologia','scienzeterbio','ipsaa'),('Storia','storia','ipsaa'),('Tecnice di produzione, val., trasf. prodotti','tecnprod','ipsaa'),('Tecniche delle produzioni','tecnprod','ipsaa'),('Tecnologie chimiche/agrarie ed ambientali','tecnchimagramb','ipsaa'),('Diritto ed economia','direco','ipsc'),('Economia aziendale','econoaz','ipsc'),('Economia e tec. aziendale turistica','ecotecaziendtur','ipsc'),('Educazione fisica','ginnastica','ipsc'),('Geografia delle risorse','georis','ipsc'),('Geografia economica e turistica','geoecoturist','ipsc'),('Informatica gestionale','infgest','ipsc'),('Italiano','italiano','ipsc'),('Lab trattamento test e contabilitÃ ','tratttesticont','ipsc'),('Lab. trattamento testi','tratttesti','ipsc'),('Lingua francese','linguafrancese','ipsc'),('Lingua inglese','linguainglese','ipsc'),('Lingua tedesca','linguatedesca','ipsc'),('Matematica','matematica','ipsc'),('Matematica e informatica','matinf','ipsc'),('Religione','religione','ipsc'),('Scienze della terra e biologia','scienzebio','ipsc'),('Storia','storia','ipsc'),('Storia dell\'arte','storiaarte','ipsc'),('Tecnica dei servizi','tecnserviz','ipsc'),('Tecnica turistica ed amministrativa','tecnicaturam','ipsc'),('Tecnice di comunicazione e relazione','tecncomunrelaz','ipsc'),('Disegno tecnico','disegnotec','ipsia'),('Educazione fisica','ginnastica','ipsia'),('Educazione giuridica ed economica','edgiuridecon','ipsia'),('Elementi di meccanica','elemmecc','ipsia'),('Elettrotecnica ed elettronica','elettro','ipsia'),('Esercitazione pratica','espratica','ipsia'),('Fisica e laboratorio','fislab','ipsia'),('Italiano','italiano','ipsia'),('Macchine a fluido','maccfluid','ipsia'),('Matematica ed informatica','matinf','ipsia'),('Meccanica applicata alle macchine','meccappmach','ipsia'),('Religione','religione','ipsia'),('Scienze della terra e biologia','scienzeterbio','ipsia'),('Sistemi e automazione','sistautom','ipsia'),('Storia','storia','ipsia'),('Tecnica della produzione e lab.','tecnicaprodlab','ipsia'),('Tecnologia meccanica e lab','tecnmecclab','ipsia'),('Diritto','diritto','itc'),('Diritto economia','dirittoeco','itc'),('Economia aziendale','econoaz','itc'),('Economia aziendale e lab','econoazlab','itc'),('Economia politica','econopol','itc'),('Educazione fisica','ginnastica','itc'),('Geografia economica','geoeco','itc'),('Italiano','italiano','itc'),('Matematica e informatica','matinf','itc'),('Materia applicata','matapp','itc'),('Prima lingua straniera','lingua1','itc'),('Religione','religione','itc'),('Scienza delle finanze','scienzafin','itc'),('Scienze della materia e lab.','scienzelab','itc'),('Scienze della natura','scienzenat','itc'),('Seconda lingua straniera','lingua2','itc'),('Storia','storia','itc'),('Trattamento testi e dati','tratttesti','itc'),('Disegno e storia dell\'arte','disegno','liceo'),('Educazione fisica','ginnastica','liceo'),('Filosofia','filosofia','liceo'),('Fisica','fisica','liceo'),('Francese','francese','liceo'),('Geografia','geografia','liceo'),('Inglese','inglese','liceo'),('Italiano','italiano','liceo'),('Latino','latino','liceo'),('Matematica','matematica','liceo'),('Religione','religione','liceo'),('Scienze','scienze','liceo'),('Storia','storia','liceo'),('Tedesco','tedesco','liceo');
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

-- Dump completed on 2009-08-20 14:31:39
