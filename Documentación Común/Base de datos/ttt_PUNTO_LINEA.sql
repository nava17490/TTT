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
-- Table structure for table `PUNTO_LINEA`
--

DROP TABLE IF EXISTS `PUNTO_LINEA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUNTO_LINEA` (
  `idLinea` char(10) NOT NULL default '',
  `sentido` int(11) NOT NULL default '0',
  `idParada` int(11) NOT NULL default '0',
  `posicion` int(11) default NULL,
  `distancia` int(11) default NULL,
  PRIMARY KEY  (`idLinea`,`sentido`,`idParada`),
  KEY `idParada` (`idParada`),
  KEY `idLinea` (`idLinea`,`sentido`),
  CONSTRAINT `PUNTO_LINEA_ibfk_1` FOREIGN KEY (`idParada`) REFERENCES `PARADA` (`idParada`),
  CONSTRAINT `PUNTO_LINEA_ibfk_2` FOREIGN KEY (`idLinea`, `sentido`) REFERENCES `LINEA` (`idLinea`, `sentido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PUNTO_LINEA`
--

LOCK TABLES `PUNTO_LINEA` WRITE;
/*!40000 ALTER TABLE `PUNTO_LINEA` DISABLE KEYS */;
INSERT INTO `PUNTO_LINEA` VALUES ('L-1',0,102,2,450),('L-1',0,103,3,500),('L-1',0,104,4,450),('L-1',0,105,5,750),('L-1',0,106,6,350),('L-1',0,107,7,170),('L-1',0,108,8,240),('L-1',0,109,9,750),('L-1',0,110,10,700),('L-1',0,111,11,170),('L-1',0,112,12,230),('L-1',0,113,13,210),('L-1',0,114,14,350),('L-1',0,115,15,500),('L-1',0,116,16,220),('L-1',0,117,17,260),('L-1',0,118,18,450),('L-1',0,119,19,160),('L-1',0,120,20,220),('L-1',0,121,21,260),('L-1',0,197,1,0),('L-1',1,109,19,600),('L-1',1,121,1,0),('L-1',1,122,2,290),('L-1',1,123,3,220),('L-1',1,124,4,270),('L-1',1,125,5,180),('L-1',1,126,6,350),('L-1',1,127,7,190),('L-1',1,128,8,170),('L-1',1,129,9,270),('L-1',1,130,10,300),('L-1',1,131,11,180),('L-1',1,132,12,350),('L-1',1,133,13,600),('L-1',1,134,14,280),('L-1',1,135,15,750),('L-1',1,136,16,210),('L-1',1,137,17,200),('L-1',1,138,18,240),('L-1',1,140,20,800),('L-1',1,141,21,250),('L-1',1,142,22,210),('L-1',1,143,23,130),('L-1',1,144,24,140),('L-1',1,145,25,700),('L-1',1,197,26,350),('L-2',0,101,2,450),('L-2',0,102,3,240),('L-2',0,104,5,350),('L-2',0,105,6,750),('L-2',0,114,8,140),('L-2',0,115,9,500),('L-2',0,116,10,220),('L-2',0,133,23,800),('L-2',0,134,24,280),('L-2',0,143,27,260),('L-2',0,146,1,600),('L-2',0,147,4,220),('L-2',0,148,7,400),('L-2',0,149,11,550),('L-2',0,150,12,900),('L-2',0,151,13,280),('L-2',0,152,14,400),('L-2',0,153,15,210),('L-2',0,154,16,290),('L-2',0,159,17,500),('L-2',0,160,18,400),('L-2',0,161,19,400),('L-2',0,162,20,170),('L-2',0,163,21,350),('L-2',0,164,22,500),('L-2',0,165,25,650),('L-2',0,166,26,100),('L-2',0,167,28,950),('L-2',0,168,29,450),('L-2',0,169,30,400),('L-2',0,170,31,700),('L-2',1,101,2,450),('L-2',1,102,3,240),('L-2',1,104,5,350),('L-2',1,105,6,750),('L-2',1,114,8,140),('L-2',1,115,9,500),('L-2',1,116,10,220),('L-2',1,133,27,800),('L-2',1,134,28,280),('L-2',1,143,31,260),('L-2',1,146,1,600),('L-2',1,147,4,220),('L-2',1,148,7,400),('L-2',1,149,11,550),('L-2',1,150,12,900),('L-2',1,151,13,280),('L-2',1,152,14,400),('L-2',1,153,15,210),('L-2',1,154,16,290),('L-2',1,155,17,600),('L-2',1,156,18,450),('L-2',1,157,19,190),('L-2',1,158,20,400),('L-2',1,159,21,800),('L-2',1,160,22,400),('L-2',1,161,23,400),('L-2',1,162,24,170),('L-2',1,163,25,350),('L-2',1,164,26,500),('L-2',1,165,29,650),('L-2',1,166,30,100),('L-2',1,167,32,950),('L-2',1,168,33,450),('L-2',1,169,34,400),('L-2',1,170,35,700),('L-3',0,121,1,0),('L-3',0,127,2,300),('L-3',0,131,4,650),('L-3',0,132,5,350),('L-3',0,133,6,600),('L-3',0,152,9,220),('L-3',0,171,3,220),('L-3',0,172,7,600),('L-3',0,173,8,250),('L-3',0,174,10,900),('L-3',0,175,11,1200),('L-3',0,176,12,550),('L-3',1,116,18,500),('L-3',1,118,19,700),('L-3',1,119,20,160),('L-3',1,121,21,500),('L-3',1,133,16,550),('L-3',1,134,17,280),('L-3',1,153,14,4400),('L-3',1,154,15,290),('L-3',1,176,1,0),('L-3',1,177,2,170),('L-3',1,178,3,230),('L-3',1,179,4,350),('L-3',1,180,5,750),('L-3',1,181,6,400),('L-3',1,182,7,600),('L-3',1,183,8,650),('L-3',1,184,9,280),('L-3',1,185,10,1200),('L-3',1,186,11,750),('L-3',1,187,12,750),('L-3',1,188,13,1900),('L-4',0,107,1,0),('L-4',0,111,2,350),('L-4',0,112,3,230),('L-4',0,113,4,210),('L-4',0,139,16,400),('L-4',0,143,6,260),('L-4',0,152,19,220),('L-4',0,161,14,300),('L-4',0,163,12,1100),('L-4',0,164,13,500),('L-4',0,166,5,350),('L-4',0,168,9,350),('L-4',0,172,17,550),('L-4',0,173,18,250),('L-4',0,174,20,900),('L-4',0,175,21,1200),('L-4',0,176,22,550),('L-4',0,189,8,750),('L-4',0,190,10,170),('L-4',0,191,11,500),('L-4',0,192,7,300),('L-4',0,199,15,400),('L-4',1,102,23,450),('L-4',1,106,26,450),('L-4',1,107,27,170),('L-4',1,145,21,1100),('L-4',1,153,14,4400),('L-4',1,154,15,290),('L-4',1,159,16,500),('L-4',1,160,17,400),('L-4',1,161,18,400),('L-4',1,162,20,400),('L-4',1,164,19,300),('L-4',1,176,1,0),('L-4',1,177,2,170),('L-4',1,178,3,230),('L-4',1,179,4,350),('L-4',1,180,5,750),('L-4',1,181,6,400),('L-4',1,182,7,600),('L-4',1,183,8,650),('L-4',1,184,9,280),('L-4',1,185,10,1200),('L-4',1,186,11,750),('L-4',1,187,12,750),('L-4',1,188,13,1900),('L-4',1,193,25,800),('L-4',1,197,22,350),('L-4',1,198,24,350),('L-6',0,102,2,450),('L-6',0,104,4,350),('L-6',0,105,5,750),('L-6',0,114,7,140),('L-6',0,115,8,500),('L-6',0,116,9,220),('L-6',0,117,10,260),('L-6',0,118,11,450),('L-6',0,119,12,160),('L-6',0,120,13,220),('L-6',0,147,3,220),('L-6',0,148,6,400),('L-6',0,194,14,600),('L-6',0,197,1,0),('L-6',1,129,4,350),('L-6',1,130,5,300),('L-6',1,131,6,180),('L-6',1,132,7,350),('L-6',1,133,8,600),('L-6',1,134,9,280),('L-6',1,143,12,260),('L-6',1,144,13,140),('L-6',1,145,14,700),('L-6',1,165,10,650),('L-6',1,166,11,100),('L-6',1,194,1,0),('L-6',1,195,2,500),('L-6',1,196,3,150),('L-6',1,197,15,350),('L-7',0,114,10,140),('L-7',0,133,11,850),('L-7',0,134,1,280),('L-7',0,135,2,750),('L-7',0,136,3,210),('L-7',0,137,4,200),('L-7',0,138,5,240),('L-7',0,140,6,250),('L-7',0,141,7,250),('L-7',0,142,8,210),('L-7',0,148,9,300),('L-N',0,102,2,450),('L-N',0,104,4,350),('L-N',0,105,5,750),('L-N',0,106,6,350),('L-N',0,107,7,170),('L-N',0,111,8,350),('L-N',0,112,9,230),('L-N',0,113,10,210),('L-N',0,114,11,350),('L-N',0,115,12,500),('L-N',0,116,13,220),('L-N',0,117,14,260),('L-N',0,118,15,450),('L-N',0,119,16,160),('L-N',0,120,17,220),('L-N',0,121,18,260),('L-N',0,147,3,220),('L-N',0,197,1,0),('L-N',1,121,1,0),('L-N',1,128,2,350),('L-N',1,129,3,270),('L-N',1,130,4,300),('L-N',1,131,5,180),('L-N',1,132,6,350),('L-N',1,135,7,800),('L-N',1,136,8,210),('L-N',1,137,9,200),('L-N',1,141,10,400),('L-N',1,143,11,350),('L-N',1,145,12,850),('L-N',1,197,13,350);
/*!40000 ALTER TABLE `PUNTO_LINEA` ENABLE KEYS */;
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
