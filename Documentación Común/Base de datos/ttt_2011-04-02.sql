# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: 155.210.68.151 (MySQL 5.0.51a-24)
# Database: ttt
# Generation Time: 2011-04-02 13:06:55 +0200
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table AUTOBUS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AUTOBUS`;

CREATE TABLE `AUTOBUS` (
  `idAutobus` int(11) NOT NULL,
  `idLinea` char(10) default NULL,
  `sentido` int(11) default NULL,
  `idParada` int(11) default NULL,
  `velocidad` float default NULL,
  PRIMARY KEY  (`idAutobus`),
  KEY `punto_linea` (`idLinea`,`sentido`,`idParada`),
  CONSTRAINT `AUTOBUS_ibfk_1` FOREIGN KEY (`idLinea`, `sentido`, `idParada`) REFERENCES `PUNTO_LINEA` (`idLinea`, `sentido`, `idParada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `AUTOBUS` WRITE;
/*!40000 ALTER TABLE `AUTOBUS` DISABLE KEYS */;
INSERT INTO `AUTOBUS` (`idAutobus`,`idLinea`,`sentido`,`idParada`,`velocidad`)
VALUES
	(1001,'L-1',1,133,16.82),
	(1002,'L-3',0,127,18.24),
	(1003,'L-1',1,136,17.34),
	(1004,NULL,NULL,NULL,NULL),
	(1005,'L-3',0,171,15.25);

/*!40000 ALTER TABLE `AUTOBUS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LINEA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LINEA`;

CREATE TABLE `LINEA` (
  `idLinea` char(10) NOT NULL default '',
  `sentido` int(11) NOT NULL default '0',
  `nombre` varchar(255) default NULL,
  PRIMARY KEY  (`idLinea`,`sentido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `LINEA` WRITE;
/*!40000 ALTER TABLE `LINEA` DISABLE KEYS */;
INSERT INTO `LINEA` (`idLinea`,`sentido`,`nombre`)
VALUES
	('L-1',0,'FUENFRESCA - ENSANCHE - CENTRO - VIÑAS'),
	('L-1',1,'VIÑAS - ENSANCHE - CENTRO - FUENFRESCA'),
	('L-2',0,'DINOPOLIS - ENSANCHE - CENTRO - PINAR (NO SUBE A Bº JORGITO)'),
	('L-2',1,'DINOPOLIS - ENSANCHE - CENTRO - PINAR (SI SUBE A Bº JORGITO)'),
	('L-3',0,'VIÑAS - CENTRO - POLIGONO'),
	('L-3',1,'POLIGONO - CENTRO - VIÑAS'),
	('L-4',0,'ENSANCHE - FUENFRESCA - SAN JULIAN -POLIGONO'),
	('L-4',1,'POLIGONO - CENTRO - SAN JULIAN - ENSANCHE'),
	('L-6',0,'FUENFRESCA - CENTRO'),
	('L-6',1,'CENTRO - ENSANCHE'),
	('L-7',0,'CENTRO - ENSANCHE'),
	('L-N',0,'FUENFRESCA - CENTRO - VIÑAS'),
	('L-N',1,'VIÑAS - CENTRO - FUENFRESCA');

/*!40000 ALTER TABLE `LINEA` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PARADA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PARADA`;

CREATE TABLE `PARADA` (
  `idParada` int(11) NOT NULL default '0',
  `descripcion` varchar(255) default NULL,
  `latitud` double default NULL,
  `longitud` double default NULL,
  PRIMARY KEY  (`idParada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PARADA` WRITE;
/*!40000 ALTER TABLE `PARADA` DISABLE KEYS */;
INSERT INTO `PARADA` (`idParada`,`descripcion`,`latitud`,`longitud`)
VALUES
	(101,'Nicanor Villalta (Nº4)',40.330605,-1.090903),
	(102,'Nicanor Villalta (INEM)',40.329064,-1.092501),
	(103,'Los Tilos (Colegio)',40.329464,-1.095376),
	(104,'Ramón J. Sender (Kiosko)',40.332814,-1.092774),
	(105,'Av. Sagunto (Entrada La Salle)',40.332948,-1.100124),
	(106,'Av. Aragón (Iglesia S. José)',40.333401,-1.103391),
	(107,'Av. Aragón (Club Ciclista)',40.332296,-1.104834),
	(108,'Av. Aragón (Jardines)',40.330767,-1.106618),
	(109,'Ambulatorio Norte',40.33045,-1.103386),
	(110,'Sanz Gadea (Frente Pl. Constitución)',40.330017,-1.108023),
	(111,'Sanz Gadea (Frente Playa de Aro)',40.33153,-1.108375),
	(112,'Ruiz Jarabo (Hospital)',40.333417,-1.107841),
	(113,'Ruiz Jarabo (Esq. Parque)',40.335198,-1.107033),
	(114,'Av. Sagunto (Barrabás)',40.336306,-1.104405),
	(115,'Salida Viaducto',40.340438,-1.10529),
	(116,'Estación de Autobuses',40.342298,-1.104587),
	(117,'Los Arcos (Dir. Viñas)',40.344389,-1.105105),
	(118,'Ctra. Alcañiz (Rep. Los Arcos)',40.347002,-1.108806),
	(119,'Ctra. Alcañiz (C.C. Matadero)',40.34831,-1.109257),
	(120,'Ctra. Alcañiz (Cruce C/ Valderrobles)',40.350275,-1.108989),
	(121,'Universidad',40.351599,-1.109989),
	(122,'IES Segundo Chomón',40.352668,-1.112081),
	(123,'Leocadio Brun',40.353901,-1.113468),
	(124,'Leocadio Brun (Fin de calle)',40.353226,-1.116252),
	(125,'Piscina S. León',40.352094,-1.116475),
	(126,'Capuchinos (Pabellón Las Viñas)',40.350371,-1.113103),
	(127,'Sta. Amalia (Rokelín)',40.349416,-1.111312),
	(128,'Sta. Amalia (Salida Ctra.)',40.349269,-1.109362),
	(129,'Ctra. Alcañiz (Frente Rep. Los Arcos)',40.346982,-1.108951),
	(130,'Los Arcos (Dir. Centro)',40.345297,-1.106197),
	(131,'Ronda (Mercado)',40.344042,-1.104928),
	(132,'Ronda Ambeles (E.R.Z.)',40.341331,-1.10485),
	(133,'Óvalo',40.341331,-1.108232),
	(134,'Ambulatorio Centro',40.340276,-1.107385),
	(135,'Ruiz Jarabo (Iglesia)',40.335337,-1.107154),
	(136,'Ruiz Jarabo (Frente Hospital)',40.333699,-1.107849),
	(137,'Playa de Aro',40.332063,-1.108578),
	(138,'Sanz Gadea (Pl. Constitución)',40.329935,-1.108163),
	(139,'Renfe (Frente)',40.341114,-1.110016),
	(140,'Av. Aragón (Frente Jardines)',40.330663,-1.106586),
	(141,'Av. Aragón (Frente Club Ciclista)',40.332243,-1.104748),
	(142,'Av. Aragón (Bar S. Miguel)',40.333509,-1.103037),
	(143,'Av. Sagunto (Los Gemelos)',40.33351,-1.101953),
	(144,'Av. Sagunto (Cruce Ctra. Castralvo)',40.332956,-1.100658),
	(145,'Frente Hogar S. José',40.333235,-1.092925),
	(146,'Parking Sabeco',40.332969,-1.088204),
	(147,'Los Olivos',40.329914,-1.094041),
	(148,'Av. Sagunto (Frente Joyería)',40.335431,-1.103246),
	(149,'Merced (Pl. San Sebastían)',40.345831,-1.10533),
	(150,'Carmen',40.346329,-1.113034),
	(151,'Carmen (Nº64)',40.347975,-1.115488),
	(152,'Av. Zaragoza (Frente Cárcel)',40.347329,-1.117502),
	(153,'Av. Zaragoza (Nº35)',40.346103,-1.115582),
	(154,'Av. Zaragoza (Moratilla)',40.344377,-1.112972),
	(155,'Jorgito (Dir. Pinar)',40.341548,-1.115558),
	(156,'Pinar',40.340673,-1.114973),
	(157,'Camino Muela',40.341106,-1.115225),
	(158,'Jorgito (Dir. Centro)',40.341478,-1.115716),
	(159,'Renfe',40.341037,-1.110188),
	(160,'Florida',40.338305,-1.108911),
	(161,'San Julián (Cruce Carretera)',40.338757,-1.104584),
	(162,'Ctra. San Julián',40.338677,-1.102999),
	(163,'Ctra. San Julián (Edif. Bellido)',40.338325,-1.102302),
	(164,'San Julián (Colegio)',40.341266,-1.103163),
	(165,'Av. Sagunto (Bar Amantes)',40.336101,-1.104357),
	(166,'Av. Sagunto (Joyería)',40.335476,-1.103531),
	(167,'Ramón J. Sender (Iglesia)',40.332213,-1.093271),
	(168,'Nicanor Villalta (Frente INEM)',40.329211,-1.092265),
	(169,'Nicanor Villalta (Farmacia)',40.332319,-1.089851),
	(170,'Dinópolis',40.332914,-1.083559),
	(171,'San León',40.347681,-1.110231),
	(172,'Av. Zaragoza (Cruce Franciscanos)',40.344645,-1.113208),
	(173,'Av. Zaragoza (Hospital)',40.346127,-1.115421),
	(174,'Parador',40.351442,-1.125712),
	(175,'Polígono (Gasolinera)',40.357566,-1.136414),
	(176,'Polígono (Asempaz)',40.359437,-1.14099),
	(177,'Polígono (Antes de rotonda)',40.358228,-1.142246),
	(178,'Polígono (C/ B: Hierros Teruel)',40.358923,-1.14422),
	(179,'Polígono (El Castellar)',40.360893,-1.14717),
	(180,'Polígono (C/ M)',40.363746,-1.153189),
	(181,'Polígono (Euroquince)',40.364711,-1.157663),
	(182,'Polígono (Cetesa)',40.362193,-1.15497),
	(183,'Polígono (Cryo)',40.360566,-1.147374),
	(184,'Polígono (Frente Hierros Teruel)',40.359176,-1.144788),
	(185,'Polígono (Rotonda C/ B)',40.357917,-1.142868),
	(186,'Polígono (Piensos Sol)',40.362283,-1.144295),
	(187,'Polígono (M. Rillo)',40.357999,-1.137782),
	(188,'Av. Zaragoza (M. Bielsa)',40.367261,-1.154476),
	(189,'Nicanor Villalta (De Cruce Ctra. Castralvo)',40.327575,-1.095725),
	(190,'Nicanor Villalta (Frente Nº4)',40.330336,-1.091005),
	(191,'Hogar S. José',40.333378,-1.092796),
	(192,'Frente Inserso',40.331329,-1.101267),
	(193,'Inserso',40.331804,-1.10117),
	(194,'Ctra. Alcañiz (Junto camino Cementerio)',40.355561,-1.108267),
	(195,'Ctra. Alcañiz (Cruce calle Universidad)',40.35128,-1.10897),
	(196,'Ctra. Alcañiz (Antes C/ Sta. Amalia)',40.349913,-1.109142),
	(197,'Nicanor Villalta (Salida)',40.332369,-1.090319),
	(198,'Nicanor Villalta (A Cruce Ctra. Castralvo)',40.327681,-1.095779),
	(199,'Florida (Frente)',40.338383,-1.108919);

/*!40000 ALTER TABLE `PARADA` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PUNTO_LINEA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PUNTO_LINEA`;

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

LOCK TABLES `PUNTO_LINEA` WRITE;
/*!40000 ALTER TABLE `PUNTO_LINEA` DISABLE KEYS */;
INSERT INTO `PUNTO_LINEA` (`idLinea`,`sentido`,`idParada`,`posicion`,`distancia`)
VALUES
	('L-1',0,102,2,450),
	('L-1',0,103,3,500),
	('L-1',0,104,4,450),
	('L-1',0,105,5,750),
	('L-1',0,106,6,350),
	('L-1',0,107,7,170),
	('L-1',0,108,8,240),
	('L-1',0,109,9,750),
	('L-1',0,110,10,700),
	('L-1',0,111,11,170),
	('L-1',0,112,12,230),
	('L-1',0,113,13,210),
	('L-1',0,114,14,350),
	('L-1',0,115,15,500),
	('L-1',0,116,16,220),
	('L-1',0,117,17,260),
	('L-1',0,118,18,450),
	('L-1',0,119,19,160),
	('L-1',0,120,20,220),
	('L-1',0,121,21,260),
	('L-1',0,197,1,350),
	('L-1',1,109,19,600),
	('L-1',1,121,1,260),
	('L-1',1,122,2,290),
	('L-1',1,123,3,220),
	('L-1',1,124,4,270),
	('L-1',1,125,5,180),
	('L-1',1,126,6,350),
	('L-1',1,127,7,190),
	('L-1',1,128,8,170),
	('L-1',1,129,9,270),
	('L-1',1,130,10,300),
	('L-1',1,131,11,180),
	('L-1',1,132,12,350),
	('L-1',1,133,13,600),
	('L-1',1,134,14,280),
	('L-1',1,135,15,750),
	('L-1',1,136,16,210),
	('L-1',1,137,17,200),
	('L-1',1,138,18,240),
	('L-1',1,140,20,800),
	('L-1',1,141,21,250),
	('L-1',1,142,22,210),
	('L-1',1,143,23,130),
	('L-1',1,144,24,140),
	('L-1',1,145,25,700),
	('L-1',1,197,26,350),
	('L-2',0,101,2,450),
	('L-2',0,102,3,240),
	('L-2',0,104,5,350),
	('L-2',0,105,6,750),
	('L-2',0,114,8,140),
	('L-2',0,115,9,500),
	('L-2',0,116,10,220),
	('L-2',0,133,23,800),
	('L-2',0,134,24,280),
	('L-2',0,143,27,260),
	('L-2',0,146,1,600),
	('L-2',0,147,4,220),
	('L-2',0,148,7,400),
	('L-2',0,149,11,550),
	('L-2',0,150,12,900),
	('L-2',0,151,13,280),
	('L-2',0,152,14,400),
	('L-2',0,153,15,210),
	('L-2',0,154,16,290),
	('L-2',0,159,17,500),
	('L-2',0,160,18,400),
	('L-2',0,161,19,400),
	('L-2',0,162,20,170),
	('L-2',0,163,21,350),
	('L-2',0,164,22,500),
	('L-2',0,165,25,650),
	('L-2',0,166,26,100),
	('L-2',0,167,28,950),
	('L-2',0,168,29,450),
	('L-2',0,169,30,400),
	('L-2',0,170,31,700),
	('L-2',1,101,2,450),
	('L-2',1,102,3,240),
	('L-2',1,104,5,350),
	('L-2',1,105,6,750),
	('L-2',1,114,8,140),
	('L-2',1,115,9,500),
	('L-2',1,116,10,220),
	('L-2',1,133,27,800),
	('L-2',1,134,28,280),
	('L-2',1,143,31,260),
	('L-2',1,146,1,600),
	('L-2',1,147,4,220),
	('L-2',1,148,7,400),
	('L-2',1,149,11,550),
	('L-2',1,150,12,900),
	('L-2',1,151,13,280),
	('L-2',1,152,14,400),
	('L-2',1,153,15,210),
	('L-2',1,154,16,290),
	('L-2',1,155,17,600),
	('L-2',1,156,18,450),
	('L-2',1,157,19,190),
	('L-2',1,158,20,400),
	('L-2',1,159,21,800),
	('L-2',1,160,22,400),
	('L-2',1,161,23,400),
	('L-2',1,162,24,170),
	('L-2',1,163,25,350),
	('L-2',1,164,26,500),
	('L-2',1,165,29,650),
	('L-2',1,166,30,100),
	('L-2',1,167,32,950),
	('L-2',1,168,33,450),
	('L-2',1,169,34,400),
	('L-2',1,170,35,700),
	('L-3',0,121,1,500),
	('L-3',0,127,2,300),
	('L-3',0,131,4,650),
	('L-3',0,132,5,350),
	('L-3',0,133,6,600),
	('L-3',0,152,9,220),
	('L-3',0,171,3,220),
	('L-3',0,172,7,600),
	('L-3',0,173,8,250),
	('L-3',0,174,10,900),
	('L-3',0,175,11,1200),
	('L-3',0,176,12,550),
	('L-3',1,116,18,500),
	('L-3',1,118,19,700),
	('L-3',1,119,20,160),
	('L-3',1,121,21,500),
	('L-3',1,133,16,550),
	('L-3',1,134,17,280),
	('L-3',1,153,14,4400),
	('L-3',1,154,15,290),
	('L-3',1,176,1,550),
	('L-3',1,177,2,170),
	('L-3',1,178,3,230),
	('L-3',1,179,4,350),
	('L-3',1,180,5,750),
	('L-3',1,181,6,400),
	('L-3',1,182,7,600),
	('L-3',1,183,8,650),
	('L-3',1,184,9,280),
	('L-3',1,185,10,1200),
	('L-3',1,186,11,750),
	('L-3',1,187,12,750),
	('L-3',1,188,13,1900),
	('L-4',0,107,1,0),
	('L-4',0,111,2,350),
	('L-4',0,112,3,230),
	('L-4',0,113,4,210),
	('L-4',0,139,16,400),
	('L-4',0,143,6,260),
	('L-4',0,152,19,220),
	('L-4',0,161,14,300),
	('L-4',0,163,12,1100),
	('L-4',0,164,13,500),
	('L-4',0,166,5,350),
	('L-4',0,168,9,350),
	('L-4',0,172,17,550),
	('L-4',0,173,18,250),
	('L-4',0,174,20,900),
	('L-4',0,175,21,1200),
	('L-4',0,176,22,550),
	('L-4',0,189,8,750),
	('L-4',0,190,10,170),
	('L-4',0,191,11,500),
	('L-4',0,192,7,300),
	('L-4',0,199,15,400),
	('L-4',1,102,23,450),
	('L-4',1,106,26,450),
	('L-4',1,107,27,170),
	('L-4',1,145,21,1100),
	('L-4',1,153,14,4400),
	('L-4',1,154,15,290),
	('L-4',1,159,16,500),
	('L-4',1,160,17,400),
	('L-4',1,161,18,400),
	('L-4',1,162,20,400),
	('L-4',1,164,19,300),
	('L-4',1,176,1,0),
	('L-4',1,177,2,170),
	('L-4',1,178,3,230),
	('L-4',1,179,4,350),
	('L-4',1,180,5,750),
	('L-4',1,181,6,400),
	('L-4',1,182,7,600),
	('L-4',1,183,8,650),
	('L-4',1,184,9,280),
	('L-4',1,185,10,1200),
	('L-4',1,186,11,750),
	('L-4',1,187,12,750),
	('L-4',1,188,13,1900),
	('L-4',1,193,25,800),
	('L-4',1,197,22,350),
	('L-4',1,198,24,350),
	('L-6',0,102,2,450),
	('L-6',0,104,4,350),
	('L-6',0,105,5,750),
	('L-6',0,114,7,140),
	('L-6',0,115,8,500),
	('L-6',0,116,9,220),
	('L-6',0,117,10,260),
	('L-6',0,118,11,450),
	('L-6',0,119,12,160),
	('L-6',0,120,13,220),
	('L-6',0,147,3,220),
	('L-6',0,148,6,400),
	('L-6',0,194,14,600),
	('L-6',0,197,1,350),
	('L-6',1,129,4,350),
	('L-6',1,130,5,300),
	('L-6',1,131,6,180),
	('L-6',1,132,7,350),
	('L-6',1,133,8,600),
	('L-6',1,134,9,280),
	('L-6',1,143,12,260),
	('L-6',1,144,13,140),
	('L-6',1,145,14,700),
	('L-6',1,165,10,650),
	('L-6',1,166,11,100),
	('L-6',1,194,1,600),
	('L-6',1,195,2,500),
	('L-6',1,196,3,150),
	('L-6',1,197,15,350),
	('L-7',0,114,10,140),
	('L-7',0,133,11,850),
	('L-7',0,134,1,280),
	('L-7',0,135,2,750),
	('L-7',0,136,3,210),
	('L-7',0,137,4,200),
	('L-7',0,138,5,240),
	('L-7',0,140,6,250),
	('L-7',0,141,7,250),
	('L-7',0,142,8,210),
	('L-7',0,148,9,300),
	('L-N',0,102,2,450),
	('L-N',0,104,4,350),
	('L-N',0,105,5,750),
	('L-N',0,106,6,350),
	('L-N',0,107,7,170),
	('L-N',0,111,8,350),
	('L-N',0,112,9,230),
	('L-N',0,113,10,210),
	('L-N',0,114,11,350),
	('L-N',0,115,12,500),
	('L-N',0,116,13,220),
	('L-N',0,117,14,260),
	('L-N',0,118,15,450),
	('L-N',0,119,16,160),
	('L-N',0,120,17,220),
	('L-N',0,121,18,260),
	('L-N',0,147,3,220),
	('L-N',0,197,1,350),
	('L-N',1,121,1,260),
	('L-N',1,128,2,350),
	('L-N',1,129,3,270),
	('L-N',1,130,4,300),
	('L-N',1,131,5,180),
	('L-N',1,132,6,350),
	('L-N',1,135,7,800),
	('L-N',1,136,8,210),
	('L-N',1,137,9,200),
	('L-N',1,141,10,400),
	('L-N',1,143,11,350),
	('L-N',1,145,12,850),
	('L-N',1,197,13,350);

/*!40000 ALTER TABLE `PUNTO_LINEA` ENABLE KEYS */;
UNLOCK TABLES;





/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
