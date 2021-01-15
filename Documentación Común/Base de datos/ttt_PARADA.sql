CREATE DATABASE  IF NOT EXISTS `ttt` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ttt`;
-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: 155.210.68.151    Database: ttt
-- ------------------------------------------------------
-- Server version	5.0.51a-24

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `PARADA`
--

DROP TABLE IF EXISTS `PARADA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PARADA` (
  `idParada` int(11) NOT NULL default '0',
  `descripcion` varchar(255) default NULL,
  `latitud` double default NULL,
  `longitud` double default NULL,
  PRIMARY KEY  (`idParada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PARADA`
--

LOCK TABLES `PARADA` WRITE;
/*!40000 ALTER TABLE `PARADA` DISABLE KEYS */;
INSERT INTO `PARADA` VALUES (101,'Nicanor Villalta (Nº4)',40.330605,-1.090903),(102,'Nicanor Villalta (INEM)',40.329064,-1.092501),(103,'Los Tilos (Colegio)',40.329464,-1.095376),(104,'Ramón J. Sender (Kiosko)',40.332814,-1.092774),(105,'Av. Sagunto (Entrada La Salle)',40.332948,-1.100124),(106,'Av. Aragón (Iglesia S. José)',40.333401,-1.103391),(107,'Av. Aragón (Club Ciclista)',40.332296,-1.104834),(108,'Av. Aragón (Jardines)',40.330767,-1.106618),(109,'Ambulatorio Norte',40.33045,-1.103386),(110,'Sanz Gadea (Frente Pl. Constitución)',40.330017,-1.108023),(111,'Sanz Gadea (Frente Playa de Aro)',40.33153,-1.108375),(112,'Ruiz Jarabo (Hospital)',40.333417,-1.107841),(113,'Ruiz Jarabo (Esq. Parque)',40.335198,-1.107033),(114,'Av. Sagunto (Barrabás)',40.336306,-1.104405),(115,'Salida Viaducto',40.340438,-1.10529),(116,'Estación de Autobuses',40.342298,-1.104587),(117,'Los Arcos (Dir. Viñas)',40.344389,-1.105105),(118,'Ctra. Alcañiz (Rep. Los Arcos)',40.347002,-1.108806),(119,'Ctra. Alcañiz (C.C. Matadero)',40.34831,-1.109257),(120,'Ctra. Alcañiz (Cruce C/ Valderrobles)',40.350275,-1.108989),(121,'Universidad',40.351599,-1.109989),(122,'IES Segundo Chomón',40.352668,-1.112081),(123,'Leocadio Brun',40.353901,-1.113468),(124,'Leocadio Brun (Fin de calle)',40.353226,-1.116252),(125,'Piscina S. León',40.352094,-1.116475),(126,'Capuchinos (Pabellón Las Viñas)',40.350371,-1.113103),(127,'Sta. Amalia (Rokelín)',40.349416,-1.111312),(128,'Sta. Amalia (Salida Ctra.)',40.349269,-1.109362),(129,'Ctra. Alcañiz (Frente Rep. Los Arcos)',40.346982,-1.108951),(130,'Los Arcos (Dir. Centro)',40.345297,-1.106197),(131,'Ronda (Mercado)',40.344042,-1.104928),(132,'Ronda Ambeles (E.R.Z.)',40.341331,-1.10485),(133,'Ovalo',40.341331,-1.108232),(134,'Ambulatorio Centro',40.340276,-1.107385),(135,'Ruiz Jarabo (Iglesia)',40.335337,-1.107154),(136,'Ruiz Jarabo (Frente Hospital)',40.333699,-1.107849),(137,'Playa de Aro',40.332063,-1.108578),(138,'Sanz Gadea (Pl. Constitución)',40.329935,-1.108163),(139,'Renfe (Frente)',40.341114,-1.110016),(140,'Av. Aragón (Frente Jardines)',40.330663,-1.106586),(141,'Av. Aragón (Frente Club Ciclista)',40.332243,-1.104748),(142,'Av. Aragón (Bar S. Miguel)',40.333509,-1.103037),(143,'Av. Sagunto (Los Gemelos)',40.33351,-1.101953),(144,'Av. Sagunto (Cruce Ctra. Castralvo)',40.332956,-1.100658),(145,'Frente Hogar S. José',40.333235,-1.092925),(146,'Parking Sabeco',40.332969,-1.088204),(147,'Los Olivos',40.329914,-1.094041),(148,'Av. Sagunto (Frente Joyería)',40.335431,-1.103246),(149,'Merced (Pl. San Sebastían)',40.345831,-1.10533),(150,'Carmen',40.346329,-1.113034),(151,'Carmen (Nº64)',40.347975,-1.115488),(152,'Av. Zaragoza (Frente Cárcel)',40.347329,-1.117502),(153,'Av. Zaragoza (Nº35)',40.346103,-1.115582),(154,'Av. Zaragoza (Moratilla)',40.344377,-1.112972),(155,'Jorgito (Dir. Pinar)',40.341548,-1.115558),(156,'Pinar',40.340673,-1.114973),(157,'Camino Muela',40.341106,-1.115225),(158,'Jorgito (Dir. Centro)',40.341478,-1.115716),(159,'Renfe',40.341037,-1.110188),(160,'Florida',40.338305,-1.108911),(161,'San Julián (Cruce Carretera)',40.338757,-1.104584),(162,'Ctra. San Julián',40.338677,-1.102999),(163,'Ctra. San Julián (Edif. Bellido)',40.338325,-1.102302),(164,'San Julián (Colegio)',40.341266,-1.103163),(165,'Av. Sagunto (Bar Amantes)',40.336101,-1.104357),(166,'Av. Sagunto (Joyería)',40.335476,-1.103531),(167,'Ramón J. Sender (Iglesia)',40.332213,-1.093271),(168,'Nicanor Villalta (Frente INEM)',40.329211,-1.092265),(169,'Nicanor Villalta (Farmacia)',40.332319,-1.089851),(170,'Dinópolis',40.332914,-1.083559),(171,'San León',40.347681,-1.110231),(172,'Av. Zaragoza (Cruce Franciscanos)',40.344645,-1.113208),(173,'Av. Zaragoza (Hospital)',40.346127,-1.115421),(174,'Parador',40.351442,-1.125712),(175,'Polígono (Gasolinera)',40.357566,-1.136414),(176,'Polígono (Asempaz)',40.359437,-1.14099),(177,'Polígono (Antes de rotonda)',40.358228,-1.142246),(178,'Polígono (C/ B: Hierros Teruel)',40.358923,-1.14422),(179,'Polígono (El Castellar)',40.360893,-1.14717),(180,'Polígono (C/ M)',40.363746,-1.153189),(181,'Polígono (Euroquince)',40.364711,-1.157663),(182,'Polígono (Cetesa)',40.362193,-1.15497),(183,'Polígono (Cryo)',40.360566,-1.147374),(184,'Polígono (Frente Hierros Teruel)',40.359176,-1.144788),(185,'Polígono (Rotonda C/ B)',40.357917,-1.142868),(186,'Polígono (Piensos Sol)',40.362283,-1.144295),(187,'Polígono (M. Rillo)',40.357999,-1.137782),(188,'Av. Zaragoza (M. Bielsa)',40.367261,-1.154476),(189,'Nicanor Villalta (De Cruce Ctra. Castralvo)',40.327575,-1.095725),(190,'Nicanor Villalta (Frente Nº4)',40.330336,-1.091005),(191,'Hogar S. José',40.333378,-1.092796),(192,'Frente Inserso',40.331329,-1.101267),(193,'Inserso',40.331804,-1.10117),(194,'Ctra. Alcañiz (Junto camino Cementerio)',40.355561,-1.108267),(195,'Ctra. Alcañiz (Cruce calle Universidad)',40.35128,-1.10897),(196,'Ctra. Alcañiz (Antes C/ Sta. Amalia)',40.349913,-1.109142),(197,'Nicanor Villalta (Salida)',40.332369,-1.090319),(198,'Nicanor Villalta (A Cruce Ctra. Castralvo)',40.327681,-1.095779),(199,'Florida (Frente)',40.338383,-1.108919);
/*!40000 ALTER TABLE `PARADA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-17 21:06:51
