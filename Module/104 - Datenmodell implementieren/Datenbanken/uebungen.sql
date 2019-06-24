-- MySQL dump 10.14  Distrib 5.5.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: uebungen
-- ------------------------------------------------------
-- Server version	5.5.36-MariaDB

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
-- Current Database: `uebungen`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `uebungen` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `uebungen`;

--
-- Table structure for table `t_abt`
--

DROP TABLE IF EXISTS `t_abt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_abt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `ort` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_abt`
--

LOCK TABLES `t_abt` WRITE;
/*!40000 ALTER TABLE `t_abt` DISABLE KEYS */;
INSERT INTO `t_abt` VALUES (1,'Einkauf','Frankfurt'),(2,'Marketing','Berlin'),(3,'Verkauf','Frankfurt'),(4,'Produktion','Berlin'),(5,'Abt_Organisation','Berlin');
/*!40000 ALTER TABLE `t_abt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_artikel`
--

DROP TABLE IF EXISTS `t_artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `code` varchar(30) NOT NULL DEFAULT '',
  `lieferant` int(11) DEFAULT NULL,
  `bemerkung` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namecodeindex` (`name`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_artikel`
--

LOCK TABLES `t_artikel` WRITE;
/*!40000 ALTER TABLE `t_artikel` DISABLE KEYS */;
INSERT INTO `t_artikel` VALUES (22,'Bleistift B (10 Stück)','3423',1,NULL),(23,'Bleistift H (10 Stück)','3123',1,NULL),(33,'Füllhalter P1','4346',1,NULL),(35,'Füllhalter P','4344',2,NULL),(38,'Füllhalter P2 rechtshänder','4322',1,NULL),(43,'Kugelschreiber KG1','5232',2,NULL),(44,'Kugelschreiber KG2','5223',2,NULL),(45,'Bleistift HB (10 Stück)','4342',1,NULL),(46,'Füllhalter P2 linkshänder','4323',1,NULL),(47,'Füllhalter','4333',2,NULL),(48,'Kugelschreiber KG5','5222',2,NULL),(49,'Kugelschreiber Edel','5233',3,NULL),(50,'Fineliner (10 Stück)','4444',2,NULL);
/*!40000 ALTER TABLE `t_artikel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lager`
--

DROP TABLE IF EXISTS `t_lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_lager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stueck` int(11) DEFAULT NULL,
  `preis` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lager`
--

LOCK TABLES `t_lager` WRITE;
/*!40000 ALTER TABLE `t_lager` DISABLE KEYS */;
INSERT INTO `t_lager` VALUES (22,267,22),(23,100,10),(33,134,8.5),(38,89,35.8),(45,156,9.5),(46,322,12),(47,46,24.8),(48,245,5.5),(49,144,14.6),(50,45,34);
/*!40000 ALTER TABLE `t_lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_liefer`
--

DROP TABLE IF EXISTS `t_liefer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_liefer` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(150) DEFAULT NULL,
  `plz` varchar(5) DEFAULT NULL,
  `ort` varchar(100) DEFAULT NULL,
  `str` varchar(100) DEFAULT NULL,
  `hnr` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_liefer`
--

LOCK TABLES `t_liefer` WRITE;
/*!40000 ALTER TABLE `t_liefer` DISABLE KEYS */;
INSERT INTO `t_liefer` VALUES (1,'Klix','82528','Niederdorf','Blumenstr.','3'),(2,'Klecks','63368','Tuxhausen','Beyerstr.','3'),(3,'Reiher','64688','Trautheim','Opernstr.','3');
/*!40000 ALTER TABLE `t_liefer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ma`
--

DROP TABLE IF EXISTS `t_ma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `vname` varchar(50) DEFAULT NULL,
  `str` varchar(150) DEFAULT NULL,
  `plz` varchar(5) DEFAULT NULL,
  `ort` varchar(50) DEFAULT NULL,
  `abtnr` int(11) DEFAULT NULL,
  `hnr` varchar(5) DEFAULT NULL,
  `gebdat` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ma`
--

LOCK TABLES `t_ma` WRITE;
/*!40000 ALTER TABLE `t_ma` DISABLE KEYS */;
INSERT INTO `t_ma` VALUES (1,'Heinrichs','Harry','Ringstr.','04651','Bad Lausick',1,'14','1945-01-12'),(2,'Kunkel','Silke','Kauterbacher Str.','04651','Bad Lausick',1,'2','1968-05-14'),(3,'Kroner','Bart','Waldstr.','04651','Bad Lausick',1,'26','1975-12-12'),(5,'Grinter','Frank','Reichersdorfer Str.','04651','Bad Lausick',1,'19','1972-06-25'),(6,'Füller','Gerd','Neue Landstr.','04651','Bad Lausick',1,'16','1968-04-03'),(7,'Hellmass','Paul','Colditz-Str.','04651','Bad Lausick',1,'5','1949-01-05'),(8,'Körner','Laura','Ringstr.','04651','Bad Lausick',1,'23','1981-08-09'),(11,'Engelhardt','Josef','Berliner Str.','55283','Nierstein',2,'5','1983-06-18'),(12,'Lauf','Heinz','Riedstr.','55283','Nierstein',2,'27','1974-08-14'),(13,'Müller','Roberta','Pestalozzistr.','55283','Nierstein',2,'30','1971-05-24'),(14,'Uhlig','Bernd','Alte Dorfstr.','04448','Wiederitzsch',2,'3','1962-09-13'),(15,'Ulmer','Karin','In den Weingärten','55283','Nierstein',2,'1','1963-12-23'),(16,'Buser','Peter','Arndtstr.','12489','Berlin',3,'52','1961-11-11'),(17,'Nüsert','Hannelore','Gruberzeile','13593','Berlin',3,'23','1976-01-05'),(18,'Franzen','Britta','Ackerstr.','10115','Berlin',3,'1','1974-07-09'),(19,'Pflüger','Susi','Ratiborstr.','10999','Berlin',3,'11','1988-06-18'),(20,'Pfennig','Veronika','Bahnhofstr.','12305','Berlin',3,'25','1984-09-12'),(21,'Hahnert','Lisa','Stillerzeile','12587','Berlin',3,'39','1963-06-04'),(22,'Heilemann','Lutz','Weimarer Str.','10625','Berlin',3,'28','1977-05-07'),(23,'Schubert','Ernst','Lauenburger Str.','12157','Berlin',3,'10','1963-01-26'),(24,'Eilmann','Gretchen','Briesestr.','12053','Berlin',4,'33','1949-12-14'),(25,'Hellstern','Dieter','Fehrbelliner Str.','10119','Berlin',4,'35','1984-02-12'),(26,'Hannemann','Helmut','Savignyplatz','10623','Berlin',4,'11','1986-08-08'),(27,'Kersten','Bernd','Borkheider Str.','12689','Berlin',4,'15','1972-11-05'),(28,'Krämer','Gino','Hennigsdorfer Str.','13503','Belin',4,'35 a','1964-05-05'),(29,'Schuster','Gabriele','Maienweg','22297','Hamburg',4,'89','1948-05-06'),(30,'Schubert','Wolfgang','Ellenbogen 13','20144','Hamburg',4,'13','1972-06-08'),(31,'Hahne','Klaus','Schedestr.','20251','Hamburg',4,'9','1976-03-16'),(32,'Heim','Michael','Bredowstr.','22113','Hamburg',4,'33','1948-03-09'),(33,'Hellmann','Manuela','Stresemannallee','22529','Hamburg',4,'54 a ','1982-11-25'),(34,'Heyne','Hermann','Bauerberg','22111','Hamburg',4,'27','1981-10-29'),(35,'Schneider','Bert','Grandweg','22529','Hamburg',4,'3','1980-12-24'),(36,'Schulze','Norbert','Pilatuspool','20355','Hamburg',4,'16','1976-12-15'),(37,'Engelke','Luisa','Keplerstr.','22763','Hamburg',4,'23','1973-01-05'),(38,'Möller','Jochen','St. Georgs Kirchhof','20099','Hamburg',4,'23','1978-09-19'),(39,'Zürcher','Steven','Mühlenweg','21465','Reinbek',4,'1','1982-07-18'),(40,'Hahnemann','Eva','Canisiusstr.','47803','Krefeld',NULL,'24','1955-05-16'),(41,'Buschert','Ernesto','Potsdamer Str.','47800','Krefeld',NULL,'9','1952-04-12'),(42,'Lüchner','Marga','Westparkstr.','47803','Krefeld',NULL,'24','1945-06-15'),(43,'Mopfert','Kerstin','Osterather Weg','47807','Krefeld',NULL,'32','1959-07-08'),(44,'Müller','Harry','Ritterstr.','47805','Krefeld',NULL,'229','1963-06-24'),(45,'Körner','Claudia','Calvisiusstr.','47803','Krefeld',NULL,'24','1984-06-27'),(46,'Benkert','Heidelore','Moosweg','88079','Kressbronn',NULL,'22','1987-12-05'),(47,'Sattler','Ulrike','Hauptstr.','88079','Kressbronn',NULL,'32','1974-06-24'),(48,'Peters','Heiner','Kieselbuchweg','88079','Kressbronn',NULL,'3','1976-05-26'),(49,'Glauber','Bernd','Danziger Weg','88079','Kressbronn',NULL,'15','1881-02-23'),(50,'Aldag','Iris','Hemigkofener Str.','88079','Kressbronn',NULL,'18','1981-05-06'),(51,'Uhlig','Dirk','Am Nonnenbach','88079','Kressbronn',NULL,'5','1974-09-18'),(52,'Steinfeld','Matthias','Schillerstr.','88079','Kressbronn',NULL,'16','1972-06-18'),(53,'Hauer','Siegfried','Dünenstr.','18609','Ostseebad Binz',NULL,'73','1964-05-09'),(54,'Griepke','Ina','Ringstr.','18609','Ostseebad Binz',NULL,'4','1959-04-16'),(55,'Beckert','Denise','Proraer Chaussee','18609','Ostseebad Binz',NULL,'7','1959-06-18'),(56,'Degen','Otto','Wandastr.','18609','Ostseebad Binz',NULL,'3','1956-07-12'),(57,'Blengert','Ernst','Margaretenstr.','18609','Ostseebad Binz',NULL,'4','1952-12-04'),(58,'Küfner','Beate','Putbuser Str.','18609','Ostseebad Binz',NULL,'27','1975-06-23'),(59,'Dorn','Elfriede','Südstr.','18609','Ostseebad Binz',NULL,'23','1965-04-15'),(60,'Eckner','Paul','Kleiststr.','07545','Gera',NULL,'7','1962-03-25'),(61,'Meyer','Angelika','Industriestr.','07546','Gera',NULL,'3','1964-04-02'),(62,'Engelbert','Torsten','Fliederweg','07546','Gera',NULL,'9','1953-02-25'),(63,'Ullrich','Hermann','Puschkinplatz','07545','Gera',NULL,'4','1956-08-24'),(64,'Drescher','Klaus','Ernseer Str.','07548','Ernsee',NULL,'1','1964-08-27'),(65,'Mehnert','Karin','Turmstraße','07546','Gera',NULL,'19','1963-06-30'),(66,'Schäfer','Daniela','Keplerstr.','07549','Gera',NULL,'10','1968-02-28'),(67,'Johannsen','Ilona','Dorfstr.','07639','Tautenhain',NULL,'80 a','1956-01-31'),(68,'Heinert','Frank','Leipziger Str.','07545','Gera',NULL,'14','1965-09-30'),(69,'Laufert','Ingo','Am Sportplatz','07552','Gera',NULL,'24','1975-05-31'),(70,'Eifert','Hans','Alte Dorfstr.','04448','Wiederitzsch',NULL,'3','1976-05-21'),(71,'Horstmann','Uwe','Brackestr.','04207','Leipzig',NULL,'33','1946-02-26'),(72,'Meinert','Heiner','Annaberger Str.','04159','Leipzig',NULL,'4','1956-04-24'),(73,'Maierl','Kurt','Aurelienstr.','04177','Leipzig',NULL,'15','1984-08-26'),(74,'Ferner','Bruno','Husemannstr.','04315','Leipzig',NULL,'3','1987-06-30'),(75,'Bader','Gustav','Merkwitzer Str.','04356','Leipzig',NULL,'24','1982-04-12'),(76,'Fleischhauer','Kuno','Bernhard-Göring-Str.','04275','Leipzig',NULL,'118','1976-06-04'),(77,'Fellmann','Guido','Robert-Schumann-Str.','04107','Leipzig',NULL,'5','1973-09-21'),(78,'Gerber','Cornelia','Richard-Lehmann-Str.','04275','Leipzig',NULL,'36','1946-06-21'),(79,'Nagel','Brigitte','Könneritzstr.','04229','Leipzig',NULL,'75','1951-06-13'),(80,'Opitz','Janine','Straße des 18. Oktobers','04315','Leipzig',NULL,'26','1946-05-26'),(81,'Kampner','Roswita','Härtelstr.','04107','Leipzig',NULL,'4','1981-05-08'),(82,'Schubert','Bruno','Maistr.','80337','München',NULL,'31','1946-06-03'),(83,'Gruner','Christian','Rosenheimer Str.','81671','München',NULL,'145 a','1976-05-16'),(84,'Henze','Michael','Melusinenstr.','81671','München',NULL,'2','1986-02-04'),(85,'Schuster','Marcus','Nikolaistr','80802','München',NULL,'5','1984-09-19'),(86,'Cäsar','Harald','Lessingstr.','19059','Schwerin',NULL,'16','1958-02-02'),(87,'Behr','Luise','Kösliner Str.','44581','Castrop-Rauxel',NULL,'9','1983-06-27'),(88,'Plüschke','Dora','Wasserwerkstr.','44575','Castrop-Rauxel',NULL,'33','1972-09-25'),(89,'Lehmann','Gertrud','Wuppertaler Str.','19063','Schwerin',NULL,'33','1969-08-15'),(90,'Uhlisch','Manfred','Güstrower Str.','19055','Schwerin',NULL,'11','1983-11-25'),(91,'Walter','Kurt','Alte Dorfstr.','19063','Schwerin',NULL,'39','1986-06-09'),(92,'Vogel','Kerstin','Eschenbachstr.','81549','München',NULL,'12','1972-08-19'),(93,'Krämer','Inge','Kurhausstr.','25999','Kampen',NULL,'21','1976-04-16'),(94,'Auster','Leon','Stieglitzweg','25999','Kampen',NULL,'4','1956-08-15'),(95,'Buchwald','Marlies','Börderstich','25999','Kampen',NULL,'3 b','1983-06-30'),(96,'Schnurpel','Wolfgang','Zur Düne','25999','Kampen',NULL,'7','1986-09-25'),(97,'Zetsche','Marion','Theresienstr.','80333','München',NULL,'155','1984-09-24'),(98,'Schieler','Helena','Domagkstr.','80807','München',NULL,'24','1972-05-19'),(99,'Fläming','Johannes','Schönfeldstr.','80539','München',NULL,'10','1964-03-06'),(100,'Wolter','Axel','Im Hagen','44581','Castrop-Rauxel',NULL,'6','1964-08-16'),(103,'Schulze','Otto',NULL,NULL,'Hamburg',NULL,NULL,'1964-03-06'),(104,'Meyer','Peter',NULL,NULL,NULL,NULL,NULL,'1687-03-06');
/*!40000 ALTER TABLE `t_ma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ma_dt`
--

DROP TABLE IF EXISTS `t_ma_dt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ma_dt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `vname` varchar(50) DEFAULT NULL,
  `str` varchar(150) DEFAULT NULL,
  `plz` varchar(5) DEFAULT NULL,
  `ort` varchar(50) DEFAULT NULL,
  `hnr` varchar(5) DEFAULT NULL,
  `gebdat` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ma_dt`
--

LOCK TABLES `t_ma_dt` WRITE;
/*!40000 ALTER TABLE `t_ma_dt` DISABLE KEYS */;
INSERT INTO `t_ma_dt` VALUES (1,'Illner','Hans','Rochlitzer Str.','04651','Rochlitz','55','1972-05-19'),(2,'Schubert','Klaus','Albert-Schweitzer-Str.','55283','Nierstein','10','1963-07-08'),(3,'Schäfer','Rosina',NULL,NULL,NULL,NULL,NULL),(4,'Meier','Susi','Königswarterstr.','60316','Frankfurt','4','1981-08-17'),(5,'Brauer','Claudia','Oeder Weg','60318','Frankfurt','156','1982-05-18'),(6,'Apelt','Auguste','Melemstr.','60322','Frankfurt','24','1973-08-19'),(7,'Backhaus','Erna','Heidestr. 150','60385','Frankfurt','150','1958-06-19');
/*!40000 ALTER TABLE `t_ma_dt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ma_proj`
--

DROP TABLE IF EXISTS `t_ma_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ma_proj` (
  `ma_id` int(11) NOT NULL DEFAULT '0',
  `proj_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ma_proj`
--

LOCK TABLES `t_ma_proj` WRITE;
/*!40000 ALTER TABLE `t_ma_proj` DISABLE KEYS */;
INSERT INTO `t_ma_proj` VALUES (2,1),(5,1),(8,1),(11,1),(14,2),(18,2);
/*!40000 ALTER TABLE `t_ma_proj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_produkt`
--

DROP TABLE IF EXISTS `t_produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_produkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `bemerk` varchar(100) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_produkt_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_produkt`
--

LOCK TABLES `t_produkt` WRITE;
/*!40000 ALTER TABLE `t_produkt` DISABLE KEYS */;
INSERT INTO `t_produkt` VALUES (1,'Schraube M4','lieferbar','2010-10-01'),(2,'Schraube M6','lieferbar','2010-10-01'),(3,'Schraube M8','lieferbar','2010-10-01'),(4,'Schraube M10','lieferbar','2010-10-01'),(5,'Mutter M4','lieferbar','2010-10-01'),(6,'Mutter M6','lieferbar','2010-10-01'),(7,'Mutter M8','lieferbar','2010-10-01'),(8,'Mutter M10','lieferbar','2010-10-01'),(9,'Unterlegscheibe M4','lieferbar','2010-10-01'),(10,'Unterlegscheibe M6','lieferbar','2010-10-01'),(11,'Unterlegscheibe M8','lieferbar','2010-10-01'),(12,'Unterlegscheibe M10','lieferbar','2010-10-01');
/*!40000 ALTER TABLE `t_produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_proj`
--

DROP TABLE IF EXISTS `t_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_proj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `beginn` date DEFAULT NULL,
  `ende` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_proj`
--

LOCK TABLES `t_proj` WRITE;
/*!40000 ALTER TABLE `t_proj` DISABLE KEYS */;
INSERT INTO `t_proj` VALUES (1,'Buchprojekt','2010-07-01','2010-08-20'),(2,'Renovierung des Pausenraumes','2010-07-01','2010-07-10'),(3,'Anlegen eines Pflichtenheftes','2010-08-10','2010-10-12'),(4,'Werbeaktion','2010-08-01','2010-10-30');
/*!40000 ALTER TABLE `t_proj` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-14 14:57:38
