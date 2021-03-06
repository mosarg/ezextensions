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

-- Table structure for table `ezcontentclass`

--



DROP TABLE IF EXISTS `ezcontentclass`;

SET @saved_cs_client     = @@character_set_client;

SET character_set_client = utf8;

CREATE TABLE `ezcontentclass` (

  `always_available` int(11) NOT NULL default '0',

  `contentobject_name` varchar(255) default NULL,

  `created` int(11) NOT NULL default '0',

  `creator_id` int(11) NOT NULL default '0',

  `id` int(11) NOT NULL auto_increment,

  `identifier` varchar(50) NOT NULL default '',

  `initial_language_id` int(11) NOT NULL default '0',

  `is_container` int(11) NOT NULL default '0',

  `language_mask` int(11) NOT NULL default '0',

  `modified` int(11) NOT NULL default '0',

  `modifier_id` int(11) NOT NULL default '0',

  `remote_id` varchar(100) NOT NULL default '',

  `serialized_name_list` longtext,

  `sort_field` int(11) NOT NULL default '1',

  `sort_order` int(11) NOT NULL default '1',

  `url_alias_name` varchar(255) default NULL,

  `version` int(11) NOT NULL default '0',

  PRIMARY KEY  (`id`,`version`),

  KEY `ezcontentclass_version` (`version`)

) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

SET character_set_client = @saved_cs_client;



--

-- Dumping data for table `ezcontentclass`

--



LOCK TABLES `ezcontentclass` WRITE;

/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;

INSERT INTO `ezcontentclass` VALUES (1,'<short_name|name>',1024392098,14,1,'folder',2,1,7,1250793753,14,'a3d405b81be900468eb153d774f4f0d2','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:6:\"Folder\";s:6:\"ita-IT\";s:6:\"Folder\";}',1,1,'',0),(1,'<name>',1024392098,14,3,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:10:\"User group\";}',1,1,'',0),(1,'<first_name> <last_name>',1024392098,14,4,'user',2,0,3,1249463756,14,'40faa822edc579b02c25f6bb7beec3ad','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:4:\"User\";}',1,1,'',0),(0,'<name>',1052385361,14,11,'link',2,0,7,1252681115,14,'74ec6507063150bc813549b22534ad48','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:4:\"Link\";s:6:\"ita-IT\";s:4:\"Link\";}',1,1,'',0),(0,'<subject>',1052385685,14,13,'comment',2,0,7,1250772188,14,'000c14f4f475e9f2955dedab72799941','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"Commento\";s:6:\"ita-IT\";s:7:\"Comment\";}',1,1,'',0),(1,'<name>',1081858024,14,14,'common_ini_settings',2,0,3,1081858024,14,'ffedf2e73b1ea0c3e630e42e2db9c900','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:19:\"Common ini settings\";}',1,1,'',0),(1,'<title>',1081858045,14,15,'template_look',2,0,7,1249377062,14,'59b43cd9feaaf0e45ac974fb4bbd3f92','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:13:\"Template look\";s:6:\"ita-IT\";s:13:\"Template Look\";}',1,1,'',0),(0,'<short_title|title>',1227478632,14,16,'article',2,1,7,1248955757,14,'c15b600eb9198b1924063b5a68758232','a:3:{s:6:\"ita-IT\";s:8:\"Articolo\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"Articolo\";}',1,1,'',0),(0,'<short_title|title>',1227478632,14,17,'article_mainpage',2,1,7,1252436842,14,'feaf24c0edae665e7ddaae1bc2b3fe5b','a:3:{s:6:\"ita-IT\";s:19:\"Article (main-page)\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:28:\"Articolo (pagina principale)\";}',1,1,'',0),(0,'<title|index_title>',1227478632,14,18,'article_subpage',2,0,7,1252749117,14,'68f305a18c76d9d03df36b810f290732','a:3:{s:6:\"ita-IT\";s:18:\"Article (sub-page)\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:27:\"Articolo (pagina sucessiva)\";}',1,1,'',0),(0,'<name>',1227478632,14,19,'blog',2,1,7,1248955900,14,'3a6f9c1f075b3bf49d7345576b196fe8','a:3:{s:6:\"ita-IT\";s:13:\"Blog (diario)\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:13:\"Diario (Blog)\";}',1,1,'',0),(0,'<title>',1227478632,14,20,'blog_post',2,1,7,1248956247,14,'7ecb961056b7cbb30f22a91357e0a007','a:3:{s:6:\"ita-IT\";s:9:\"Blog post\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:25:\"Pagina diario (blog post)\";}',1,1,'',0),(0,'<name>',1227478632,14,21,'product',4,0,5,1227478632,14,'77f3ede996a3a39c7159cc69189c5307','a:2:{s:6:\"ita-IT\";s:7:\"Product\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1227478632,14,22,'feedback_form',2,1,7,1252654771,14,'df0257b8fc55f6b8ab179d6fb915455e','a:3:{s:6:\"ita-IT\";s:13:\"Feedback form\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:19:\"Formulario feedback\";}',1,1,'',0),(0,'<name>',1227478632,14,23,'frontpage',2,1,7,1252655882,14,'e36c458e3e4a81298a0945f53a2c81f4','a:3:{s:6:\"ita-IT\";s:9:\"Frontpage\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:9:\"Frontpage\";}',1,1,'',0),(0,'<title>',1227478633,14,24,'documentation_page',4,1,5,1227478633,14,'d4a05eed0402e4d70fedfda2023f1aa2','a:2:{s:6:\"ita-IT\";s:18:\"Documentation page\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1227970430,14,45,'school_front',2,1,7,1250772743,14,'e36c458e3c4a01297a0945f53a2c81f4','a:3:{s:6:\"ita-IT\";s:30:\"Copia della classe <Frontpage>\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:16:\"Frontpage scuola\";}',1,1,'',0),(1,'<first_name> <last_name>',1230478027,14,47,'professore',2,0,3,1250778440,14,'40faa822edc579b02c25f6bb7bffc9ad','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:10:\"professore\";}',1,1,'',0),(1,'<scuola>',1230916544,14,70,'infoprof',2,0,7,1248895700,14,'3f78d8885edb26240b5aa6724e980d1f','a:3:{s:6:\"ita-IT\";s:8:\"infoProf\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:16:\"Prof information\";}',1,1,'',0),(1,'<short_name|name>',1230992912,14,73,'classgroup',2,1,7,1252746554,14,'a3d405b81be9994686c153d794f4ffc2','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:12:\"gruppoClassi\";s:6:\"ita-IT\";s:12:\"classesGroup\";}',1,1,'',0),(1,'<short_name|name>',1230993034,14,74,'classe',2,1,7,1252749319,14,'a3d495b910fc00468eb153d774f4f0d2','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:6:\"Classe\";s:6:\"ita-IT\";s:5:\"Class\";}',1,1,'',0),(1,'<short_name|name>',1234546821,14,76,'proffolder',2,1,7,1252747548,14,'a3d605b81be990468eb153d774fff0d2','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:29:\"Professore (spazio personale)\";s:6:\"ita-IT\";s:20:\"Prof personal folder\";}',1,1,'',0),(1,'<short_name|name>',1234638163,14,77,'profgroup',2,1,7,1252746820,14,'a3f495b81be900468eb153d774f4f0d2','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:13:\"gruppoDocenti\";s:6:\"ita-IT\";s:9:\"progGroup\";}',1,1,'',0),(1,'<first_name> <last_name>',1235896565,14,78,'alunno',2,0,3,1254408092,14,'40ffa822edc689b02c25f6bb7beec3ad','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:6:\"alunno\";}',1,1,'',0),(1,'<first_name> <last_name>',1235897014,14,79,'ata',2,0,3,1251295115,14,'40faa822edc479bc2c2ff6bb7beec3ad','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:3:\"ata\";}',1,1,'',0),(1,'<first_name> <last_name>',1235897048,14,80,'genitore',2,0,3,1251284981,14,'40faa822edc579b02c25f6bc7772c3ca','a:2:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"genitore\";}',1,1,'',0),(0,'<header>',1239294059,14,82,'infobox',2,0,7,1252657275,14,'0b4e8accad5bec5ba2d430acb25c1ff6','a:3:{s:6:\"ita-IT\";s:7:\"Infobox\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:12:\"Colonna info\";}',1,1,'',0),(0,'<name>',1239294061,14,83,'multicalendar',2,0,7,1250772675,14,'99aec4e5682414517ed929ecd969439f','a:3:{s:6:\"ita-IT\";s:13:\"Multicalendar\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:19:\"Calendario multiplo\";}',1,1,'',0),(0,'<name>',1239294062,14,84,'poll',2,0,7,1248956400,14,'232937a3a2eacbbf24e2601aebe16522','a:3:{s:6:\"ita-IT\";s:4:\"Poll\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:20:\"Questionario (breve)\";}',1,1,'',0),(0,'<name>',1239294064,14,85,'file',2,0,7,1252760530,14,'637d58bfddf164627bdfd265733280a0','a:3:{s:6:\"ita-IT\";s:4:\"File\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:4:\"File\";}',1,1,'',0),(0,'<name>',1239294065,14,86,'flash',4,0,5,1247834654,14,'6cd17b98a41ee9355371a376e8868ee0','a:2:{s:6:\"ita-IT\";s:5:\"Flash\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1239294066,14,87,'flash_recorder',4,0,5,1239294066,14,'e349c947fd306299418be35b07b9a940','a:2:{s:6:\"ita-IT\";s:14:\"Flash recorder\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1239294067,14,88,'flash_player',2,0,7,1252760650,14,'20b2ed0982343e6e0a550f7f0c137e06','a:3:{s:6:\"ita-IT\";s:18:\"Video/Flash Player\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:9:\"Video Flv\";}',1,1,'',0),(0,'<name>',1239294071,14,89,'global_layout',2,0,7,1248271534,14,'f0271811b913befa8f062527e909f15e','a:3:{s:6:\"ita-IT\";s:13:\"Global layout\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:14:\"Layout globale\";}',1,1,'',0),(0,'<name>',1239294073,14,90,'image',2,0,7,1252760592,14,'f6df12aa74e36230eb675f364fccd25a','a:3:{s:6:\"ita-IT\";s:5:\"Image\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"Immagine\";}',1,1,'',0),(0,'<name>',1239294075,14,91,'quicktime',4,0,5,1239294075,14,'16d7b371979d6ba37894cc8dc306f38f','a:2:{s:6:\"ita-IT\";s:9:\"Quicktime\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1239294076,14,92,'windows_media',4,0,5,1239294076,14,'223dd2551e85b63b55a72d02363faab6','a:2:{s:6:\"ita-IT\";s:13:\"Windows media\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1239294077,14,93,'real_video',4,0,5,1239294077,14,'dba67bc20a4301aa04cc74e411310dfc','a:2:{s:6:\"ita-IT\";s:10:\"Real video\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1239294079,14,94,'gallery',2,1,7,1250190836,14,'6a320cdc3e274841b82fcd63a86f80d1','a:3:{s:6:\"ita-IT\";s:8:\"Galleria\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"Galleria\";}',1,1,'',0),(0,'<name>',1239294081,14,95,'forum',2,1,7,1252655124,14,'b241f924b96b267153f5f55904e0675a','a:3:{s:6:\"ita-IT\";s:5:\"Forum\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:5:\"Forum\";}',1,1,'',0),(0,'<subject>',1239294083,14,96,'forum_topic',2,1,7,1250772477,14,'71f99c516743a33562c3893ef98c9b60','a:3:{s:6:\"ita-IT\";s:11:\"Forum topic\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:15:\"Forum-argomento\";}',1,1,'',0),(0,'<subject>',1239294084,14,97,'forum_reply',2,0,7,1250772317,14,'80ee42a66b2b8b6ee15f5c5f4b361562','a:3:{s:6:\"ita-IT\";s:11:\"Forum reply\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:14:\"Forum-risposta\";}',1,1,'',0),(0,'<short_title|title>',1239294087,14,98,'event',2,0,7,1251900703,14,'563cb5edc2adfd2b240efa456c81525f','a:3:{s:6:\"ita-IT\";s:5:\"Event\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:6:\"Evento\";}',1,1,'',0),(0,'<short_title|title>',1239294087,14,99,'event_calendar',2,1,7,1249913657,14,'020cbeb6382c8c89dcec2cd406fb47a8','a:3:{s:6:\"ita-IT\";s:10:\"Calendario\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:10:\"Calendario\";}',1,1,'',0),(0,'<name>',1239294087,14,100,'banner',2,0,7,1248955850,14,'9cb558e25fd946246bbb32950c00228e','a:3:{s:6:\"ita-IT\";s:6:\"Banner\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:6:\"Banner\";}',1,1,'',0),(0,'<title>',1239294087,14,101,'forums',2,1,7,1252655581,14,'60a921e54c1efbb9456bd2283d9e66cb','a:3:{s:6:\"ita-IT\";s:6:\"Forums\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:6:\"Forums\";}',1,1,'',0),(0,'<name>',1239294087,14,102,'silverlight',4,0,5,1239294087,14,'8ab17aae77dd4f24b5a8e835784e96e7','a:2:{s:6:\"ita-IT\";s:11:\"Silverlight\";s:16:\"always-available\";s:6:\"ita-IT\";}',1,1,'',0),(0,'<name>',1245253928,14,103,'macroarea',2,1,7,1252749969,14,'da584032603690cdbd1aabc9a65699b5','a:3:{s:6:\"ita-IT\";s:30:\"Copia della classe <Frontpage>\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:9:\"Macroarea\";}',1,1,'',0),(0,'<name>',1245485476,14,104,'m2000_front',2,1,7,1252656037,14,'d132026642c63fb2e8a7feb9ab4bc4a6','a:3:{s:6:\"ita-IT\";s:15:\"Frontpage m2000\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:15:\"Frontpage m2000\";}',1,1,'',0),(1,'<short_name|name>',1245524970,14,105,'folder_circolari',2,1,7,1252749600,14,'f9fd11674e4be2b264af608f3a0b99c8','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:16:\"Folder Circolari\";s:6:\"ita-IT\";s:16:\"Folder Circolari\";}',1,1,'',0),(1,'<short_name|name>',1245678069,14,106,'ufficio',2,1,7,1252748820,14,'6cbb1070bbfb679dfde52650cd3b3cec','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:7:\"Ufficio\";s:6:\"ita-IT\";s:6:\"Office\";}',1,1,'',0),(1,'<short_name|name>',1246371000,14,107,'dir_circolari',2,1,7,1252748164,14,'3b8dd7d9c93cafcead462ef5904247e3','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:22:\"Raccoglitore circolari\";s:6:\"ita-IT\";s:19:\"Directory Circolari\";}',1,1,'',0),(1,'<nome-corto|nome>',1247468829,14,108,'contatti',2,1,7,1248956326,14,'51c5725b2b601602d90e813f2f11d3b2','a:3:{s:6:\"ita-IT\";s:8:\"Contatti\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"Contacts\";}',1,1,'',0),(1,'<name>',1248522373,14,109,'libro',2,1,7,1252658877,14,'0ef021c603aa4e091141db92a198f857','a:3:{s:6:\"ita-IT\";s:5:\"Libro\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:4:\"Book\";}',1,1,'',0),(1,'<short_name|name>',1248617735,14,110,'dipendenti',2,1,7,1252521086,14,'5c1c2ebdb3e0ead93098739b35aa9c8a','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:10:\"Dipendenti\";s:6:\"ita-IT\";s:20:\"Employee (container)\";}',1,1,'',0),(1,'<short_title|title>',1248954682,14,111,'progetto',2,1,7,1248956523,14,'3597c79e3f55a77b1aa2b5fb805ad968','a:3:{s:6:\"ita-IT\";s:8:\"Progetto\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:8:\"Progetto\";}',1,1,'',0),(0,'<title>',1249328933,14,112,'newsletter_article',2,0,7,1250771598,14,'b18f33b12f2575396ad13185886bead7','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:18:\"Newsletter article\";s:6:\"ita-IT\";s:19:\"Articolo Newsletter\";}',1,1,'',0),(0,'<title>',1249328933,14,113,'newsletter_issue',2,0,7,1250771953,14,'2874d0ef083957db8c1e23803139b0f6','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:16:\"Newsletter issue\";s:6:\"ita-IT\";s:17:\"Uscita newsletter\";}',1,1,'',0),(0,'<name>',1250773594,14,114,'survey',2,0,7,1252678799,14,'16e88a5553cea0cfe0789270b653ef82','a:3:{s:6:\"ita-IT\";s:6:\"Survey\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:9:\"Sondaggio\";}',1,1,'',0),(0,'survey',1250773594,14,115,'survey_attribute',2,0,7,1250773878,14,'8f1f09937955ebc99432950c4bdaba33','a:3:{s:6:\"ita-IT\";s:16:\"Survey attribute\";s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:19:\"Attributo sondaggio\";}',1,1,'',0),(1,'<short_name|name>',1250793434,14,117,'dmsfolder',2,1,7,1250793641,14,'85442637eed684af2d11b85a21b7d791','a:3:{s:16:\"always-available\";s:6:\"ita-IT\";s:6:\"ita-IT\";s:16:\"Folder Documenti\";s:6:\"ita-IT\";s:10:\"Dms Folder\";}',1,1,'',0);

/*!40000 ALTER TABLE `ezcontentclass` ENABLE KEYS */;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



-- Dump completed on 2009-10-01 18:18:41

