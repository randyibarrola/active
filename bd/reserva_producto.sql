CREATE DATABASE  IF NOT EXISTS `vikahotel` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vikahotel`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: localhost    Database: vikahotel
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `reserva_producto`
--

DROP TABLE IF EXISTS `reserva_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserva_id` int(11) NOT NULL,
  `nombre` text CHARACTER SET utf8,
  `tipo` varchar(45) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `inicio` timestamp NULL DEFAULT NULL,
  `final` timestamp NULL DEFAULT NULL,
  `pago_offline` tinyint(4) DEFAULT NULL,
  `importe_inicial` double DEFAULT NULL,
  `porciento_inicial` double DEFAULT NULL,
  `localizador` varchar(200) DEFAULT NULL,
  `telefono_contacto` varchar(200) DEFAULT NULL,
  `modo_pago_offline` varchar(200) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `evento_tpv` text,
  `sesion` time DEFAULT NULL,
  `direccion` text,
  `emails` text,
  `entradas` text,
  `condicion` text,
  `pension` text,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_producto_reserva1_idx` (`reserva_id`),
  CONSTRAINT `fk_reserva_producto_reserva1` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_producto`
--

LOCK TABLES `reserva_producto` WRITE;
/*!40000 ALTER TABLE `reserva_producto` DISABLE KEYS */;
INSERT INTO `reserva_producto` VALUES (309,148,'\nVilla 3 dormitorios (5-6 adultos)\n	\n','apartamento',420,0,'2014-02-13 23:00:00','2014-02-16 23:00:00',1,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(322,161,'\nDúplex de 3 dormitorios con piscina privada\n\n	\n','apartamento',598,0,'2014-05-06 22:00:00','2014-05-14 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(323,162,'\nVilla de 3 dormitorios con piscina privada\n\n	\n','apartamento',583,0,'2014-05-06 22:00:00','2014-05-14 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(325,164,'\nStudio (2 Adults)\n\n	\n','apartamento',168.58,0,'2014-02-22 23:00:00','2014-03-01 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(326,165,'\nThree-Bedroom Duplex with Private Pool\n\n	\n','apartamento',498.75,0,'2014-03-21 23:00:00','2014-03-28 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(327,166,'\nEstudio\n\n	\n','apartamento',702,0,'2014-08-24 22:00:00','2014-08-30 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(328,167,'\nApartamento de 1 dormitorio (2 adultos + 2 niños)\n\n	\n','apartamento',394,0,'2014-04-16 22:00:00','2014-04-19 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(329,168,'\nApartamento de 1 dormitorio (2 adultos + 1 niño)\n\n	\n','apartamento',163,0,'2014-03-05 23:00:00','2014-03-09 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(330,169,'\nApartamento de 1 dormitorio (2 adultos + 2 niños)\n\n	\n','apartamento',288,0,'2014-03-02 23:00:00','2014-03-07 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(331,170,'\nStudio (2 Adults)\n\n	\n','apartamento',241,0,'2014-03-18 23:00:00','2014-04-01 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(333,172,'\nEstudio (2 adultos)\n\n	\n','apartamento',24,0,'2014-02-25 23:00:00','2014-02-26 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(334,173,'\nEstudio (2 adultos + 1 niño)\n\n	\n','apartamento',239,0,'2014-02-28 23:00:00','2014-03-07 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(335,174,'\nDouble or Twin Room with Sea View\n\n	\n','apartamento',1285.2,0,'2014-03-10 23:00:00','2014-03-24 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(336,175,'\nApartamento de 1 dormitorio (2 adultos + 2 niños)\n\n	\n','apartamento',219,0,'2014-03-02 23:00:00','2014-03-07 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(337,176,'\nEstudio\n\n	\n','apartamento',357,0,'2014-04-16 22:00:00','2014-04-19 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','',NULL,NULL),(342,181,'\nCamera Doppia con Letti Singoli\n\n	\n','apartamento',216,0,'2014-05-12 22:00:00','2014-05-16 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancellazione GRATUITA\n\n• Colazione inclusa',NULL),(343,182,'\nCamera Doppia con Letti Singoli\n\n	\n','apartamento',216,0,'2014-05-12 22:00:00','2014-05-16 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancellazione GRATUITA\n\n• Colazione inclusa',NULL),(344,183,'\nCamera Doppia con Letti Singoli\n\n	\n','apartamento',216,0,'2014-05-12 22:00:00','2014-05-16 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancellazione GRATUITA\n\n• Colazione inclusa',NULL),(350,189,'\nEstudio (2 adultos)\n\n	\n','apartamento',47,0,'2014-04-15 22:00:00','2014-04-16 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','No reembolsable\n\n• Desayuno € 6 por persona',''),(351,190,'\nEstudio (2 adultos)\n\n	\n','apartamento',47,0,'2014-04-18 22:00:00','2014-04-19 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','No reembolsable\n\n• Desayuno € 6 por persona',''),(360,199,'\nApartamento de 2 dormitorios (6 adultos)\n\n	\n','apartamento',249,0,'2014-03-05 23:00:00','2014-03-08 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA',''),(361,200,'\nApartamento de 2 dormitorios \n\n	\n','apartamento',293,0,'2014-03-05 23:00:00','2014-03-08 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA',''),(362,201,'\nEstudio\n\n	\n','apartamento',163,0,'2014-03-05 23:00:00','2014-03-08 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA',''),(363,202,'\nOne-Bedroom Apartment with Sea View \n\n	\n','apartamento',622.06,0,'2014-03-25 23:00:00','2014-04-05 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Non-refundable',''),(364,203,'\nEstudio \n\n	\n','apartamento',24,0,'2014-03-04 23:00:00','2014-03-05 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA - PAGA DESPUÉS',''),(366,205,'\nEstudio \n\n	\n','apartamento',146,0,'2014-04-01 22:00:00','2014-04-08 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','No reembolsable',''),(369,208,'\nApartamento de 1 dormitorio \n\n	\n','apartamento',108,0,'2014-05-28 22:00:00','2014-05-31 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA - PAGA DESPUÉS',''),(371,210,'\nStudio\n\n	\n','apartamento',236.5,0,'2014-12-09 23:00:00','2014-12-19 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Non-refundable',''),(372,211,'\nApartamento de 1 dormitorio \n\n	\n','apartamento',92,0,'2014-05-08 22:00:00','2014-05-12 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA - PAGA DESPUÉS',''),(373,212,'\nCamera Matrimoniale/Doppia con Letti Singoli\n\n	\n','apartamento',1848,0,'2014-09-06 22:00:00','2014-09-27 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancellazione GRATUITA - PAGA DOPO\n	\n\n• Colazione inclusa',''),(375,214,'\nHabitación Doble - 2 camas\n\n	\n','apartamento',250,0,'2014-05-10 22:00:00','2014-05-15 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA',''),(380,219,'\nEstudio \n\n	\n','apartamento',146,0,'2014-04-01 22:00:00','2014-04-08 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','No reembolsable','Solo Alojamiento'),(381,220,'','apartamento',0,0,'2014-03-20 23:00:00','2014-03-26 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','',''),(382,221,'\nEstudio \n\n	\n','apartamento',125,0,'2014-03-20 23:00:00','2014-03-26 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','No reembolsable','Solo Alojamiento'),(383,222,'\nApartamento de 1 dormitorio \n\n	\n','apartamento',224,0,'2014-03-07 23:00:00','2014-03-15 23:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Condiciones especiales','Solo Alojamiento'),(384,223,'\nAppartamento con 1 Camera da Letto \n\n	\n','apartamento',611,0,'2014-03-24 23:00:00','2014-03-31 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Non rimborsabile','Mezza pensione inclusa'),(385,224,'\nMonolocale\n\n	\n','apartamento',497,0,'2014-03-24 23:00:00','2014-03-31 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Non rimborsabile','Mezza pensione inclusa'),(386,225,'\nThree-Bedroom Villa with Private Pool\n\n	\n','apartamento',731.5,0,'2014-04-27 22:00:00','2014-05-07 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','FREE cancellation','Self catering'),(387,226,'\nOne-Bedroom Apartment \n\n	\n','apartamento',161,0,'2014-06-09 22:00:00','2014-06-16 22:00:00',0,16.1,10,'','','',NULL,'','00:00:00','','','','FREE cancellation','Self catering'),(388,227,'\nOne-Bedroom Apartment \n\n	\n','apartamento',396,0,'2014-06-20 22:00:00','2014-07-01 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','FREE cancellation','Self catering'),(389,228,'\nStudio \n\n	\n','apartamento',498,0,'2014-03-26 23:00:00','2014-04-04 22:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Annulation GRATUITE - PAYEZ PLUS TARD','Petit-déjeuner € 6 par personne'),(390,229,'\nApartamento de 1 dormitorio \n\n	\n','apartamento',532,0,'2014-05-07 00:00:00','2014-05-14 00:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA','Media pensión incluida'),(391,230,'\nApartamento de 1 dormitorio \n\n	\n','apartamento',308,0,'2014-05-07 00:00:00','2014-05-14 00:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA','Solo Alojamiento'),(392,231,'\nApartamento de 1 dormitorio \n\n	\n','apartamento',285,0,'2014-04-15 00:00:00','2014-04-20 00:00:00',0,0,0,'','','',NULL,'','00:00:00','','','','Cancelación GRATUITA','Solo Alojamiento');
/*!40000 ALTER TABLE `reserva_producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-12 13:21:40
