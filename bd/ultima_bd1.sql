CREATE DATABASE  IF NOT EXISTS `orvikat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `orvikat`;
-- MySQL dump 10.13  Distrib 5.5.24, for osx10.5 (i386)
--
-- Host: localhost    Database: orvikat
-- ------------------------------------------------------
-- Server version	5.5.33-cll-lve

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
-- Table structure for table `apartamento`
--

DROP TABLE IF EXISTS `apartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `hotel_id` int(11) NOT NULL,
  `descripcion_corta` text,
  `descripcion_larga` text,
  `estado` varchar(45) DEFAULT NULL,
  `adultos` int(11) DEFAULT NULL,
  `superficie` double DEFAULT NULL,
  `ninios` int(11) DEFAULT NULL,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_apartamentos_hotel_idx` (`hotel_id`),
  CONSTRAINT `fk_apartamentos_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento`
--

LOCK TABLES `apartamento` WRITE;
/*!40000 ALTER TABLE `apartamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartamento_archivo`
--

DROP TABLE IF EXISTS `apartamento_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartamento_archivo` (
  `apartamento_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_apartamentos_has_archivos_archivos1_idx` (`archivo_id`),
  KEY `fk_apartamentos_has_archivos_apartamentos1_idx` (`apartamento_id`),
  CONSTRAINT `fk_apartamentos_has_archivos_apartamentos1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_apartamentos_has_archivos_archivos1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento_archivo`
--

LOCK TABLES `apartamento_archivo` WRITE;
/*!40000 ALTER TABLE `apartamento_archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartamento_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartamento_condicion`
--

DROP TABLE IF EXISTS `apartamento_condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartamento_condicion` (
  `apartamento_id` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_apartamento_has_condicion_condicion1_idx` (`condicion_id`),
  KEY `fk_apartamento_has_condicion_apartamento1_idx` (`apartamento_id`),
  CONSTRAINT `fk_apartamento_has_condicion_apartamento1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_apartamento_has_condicion_condicion1` FOREIGN KEY (`condicion_id`) REFERENCES `condicion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento_condicion`
--

LOCK TABLES `apartamento_condicion` WRITE;
/*!40000 ALTER TABLE `apartamento_condicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartamento_condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apartamento_servicio`
--

DROP TABLE IF EXISTS `apartamento_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartamento_servicio` (
  `apartamento_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_apartamento_has_servicio_servicio1_idx` (`servicio_id`),
  KEY `fk_apartamento_has_servicio_apartamento1_idx` (`apartamento_id`),
  CONSTRAINT `fk_apartamento_has_servicio_apartamento1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_apartamento_has_servicio_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartamento_servicio`
--

LOCK TABLES `apartamento_servicio` WRITE;
/*!40000 ALTER TABLE `apartamento_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartamento_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo`
--

DROP TABLE IF EXISTS `archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `ruta` varchar(300) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `extension` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (560,'','http://or.vikatickets.com/templates/images/apartamentos/ad513d7b83ca7bb0ab8d773d946f0551.jpg','imagen','jpg'),(561,'','http://or.vikatickets.com/templates/images/apartamentos/8b6a1be29fc06c85fa35b7fd602048fb.jpg','imagen','jpg'),(562,'','http://or.vikatickets.com/templates/images/apartamentos/c71779b06cce13b82d59b409027bb8c6.jpg','imagen','jpg'),(563,'','http://or.vikatickets.com/templates/images/apartamentos/74a62cb9bda4291e57d5b8b652d9de89.jpg','imagen','jpg'),(564,'','http://or.vikatickets.com/templates/images/apartamentos/2e0973568c135be7f4c7fcd4221d4e6f.jpg','imagen','jpg'),(565,'','http://or.vikatickets.com/templates/images/apartamentos/1f4ea1c2681721dfdf6cf5bff303ac27.jpg','imagen','jpg'),(566,'','http://or.vikatickets.com/templates/images/apartamentos/e40a055b831042cb9f29158169cab10e.jpg','imagen','jpg'),(567,'','http://or.vikatickets.com/templates/images/apartamentos/a5adbbd33029d4ed4784572deaee1420.jpg','imagen','jpg'),(568,'','http://or.vikatickets.com/templates/images/apartamentos/cc147046d493a6a5e4215d31b1bb163d.jpg','imagen','jpg'),(569,'','http://or.vikatickets.com/templates/images/apartamentos/72a56e71aa9cd49eb1d75224106ee59a.jpg','imagen','jpg'),(570,'','http://or.vikatickets.com/templates/images/apartamentos/06d791458062e027cfc802da13c1c67b.jpg','imagen','jpg'),(571,'','http://or.vikatickets.com/templates/images/apartamentos/c17c3f297a5d3158f03ae34243f809ae.jpg','imagen','jpg'),(572,'','http://or.vikatickets.com/templates/images/apartamentos/993acb0eed0b45f7778cfa0c815b46f4.jpg','imagen','jpg'),(573,'','http://or.vikatickets.com/templates/images/apartamentos/f835e9f00e93c197689013175762f53b.jpg','imagen','jpg'),(574,'','http://or.vikatickets.com/templates/images/apartamentos/01d19b553a205637f20c2f6a52124fdf.jpg','imagen','jpg'),(575,'','http://or.vikatickets.com/templates/images/apartamentos/dc5c7443549e7637983207be02e59fb9.jpg','imagen','jpg'),(576,'','http://or.vikatickets.com/templates/images/apartamentos/3840aab520dad437947bec583867d1aa.jpg','imagen','jpg'),(577,'','http://or.vikatickets.com/templates/images/apartamentos/2f7866b222ff83b60417c56e0f7c38f4.jpg','imagen','jpg'),(578,'','http://or.vikatickets.com/templates/images/apartamentos/7f4d2b86ab66555beaebe2372a5aadcc.jpg','imagen','jpg'),(579,'','http://or.vikatickets.com/templates/images/apartamentos/9e8da5cd63aae87eb0d372d168abdddb.jpg','imagen','jpg'),(628,'','http://or.vikatickets.com/templates/images/apartamentos/b1bd0e3a5b851fb03426c5ff7a7b0f73.jpg','imagen','jpg'),(629,'','http://or.vikatickets.com/templates/images/apartamentos/f1214a96370448a12f1d3f6b00a8370d.jpg','imagen','jpg'),(630,'','http://or.vikatickets.com/templates/images/apartamentos/3a6adde03c6eae2c7a073de4a11a38e8.jpg','imagen','jpg'),(631,'','http://or.vikatickets.com/templates/images/apartamentos/564f98792c85bf862523764b357c83bf.jpg','imagen','jpg'),(632,'','http://or.vikatickets.com/templates/images/apartamentos/f45d93c6bcf6d1601958c76149ef0e79.jpg','imagen','jpg'),(633,'','http://or.vikatickets.com/templates/images/apartamentos/0fa792680aa021e5014488b931708ac9.jpg','imagen','jpg'),(634,'','http://or.vikatickets.com/templates/images/apartamentos/36c952b1d70b726b9bafc22d24e3bebb.jpg','imagen','jpg'),(635,'','http://or.vikatickets.com/templates/images/apartamentos/023666f0ed4fa0b8a28f7fd4da5acb1a.jpg','imagen','jpg'),(636,'','http://or.vikatickets.com/templates/images/apartamentos/14d6d58f8828f685b282f085e6d2f10a.jpg','imagen','jpg'),(637,'','http://or.vikatickets.com/templates/images/apartamentos/57d9e319e582f3a919c146d950ed2518.jpg','imagen','jpg'),(638,'','http://or.vikatickets.com/templates/images/apartamentos/7a1f6a356b61d1007e4f60391afa1124.jpg','imagen','jpg'),(639,'','http://or.vikatickets.com/templates/images/apartamentos/535e7c5a1a5d181f705f0b1290cec23f.jpg','imagen','jpg'),(640,'','http://or.vikatickets.com/templates/images/apartamentos/c93f3cb2a4fb505b9e84465a2d30e628.jpg','imagen','jpg'),(641,'','http://or.vikatickets.com/templates/images/apartamentos/884eaf57206a36e2642ae176bb7d25a7.jpg','imagen','jpg'),(642,'','http://or.vikatickets.com/templates/images/apartamentos/3683e32b507beb94578e6bc54ee1ea5a.jpg','imagen','jpg'),(643,'','http://or.vikatickets.com/templates/images/apartamentos/ee6c2215088bbe60adf1dcc0e26fc362.jpg','imagen','jpg'),(644,'','http://or.vikatickets.com/templates/images/apartamentos/3eb7516a74489f1ec6c84196765b8bf6.jpg','imagen','jpg'),(645,'','http://or.vikatickets.com/templates/images/apartamentos/a09e5bee3427a2d5c83805e574ff09ba.jpg','imagen','jpg'),(646,'','http://or.vikatickets.com/templates/images/apartamentos/6e44a19e499ff245047758e3bc555162.jpg','imagen','jpg'),(647,'','http://or.vikatickets.com/templates/images/apartamentos/920d0dccf39edd4b98c194f5958d28a6.jpg','imagen','jpg'),(648,'','http://or.vikatickets.com/templates/images/apartamentos/4453ef7323701bfe6cfbcc9ec9f3b7b2.jpg','imagen','jpg'),(649,'','http://or.vikatickets.com/templates/images/apartamentos/d688e626a7488928d5f55b9d923a0f9f.jpg','imagen','jpg'),(650,'','http://or.vikatickets.com/templates/images/apartamentos/5988971a87497fb733255b94f324a348.jpg','imagen','jpg'),(651,'','http://or.vikatickets.com/templates/images/apartamentos/4d34a2ff119d93047bc102e4f2ddbfe3.jpg','imagen','jpg'),(652,'','http://or.vikatickets.com/templates/images/apartamentos/4b37679ffaa40a9d92c7dffd20ca84ce.jpg','imagen','jpg'),(653,'','http://or.vikatickets.com/templates/images/apartamentos/2e351fadf06ae5244ad8de1e71b4647b.jpg','imagen','jpg'),(654,'','http://or.vikatickets.com/templates/images/apartamentos/170460373249dd04d2df74c1966931d5.jpg','imagen','jpg'),(655,'','http://or.vikatickets.com/templates/images/apartamentos/1c125433a991054a5a52dbc9afbdbc15.jpg','imagen','jpg'),(656,'','http://or.vikatickets.com/templates/images/apartamentos/a8c719771969dce34e086d3b9382fe06.jpg','imagen','jpg'),(657,'','http://or.vikatickets.com/templates/images/apartamentos/b3c7154dab18232ffce2c191d125a278.jpg','imagen','jpg'),(658,'','http://or.vikatickets.com/templates/images/apartamentos/2318533f96a13b74675648c8b8808374.jpg','imagen','jpg'),(659,'','http://or.vikatickets.com/templates/images/apartamentos/6f3a2d771bb83d10f346692e46f42a21.jpg','imagen','jpg'),(660,'','http://or.vikatickets.com/templates/images/apartamentos/957cd726a0821a7595fd405eca8271f0.jpg','imagen','jpg'),(661,'','http://or.vikatickets.com/templates/images/apartamentos/39f3d4e412f607a643d82dd5e61893dc.jpg','imagen','jpg'),(662,'','http://or.vikatickets.com/templates/images/apartamentos/7f5ebec3443b7120db0ce30e829ffdd2.jpg','imagen','jpg'),(663,'','http://or.vikatickets.com/templates/images/apartamentos/c865e6aba7d3da3c885d5b03f5f72de6.jpg','imagen','jpg'),(664,'','http://or.vikatickets.com/templates/images/apartamentos/575b2a71cea8241790e91c2db2ec571f.jpg','imagen','jpg'),(665,'','http://or.vikatickets.com/templates/images/apartamentos/7c44bd175c36e37c1049167a5d1515ec.jpg','imagen','jpg'),(666,'','http://or.vikatickets.com/templates/images/apartamentos/1df7da5e34290af8cc415d5f8b2d7d9c.jpg','imagen','jpg'),(667,'','http://or.vikatickets.com/templates/images/apartamentos/257bcdb2efed6a97ddd22b444736bbaa.jpg','imagen','jpg'),(668,'','http://or.vikatickets.com/templates/images/apartamentos/99ffcd05be919b7265e2850cff765bbc.jpg','imagen','jpg'),(669,'','http://or.vikatickets.com/templates/images/apartamentos/26a535d5340948382c7c823f3483438e.jpg','imagen','jpg'),(670,'','http://or.vikatickets.com/templates/images/apartamentos/e79a0e78d884329ee09395bea2de9841.jpg','imagen','jpg'),(671,'','http://or.vikatickets.com/templates/images/apartamentos/48748c06e8dcb03694ae3d1583c4a336.jpg','imagen','jpg'),(672,'','http://or.vikatickets.com/templates/images/apartamentos/a41361acc61c7e64cce00ee1bb162284.jpg','imagen','jpg'),(697,'','http://or.vikatickets.com/templates/images/apartamentos/e76b2167ca85592bd88d0e851e13115a.jpg','imagen','jpg'),(698,'','http://or.vikatickets.com/templates/images/apartamentos/829e5f14ea75d722643a90c373b3d442.jpg','imagen','jpg'),(699,'','http://or.vikatickets.com/templates/images/apartamentos/2056f0c6fe77a0e87c43b68ed805786d.jpg','imagen','jpg'),(700,'','http://or.vikatickets.com/templates/images/apartamentos/934c500d9d103dadeb111fee716d7569.jpg','imagen','jpg'),(701,'','http://or.vikatickets.com/templates/images/apartamentos/c4ae5a22bfe345d617e04ae278e5d0bf.jpg','imagen','jpg'),(702,'','http://or.vikatickets.com/templates/images/apartamentos/15dd8d0cea2ea04142667973daa1e8ce.jpg','imagen','jpg'),(703,'','http://or.vikatickets.com/templates/images/apartamentos/f295fa7e158c546369af67ca48e923b1.jpg','imagen','jpg'),(704,'','http://or.vikatickets.com/templates/images/apartamentos/828243e8e84fcc4e40a14463a3fd6d14.jpg','imagen','jpg'),(705,'','http://or.vikatickets.com/templates/images/apartamentos/ea0d845bcac8c2b8c049d99430c323f5.jpg','imagen','jpg'),(706,'','http://or.vikatickets.com/templates/images/apartamentos/ef0f2b6fd3e2265fb5826a665185d665.jpg','imagen','jpg'),(707,'','http://or.vikatickets.com/templates/images/apartamentos/1157fb17727a8b380d413df2e049fabb.jpg','imagen','jpg'),(708,'','http://or.vikatickets.com/templates/images/apartamentos/5f3549bc3aa6524426415769ca32f334.jpg','imagen','jpg'),(709,'','http://or.vikatickets.com/templates/images/apartamentos/3568386ffe4cee9d1f9f2eef4b4d1dd2.jpg','imagen','jpg'),(710,'','http://or.vikatickets.com/templates/images/apartamentos/51beecd4933eb3070cb93fb7aa4c819c.jpg','imagen','jpg'),(711,'','http://or.vikatickets.com/templates/images/apartamentos/7cb306b9c16d20c2d61690fe79568e25.jpg','imagen','jpg'),(712,'','http://or.vikatickets.com/templates/images/apartamentos/e9c45f6ae886625faf238be16701858d.jpg','imagen','jpg'),(713,'','http://or.vikatickets.com/templates/images/apartamentos/b59102ba3880b17420c3f7a1eb2bde4e.jpg','imagen','jpg'),(714,'','http://or.vikatickets.com/templates/images/apartamentos/fc8a25d97a49b86966fd2a322949f3d0.jpg','imagen','jpg'),(715,'','http://or.vikatickets.com/templates/images/apartamentos/a74c3843133458014b897268f614df6d.jpg','imagen','jpg'),(716,'','http://or.vikatickets.com/templates/images/apartamentos/9abaa69afbe70e9bcda880c9b766307b.jpg','imagen','jpg'),(717,'','http://or.vikatickets.com/templates/images/apartamentos/a4d1faaab99b075557d4e2516427baf8.jpg','imagen','jpg'),(718,'','http://or.vikatickets.com/templates/images/apartamentos/ff89573c6e2a8b82e2289402f9c3a151.jpg','imagen','jpg'),(719,'','http://or.vikatickets.com/templates/images/apartamentos/ee68652d7b2463e6d514e5208d276f97.jpg','imagen','jpg'),(720,'','http://or.vikatickets.com/templates/images/apartamentos/90856d0f50fdb83d0590f11d38475191.jpg','imagen','jpg');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion`
--

DROP TABLE IF EXISTS `condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `condicion_categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_condicion_condicion_categoria1_idx` (`condicion_categoria_id`),
  CONSTRAINT `fk_condicion_condicion_categoria1` FOREIGN KEY (`condicion_categoria_id`) REFERENCES `condicion_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion`
--

LOCK TABLES `condicion` WRITE;
/*!40000 ALTER TABLE `condicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_categoria`
--

DROP TABLE IF EXISTS `condicion_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicion_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_categoria`
--

LOCK TABLES `condicion_categoria` WRITE;
/*!40000 ALTER TABLE `condicion_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `condicion_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descuento_booking` double DEFAULT NULL,
  `tipo_descuento_booking` varchar(50) DEFAULT NULL,
  `comparacion_booking` tinyint(1) DEFAULT NULL,
  `sincronizacion_vika` tinyint(1) DEFAULT NULL,
  `cupon_promocional` tinyint(1) DEFAULT NULL,
  `atencion_personalizada` tinyint(1) DEFAULT NULL,
  `pago_flexible` tinyint(1) DEFAULT NULL,
  `vika_email` varchar(200) DEFAULT NULL,
  `vika_password` varchar(200) DEFAULT NULL,
  `vika_canal` int(11) DEFAULT NULL,
  `vika_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (1,2,'%',1,1,1,1,1,'admin@outlet-rooms.com','admin',3,9),(2,0,'',0,1,0,0,0,'admin@outlet-rooms.com','admin',3,9);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'',0,0,'',''),(2,'Calle Fuerteventura, 1, Corralejo, España',28.72753206152262,-13.870226834948767,'',''),(3,'Oficina de Correos, 35660 Corralejo (fuerteventura), Las Palmas, España',28.72962911348372,-13.867921829223633,'',''),(4,'Plaza E Anex Calet Fust Oest, 35610 Antigua, Las Palmas, España',28.395713623663525,-13.868493139743805,'',''),(5,'Urbanización Corralejo Pl U, 35660 Corralejo, Las Palmas, España',28.7262327371749,-13.85949432849884,'','');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comercial` varchar(200) DEFAULT NULL,
  `nombre_fiscal` varchar(200) DEFAULT NULL,
  `numero_fiscal` varchar(50) DEFAULT NULL,
  `telefono_reservas` text,
  `email_reservas` text,
  `direccion_id` int(11) NOT NULL,
  `contacto_nombre` varchar(200) DEFAULT NULL,
  `contacto_apellidos` varchar(200) DEFAULT NULL,
  `contacto_email` varchar(200) DEFAULT NULL,
  `destino_turistico` text,
  PRIMARY KEY (`id`),
  KEY `fk_empresa_direccion1_idx` (`direccion_id`),
  CONSTRAINT `fk_empresa_direccion1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Empresa Mati','mati s.l.','64464684684','666564986','matias.barbarroja@gmail.com',1,'matias','barbarroja','matias.barbarroja@gmail.com','Fuerteventura');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas_hotel`
--

DROP TABLE IF EXISTS `fechas_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechas_hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas_hotel`
--

LOCK TABLES `fechas_hotel` WRITE;
/*!40000 ALTER TABLE `fechas_hotel` DISABLE KEYS */;
INSERT INTO `fechas_hotel` VALUES (2,3,'2013-12-22 23:00:00'),(3,3,'2013-12-23 23:00:00'),(4,3,'2013-12-24 23:00:00');
/*!40000 ALTER TABLE `fechas_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion_corta` text,
  `descripcion_larga` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `visitas` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  `url` text,
  `calidad` double DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `configuracion_id` int(11) DEFAULT NULL,
  `trip_advisor` text,
  `background_color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_empresa1_idx` (`empresa_id`),
  KEY `fk_hotel_configuracion1` (`configuracion_id`),
  CONSTRAINT `fk_hotel_configuracion1` FOREIGN KEY (`configuracion_id`) REFERENCES `configuracion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (2,'{\"es\":\"Villas Oasis Casa Vieja\",\"en-us\":\"Villas Oasis Casa Vieja\",\"de\":\"Villas Oasis Casa Vieja\",\"fr\":\"Villas Oasis Casa Vieja\",\"it\":\"Villas Oasis Casa Vieja\"}','{\"es\":\"\"}','{\"es\":\"<p>Ubicadas en la encantadora ciudad de La Oliva, estas elegantes villas le permitir&aacute;n disfrutar de las vacaciones a su propio ritmo. Cuentan con piscina privada y jard&iacute;n.</p>\\n\\n<p>Los modernos apartamentos de 2 plantas del Oasis Rural cuentan con un dise&ntilde;o inspirado por su entorno en Fuerteventura. Los muebles de madera oscura le dan un aire r&uacute;stico a la estancia, y las piezas de arte reflejan el entorno de la isla. Cuenta con sof&aacute;s c&oacute;modos y contempor&aacute;neos, techos de madera en el sal&oacute;n y suelos de m&aacute;rmol. Los dormitorios son muy luminosos. El dormitorio principal dispone de ba&ntilde;o de m&aacute;rmol y se encuentra en la planta superior. Los otros 2 tienen ba&ntilde;o compartido y est&aacute;n en la planta baja.</p>\\n\\n<p>Despu&eacute;s de preparar el desayuno en la moderna cocina, dir&iacute;jase al jard&iacute;n y tome el sol. Lea un libro en las tumbonas y refr&eacute;squese en su propia piscina. Por la noche, podr&aacute; organizar una barbacoa.</p>\\n\",\"en-us\":\"<p>Ubicadas en la encantadora ciudad de La Oliva, estas elegantes villas le permitirán disfrutar de las vacaciones a su propio ritmo. Cuentan con piscina privada y jardín.</p>\\n<p>Los modernos apartamentos de 2 plantas del Oasis Rural cuentan con un diseño inspirado por su entorno en Fuerteventura. Los muebles de madera oscura le dan un aire rústico a la estancia, y las piezas de arte reflejan el entorno de la isla. Cuenta con sofás cómodos y contemporáneos, techos de madera en el salón y suelos de mármol. Los dormitorios son muy luminosos. El dormitorio principal dispone de baño de mármol y se encuentra en la planta superior. Los otros 2 tienen baño compartido y están en la planta baja.</p>\\n<p>Después de preparar el desayuno en la moderna cocina, diríjase al jardín y tome el sol. Lea un libro en las tumbonas y refrésquese en su propia piscina. Por la noche, podrá organizar una barbacoa.</p>\",\"de\":\"<p>In der reizvollen Stadt La Oliva erholen Sie in diesen stilvollen Villen mit einem eigenen Pool und einem Garten fernab vom Alltag.</p>\\n<p>Die eleganten, modernen 2-stöckigen Apartments des Oasis Rural empfangen Sie mit einem für Fuerteventura typischen Design. Freuen Sie sich auf elegante, dunkle Holzmöbel in leicht rustikalem Stil.  Das Kunsthandwerk spiegelt die ländliche Umgebung des Oasis Rural wider, außerdem finden Sie einladende und moderne Sofas vor. Die Lounge bietet Holzdecken und Böden mit Marmorfliesen. Durch die großen Fenster fällt viel Licht in die Schlafzimmer.\\n<br />Das Hauptschlafzimmer in der oberen Etage verfügt über ein eigenes Marmorbad, während sich die 2 weiteren Schlafzimmer in der unteren Etage 1 Badezimmer teilen.</p>\\n<p>Bereiten Sie sich Ihr Frühstück in der modernen Küche Ihrer Villa im Oasis Rural de Villaverde zu und begeben sich in den Garten. Dort genießen Sie die Sonne, die Fuerteventura fast während des ganzen Jahres bietet. Lesen Sie ein Buch auf den Liegestühlen und kühlen Sie sich anschließend in Ihrem eigenen Pool ab. Abends verbringen Sie vergnügliche Stunden beim Grillen in angenehmer Runde.</p>\",\"fr\":\"<p>Vivez à votre rythme dans les jolies villas de ce complexe hôtelier de la charmante ville d\'Oliva.</p>\\n<p>Élégantes et modernes, ces villas sont construites sur 2 étages, en parfaite harmonie avec le paysage de Fuerteventura. \\n<br />Elles disposent d\'un jardin et d\'une piscine privatifs, de canapés confortables de style contemporain, d\'un salon avec un plafond en bois, de chambres avec de larges fenêtres qui laissent passer la lumière du soleil et de sols en marbre. Au deuxième étage, la chambre principale jouit d\'une salle de bains attenante en marbre. Au rez-de-chaussée, les 2 autres chambres disposent d\'une salle de bains partagée. Appréciez également l\'élégant mobilier en bois sombre au style rustique et les peintures qui reflètent les paysages alentours.</p>\\n<p>Préparez votre petit déjeuner dans la cuisine moderne de votre villa, avant de profiter du soleil (il brille une grande partie de l\'année à Fuerteventura) dans votre jardin. Installez-vous sur les transats, un livre à la main, avant d\'aller vous rafraîchir dans votre piscine. Le soir, préparez un barbecue et passez la soirée avec vos amis. </p>\",\"it\":\"<p>Site nell\'incantevole città di La Oliva, queste ville eleganti offrono una piscina e un giardino privati.</p>\\n<p>Questi appartamenti lussuosi e moderni a due piani vantano un design ispirato all\'isola. Potrete ammirare mobili in legno scuro dallo stile rustico, opere artistiche in linea con l\'ambiente e dei divani invitanti e moderni. I soffitti del salone sono in legno, mentre i pavimenti sono in piastrelle di marmo. Le camere da letto offrono ampie finestre che lasciano filtrare abbondante luce naturale. La camera da letto principale offre un bagno in marmo e si trova al piano più alto, mentre le due camere da letto in più offrono un bagno condiviso e sono situate al piano inferiore.</p>\\n<p>Dopo aver preparato la colazione nella cucina moderna della struttura potrete visitare il giardino e crogiolarvi al sole di Fuerteventura, presente per quasi tutto l\'anno. Potrete leggere un libro sul lettino e poi tuffarvi nella piscina privata. Alla sera cosa c\'è di meglio che un barbecue tra amici?</p>\"}',NULL,'activo',NULL,'2013-11-27 07:50:34','0000-00-00 00:00:00','http://www.booking.com/hotel/es/villas-oasis-rural-de-villaverde.es.html',4,1,1,NULL,NULL),(3,'{\"es\":\"Oasis Duna\",\"en\":\"Oasis Duna\",\"de\":\"Oasis Duna\",\"fr\":\"Oasis Duna\",\"it\":\"Oasis Duna\",\"ru\":\"Oasis Duna\",\"pt\":\"Oasis Duna\"}','{\"es\":\"\",\"ru\":\"\",\"ja\":\"\",\"pt\":\"\",\"fr\":\"\"}','{\"es\":\"<p>El Oasis Duna est&aacute; situado en Fuerteventura, a 100 metros del puerto de Corralejo, y ofrece un amplio sol&aacute;rium y una piscina al aire libre (climatizada en invierno), as&iacute; como apartamentos con balc&oacute;n privado.</p>\\n\\n<p>Los apartamentos del Oasis Duna son amplios y disponen de un sal&oacute;n con TV de pago y una zona de cocina bien equipada, con fogones, microondas y hervidor de agua. Tambi&eacute;n hay conexi&oacute;n Wi-Fi disponible por un suplemento.</p>\\n\\n<p>Los apartamentos del Oasis Duna est&aacute;n rodeados de jardines tropicales y cuentan con pistas de tenis, un gimnasio, una pista de baloncesto y un parque infantil.</p>\\n\\n<p>Adem&aacute;s, el Oasis Duna alberga un restaurante buf&eacute;, una pizzer&iacute;a a la carta, un bar junto a la piscina y un pub, el Boulevard, que ofrece un programa de animaci&oacute;n por las noches.</p>\\n\\n<p>El complejo Oasis Duna se encuentra a solo 200 metros del parque acu&aacute;tico de Corralejo, a 900 metros de la playa y a 5 minutos a pie del puerto, desde donde zarpan barcos con destino a la cercana isla de Lobos con frecuencia. Adem&aacute;s, hay aparcamiento gratuito.</p>\\n\",\"en\":\"<p>Set 100 metres from Fuerteventura’s Corralejo Harbour, Oasis Duna has a large sun terrace and an outdoor swimming pool, heated in winter. It offers apartments with private balconies.</p>\\n<p>Each spacious apartment at Oasis Duna Corralejo features a lounge with pay TV and a well-equipped kitchen area, including a hob, microwave and kettle. Wi-Fi is available for an extra cost.</p>\\n<p>Surrounded by tropical gardens, the Oasis Duna Fuerteventura has tennis courts, a gym and basketball court. There is also a children\'s play area.</p>\\n<p>Guests at Oasis Duna Apartments can enjoy meals in the buffet restaurant, à la carte pizzeria or poolside bar. The Boulevard pub offers an evening entertainment programme.</p>\\n<p>The Oasis Duna complex is only 200 metres from Corralejo Water Park and 900 metres from Corralejo Beach. Boats to nearby Lobos Island leave regularly from the harbour, just a 5-minute walk away. The complex offers free on-site parking.</p>\",\"de\":\"<p>Das Oasis Duna ist nur 100 m vom Hafen von Corralejo auf Fuerteventura entfernt und bietet Ihnen eine große Sonnenterrasse und einen Außenpool, der im Winter beheizt wird. Die Apartments besitzen einen eigenen Balkon.</p>\\n<p>Jedes der geräumigen Apartments im Oasis Duna verfügt über einen Wohnbereich mit Pay-TV und einen gut ausgestatteten Küchenbereich mit einem Kochfeld, einer Mikrowelle und einem Wasserkocher. Das WLAN nutzen Sie gegen einen Aufpreis.</p>\\n<p>Die Oasis Duna Apartments sind von tropischen Gärten umgeben und bieten Tennisplätze, einen Fitnessraum sowie einen Basketballplatz. Auch ein Kinderspielbereich steht zu Ihrer Verfügung.</p>\\n<p>Als Gast im Oasis Duna können Sie Ihre Mahlzeiten im Buffetrestaurant, in der À-la-carte-Pizzeria oder an der Poolbar genießen. Der Pub Boulevard bietet abends ein Unterhaltungsprogramm.</p>\\n<p>Vom Komplex Oasis Duna aus gelangen Sie schon nach 200 m zum Wasserpark Corralejo und nach 900 m an den Strand von Corralejo. Boote zur nahe gelegenen Insel Lobos mit regelmäßigen Fahrzeiten legen vom Hafen ab, der nur 5 Gehminuten entfernt ist. Der Komplex bietet kostenfreies Parken an der Unterkunft.</p>\",\"fr\":\"<p>Situé à Fuerteventura, à 100 mètres du port de Corralejo, l\'établissement Oasis Duna est doté d\'une piscine extérieure chauffée en hiver et d\'une grande terrasse bien exposée. Il abrite des appartements avec un balcon privé.</p>\\n<p>Tous les appartements spacieux comprennent un salon pourvu d\'une télévision avec chaînes à la carte, ainsi qu\'un coin cuisine bien équipé pourvu d\'une plaque de cuisson, d\'un four micro-ondes et d\'une bouilloire. Une connexion Wi-Fi est disponible moyennant de frais supplémentaires.</p>\\n<p>Entouré de jardins tropicaux, l\'Oasis Duna possède des courts de tennis, une salle de sport, un terrain de basket-ball ainsi qu\'une aire de jeux pour enfants.</p>\\n<p>Lors de votre séjour, vous pourrez prendre vos repas au restaurant buffet, à la pizzeria à la carte ou au bar de la piscine. Le pub Boulevard propose quant à lui un programme d\'animations en soirée.</p>\\n<p>Le complexe Oasis Duna se trouve à seulement 200 mètres du parc aquatique de Corralejo et à 900 mètres de sa plage. Des bateaux à destination de l\'île de Lobos, située à proximité, partent régulièrement du port qui est accessible en seulement 5 minutes à pied. En outre, le parking sur place est gratuit.</p>\",\"it\":\"<p>A 100 metri dal Porto di Corralejo, a Fuerteventura, l\'Oasis Dunas vanta un\'ampia terrazza solarium, una piscina all\'aperto riscaldata in inverno e appartamenti con balcone privato.</p>\\n<p>Gli spaziosi alloggi dell\'Oasis Duna presentano un salotto con pay TV e una zona cucina ben accessoriata, completa di piano cottura, forno a microonde e bollitore. La connessione Wi-Fi è disponibile a pagamento.</p>\\n<p>Circondato da giardini tropicali, l\'Oasis Duna Apartments offre inoltre campi da tennis, una palestra, una campo da basket e un\'area giochi per bambini.</p>\\n<p>All\'Oasis Duna potrete gustare i vostri pasti nel ristorante a buffet, nella pizzeria alla carta o nel bar a bordo piscina. Il pub Boulevard propone poi un programma di intrattenimento serale.</p>\\n<p>Il complesso Oasis Duna dista soli 200 metri dal Parco Acquatico di Corralejo, 900 metri dalla spiaggia cittadina e appena 5 minuti a piedi dal porto, da dove partono regolarmente barche dirette alla vicina Isola di Lobos. La proprietà include anche un parcheggio in loco gratuito.</p>\",\"ru\":\"<p>Комплекс апартаментов Oasis Duna расположен в 100 метрах от гавани Корралехо на острове Фуэртевентура. К вашим услугам просторная солнечная терраса и открытый бассейн, который подогревается в зимнее время. Гостям предлагаются апартаменты с собственным балконом.</p>\\n<p>Во всех просторных апартаментах комплекса Oasis Duna есть гостиная с платным телевидением и хорошо оборудованная кухонная зона с плитой, микроволновой печью и чайником. Wi-Fi предоставляется за дополнительную плату.</p>\\n<p>В комплексе апартаментов Oasis Duna, окруженном тропическими садами, в вашем распоряжении теннисные корты, тренажерный зал и баскетбольная площадка. Для детей обустроена игровая зона.</p>\\n<p>Гости комплекса Oasis Duna могут посетить ресторан, работающий по системе шведский стол, пиццерию с обслуживанием по меню и бар у бассейна. В баре Boulevard проводится вечерняя развлекательная программа.</p>\\n<p>Комплекс Oasis Duna находится всего в 200 метрах от аквапарка и в 900 метрах от пляжа Корралехо. До гавани, откуда регулярно отправляется водный транспорт на остров Лобос, можно дойти за 5 минут. Гостям предлагается бесплатная парковка на территории комплекса.</p>\",\"pt\":\"<p>O Oasis Duna está situado a 100 metros do Porto de Correlejo, em Fuerteventura, e disponibiliza um amplo terraço para banhos de sol e uma piscina exterior aquecida no Inverno. Oferece apartamentos com varandas privadas.</p>\\n<p>Cada espaçoso apartamento do Oasis Duna inclui um salão com pay-TV e uma área de cozinha bem equipada com uma placa de fogão, micro-ondas e chaleira. O acesso Wi-Fi está disponível por um custo adicional.</p>\\n<p>Rodeado por jardins tropicais, o Oasis Duna Apartments tem campos de ténis, um ginásio e campo de basquetebol. Também existe uma área de brincar para crianças.</p>\\n<p>Os hóspedes do Oasis Duna podem desfrutar de refeições no restaurante de estilo buffet, na pizzaria à carta ou no bar de apoio à piscina. O Pub Boulevard dispõe de um programa de entretenimento nocturno.</p>\\n<p>O Complexo Oasis Dunas fica apenas a 200 metros do Parque Aquático de Correlejo e a 900 metros da Praia de Corralejo. Barcos com ligação para a Ilha de Lobos, nas proximidades, partem regularmente do porto que localiza-se apenas a 5 minutos a pé. O complexo fornece estacionamento gratuito no local.</p>\"}',0,'activo',NULL,'2013-11-27 07:58:29','0000-00-00 00:00:00','http://www.booking.com/hotel/es/oasis-duna-corralejo-fuerteventura.es.html',3,1,1,'<div id=\"TA_selfserveprop906\" class=\"TA_selfserveprop\">\r\n<ul id=\"TFEoy8Z3HzQS\" class=\"TA_links mgewsNjZeGY\">\r\n<li id=\"XiaiGPaJ600\" class=\"yOtebqGKAl\">888 opiniones sobre <a target=\"_blank\" href=\"http://www.tripadvisor.es/Hotel_Review-g580322-d287970-Reviews-Oasis_Duna_Hotel-Corralejo_La_Oliva_Fuerteventura_Canary_Islands.html\">Oasis Duna Hotel</a> en Corralejo</li>\r\n</ul>\r\n</div>\r\n<script src=\"http://www.jscache.com/wejs?wtype=selfserveprop&uniq=906&locationId=287970&lang=es&rating=true&nreviews=5&writereviewlink=true&popIdx=true&iswide=false&border=false\"></script>','f1c06c'),(4,'{\"es\":\"Villas Alicia\",\"en\":\"Villas Alicia\",\"de\":\"Villas Alicia\",\"fr\":\"Villas Alicia\",\"it\":\"Villas Alicia\",\"zh\":\"Villas Alicia\",\"ru\":\"Villas Alicia\",\"ja\":\"Villas Alicia\",\"pt\":\"Villas Alicia\"}','{\"es\":\"\",\"ru\":\"\"}','{\"es\":\"<p>El establecimiento Villas Alicia est&aacute; situado en Caletas de Fuste, cerca del campo de golf de Fuerteventura. Ofrece villas modernas y elegantes equipadas con una piscina y un jard&iacute;n privados, conexi&oacute;n Wi-Fi gratuita y una TV de pantalla plana.</p>\\n\\n<p>Las luminosas villas del Villas Alicia cuentan con un dormitorio con una cama doble y un dormitorio con 2 camas individuales con vistas al jard&iacute;n. Disponen adem&aacute;s de una amplia sala de estar y comedor con un reproductor de DVD y un sof&aacute; grande.</p>\\n\\n<p>La cocina cuenta con fogones, microondas, cafetera, lavavajillas y lavadora. El jard&iacute;n privado incluye un sol&aacute;rium con una barbacoa y una piscina y ofrece vistas al oc&eacute;ano Atl&aacute;ntico.</p>\\n\\n<p>Este moderno complejo de villas est&aacute; a solo 600 metros de la playa y a 8 km del aeropuerto de Fuerteventura. En Caleta de Fuste hay varios cines y un casino.</p>\\n\",\"en\":\"<p>Villas Alicia is located in Caletas de Fuste, next to Fuerteventura Golf Course. It offers stylish, modern villas with a private pool and garden, free Wi-Fi and a flat-screen TV.</p>\\n<p>The bright villas at Villas Alicia have a double bedroom and a twin bedroom, both with garden views. There is a spacious lounge-diner with a DVD player and a large sofa.</p>\\n<p>The kitchen includes a hob, microwave and coffee maker, as well as a washing machine and dishwasher. The private garden has a sun terrace with a barbecue pool and views of the Atlantic Ocean.</p>\\n<p>This modern villa complex is just 600 metres from the beach, and there are various cinemas and a casino in Caleta de Fuste. Fuerteventura Airport is 8 km away.</p>\",\"de\":\"<p>Die Villas Alicia erwarten Sie in Caletas de Fuste, direkt neben dem Golfplatz Fuerteventura. Freuen Sie sich auf stilvolle, moderne Villen mit einem eigenen Pool und Garten, kostenfreiem WLAN und einem Flachbild-TV.</p>\\n<p>Die hellen Villen der Villas Alicia bieten ein Schlafzimmer mit 1 Doppelbett und ein Schlafzimmer mit 2 Einzelbetten, beide mit Gartenblick. Zur Ausstattung gehören auch ein geräumiger Wohn- und Essbereich mit einem DVD-Player und einem großen Sofa.</p>\\n<p>Die Küche ist mit einem Kochfeld, einer Mikrowelle und einer Kaffeemaschine ausgestattet. Eine Waschmaschine und eine Spülmaschine sind ebenfalls vorhanden. Der eigene Garten besticht durch eine Sonnenterrasse mit einem Pool und einem Grill sowie Blick auf den Atlantischen Ozean.</p>\\n<p>Dieser moderne Villen-Komplex liegt nur 600 m vom Strand entfernt. Der Ort Caleta de Fuste lockt mit verschiedenen Kinos und einem Casino. Vom Flughafen Fuerteventura trennen Sie 8 km.</p>\",\"fr\":\"<p>L\'établissement Villas Alicia se situe à Caleta de Fuste, à proximité du parcours de golf de Fuerteventura. Il propose des villas modernes et élégantes avec piscine privée et jardin, une connexion Wi-Fi gratuite et une télévision à écran plat.</p>\\n<p>Les villas lumineuses sont dotées d\'une chambre double et d\'une chambre lits jumeaux, toutes deux avec vue sur le jardin. Elles comprennent également un grand salon/salle à manger avec un lecteur DVD et un grand canapé.</p>\\n<p>La cuisine est équipée de plaques de cuisson, d\'un four micro-ondes, d\'une cafetière, d\'un lave-linge et d\'un lave-vaisselle. Le jardin privé est agrémenté d\'une terrasse bien exposée avec barbecue et offre une vue sur l\'océan Atlantique.</p>\\n<p>Ce complexe moderne se trouve à 600 mètres de la plage. Vous trouverez plusieurs cinémas et un casino à Caleta de Fuste. L\'aéroport de Fuerteventura est situé à 8 km de l\'établissement.</p>\",\"it\":\"<p>Il complesso Villas Alicia vi attende a Caletas de Fuste, nei pressi del campo da golf di Fuerteventura, e vanta ville moderne ed eleganti con piscina e giardino privati, connessione internet Wi-Fi gratuita e TV a schermo piatto.</p>\\n<p>Gli alloggi del Villas Alicia presentano una camera matrimoniale e una camera doppia con letti singoli, entrambe con vista sul giardino. Dispongono inoltre di una spaziosa area soggiorno-pranzo con lettore DVD e ampio divano.</p>\\n<p>La cucina include un piano cottura, un forno a microonde, una macchina del caffè, una lavastoviglie e una lavatrice. Il giardino terrazzato privato è completo di piscina, attrezzature per il barbecue e vista sull\'Oceano Atlantico.</p>\\n<p>Questo moderno complesso di ville sorge nei pressi dei vari cinema e casinò di Caleta de Fuste, a soli 600 metri dalla costa e a 8 km dall\'Aeroporto di Fuerteventura.</p>\",\"zh\":\"<p>Villas Alicia is located in Caletas de Fuste, next to Fuerteventura Golf Course. It offers stylish, modern villas with a private pool and garden, free Wi-Fi and a flat-screen TV.</p>\\n<p>The bright villas at Villas Alicia have a double bedroom and a twin bedroom, both with garden views. There is a spacious lounge-diner with a DVD player and a large sofa.</p>\\n<p>The kitchen includes a hob, microwave and coffee maker, as well as a washing machine and dishwasher. The private garden has a sun terrace with a barbecue pool and views of the Atlantic Ocean.</p>\\n<p>This modern villa complex is just 600 metres from the beach, and there are various cinemas and a casino in Caleta de Fuste. Fuerteventura Airport is 8 km away.</p>\",\"ru\":\"<p>Виллы Alicia находятся в городе Калета-де-Фусте, рядом с полем для гольфа Fuerteventura. Гостям предлагаются стильные и современные виллы с собственным бассейном, садом, телевизором с плоским экраном и бесплатным Wi-Fi.</p>\\n<p>Яркие виллы Alicia располагают спальней с 1 двуспальной кроватью и спальней с 2 отдельными кроватями. Из окон обеих спален открывается вид на сад. Помимо этого, имеется просторная гостиная с обеденной зоной, DVD-плеером и большим диваном.</p>\\n<p>Кухня оснащена электроплитой, микроволновой печью, кофеваркой, а также стиральной и посудомоечной машинами. Собственный сад располагает солнечной террасой с барбекю и бассейном, откуда открывается вид на Атлантический океан.</p>\\n<p>Этот современный комплекс вилл находится всего в 600 метрах от пляжа. Помимо этого, в Калета-де-Фусте гости могут посетить различные кинотеатры и казино. Расстояние до аэропорта Фуэртевентура составляет 8 км.</p>\",\"ja\":\"<p>Villas Alicia is located in Caletas de Fuste, next to Fuerteventura Golf Course. It offers stylish, modern villas with a private pool and garden, free Wi-Fi and a flat-screen TV.</p>\\n<p>The bright villas at Villas Alicia have a double bedroom and a twin bedroom, both with garden views. There is a spacious lounge-diner with a DVD player and a large sofa.</p>\\n<p>The kitchen includes a hob, microwave and coffee maker, as well as a washing machine and dishwasher. The private garden has a sun terrace with a barbecue pool and views of the Atlantic Ocean.</p>\\n<p>This modern villa complex is just 600 metres from the beach, and there are various cinemas and a casino in Caleta de Fuste. Fuerteventura Airport is 8 km away.</p>\",\"pt\":\"<p>Villas Alicia is located in Caletas de Fuste, next to Fuerteventura Golf Course. It offers stylish, modern villas with a private pool and garden, free Wi-Fi and a flat-screen TV.</p>\\n<p>The bright villas at Villas Alicia have a double bedroom and a twin bedroom, both with garden views. There is a spacious lounge-diner with a DVD player and a large sofa.</p>\\n<p>The kitchen includes a hob, microwave and coffee maker, as well as a washing machine and dishwasher. The private garden has a sun terrace with a barbecue pool and views of the Atlantic Ocean.</p>\\n<p>This modern villa complex is just 600 metres from the beach, and there are various cinemas and a casino in Caleta de Fuste. Fuerteventura Airport is 8 km away.</p>\"}',0,'activo',NULL,'2013-11-27 15:33:41','0000-00-00 00:00:00','http://www.booking.com/hotel/es/villas-alicia.es.html',0,1,2,'<div id=\"TA_selfserveprop305\" class=\"TA_selfserveprop\">\r\n<ul id=\"nEkEDpviH9kY\" class=\"TA_links wwxrWj\">\r\n<li id=\"aunAnH7\" class=\"ERgPu1UW5Hno\">0 opiniones sobre <a target=\"_blank\" href=\"http://www.tripadvisor.es/Hotel_Review-g658907-d3953146-Reviews-Villas_Alicia-Caleta_de_Fuste_Antigua_Fuerteventura_Canary_Islands.html\">Villas Alicia</a> en Caleta de Fuste</li>\r\n</ul>\r\n</div>\r\n<script src=\"http://www.jscache.com/wejs?wtype=selfserveprop&amp;uniq=305&amp;locationId=3953146&amp;lang=es&amp;rating=true&amp;nreviews=5&amp;writereviewlink=true&amp;popIdx=true&amp;iswide=false&amp;border=false\"></script>\r\n','ccad10'),(5,'{\"es\":\"Hotel Arena\",\"en\":\"Hotel Arena\",\"de\":\"Hotel Arena\",\"fr\":\"Hotel Arena\",\"it\":\"Hotel Arena\",\"ru\":\"Hotel Arena\",\"cs\":\"Hotel Arena\",\"pt\":\"Hotel Arena\"}','{\"es\":\"\"}','{\"es\":\"<p>Situado en el coraz&oacute;n de Corralejo, al norte de Fuenteventura, el Hotel Arena dispone de sauna, centro de fitness y una amplia piscina perfecta para relajarse bajo el sol.</p>\\n\\n<p>Disfrute de un relajante descanso en este pintoresco hotel, cuyas habitaciones disponen de aire acondicionado completo, y tienen un balc&oacute;n donde podr&aacute; disfrutar del sol.</p>\\n\\n<p>Disfrute de un paseo de unos 500 metros hasta las preciosas playas de esta isla tropical. El Hotel Arena goza de una excelente ubicaci&oacute;n para visitar los caf&eacute;s, bares y restaurantes.</p>\\n\\n<p>Tambi&eacute;n podr&aacute; saborear una sangr&iacute;a en su hamaca, alrededor de la preciosa piscina del hotel. Tambi&eacute;n hay una piscina m&aacute;s peque&ntilde;a, para ni&ntilde;os.</p>\\n\\n<p>Saboree la deliciosa comida en el restaurante del hotel. El Arena tambi&eacute;n ofrece servicios convenientes como cambio de divisas y alquiler de coches.</p>\\n\\n<p>Podr&aacute; utilizar el mostrador tur&iacute;stico y la recepci&oacute;n las 24 horas, para planear sus excursiones alrededor de la isla.</p>\\n\",\"en\":\"<p>Set in the heart of Corralejo, in northern Fuenteventura, the hotel Arena has a sauna, fitness centre and large outdoor swimming pool – perfect for a relaxing break in the sun.</p>\\n<p>Have a relaxing break at this quaint hotel, whose rooms are fully air-conditioned and have a balcony where you can enjoy the sun.</p>\\n<p>Take the 500-metre walk down to this tropical island’s beautiful beaches. The hotel Arena is well-placed to make the most of the resort’s cafes, bars and restaurants.</p>\\n<p>You can also enjoy sipping sangria on a sun lounger around the hotel’s lovely swimming pool. There is also a smaller pool for kids.</p>\\n<p>Savour great food at the hotel’s restaurant. The Arena also offers convenient services such as on-site currency exchange and car rental.</p>\\n<p>You can make use of the tour desk and 24-hour reception to plan day trips around the island.</p>\",\"de\":\"<p>Das Hotel Arena liegt im Herzen von Corralejo in Fuenteventuras Norden und erwartet Sie mit einer Sauna, einem Fitnesscenter sowie einem großen Außenpool - perfekt für ein erholsames Sonnenbad.</p>\\n<p>Genießen Sie einen erholsamen Aufenthalt in diesem hübschen Hotel, dessen klimatisierte Zimmer einen Balkon besitzen, von dem aus Sie die Sonne genießen können.</p>\\n<p>Schlendern Sie die 500 Meter hinunter zu den traumhaften Stränden dieser tropischen Insel. Das Hotel Arena befindet sich in ausgezeichneter Lage unweit vieler Cafés, Bars und Restaurants des Resorts.</p>\\n<p>Gönnen Sie sich doch einen Sangria auf einer der Sonnenliegen rund um den schönen Pool des Hotels. Es gibt auch einen kleineren Pool für Kinder.</p>\\n<p>Das hoteleigene Restaurant verwöhnt Sie mit kulinarischen Köstlichkeiten. Das Arena bietet auch praktische Dienste wie Geldwechsel im Hotel sowie eine Autovermietung.</p>\\n<p>Bei der Planung von Tagesausflügen rund um die Insel sind Ihnen der Tourenschalter und die 24-Stunden-Rezeption gerne behilflich.</p>\",\"fr\":\"<p>Situé au cœur de Corralejo, au nord de Fuenteventura, l\'hôtel Arena dispose d\'un sauna, d\'un centre de remise en forme et d\'une grande piscine extérieure, l\'endroit idéal pour se détendre au soleil.</p>\\n<p>Relaxez-vous dans cet hôtel pittoresque, dont les chambres sont entièrement climatisées et disposent d\'un balcon où vous pouvez profiter du soleil.</p>\\n<p>Vous pourrez faire à pied les 500 mètres de sentier qui descend vers les belles plages de cette île tropicale. L\'hôtel Arena bénéficie d\'un bon emplacement pour profiter au maximum des cafés, des bars et des restaurants de la station.</p>\\n<p>Vous pouvez également siroter une sangria sur une chaise longue près de la belle piscine de l\'hôtel. Une petite piscine pour les enfants est également disponible.</p>\\n<p>Savourez de bons plats au restaurant de l\'hôtel. L\'Arena propose également des services pratiques comme un service de change et de location de voiture sur place.</p>\\n<p>Vous pouvez utiliser le bureau d\'excursion et la réception ouverte 24h/24 pour planifier vos excursions dans l\'île.</p>\",\"it\":\"<p>Situato nel cuore di Corralejo, nella zona settentrionale di Fuenteventura, l\'Hotel Arena vanta una sauna, un centro fitness e un\'ampia piscina all\'aperto, ideale per crogiolarsi al sole.</p>\\n<p>Questa struttura pittoresca dispone di camere interamente climatizzate e provviste di balcone soleggiato.</p>\\n<p>L\'Hotel Arena dista soli 500 metri dalle splendide spiagge di questa isola tropicale. Gode inoltre di una posizione perfetta per raggiungere le caffetterie, i bar e i ristoranti di Corralejo.</p>\\n<p>Non vi è niente di meglio che sorseggiare una rinfrescante sangria sui lettini che attorniano la piscina dell\'albergo. Vi è anche una piscina più piccola per i bambini.</p>\\n<p>Il ristorante dell\'albergo propone una cucina eccellente. L\'Arena presenta utili servizi quali il cambio valuta e l\'autonoleggio.</p>\\n<p>A vostra disposizione anche un banco escursioni e una reception aperta 24 ore su 24, dove è possibile organizzare gite giornaliere sull\'isola.</p>\",\"ru\":\"<p>Расположенный в сердце Корралехо, в северной части Фуэртевентуры отель Arena имеет сауну, фитнес-центр и большой открытый бассейн, являясь идеальной базой для беззаботного отдыха на солнце.</p>\\n<p>Вас ждет расслабленный отдых в этом причудливом отеле. Номера оборудованы кондиционерами и балконами, где можно насладиться солнцем.</p>\\n<p>Пройдите 500 метров до красивых пляжей этого тропического острова. Отель Arena находится вблизи множества кафе, баров и ресторанов курорта.</p>\\n<p>Вы можете также отдохнуть, потягивая сангрию на шезлонге у прекрасного бассейна отеля. Есть небольшой бассейн для малышей.</p>\\n<p>Насладитесь вкусной едой в ресторане отеля. Отель Arena также предлагает удобные услуги, такие как обмен валюты, аренду автомобиля.</p>\\n<p>Вы можете воспользоваться экскурсионным бюро и запланировать однодневные экскурсии по острову на круглосуточной стойке регистрации.</p>\",\"cs\":\"<p>Hotel Arena se nachází v srdci letoviska Corajelo, na severu oblasti Fuenteventura. K dispozici je tu sauna, fitness centrum a velký venkovní bazén, jako stvořený pro relaxaci a opalování.</p>\\n<p>Čeká tu na vás odpočinková dovolená v klimatizovaných pokojích s balkonem, kde se také můžete opalovat.</p>\\n<p>Po půlkilometrové procházce vás uvítají překrásné pláže tohoto tropického ostrova. Hotel Arena je výhodně položen, v blízkosti mnoha kaváren a restaurací.</p>\\n<p>U hotelového bazénu si na lehátku vychutnejte sklenku sangrie. Je tu také menší bazén pro děti.</p>\\n<p>V restauraci hotelu Arena si pochutnáte na výborném jídle. Využít můžete služeb směnárny nebo půjčovny aut.</p>\\n<p>Turistické informace a recepce otevřená 24 hodin denně jsou také k dispozici a pomohou vám tu naplánovat výlety po celém ostrově.</p>\",\"pt\":\"<p>O Hotel Arena está situado no centro de Corralejo, no norte de Fuenteventura, dispõe de sauna, centro de fitness e piscina exterior, sendo perfeito para uma pausa relaxante ao sol.</p>\\n<p>Faça uma pausa relaxante neste acolhedor hotel, cujos quartos estão equipados com ar condicionado e uma varanda onde pode desfrutar do sol.</p>\\n<p>Faça um passeio a pé de 500 metros até às belas praias desta ilha tropical. O Hotel Arena está bem posicionado para tirar o máximo proveito dos cafés, bares e restaurantes desta estância.</p>\\n<p>Também poderá saborear uma sangria enquanto relaxa numa espreguiçadeira junto da encantadora piscina do hotel. Existe também uma pequena piscina para crianças.</p>\\n<p>Saboreie excelente culinária no restaurante do hotel. O Arena também conta com convenientes serviços, como câmbio e aluguer de automóveis.</p>\\n<p>Poderá fazer uso do balcão de turismo e da recepção 24 horas para organizar passeios diários pela ilha.</p>\"}',0,'activo',NULL,'2013-11-27 21:55:00','0000-00-00 00:00:00','http://www.booking.com/hotel/es/arena-corralejo.es.html',4,1,1,'<div id=\"TA_selfserveprop482\" class=\"TA_selfserveprop\">\r\n<ul id=\"UNGaybVM6hx\" class=\"TA_links oa68qJfsA1Ct\">\r\n<li id=\"5cGyB6MNRf1M\" class=\"1ydUE2sCi18\">800 reviews of <a target=\"_blank\" href=\"http://www.tripadvisor.co.uk/Hotel_Review-g580322-d249517-Reviews-Hotel_Arena-Corralejo_La_Oliva_Fuerteventura_Canary_Islands.html\">Hotel Arena</a> in Corralejo</li>\r\n</ul>\r\n</div>\r\n<script src=\"http://www.jscache.com/wejs?wtype=selfserveprop&uniq=482&locationId=249517&lang=en_UK&rating=true&nreviews=5&writereviewlink=true&popIdx=true&iswide=false&border=false\"></script>','45adad');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_archivo`
--

DROP TABLE IF EXISTS `hotel_archivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_archivo` (
  `hotel_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_archivos_archivos1_idx` (`archivo_id`),
  KEY `fk_hotel_has_archivos_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_archivos_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_archivos_archivos1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_archivo`
--

LOCK TABLES `hotel_archivo` WRITE;
/*!40000 ALTER TABLE `hotel_archivo` DISABLE KEYS */;
INSERT INTO `hotel_archivo` VALUES (4,560,536,''),(4,561,537,''),(4,562,538,''),(4,563,539,''),(4,564,540,''),(4,565,541,''),(4,566,542,''),(4,567,543,''),(4,568,544,''),(4,569,545,''),(4,570,546,''),(4,571,547,''),(4,572,548,''),(4,573,549,''),(4,574,550,''),(4,575,551,''),(4,576,552,''),(4,577,553,''),(4,578,554,''),(4,579,555,''),(5,628,604,''),(5,629,605,''),(5,630,606,''),(5,631,607,''),(5,632,608,''),(5,633,609,''),(5,634,610,''),(5,635,611,''),(5,636,612,''),(5,637,613,''),(5,638,614,''),(5,639,615,''),(5,640,616,''),(5,641,617,''),(5,642,618,''),(5,643,619,''),(5,644,620,''),(5,645,621,''),(5,646,622,''),(5,647,623,''),(5,648,624,''),(5,649,625,''),(5,650,626,''),(5,651,627,''),(5,652,628,''),(5,653,629,''),(5,654,630,''),(5,655,631,''),(5,656,632,''),(5,657,633,''),(5,658,634,''),(5,659,635,''),(5,660,636,''),(5,661,637,''),(5,662,638,''),(5,663,639,''),(5,664,640,''),(5,665,641,''),(5,666,642,''),(5,667,643,''),(5,668,644,''),(5,669,645,''),(5,670,646,''),(5,671,647,''),(5,672,648,''),(3,697,673,''),(3,698,674,''),(3,699,675,''),(3,700,676,''),(3,701,677,''),(3,702,678,''),(3,703,679,''),(3,704,680,''),(3,705,681,''),(3,706,682,''),(3,707,683,''),(3,708,684,''),(3,709,685,''),(3,710,686,''),(3,711,687,''),(3,712,688,''),(3,713,689,''),(3,714,690,''),(3,715,691,''),(3,716,692,''),(3,717,693,''),(3,718,694,''),(3,719,695,''),(3,720,696,'');
/*!40000 ALTER TABLE `hotel_archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_condicion`
--

DROP TABLE IF EXISTS `hotel_condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_condicion` (
  `hotel_id` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_condicion_condicion1_idx` (`condicion_id`),
  KEY `fk_hotel_has_condicion_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_condicion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_condicion_condicion1` FOREIGN KEY (`condicion_id`) REFERENCES `condicion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_condicion`
--

LOCK TABLES `hotel_condicion` WRITE;
/*!40000 ALTER TABLE `hotel_condicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_condicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_direccion`
--

DROP TABLE IF EXISTS `hotel_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_direccion` (
  `hotel_id` int(11) NOT NULL,
  `direccion_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_direccion_direccion1_idx` (`direccion_id`),
  KEY `fk_hotel_has_direccion_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_direccion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_direccion_direccion1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_direccion`
--

LOCK TABLES `hotel_direccion` WRITE;
/*!40000 ALTER TABLE `hotel_direccion` DISABLE KEYS */;
INSERT INTO `hotel_direccion` VALUES (2,2,1),(3,3,2),(4,4,3),(5,5,4);
/*!40000 ALTER TABLE `hotel_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_idioma`
--

DROP TABLE IF EXISTS `hotel_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_idioma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `idioma_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hoteli_hotel_idx` (`hotel_id`),
  KEY `fk_hoteli_idioma1_idx` (`idioma_id`),
  CONSTRAINT `fk_hoteli_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hoteli_idioma1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_idioma`
--

LOCK TABLES `hotel_idioma` WRITE;
/*!40000 ALTER TABLE `hotel_idioma` DISABLE KEYS */;
INSERT INTO `hotel_idioma` VALUES (145,2,1),(146,2,2),(147,2,3),(148,2,4),(149,2,5),(426,5,1),(427,5,2),(428,5,3),(429,5,4),(430,5,5),(431,5,7),(432,5,8),(433,5,10),(459,4,1),(460,4,2),(461,4,3),(462,4,4),(463,4,5),(464,4,6),(465,4,7),(466,4,9),(467,4,10),(475,3,1),(476,3,2),(477,3,3),(478,3,4),(479,3,5),(480,3,7),(481,3,10);
/*!40000 ALTER TABLE `hotel_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_moneda`
--

DROP TABLE IF EXISTS `hotel_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `moneda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotelm_hotel_idx` (`hotel_id`),
  KEY `fk_hotelm_moneda1_idx` (`moneda_id`),
  CONSTRAINT `fk_hotelm_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotelm_moneda1` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_moneda`
--

LOCK TABLES `hotel_moneda` WRITE;
/*!40000 ALTER TABLE `hotel_moneda` DISABLE KEYS */;
INSERT INTO `hotel_moneda` VALUES (48,2,1),(49,2,2),(160,5,1),(161,5,2),(162,5,3),(172,4,1),(173,4,2),(174,4,3),(178,3,1),(179,3,2),(180,3,3);
/*!40000 ALTER TABLE `hotel_moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_servicio`
--

DROP TABLE IF EXISTS `hotel_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel_servicio` (
  `hotel_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_servicio_servicio1_idx` (`servicio_id`),
  KEY `fk_hotel_has_servicio_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_servicio_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_servicio_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_servicio`
--

LOCK TABLES `hotel_servicio` WRITE;
/*!40000 ALTER TABLE `hotel_servicio` DISABLE KEYS */;
INSERT INTO `hotel_servicio` VALUES (2,128,122),(2,129,123),(2,130,124),(2,131,125),(2,132,126),(2,133,127),(2,134,128),(4,167,195),(4,168,196),(4,169,197),(4,170,198),(4,171,199),(4,172,200),(4,173,201),(4,174,202),(4,175,203),(4,176,204),(4,177,205),(4,178,206),(4,179,207),(4,180,208),(4,181,209),(4,182,210),(4,183,211),(4,175,212),(4,176,213),(4,177,214),(4,178,215),(4,179,216),(4,180,217),(4,181,218),(4,182,219),(4,183,220),(4,175,555),(4,176,556),(4,177,557),(4,178,558),(4,179,559),(4,180,560),(4,181,561),(4,182,562),(4,183,563),(4,175,564),(4,176,565),(4,177,566),(4,178,567),(4,179,568),(4,180,569),(4,181,570),(4,182,571),(4,183,572),(5,518,640),(5,519,641),(5,520,642),(5,521,643),(5,522,644),(5,523,645),(5,524,646),(5,525,647),(5,526,648),(5,527,649),(5,528,650),(5,529,651),(5,530,652),(5,531,653),(5,532,654),(5,533,655),(5,534,656),(5,535,657),(5,536,658),(5,537,659),(5,538,660),(5,539,661),(5,540,662),(5,541,663),(5,542,664),(5,543,665),(5,544,666),(5,545,667),(5,546,668),(5,547,669),(5,548,670),(5,549,671),(5,550,672),(5,551,673),(5,552,674),(5,553,675),(5,554,676),(5,555,677),(5,556,678),(3,591,713),(3,592,714),(3,593,715),(3,594,716),(3,595,717),(3,596,718),(3,597,719),(3,598,720),(3,599,721),(3,600,722),(3,601,723),(3,602,724),(3,603,725),(3,604,726),(3,605,727),(3,606,728),(3,607,729),(3,608,730),(3,609,731),(3,610,732),(3,611,733),(3,612,734),(3,613,735),(3,614,736),(3,615,737),(3,616,738),(3,617,739),(3,618,740),(3,619,741),(3,620,742),(3,621,743),(3,622,744),(3,623,745),(3,624,746);
/*!40000 ALTER TABLE `hotel_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `codigo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Español','es'),(2,'English','en'),(3,'Deutsch','de'),(4,'Français','fr'),(5,'Italiano','it'),(6,'简体中文','zh'),(7,'Русский','ru'),(8,'Čeština','cs'),(9,'日本語','ja'),(10,'Português','pt');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) DEFAULT NULL,
  `mailcol` varchar(45) DEFAULT NULL,
  `mail_tipo_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mail_mail_tipo1_idx` (`mail_tipo_id`),
  KEY `fk_mail_empresa1_idx` (`empresa_id`),
  CONSTRAINT `fk_mail_mail_tipo1` FOREIGN KEY (`mail_tipo_id`) REFERENCES `mail_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mail_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_tipo`
--

DROP TABLE IF EXISTS `mail_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_tipo`
--

LOCK TABLES `mail_tipo` WRITE;
/*!40000 ALTER TABLE `mail_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `simbolo` varchar(3) DEFAULT NULL,
  `codigo` varchar(4) DEFAULT NULL,
  `tasa_cambio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
INSERT INTO `moneda` VALUES (1,'Euro','€','EUR',1),(2,'Dolar','$','USD',1.3592),(3,'Pound','£','GBP',0.831989247);
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `prefijo` smallint(5) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `continente` varchar(16) DEFAULT NULL,
  `subcontinente` varchar(32) DEFAULT NULL,
  `iso_moneda` varchar(3) DEFAULT NULL,
  `nombre_moneda` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (4,'AF','AFG',93,'Afganistán','Asia',NULL,'AFN','Afgani afgano'),(8,'AL','ALB',355,'Albania','Europa',NULL,'ALL','Lek albanés'),(10,'AQ','ATA',672,'Antártida','Antártida',NULL,NULL,NULL),(12,'DZ','DZA',213,'Argelia','África',NULL,'DZD','Dinar algerino'),(16,'AS','ASM',1684,'Samoa Americana','Oceanía',NULL,NULL,NULL),(20,'AD','AND',376,'Andorra','Europa',NULL,'EUR','Euro'),(24,'AO','AGO',244,'Angola','África',NULL,'AOA','Kwanza angoleño'),(28,'AG','ATG',1268,'Antigua y Barbuda','América','El Caribe',NULL,NULL),(31,'AZ','AZE',994,'Azerbaiyán','Asia',NULL,'AZM','Manat azerbaiyano'),(32,'AR','ARG',54,'Argentina','América','América del Sur','ARS','Peso argentino'),(36,'AU','AUS',61,'Australia','Oceanía',NULL,'AUD','Dólar australiano'),(40,'AT','AUT',43,'Austria','Europa',NULL,'EUR','Euro'),(44,'BS','BHS',1242,'Bahamas','América','El Caribe','BSD','Dólar bahameño'),(48,'BH','BHR',973,'Bahréin','Asia',NULL,'BHD','Dinar bahreiní'),(50,'BD','BGD',880,'Bangladesh','Asia',NULL,'BDT','Taka de Bangladesh'),(51,'AM','ARM',374,'Armenia','Asia',NULL,'AMD','Dram armenio'),(52,'BB','BRB',1246,'Barbados','América','El Caribe','BBD','Dólar de Barbados'),(56,'BE','BEL',32,'Bélgica','Europa',NULL,'EUR','Euro'),(60,'BM','BMU',1441,'Bermudas','América','El Caribe','BMD','Dólar de Bermuda'),(64,'BT','BTN',975,'Bhután','Asia',NULL,'BTN','Ngultrum de Bután'),(68,'BO','BOL',591,'Bolivia','América','América del Sur','BOB','Boliviano'),(70,'BA','BIH',387,'Bosnia y Herzegovina','Europa',NULL,'BAM','Marco convertible de Bosnia-Herzegovina'),(72,'BW','BWA',267,'Botsuana','África',NULL,'BWP','Pula de Botsuana'),(74,'BV','BVT',0,'Isla Bouvet',NULL,NULL,NULL,NULL),(76,'BR','BRA',55,'Brasil','América','América del Sur','BRL','Real brasileño'),(84,'BZ','BLZ',501,'Belice','América','América Central','BZD','Dólar de Belice'),(86,'IO','IOT',0,'Territorio Británico del Océano Índico',NULL,NULL,NULL,NULL),(90,'SB','SLB',677,'Islas Salomón','Oceanía',NULL,'SBD','Dólar de las Islas Salomón'),(92,'VG','VGB',1284,'Islas Vírgenes Británicas','América','El Caribe',NULL,NULL),(96,'BN','BRN',673,'Brunéi','Asia',NULL,'BND','Dólar de Brunéi'),(100,'BG','BGR',359,'Bulgaria','Europa',NULL,'BGN','Lev búlgaro'),(104,'MM','MMR',95,'Myanmar','Asia',NULL,'MMK','Kyat birmano'),(108,'BI','BDI',257,'Burundi','África',NULL,'BIF','Franco burundés'),(112,'BY','BLR',375,'Bielorrusia','Europa',NULL,'BYR','Rublo bielorruso'),(116,'KH','KHM',855,'Camboya','Asia',NULL,'KHR','Riel camboyano'),(120,'CM','CMR',237,'Camerún','África',NULL,NULL,NULL),(124,'CA','CAN',1,'Canadá','América','América del Norte','CAD','Dólar canadiense'),(132,'CV','CPV',238,'Cabo Verde','África',NULL,'CVE','Escudo caboverdiano'),(136,'KY','CYM',1345,'Islas Caimán','América','El Caribe','KYD','Dólar caimano (de Islas Caimán)'),(140,'CF','CAF',236,'República Centroafricana','África',NULL,NULL,NULL),(144,'LK','LKA',94,'Sri Lanka','Asia',NULL,'LKR','Rupia de Sri Lanka'),(148,'TD','TCD',235,'Chad','África',NULL,NULL,NULL),(152,'CL','CHL',56,'Chile','América','América del Sur','CLP','Peso chileno'),(156,'CN','CHN',86,'China','Asia',NULL,'CNY','Yuan Renminbi de China'),(158,'TW','TWN',886,'Taiwán','Asia',NULL,'TWD','Dólar taiwanés'),(162,'CX','CXR',61,'Isla de Navidad','Oceanía',NULL,NULL,NULL),(166,'CC','CCK',61,'Islas Cocos','Óceanía',NULL,NULL,NULL),(170,'CO','COL',57,'Colombia','América','América del Sur','COP','Peso colombiano'),(174,'KM','COM',269,'Comoras','África',NULL,'KMF','Franco comoriano (de Comoras)'),(175,'YT','MYT',262,'Mayotte','África',NULL,NULL,NULL),(178,'CG','COG',242,'Congo','África',NULL,NULL,NULL),(180,'CD','COD',243,'República Democrática del Congo','África',NULL,'CDF','Franco congoleño'),(184,'CK','COK',682,'Islas Cook','Oceanía',NULL,NULL,NULL),(188,'CR','CRI',506,'Costa Rica','América','América Central','CRC','Colón costarricense'),(191,'HR','HRV',385,'Croacia','Europa',NULL,'HRK','Kuna croata'),(192,'CU','CUB',53,'Cuba','América','El Caribe','CUP','Peso cubano'),(196,'CY','CYP',357,'Chipre','Europa',NULL,'CYP','Libra chipriota'),(203,'CZ','CZE',420,'República Checa','Europa',NULL,'CZK','Koruna checa'),(204,'BJ','BEN',229,'Benín','África',NULL,NULL,NULL),(208,'DK','DNK',45,'Dinamarca','Europa',NULL,'DKK','Corona danesa'),(212,'DM','DMA',1767,'Dominica','América','El Caribe',NULL,NULL),(214,'DO','DOM',1809,'República Dominicana','América','El Caribe','DOP','Peso dominicano'),(218,'EC','ECU',593,'Ecuador','América','América del Sur',NULL,NULL),(222,'SV','SLV',503,'El Salvador','América','América Central','SVC','Colón salvadoreño'),(226,'GQ','GNQ',240,'Guinea Ecuatorial','África',NULL,NULL,NULL),(231,'ET','ETH',251,'Etiopía','África',NULL,'ETB','Birr etíope'),(232,'ER','ERI',291,'Eritrea','África',NULL,'ERN','Nakfa eritreo'),(233,'EE','EST',372,'Estonia','Europa',NULL,'EEK','Corona estonia'),(234,'FO','FRO',298,'Islas Feroe','Europa',NULL,NULL,NULL),(238,'FK','FLK',500,'Islas Malvinas','América','América del Sur','FKP','Libra malvinense'),(239,'GS','SGS',0,'Islas Georgias del Sur y Sandwich del Sur','América','América del Sur',NULL,NULL),(242,'FJ','FJI',679,'Fiyi','Oceanía',NULL,'FJD','Dólar fijiano'),(246,'FI','FIN',358,'Finlandia','Europa',NULL,'EUR','Euro'),(248,'AX','ALA',0,'Islas Gland','Europa',NULL,NULL,NULL),(250,'FR','FRA',33,'Francia','Europa',NULL,'EUR','Euro'),(254,'GF','GUF',0,'Guayana Francesa','América','América del Sur',NULL,NULL),(258,'PF','PYF',689,'Polinesia Francesa','Oceanía',NULL,NULL,NULL),(260,'TF','ATF',0,'Territorios Australes Franceses',NULL,NULL,NULL,NULL),(262,'DJ','DJI',253,'Yibuti','África',NULL,'DJF','Franco yibutiano'),(266,'GA','GAB',241,'Gabón','África',NULL,NULL,NULL),(268,'GE','GEO',995,'Georgia','Europa',NULL,'GEL','Lari georgiano'),(270,'GM','GMB',220,'Gambia','África',NULL,'GMD','Dalasi gambiano'),(275,'PS','PSE',0,'Palestina','Asia',NULL,NULL,NULL),(276,'DE','DEU',49,'Alemania','Europa',NULL,'EUR','Euro'),(288,'GH','GHA',233,'Ghana','África',NULL,'GHC','Cedi ghanés'),(292,'GI','GIB',350,'Gibraltar','Europa',NULL,'GIP','Libra de Gibraltar'),(296,'KI','KIR',686,'Kiribati','Oceanía',NULL,NULL,NULL),(300,'GR','GRC',30,'Grecia','Europa',NULL,'EUR','Euro'),(304,'GL','GRL',299,'Groenlandia','América','América del Norte',NULL,NULL),(308,'GD','GRD',1473,'Granada','América','El Caribe',NULL,NULL),(312,'GP','GLP',0,'Guadalupe','América','El Caribe',NULL,NULL),(316,'GU','GUM',1671,'Guam','Oceanía',NULL,NULL,NULL),(320,'GT','GTM',502,'Guatemala','América','América Central','GTQ','Quetzal guatemalteco'),(324,'GN','GIN',224,'Guinea','África',NULL,'GNF','Franco guineano'),(328,'GY','GUY',592,'Guyana','América','América del Sur','GYD','Dólar guyanés'),(332,'HT','HTI',509,'Haití','América','El Caribe','HTG','Gourde haitiano'),(334,'HM','HMD',0,'Islas Heard y McDonald','Oceanía',NULL,NULL,NULL),(336,'VA','VAT',39,'Ciudad del Vaticano','Europa',NULL,NULL,NULL),(340,'HN','HND',504,'Honduras','América','América Central','HNL','Lempira hondureño'),(344,'HK','HKG',852,'Hong Kong','Asia',NULL,'HKD','Dólar de Hong Kong'),(348,'HU','HUN',36,'Hungría','Europa',NULL,'HUF','Forint húngaro'),(352,'IS','ISL',354,'Islandia','Europa',NULL,'ISK','Króna islandesa'),(356,'IN','IND',91,'India','Asia',NULL,'INR','Rupia india'),(360,'ID','IDN',62,'Indonesia','Asia',NULL,'IDR','Rupiah indonesia'),(364,'IR','IRN',98,'Irán','Asia',NULL,'IRR','Rial iraní'),(368,'IQ','IRQ',964,'Iraq','Asia',NULL,'IQD','Dinar iraquí'),(372,'IE','IRL',353,'Irlanda','Europa',NULL,'EUR','Euro'),(376,'IL','ISR',972,'Israel','Asia',NULL,'ILS','Nuevo shéquel israelí'),(380,'IT','ITA',39,'Italia','Europa',NULL,'EUR','Euro'),(384,'CI','CIV',225,'Costa de Marfil','África',NULL,NULL,NULL),(388,'JM','JAM',1876,'Jamaica','América','El Caribe','JMD','Dólar jamaicano'),(392,'JP','JPN',81,'Japón','Asia',NULL,'JPY','Yen japonés'),(398,'KZ','KAZ',7,'Kazajstán','Asia',NULL,'KZT','Tenge kazajo'),(400,'JO','JOR',962,'Jordania','Asia',NULL,'JOD','Dinar jordano'),(404,'KE','KEN',254,'Kenia','África',NULL,'KES','Chelín keniata'),(408,'KP','PRK',850,'Corea del Norte','Asia',NULL,'KPW','Won norcoreano'),(410,'KR','KOR',82,'Corea del Sur','Asia',NULL,'KRW','Won surcoreano'),(414,'KW','KWT',965,'Kuwait','Asia',NULL,'KWD','Dinar kuwaití'),(417,'KG','KGZ',996,'Kirguistán','Asia',NULL,'KGS','Som kirguís (de Kirguistán)'),(418,'LA','LAO',856,'Laos','Asia',NULL,'LAK','Kip lao'),(422,'LB','LBN',961,'Líbano','Asia',NULL,'LBP','Libra libanesa'),(426,'LS','LSO',266,'Lesotho','África',NULL,'LSL','Loti lesotense'),(428,'LV','LVA',371,'Letonia','Europa',NULL,'LVL','Lat letón'),(430,'LR','LBR',231,'Liberia','África',NULL,'LRD','Dólar liberiano'),(434,'LY','LBY',218,'Libia','África',NULL,'LYD','Dinar libio'),(438,'LI','LIE',423,'Liechtenstein','Europa',NULL,NULL,NULL),(440,'LT','LTU',370,'Lituania','Europa',NULL,'LTL','Litas lituano'),(442,'LU','LUX',352,'Luxemburgo','Europa',NULL,'EUR','Euro'),(446,'MO','MAC',853,'Macao','Asia',NULL,'MOP','Pataca de Macao'),(450,'MG','MDG',261,'Madagascar','África',NULL,'MGA','Ariary malgache'),(454,'MW','MWI',265,'Malaui','África',NULL,'MWK','Kwacha malauiano'),(458,'MY','MYS',60,'Malasia','Asia',NULL,'MYR','Ringgit malayo'),(462,'MV','MDV',960,'Maldivas','Asia',NULL,'MVR','Rufiyaa maldiva'),(466,'ML','MLI',223,'Malí','África',NULL,NULL,NULL),(470,'MT','MLT',356,'Malta','Europa',NULL,'MTL','Lira maltesa'),(474,'MQ','MTQ',0,'Martinica','América','El Caribe',NULL,NULL),(478,'MR','MRT',222,'Mauritania','África',NULL,'MRO','Ouguiya mauritana'),(480,'MU','MUS',230,'Mauricio','África',NULL,'MUR','Rupia mauricia'),(484,'MX','MEX',52,'México','América','América del Norte','MXN','Peso mexicano'),(492,'MC','MCO',377,'Mónaco','Europa',NULL,NULL,NULL),(496,'MN','MNG',976,'Mongolia','Asia',NULL,'MNT','Tughrik mongol'),(498,'MD','MDA',373,'Moldavia','Europa',NULL,'MDL','Leu moldavo'),(499,'ME','MNE',382,'Montenegro','Europa',NULL,NULL,NULL),(500,'MS','MSR',1664,'Montserrat','América','El Caribe',NULL,NULL),(504,'MA','MAR',212,'Marruecos','África',NULL,'MAD','Dirham marroquí'),(508,'MZ','MOZ',258,'Mozambique','África',NULL,'MZM','Metical mozambiqueño'),(512,'OM','OMN',968,'Omán','Asia',NULL,'OMR','Rial omaní'),(516,'NA','NAM',264,'Namibia','África',NULL,'NAD','Dólar namibio'),(520,'NR','NRU',674,'Nauru','Oceanía',NULL,NULL,NULL),(524,'NP','NPL',977,'Nepal','Asia',NULL,'NPR','Rupia nepalesa'),(528,'NL','NLD',31,'Países Bajos','Europa',NULL,'EUR','Euro'),(530,'AN','ANT',599,'Antillas Holandesas','América','El Caribe','ANG','Florín antillano neerlandés'),(533,'AW','ABW',297,'Aruba','América','El Caribe','AWG','Florín arubeño'),(540,'NC','NCL',687,'Nueva Caledonia','Oceanía',NULL,NULL,NULL),(548,'VU','VUT',678,'Vanuatu','Oceanía',NULL,'VUV','Vatu vanuatense'),(554,'NZ','NZL',64,'Nueva Zelanda','Oceanía',NULL,'NZD','Dólar neozelandés'),(558,'NI','NIC',505,'Nicaragua','América','América Central','NIO','Córdoba nicaragüense'),(562,'NE','NER',227,'Níger','África',NULL,NULL,NULL),(566,'NG','NGA',234,'Nigeria','África',NULL,'NGN','Naira nigeriana'),(570,'NU','NIU',683,'Niue','Oceanía',NULL,NULL,NULL),(574,'NF','NFK',0,'Isla Norfolk','Oceanía',NULL,NULL,NULL),(578,'NO','NOR',47,'Noruega','Europa',NULL,'NOK','Corona noruega'),(580,'MP','MNP',1670,'Islas Marianas del Norte','Oceanía',NULL,NULL,NULL),(581,'UM','UMI',0,'Islas Ultramarinas de Estados Unidos',NULL,NULL,NULL,NULL),(583,'FM','FSM',691,'Micronesia','Oceanía',NULL,NULL,NULL),(584,'MH','MHL',692,'Islas Marshall','Oceanía',NULL,NULL,NULL),(585,'PW','PLW',680,'Palaos','Oceanía',NULL,NULL,NULL),(586,'PK','PAK',92,'Pakistán','Asia',NULL,'PKR','Rupia pakistaní'),(591,'PA','PAN',507,'Panamá','América','América Central','PAB','Balboa panameña'),(598,'PG','PNG',675,'Papúa Nueva Guinea','Oceanía',NULL,'PGK','Kina de Papúa Nueva Guinea'),(600,'PY','PRY',595,'Paraguay','América','América del Sur','PYG','Guaraní paraguayo'),(604,'PE','PER',51,'Perú','América','América del Sur','PEN','Nuevo sol peruano'),(608,'PH','PHL',63,'Filipinas','Asia',NULL,'PHP','Peso filipino'),(612,'PN','PCN',870,'Islas Pitcairn','Oceanía',NULL,NULL,NULL),(616,'PL','POL',48,'Polonia','Europa',NULL,'PLN','zloty polaco'),(620,'PT','PRT',351,'Portugal','Europa',NULL,'EUR','Euro'),(624,'GW','GNB',245,'Guinea-Bissau','África',NULL,NULL,NULL),(626,'TL','TLS',670,'Timor Oriental','Asia',NULL,NULL,NULL),(630,'PR','PRI',1,'Puerto Rico','América','El Caribe',NULL,NULL),(634,'QA','QAT',974,'Qatar','Asia',NULL,'QAR','Rial qatarí'),(638,'RE','REU',262,'Reunión','África',NULL,NULL,NULL),(642,'RO','ROU',40,'Rumania','Europa',NULL,'RON','Leu rumano'),(643,'RU','RUS',7,'Rusia','Asia',NULL,'RUB','Rublo ruso'),(646,'RW','RWA',250,'Ruanda','África',NULL,'RWF','Franco ruandés'),(654,'SH','SHN',290,'Santa Helena','África',NULL,'SHP','Libra de Santa Helena'),(659,'KN','KNA',1869,'San Cristóbal y Nieves','América','El Caribe',NULL,NULL),(660,'AI','AIA',1264,'Anguila','América','El Caribe',NULL,NULL),(662,'LC','LCA',1758,'Santa Lucía','América','El Caribe',NULL,NULL),(666,'PM','SPM',508,'San Pedro y Miquelón','América','América del Norte',NULL,NULL),(670,'VC','VCT',1784,'San Vicente y las Granadinas','América','El Caribe',NULL,NULL),(674,'SM','SMR',378,'San Marino','Europa',NULL,NULL,NULL),(678,'ST','STP',239,'Santo Tomé y Príncipe','África',NULL,'STD','Dobra de Santo Tomé y Príncipe'),(682,'SA','SAU',966,'Arabia Saudí','Asia',NULL,'SAR','Riyal saudí'),(686,'SN','SEN',221,'Senegal','África',NULL,NULL,NULL),(688,'RS','SRB',381,'Serbia','Europa',NULL,NULL,NULL),(690,'SC','SYC',248,'Seychelles','África',NULL,'SCR','Rupia de Seychelles'),(694,'SL','SLE',232,'Sierra Leona','África',NULL,'SLL','Leone de Sierra Leona'),(702,'SG','SGP',65,'Singapur','Asia',NULL,'SGD','Dólar de Singapur'),(703,'SK','SVK',421,'Eslovaquia','Europa',NULL,'SKK','Corona eslovaca'),(704,'VN','VNM',84,'Vietnam','Asia',NULL,'VND','Dong vietnamita'),(705,'SI','SVN',386,'Eslovenia','Europa',NULL,NULL,NULL),(706,'SO','SOM',252,'Somalia','África',NULL,'SOS','Chelín somalí'),(710,'ZA','ZAF',27,'Sudáfrica','África',NULL,'ZAR','Rand sudafricano'),(716,'ZW','ZWE',263,'Zimbabue','África',NULL,'ZWL','Dólar zimbabuense'),(724,'ES','ESP',34,'España','Europa',NULL,'EUR','Euro'),(732,'EH','ESH',0,'Sahara Occidental','África',NULL,NULL,NULL),(736,'SD','SDN',249,'Sudán','África',NULL,'SDD','Dinar sudanés'),(740,'SR','SUR',597,'Surinam','América','América del Sur','SRD','Dólar surinamés'),(744,'SJ','SJM',0,'Svalbard y Jan Mayen','Europa',NULL,NULL,NULL),(748,'SZ','SWZ',268,'Suazilandia','África',NULL,'SZL','Lilangeni suazi'),(752,'SE','SWE',46,'Suecia','Europa',NULL,'SEK','Corona sueca'),(756,'CH','CHE',41,'Suiza','Europa',NULL,'CHF','Franco suizo'),(760,'SY','SYR',963,'Siria','Asia',NULL,'SYP','Libra siria'),(762,'TJ','TJK',992,'Tayikistán','Asia',NULL,'TJS','Somoni tayik (de Tayikistán)'),(764,'TH','THA',66,'Tailandia','Asia',NULL,'THB','Baht tailandés'),(768,'TG','TGO',228,'Togo','África',NULL,NULL,NULL),(772,'TK','TKL',690,'Tokelau','Oceanía',NULL,NULL,NULL),(776,'TO','TON',676,'Tonga','Oceanía',NULL,'TOP','Pa\'anga tongano'),(780,'TT','TTO',1868,'Trinidad y Tobago','América','El Caribe','TTD','Dólar de Trinidad y Tobago'),(784,'AE','ARE',971,'Emiratos Árabes Unidos','Asia',NULL,'AED','Dirham de los Emiratos Árabes Unidos'),(788,'TN','TUN',216,'Túnez','África',NULL,'TND','Dinar tunecino'),(792,'TR','TUR',90,'Turquía','Asia',NULL,'TRY','Lira turca'),(795,'TM','TKM',993,'Turkmenistán','Asia',NULL,'TMM','Manat turcomano'),(796,'TC','TCA',1649,'Islas Turcas y Caicos','América','El Caribe',NULL,NULL),(798,'TV','TUV',688,'Tuvalu','Oceanía',NULL,NULL,NULL),(800,'UG','UGA',256,'Uganda','África',NULL,'UGX','Chelín ugandés'),(804,'UA','UKR',380,'Ucrania','Europa',NULL,'UAH','Grivna ucraniana'),(807,'MK','MKD',389,'Macedonia','Europa',NULL,'MKD','Denar macedonio'),(818,'EG','EGY',20,'Egipto','África',NULL,'EGP','Libra egipcia'),(826,'GB','GBR',44,'Reino Unido','Europa',NULL,'GBP','Libra esterlina (libra de Gran Bretaña)'),(834,'TZ','TZA',255,'Tanzania','África',NULL,'TZS','Chelín tanzano'),(840,'US','USA',1,'Estados Unidos','América','América del Norte','USD','Dólar estadounidense'),(850,'VI','VIR',1340,'Islas Vírgenes de los Estados Unidos','América','El Caribe',NULL,NULL),(854,'BF','BFA',226,'Burkina Faso','África',NULL,NULL,NULL),(858,'UY','URY',598,'Uruguay','América','América del Sur','UYU','Peso uruguayo'),(860,'UZ','UZB',998,'Uzbekistán','Asia',NULL,'UZS','Som uzbeko'),(862,'VE','VEN',58,'Venezuela','América','América del Sur','VEB','Bolívar venezolano'),(876,'WF','WLF',681,'Wallis y Futuna','Oceanía',NULL,NULL,NULL),(882,'WS','WSM',685,'Samoa','Oceanía',NULL,'WST','Tala samoana'),(887,'YE','YEM',967,'Yemen','Asia',NULL,'YER','Rial yemení (de Yemen)'),(894,'ZM','ZMB',260,'Zambia','África',NULL,'ZMK','Kwacha zambiano');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglas_cupones`
--

DROP TABLE IF EXISTS `reglas_cupones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reglas_cupones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_id` int(11) NOT NULL,
  `monto` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `tipo_descuento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reglas_cupones_configuracion1_idx` (`configuracion_id`),
  CONSTRAINT `fk_reglas_cupones_configuracion1` FOREIGN KEY (`configuracion_id`) REFERENCES `configuracion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas_cupones`
--

LOCK TABLES `reglas_cupones` WRITE;
/*!40000 ALTER TABLE `reglas_cupones` DISABLE KEYS */;
INSERT INTO `reglas_cupones` VALUES (11,1,300,10,'€'),(12,2,100,50,'%'),(13,2,500,100,'%');
/*!40000 ALTER TABLE `reglas_cupones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `peticiones_especiales` text,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  `hora_prevista` varchar(45) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `moneda` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_reserva_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,'','2013-11-26 23:00:00','0000-00-00 00:00:00','',118.8,'',''),(2,2,'','2013-11-30 23:00:00','0000-00-00 00:00:00','',621.76,'',''),(3,3,'','2013-12-01 23:00:00','0000-00-00 00:00:00','',533.36,'',''),(4,4,'','2013-12-01 23:00:00','0000-00-00 00:00:00','',533.36,'',''),(5,5,'','2013-12-01 23:00:00','0000-00-00 00:00:00','',373.08,'',''),(6,7,'','2013-12-01 23:00:00','0000-00-00 00:00:00','',469.8,'','');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_pago`
--

DROP TABLE IF EXISTS `reserva_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forma_pago` varchar(45) DEFAULT NULL,
  `autorizacion` text,
  `request` text,
  `importe` double DEFAULT NULL,
  `concepto` text,
  `estado` varchar(45) DEFAULT NULL,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  `origen` varchar(45) DEFAULT NULL,
  `validada` tinyint(1) DEFAULT NULL,
  `comentario` text,
  `tipo` varchar(45) DEFAULT NULL,
  `reserva_id` int(11) NOT NULL,
  `tarjeta_tipo` varchar(45) DEFAULT NULL,
  `caducidad_mes` int(11) DEFAULT NULL,
  `caducidad_anio` int(11) DEFAULT NULL,
  `paypal` text,
  `tarjeta_numero` text,
  `cvv` text,
  `moneda_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_pago_reserva1_idx` (`reserva_id`),
  KEY `fk_reserva_pago_moneda1_idx` (`moneda_id`),
  CONSTRAINT `fk_reserva_pago_reserva1` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_pago_moneda1` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_pago`
--

LOCK TABLES `reserva_pago` WRITE;
/*!40000 ALTER TABLE `reserva_pago` DISABLE KEYS */;
INSERT INTO `reserva_pago` VALUES (1,'tarjeta','','',118.8,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',1,'MasterCard',1,2014,'','5593045978791827','123',NULL),(2,'tarjeta','','',621.76,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',2,'Visa',1,2015,'','4716767213050942','655',NULL),(3,'tarjeta','','',533.36,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',3,'Visa',1,2015,'','4485900407582227','756',NULL),(4,'tarjeta','','',533.36,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',4,'Visa',1,2015,'','4485900407582227','756',NULL),(5,'tarjeta','','',373.08,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',5,'Visa',1,2014,'','4624582300883837','5444',NULL),(6,'tarjeta','','',469.8,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',6,'MasterCard',6,2014,'','5282471792816655','123',NULL);
/*!40000 ALTER TABLE `reserva_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_producto`
--

DROP TABLE IF EXISTS `reserva_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserva_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `inicio` timestamp NULL DEFAULT NULL,
  `final` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_producto_reserva1_idx` (`reserva_id`),
  CONSTRAINT `fk_reserva_producto_reserva1` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_producto`
--

LOCK TABLES `reserva_producto` WRITE;
/*!40000 ALTER TABLE `reserva_producto` DISABLE KEYS */;
INSERT INTO `reserva_producto` VALUES (1,1,' Apartamento de 1 dormitorio (2 adultos) ','apartamento',118.8,1,'2013-12-16 23:00:00','2013-12-19 23:00:00'),(2,2,' Habitación Doble - 2 camas ','apartamento',607.36,1,'2014-01-06 23:00:00','2014-01-14 23:00:00'),(3,2,'','excursion',14.4,1,'2014-01-07 23:00:00','2014-01-07 23:00:00'),(4,3,' Habitación Doble - 2 camas ','apartamento',463.96,1,'2013-12-10 23:00:00','2013-12-17 23:00:00'),(5,3,'','excursion',14.4,1,'2013-12-11 23:00:00','2013-12-11 23:00:00'),(6,3,'','excursion',55,1,'2013-12-11 23:00:00','2013-12-11 23:00:00'),(7,3,'','excursion',0,1,'2013-12-11 23:00:00','2013-12-11 23:00:00'),(8,4,' Habitación Doble - 2 camas ','apartamento',463.96,1,'2013-12-10 23:00:00','2013-12-17 23:00:00'),(9,4,'','excursion',14.4,1,'2013-12-11 23:00:00','2013-12-11 23:00:00'),(10,4,'','excursion',55,1,'2013-12-11 23:00:00','2013-12-11 23:00:00'),(11,4,'','excursion',0,1,'2013-12-11 23:00:00','2013-12-11 23:00:00'),(12,5,' Habitación Doble - 2 camas ','apartamento',303.68,1,'2014-01-15 23:00:00','2014-01-19 23:00:00'),(13,5,'','excursion',14.4,1,'2014-01-16 23:00:00','2014-01-16 23:00:00'),(14,5,'','excursion',55,1,'2014-01-16 23:00:00','2014-01-16 23:00:00'),(15,6,' Apartamento de 1 dormitorio (2 adultos) ','apartamento',441,1,'2014-02-10 23:00:00','2014-02-20 23:00:00'),(16,6,'Transfer Aeropuerto','excursion',14.4,1,'2014-02-10 23:00:00','2014-02-10 23:00:00'),(17,6,'Transfer Aeropuerto','excursion',14.4,1,'2014-02-10 23:00:00','2014-02-10 23:00:00');
/*!40000 ALTER TABLE `reserva_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `servicio_categoria_id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`),
  KEY `fk_servicio_servicio_categoria1_idx` (`servicio_categoria_id`),
  CONSTRAINT `fk_servicio_servicio_categoria1` FOREIGN KEY (`servicio_categoria_id`) REFERENCES `servicio_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (127,'{\"es\":\"Barbacoa\",\"en-us\":\"Barbacoa\",\"de\":\"Grillm\\u00f6glichkeiten\",\"fr\":\"installations pour barbecue\",\"it\":\"barbecue\"}',9,'hotel',''),(128,'{\"es\":\"Piscina al aire libre\",\"en-us\":\"Piscina al aire libre\",\"de\":\"Au\\u00dfenpool\",\"fr\":\"piscine ext\\u00e9rieure\",\"it\":\"piscina all\'aperto\"}',9,'hotel',''),(129,'{\"es\":\"\\u00a1Gratis! Internet wi-fi (hotspot) disponible en las zonas comunes. Gratis.\",\"en-us\":\"\\u00a1Gratis! Internet wi-fi (hotspot) disponible en las zonas comunes. Gratis.\",\"de\":\"Kostenlos! WLAN Hotspot ist in den \\u00f6ffentlichen Bereichen nutzbar und ist kostenfrei.\",\"fr\":\"Gratuit\\u00a0! Un acc\\u00e8s sans fil via Hotspot est disponible dans les parties communes gratuitement.\",\"it\":\"Gratis! La connessione Internet wireless tramite hotspot gratuitamente nelle aree comuni.\"}',10,'hotel',''),(130,'{\"es\":\"\\u00a1Gratis! Hay parking gratis p\\u00fablico en el establecimiento. No es necesario reservar.\",\"en-us\":\"\\u00a1Gratis! Hay parking gratis p\\u00fablico en el establecimiento. No es necesario reservar.\",\"de\":\"Kostenlos! \\u00d6ffentliche Parkpl\\u00e4tze stehen kostenfrei an der Unterkunft (Reservierung ist nicht erforderlich) zur Verf\\u00fcgung.\",\"fr\":\"Gratuit\\u00a0! Un parking gratuit et public est disponible sur place (sans r\\u00e9servation pr\\u00e9alable).\",\"it\":\"Gratis! Parcheggio pubblico disponibile gratuitamente in loco senza prenotazione.\"}',11,'hotel',''),(131,'{\"es\":\"Habitaciones no fumadores\",\"en-us\":\"Habitaciones no fumadores\",\"de\":\"Nichtraucherzimmer\",\"fr\":\"chambres non-fumeurs\",\"it\":\"camere non fumatori\"}',12,'hotel',''),(132,'{\"es\":\"Calefacci\\u00f3n\",\"en-us\":\"Calefacci\\u00f3n\",\"de\":\"Heizung\",\"fr\":\"chauffage\",\"it\":\"riscaldamento\"}',12,'hotel',''),(133,'{\"es\":\"Prohibido fumar en todo el recinto del hotel\",\"en-us\":\"Prohibido fumar en todo el recinto del hotel\",\"de\":\"Nichtraucherunterkunft (Alle \\u00f6ffentlichen und privaten Bereiche sind Nichtraucherzonen)\",\"fr\":\"Toutes les parties communes et priv\\u00e9es sont non-fumeurs\",\"it\":\"struttura interamente non fumatori\"}',12,'hotel',''),(134,'{\"es\":\"Aire acondicionado\",\"en-us\":\"Aire acondicionado\",\"de\":\"Klimaanlage\",\"fr\":\"climatisation\",\"it\":\"aria condizionata\"}',12,'hotel',''),(167,'{\"es\":\"Jard\\u00edn\",\"en\":\"Garden\",\"de\":\"Garten\",\"fr\":\"jardin\",\"it\":\"giardino\",\"zh\":\"\\u82b1\\u56ed\",\"ru\":\"\\u0421\\u0430\\u0434\"}',17,'hotel',''),(168,'{\"es\":\"Terraza\",\"en\":\"Terrace\",\"de\":\"Terrasse oder Innenhof\",\"fr\":\"terrasse\",\"it\":\"terrazza\",\"zh\":\"\\u9732\\u53f0\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430\"}',17,'hotel',''),(169,'{\"es\":\"Terraza \\/ sol\\u00e1rium\",\"en\":\"Sun terrace\",\"de\":\"Sonnenterrasse\",\"fr\":\"terrasse bien expos\\u00e9e\",\"it\":\"terrazza solarium\",\"zh\":\"\\u9633\\u5149\\u9732\\u53f0\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430 \\u0434\\u043b\\u044f \\u0437\\u0430\\u0433\\u0430\\u0440\\u0430\"}',17,'hotel',''),(170,'{\"es\":\"Barbacoa\",\"en\":\"BBQ facilities\",\"de\":\"Grillm\\u00f6glichkeiten\",\"fr\":\"installations pour barbecue\",\"it\":\"barbecue\",\"zh\":\"\\u70e7\\u70e4\\u8bbe\\u65bd\",\"ru\":\"\\u0411\\u0430\\u0440\\u0431\\u0435\\u043a\\u044e\"}',17,'hotel',''),(171,'{\"es\":\"Campo de golf (a menos de 3 km)\",\"en\":\"Golf course (within 3 km)\",\"de\":\"Golfplatz (max. 3 km entfernt)\",\"fr\":\"parcours de golf (\\u00e0 moins de 3 km)\",\"it\":\"campo da golf (nel raggio di 3 km)\",\"zh\":\"\\u9ad8\\u5c14\\u592b\\u7403\\u573a\\uff083\\u516c\\u91cc\\u5185\\uff09\",\"ru\":\"\\u041f\\u043e\\u043b\\u0435 \\u0434\\u043b\\u044f \\u0433\\u043e\\u043b\\u044c\\u0444\\u0430 (\\u0432 \\u043f\\u0440\\u0435\\u0434\\u0435\\u043b\\u0430\\u0445 3 \\u043a\\u043c)\"}',18,'hotel',''),(172,'{\"es\":\"\\u00a1Gratis! Hay conexi\\u00f3n a internet Wi-Fi disponible en todo el establecimiento. Gratis.\",\"en\":\"Free! WiFi is available in all areas and is free of charge.\",\"de\":\"Kostenlos! WLAN ist in allen Bereichen nutzbar und ist kostenfrei.\",\"fr\":\"Gratuit\\u00a0! Une connexion Wi-Fi est disponible dans tout l\'\\u00e9tablissement gratuitement.\",\"it\":\"Gratis! Internet Wi-Fi disponibile gratuitamente in tutta la struttura.\",\"zh\":\"\\u514d\\u8d39\\uff01 \\u9152\\u5e97\\u5728\\u5404\\u5904\\u63d0\\u4f9b\\u65e0\\u7ebf\\u7f51\\u7edc\\u8fde\\u63a5 \\uff0c\\u4e0d\\u6536\\u8d39\\u3002\",\"ru\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e! Wi-Fi \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u0432\\u0441\\u0435\\u0433\\u043e \\u043e\\u0442\\u0435\\u043b\\u044f \\u0431\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e.\"}',19,'hotel',''),(173,'{\"es\":\"\\u00a1Gratis! Hay parking gratis privado en el establecimiento. No se puede reservar.\",\"en\":\"Free! Free private parking is possible on site (reservation is not possible).\",\"de\":\"Kostenlos! Private Parkpl\\u00e4tze stehen kostenfrei an der Unterkunft (Reservierung ist nicht m\\u00f6glich) zur Verf\\u00fcgung.\",\"fr\":\"Gratuit\\u00a0! Un parking gratuit et priv\\u00e9 est disponible sur place (sans possibilit\\u00e9 de r\\u00e9server).\",\"it\":\"Gratis! Parcheggio privato disponibile gratuitamente in loco e non prenotabile.\",\"zh\":\"\\u514d\\u8d39\\uff01 \\u9152\\u5e97 \\uff08\\u4e0d\\u53ef\\u9884\\u8ba2\\uff09\\u53ef\\u63d0\\u4f9b\\u79c1\\u4eba\\u505c\\u8f66\\u8bbe\\u65bd\\uff0c\\u514d\\u8d39\\u3002\",\"ru\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e! \\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0427\\u0430\\u0441\\u0442\\u043d\\u0430\\u044f \\u043f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430 \\u043d\\u0430 \\u043c\\u0435\\u0441\\u0442\\u0435 (\\u043f\\u0440\\u0435\\u0434\\u0432\\u0430\\u0440\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437 \\u043d\\u0435\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u0435\\u043d) .\"}',20,'hotel',''),(174,'{\"es\":\"Caja fuerte\",\"en\":\"Safety deposit box\",\"de\":\"Safe\",\"fr\":\"coffre-fort\",\"it\":\"cassaforte\",\"zh\":\"\\u4fdd\\u9669\\u7bb1\",\"ru\":\"\\u0421\\u0435\\u0439\\u0444\"}',21,'hotel',''),(175,'{\"es\":\"Jard\\u00edn\",\"en\":\"Garden\",\"de\":\"Garten\",\"fr\":\"jardin\",\"it\":\"giardino\",\"zh\":\"\\u82b1\\u56ed\",\"ru\":\"\\u0421\\u0430\\u0434\",\"ja\":\"\\u5ead\",\"pt\":\"Jardim\"}',22,'hotel',''),(176,'{\"es\":\"Terraza\",\"en\":\"Terrace\",\"de\":\"Terrasse oder Innenhof\",\"fr\":\"terrasse\",\"it\":\"terrazza\",\"zh\":\"\\u9732\\u53f0\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430\",\"ja\":\"\\u30c6\\u30e9\\u30b9\",\"pt\":\"Terra\\u00e7o\"}',22,'hotel',''),(177,'{\"es\":\"Terraza \\/ sol\\u00e1rium\",\"en\":\"Sun terrace\",\"de\":\"Sonnenterrasse\",\"fr\":\"terrasse bien expos\\u00e9e\",\"it\":\"terrazza solarium\",\"zh\":\"\\u9633\\u5149\\u9732\\u53f0\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430 \\u0434\\u043b\\u044f \\u0437\\u0430\\u0433\\u0430\\u0440\\u0430\",\"ja\":\"\\u30b5\\u30f3\\u30c6\\u30e9\\u30b9\",\"pt\":\"Terra\\u00e7o\"}',22,'hotel',''),(178,'{\"es\":\"Barbacoa\",\"en\":\"BBQ facilities\",\"de\":\"Grillm\\u00f6glichkeiten\",\"fr\":\"installations pour barbecue\",\"it\":\"barbecue\",\"zh\":\"\\u70e7\\u70e4\\u8bbe\\u65bd\",\"ru\":\"\\u0411\\u0430\\u0440\\u0431\\u0435\\u043a\\u044e\",\"ja\":\"\\u30d0\\u30fc\\u30d9\\u30ad\\u30e5\\u30fc\\u8a2d\\u5099\",\"pt\":\"Churrasqueira\"}',22,'hotel',''),(179,'{\"es\":\"Campo de golf (a menos de 3 km)\",\"en\":\"Golf course (within 3 km)\",\"de\":\"Golfplatz (max. 3 km entfernt)\",\"fr\":\"parcours de golf (\\u00e0 moins de 3 km)\",\"it\":\"campo da golf (nel raggio di 3 km)\",\"zh\":\"\\u9ad8\\u5c14\\u592b\\u7403\\u573a\\uff083\\u516c\\u91cc\\u5185\\uff09\",\"ru\":\"\\u041f\\u043e\\u043b\\u0435 \\u0434\\u043b\\u044f \\u0433\\u043e\\u043b\\u044c\\u0444\\u0430 (\\u0432 \\u043f\\u0440\\u0435\\u0434\\u0435\\u043b\\u0430\\u0445 3 \\u043a\\u043c)\",\"ja\":\"\\u30b4\\u30eb\\u30d5\\u30b3\\u30fc\\u30b9\\uff083km\\u570f\\u5185\\uff09\",\"pt\":\"Campo de golfe (num raio de 3 km)\"}',23,'hotel',''),(180,'{\"es\":\"\\u00a1Gratis! Hay conexi\\u00f3n a internet Wi-Fi disponible en todo el establecimiento. Gratis.\",\"en\":\"Free! WiFi is available in all areas and is free of charge.\",\"de\":\"Kostenlos! WLAN ist in allen Bereichen nutzbar und ist kostenfrei.\",\"fr\":\"Gratuit\\u00a0! Une connexion Wi-Fi est disponible dans tout l\'\\u00e9tablissement gratuitement.\",\"it\":\"Gratis! Internet Wi-Fi disponibile gratuitamente in tutta la struttura.\",\"zh\":\"\\u514d\\u8d39\\uff01 \\u9152\\u5e97\\u5728\\u5404\\u5904\\u63d0\\u4f9b\\u65e0\\u7ebf\\u7f51\\u7edc\\u8fde\\u63a5 \\uff0c\\u4e0d\\u6536\\u8d39\\u3002\",\"ru\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e! Wi-Fi \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u0432\\u0441\\u0435\\u0433\\u043e \\u043e\\u0442\\u0435\\u043b\\u044f \\u0431\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e.\",\"ja\":\"\\u7121\\u6599\\uff01 \\u30db\\u30c6\\u30eb\\u5168\\u57df\\u306b\\u3066Wi-Fi\\uff08\\u7121\\u7ddaLAN\\uff09\\u5229\\u7528\\u53ef\\uff1a\\u7121\\u6599\",\"pt\":\"Gr\\u00e1tis! Acesso Wi-Fi dispon\\u00edvel em todo o hotel\"}',24,'hotel',''),(181,'{\"es\":\"\\u00a1Gratis! Hay parking gratis privado en el establecimiento. No se puede reservar.\",\"en\":\"Free! Free private parking is possible on site (reservation is not possible).\",\"de\":\"Kostenlos! Private Parkpl\\u00e4tze stehen kostenfrei an der Unterkunft (Reservierung ist nicht m\\u00f6glich) zur Verf\\u00fcgung.\",\"fr\":\"Gratuit\\u00a0! Un parking gratuit et priv\\u00e9 est disponible sur place (sans possibilit\\u00e9 de r\\u00e9server).\",\"it\":\"Gratis! Parcheggio privato disponibile gratuitamente in loco e non prenotabile.\",\"zh\":\"\\u514d\\u8d39\\uff01 \\u9152\\u5e97 \\uff08\\u4e0d\\u53ef\\u9884\\u8ba2\\uff09\\u53ef\\u63d0\\u4f9b\\u79c1\\u4eba\\u505c\\u8f66\\u8bbe\\u65bd\\uff0c\\u514d\\u8d39\\u3002\",\"ru\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e! \\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0427\\u0430\\u0441\\u0442\\u043d\\u0430\\u044f \\u043f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430 \\u043d\\u0430 \\u043c\\u0435\\u0441\\u0442\\u0435 (\\u043f\\u0440\\u0435\\u0434\\u0432\\u0430\\u0440\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437 \\u043d\\u0435\\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u0435\\u043d) .\",\"ja\":\"\\u7121\\u6599\\uff01 \\u6577\\u5730\\u5185\\u306b\\u4e8b\\u524d\\u4e88\\u7d04\\u4e0d\\u53ef\\u306e\\u5c02\\u7528\\u30d1\\u30fc\\u30ad\\u30f3\\u30b0\\u3042\\u308a\\uff1a\\u7121\\u6599\",\"pt\":\"Gr\\u00e1tis! Estacionamento gratuito e privativo dispon\\u00edvel no local (sem possibilidade de reserva).\"}',25,'hotel',''),(182,'{\"es\":\"Caja fuerte\",\"en\":\"Safety deposit box\",\"de\":\"Safe\",\"fr\":\"coffre-fort\",\"it\":\"cassaforte\",\"zh\":\"\\u4fdd\\u9669\\u7bb1\",\"ru\":\"\\u0421\\u0435\\u0439\\u0444\",\"ja\":\"\\u30bb\\u30fc\\u30d5\\u30c6\\u30a3\\u30dc\\u30c3\\u30af\\u30b9\",\"pt\":\"Cofre\"}',26,'hotel',''),(183,'{\"pt\":\"gratuitamente.\"}',27,'hotel',''),(518,'{\"es\":\"Jard\\u00edn\",\"en\":\"Garden\",\"de\":\"Garten\",\"fr\":\"jardin\",\"it\":\"giardino\",\"ru\":\"\\u0421\\u0430\\u0434\",\"cs\":\"Zahrada\",\"pt\":\"Jardim\"}',36,'hotel',''),(519,'{\"es\":\"Terraza\",\"en\":\"Terrace\",\"de\":\"Terrasse oder Innenhof\",\"fr\":\"terrasse\",\"it\":\"terrazza\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430\",\"cs\":\"Terasa\",\"pt\":\"Terra\\u00e7o\"}',36,'hotel',''),(520,'{\"es\":\"Terraza \\/ sol\\u00e1rium\",\"en\":\"Sun terrace\",\"de\":\"Sonnenterrasse\",\"fr\":\"terrasse bien expos\\u00e9e\",\"it\":\"terrazza solarium\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430 \\u0434\\u043b\\u044f \\u0437\\u0430\\u0433\\u0430\\u0440\\u0430\",\"cs\":\"Slune\\u010dn\\u00ed terasa\",\"pt\":\"Terra\\u00e7o\"}',36,'hotel',''),(521,'{\"es\":\"Piscina al aire libre (todo el a\\u00f1o)\",\"en\":\"Outdoor pool (all year)\",\"de\":\"Au\\u00dfenpool (ganzj\\u00e4hrig)\",\"fr\":\"piscine ext\\u00e9rieure (toute l\'ann\\u00e9e)\",\"it\":\"piscina all\'aperto (tutto l\'anno)\",\"ru\":\"\\u041e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439 \\u0431\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d (\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u0442 \\u043a\\u0440\\u0443\\u0433\\u043b\\u044b\\u0439 \\u0433\\u043e\\u0434)\",\"cs\":\"Venkovn\\u00ed baz\\u00e9n (po cel\\u00fd rok)\",\"pt\":\"Piscina (o ano inteiro)\"}',36,'hotel',''),(522,'{\"es\":\"Sauna\",\"en\":\"Sauna\",\"de\":\"Sauna\",\"fr\":\"sauna\",\"it\":\"sauna\",\"ru\":\"\\u0421\\u0430\\u0443\\u043d\\u0430\",\"cs\":\"Sauna\",\"pt\":\"Sauna\"}',37,'hotel',''),(523,'{\"es\":\"Gimnasio\",\"en\":\"Fitness centre\",\"de\":\"Fitnesscenter\",\"fr\":\"centre de remise en forme\",\"it\":\"palestra\",\"ru\":\"\\u0424\\u0438\\u0442\\u043d\\u0435\\u0441-\\u0446\\u0435\\u043d\\u0442\\u0440\",\"cs\":\"Fitness centrum\",\"pt\":\"Academia\"}',37,'hotel',''),(524,'{\"es\":\"Billar\",\"en\":\"Billiards\",\"de\":\"Billard\",\"fr\":\"billard\",\"it\":\"biliardo\",\"ru\":\"\\u0411\\u0438\\u043b\\u044c\\u044f\\u0440\\u0434\",\"cs\":\"Kule\\u010dn\\u00edk\",\"pt\":\"Bilhar\"}',37,'hotel',''),(525,'{\"es\":\"Ping pong\",\"en\":\"Table tennis\",\"de\":\"Tischtennis\",\"fr\":\"tennis de table\",\"it\":\"ping-pong\",\"ru\":\"\\u041d\\u0430\\u0441\\u0442\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043d\\u043d\\u0438\\u0441\",\"cs\":\"Stoln\\u00ed tenis\",\"pt\":\"T\\u00eanis de mesa\"}',37,'hotel',''),(526,'{\"es\":\"Karaoke\",\"en\":\"Karaoke\",\"de\":\"Karaoke\",\"fr\":\"karaok\\u00e9\",\"it\":\"karaoke\",\"ru\":\"\\u041a\\u0430\\u0440\\u0430\\u043e\\u043a\\u0435\",\"cs\":\"Karaoke\",\"pt\":\"Karaok\\u00ea\"}',37,'hotel',''),(527,'{\"es\":\"Dardos\",\"en\":\"Darts\",\"de\":\"Dart\",\"fr\":\"fl\\u00e9chettes\",\"it\":\"freccette\",\"ru\":\"\\u0414\\u0430\\u0440\\u0442\\u0441\",\"cs\":\"\\u0160ipky\",\"pt\":\"Jogo de dardos\"}',37,'hotel',''),(528,'{\"es\":\"Ba\\u00f1era de hidromasaje\",\"en\":\"Hot tub\",\"de\":\"Whirlpool\",\"fr\":\"bain \\u00e0 remous\",\"it\":\"vasca idromassaggio\",\"ru\":\"\\u0413\\u0438\\u0434\\u0440\\u043e\\u043c\\u0430\\u0441\\u0441\\u0430\\u0436\\u043d\\u0430\\u044f \\u0432\\u0430\\u043d\\u043d\\u0430\",\"cs\":\"V\\u00ed\\u0159ivka\",\"pt\":\"Banheira de hidromassagem\"}',37,'hotel',''),(529,'{\"es\":\"Squash\",\"en\":\"Squash\",\"de\":\"Squash\",\"fr\":\"squash\",\"it\":\"squash\",\"ru\":\"\\u0421\\u043a\\u0432\\u043e\\u0448\",\"cs\":\"Squash\",\"pt\":\"Squash\"}',37,'hotel',''),(530,'{\"es\":\"Alquiler de bicicletas\",\"en\":\"Bicycle rental\",\"de\":\"Fahrradverleih\",\"fr\":\"location de v\\u00e9los\",\"it\":\"noleggio biciclette\",\"ru\":\"\\u041f\\u0440\\u043e\\u043a\\u0430\\u0442 \\u0432\\u0435\\u043b\\u043e\\u0441\\u0438\\u043f\\u0435\\u0434\\u043e\\u0432\",\"cs\":\"Pron\\u00e1jem kol\",\"pt\":\"Aluguel de bicicletas\"}',37,'hotel',''),(531,'{\"es\":\"Personal de animaci\\u00f3n\",\"en\":\"Entertainment staff\",\"de\":\"Entertainment-Team\",\"fr\":\"\\u00e9quipe d\'animation\",\"it\":\"staff di animazione\",\"ru\":\"\\u0410\\u043d\\u0438\\u043c\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u044b\\u0439 \\u043f\\u0435\\u0440\\u0441\\u043e\\u043d\\u0430\\u043b\",\"cs\":\"Anima\\u010dn\\u00ed t\\u00fdm\",\"pt\":\"Equipe de entretenimento\"}',37,'hotel',''),(532,'{\"es\":\"Restaurante\",\"en\":\"Restaurant\",\"de\":\"Restaurant\",\"fr\":\"restaurant\",\"it\":\"ristorante\",\"ru\":\"\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\",\"cs\":\"Restaurace\",\"pt\":\"Restaurante\"}',38,'hotel',''),(533,'{\"es\":\"Bar\",\"en\":\"Bar\",\"de\":\"Bar\",\"fr\":\"bar\",\"it\":\"bar\",\"ru\":\"\\u0411\\u0430\\u0440\",\"cs\":\"Bar\",\"pt\":\"Bar\"}',38,'hotel',''),(534,'{\"es\":\"Snack-bar\",\"en\":\"Snack bar\",\"de\":\"Snackbar\",\"fr\":\"snack-bar\",\"it\":\"snack bar\",\"ru\":\"\\u0421\\u043d\\u044d\\u043a-\\u0431\\u0430\\u0440\",\"cs\":\"Snack bar\",\"pt\":\"Lanchonete\"}',38,'hotel',''),(535,'{\"es\":\"Internet wi-fi (hotspot) disponible en las zonas comunes. Precio: 4 EUR por hora .\",\"en\":\"Wireless Internet Hotspot is available in public areas and costs EUR 4 per hour.\",\"de\":\"WLAN Hotspot ist in den \\u00f6ffentlichen Bereichen nutzbar und kostet EUR 4 pro Stunde.\",\"fr\":\"Un acc\\u00e8s sans fil via Hotspot est disponible dans les parties communes au tarif de 4 EUR par heure.\",\"it\":\"La connessione Internet wireless tramite hotspot al costo di 4 EUR ogni ora nelle aree comuni.\",\"ru\":\"\\u0422\\u043e\\u0447\\u043a\\u0430 \\u0431\\u0435\\u0441\\u043f\\u0440\\u043e\\u0432\\u043e\\u0434\\u043d\\u043e\\u0433\\u043e \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u0430 \\u0432 \\u0418\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442 \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u0432 \\u043e\\u0431\\u0449\\u0435\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u044b\\u0445 \\u0437\\u043e\\u043d\\u0430\\u0445 \\u043f\\u043e \\u0446\\u0435\\u043d\\u0435 EUR 4 \\u0432 \\u0447\\u0430\\u0441.\",\"cs\":\"Bezdr\\u00e1tov\\u00e9 internetov\\u00e9 p\\u0159ipojen\\u00ed Hotspot je dostupn\\u00e9 ve spole\\u010dn\\u00fdch prostor\\u00e1ch za 4 EUR na hodinu.\",\"pt\":\"Wireless Internet Hotspot dispon\\u00edvel nas \\u00e1reas p\\u00fablicas\"}',39,'hotel',''),(536,'{\"es\":\"\\u00a1Gratis! Hay parking gratis p\\u00fablico en las inmediaciones. No es necesario reservar.\",\"en\":\"Free! Free public parking is possible at a location nearby (reservation is not needed).\",\"de\":\"Kostenlos! \\u00d6ffentliche Parkpl\\u00e4tze stehen kostenfrei in der N\\u00e4he (Reservierung ist nicht erforderlich) zur Verf\\u00fcgung.\",\"fr\":\"Gratuit\\u00a0! Un parking gratuit et public est disponible \\u00e0 proximit\\u00e9 (sans r\\u00e9servation pr\\u00e9alable).\",\"it\":\"Gratis! Parcheggio pubblico disponibile gratuitamente in zona senza prenotazione.\",\"ru\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e! \\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u041e\\u0431\\u0449\\u0435\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0430\\u044f \\u043f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430 \\u043d\\u0430 \\u043f\\u0440\\u0438\\u043b\\u0435\\u0433\\u0430\\u044e\\u0449\\u0435\\u0439 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 (\\u043f\\u0440\\u0435\\u0434\\u0432\\u0430\\u0440\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437 \\u043d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442\\u0441\\u044f) .\",\"cs\":\"Zdarma! Ve\\u0159ejn\\u00e9 parkov\\u00e1n\\u00ed je mo\\u017en\\u00e9 zdarma na p\\u0159ilehl\\u00e9m m\\u00edst\\u011b (rezervace nen\\u00ed nutn\\u00e1).\",\"pt\":\"Gr\\u00e1tis! Estacionamento gratuito e p\\u00fablico dispon\\u00edvel em localiza\\u00e7\\u00e3o pr\\u00f3xima (n\\u00e3o necessita de reserva).\"}',40,'hotel',''),(537,'{\"es\":\"Recepci\\u00f3n 24 horas\",\"en\":\"24-hour front desk\",\"de\":\"24-Stunden-Rezeption\",\"fr\":\"r\\u00e9ception ouverte 24h\\/24\",\"it\":\"reception 24 ore su 24\",\"ru\":\"\\u041a\\u0440\\u0443\\u0433\\u043b\\u043e\\u0441\\u0443\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0442\\u043e\\u0439\\u043a\\u0430 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438\",\"cs\":\"Recepce 24 hodin denn\\u011b\",\"pt\":\"Recep\\u00e7\\u00e3o 24 horas\"}',41,'hotel',''),(538,'{\"es\":\"Registro de entrada y salida expr\\u00e9s\",\"en\":\"Express check-in\\/check-out\",\"de\":\"Express-Check-in\\/-out\",\"fr\":\"enregistrement et r\\u00e8glement rapides\",\"it\":\"check-in e check-out express\",\"ru\":\"\\u0423\\u0441\\u043a\\u043e\\u0440\\u0435\\u043d\\u043d\\u0430\\u044f \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u044f \\u0437\\u0430\\u0435\\u0437\\u0434\\u0430\\/\\u043e\\u0442\\u044a\\u0435\\u0437\\u0434\\u0430\",\"cs\":\"Expresn\\u00ed p\\u0159ihl\\u00e1\\u0161en\\u00ed\\/odhl\\u00e1\\u0161en\\u00ed\",\"pt\":\"Check-in \\/ Check-out expressos\"}',41,'hotel',''),(539,'{\"es\":\"Servicio de lavander\\u00eda\",\"en\":\"Laundry\",\"de\":\"Waschsalon\\/W\\u00e4scheservice\",\"fr\":\"blanchisserie\",\"it\":\"servizio lavanderia\",\"ru\":\"\\u041f\\u0440\\u0430\\u0447\\u0435\\u0447\\u043d\\u0430\\u044f\",\"cs\":\"Slu\\u017eba pran\\u00ed\",\"pt\":\"Lavanderia\"}',41,'hotel',''),(540,'{\"es\":\"Cambio de moneda\",\"en\":\"Currency exchange\",\"de\":\"W\\u00e4hrungsumtausch\",\"fr\":\"service de change\",\"it\":\"cambio valuta\",\"ru\":\"\\u041e\\u0431\\u043c\\u0435\\u043d \\u0432\\u0430\\u043b\\u044e\\u0442\\u044b\",\"cs\":\"Sm\\u011bn\\u00e1rna\",\"pt\":\"C\\u00e2mbio de moedas\"}',41,'hotel',''),(541,'{\"es\":\"Alquiler de coches\",\"en\":\"Car hire\",\"de\":\"Autovermietung\",\"fr\":\"location de voitures\",\"it\":\"autonoleggio\",\"ru\":\"\\u041f\\u0440\\u043e\\u043a\\u0430\\u0442 \\u0430\\u0432\\u0442\\u043e\\u043c\\u043e\\u0431\\u0438\\u043b\\u0435\\u0439\",\"cs\":\"Pron\\u00e1jem aut\",\"pt\":\"Aluguel de carros\"}',41,'hotel',''),(542,'{\"es\":\"Informaci\\u00f3n tur\\u00edstica\",\"en\":\"Tour desk\",\"de\":\"Informationsschalter f\\u00fcr Ausfl\\u00fcge\",\"fr\":\"bureau d\'excursions\",\"it\":\"banco escursioni\",\"ru\":\"\\u042d\\u043a\\u0441\\u043a\\u0443\\u0440\\u0441\\u0438\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0431\\u044e\\u0440\\u043e\",\"cs\":\"Turistick\\u00e9 informace\",\"pt\":\"Balc\\u00e3o de turismo\"}',41,'hotel',''),(543,'{\"es\":\"Fax \\/ fotocopiadora\",\"en\":\"Fax\\/photocopying\",\"de\":\"Fax- u. Fotokopiereinrichtungen\",\"fr\":\"fax\\/photocopies\",\"it\":\"fax\\/fotocopiatrice\",\"ru\":\"\\u0424\\u0430\\u043a\\u0441\\/\\u041a\\u0441\\u0435\\u0440\\u043e\\u043a\\u043e\\u043f\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\",\"cs\":\"Fax\\/Kop\\u00edrka\",\"pt\":\"Fax \\/ Fotoc\\u00f3pia\"}',41,'hotel',''),(544,'{\"es\":\"M\\u00e1quina expendedora (bebidas)\",\"en\":\"Vending machine (drinks)\",\"de\":\"Getr\\u00e4nkeautomat\",\"fr\":\"distributeur automatique (boissons)\",\"it\":\"distributore automatico di bevande\",\"ru\":\"\\u0422\\u043e\\u0440\\u0433\\u043e\\u0432\\u044b\\u0439 \\u0430\\u0432\\u0442\\u043e\\u043c\\u0430\\u0442 (\\u043d\\u0430\\u043f\\u0438\\u0442\\u043a\\u0438)\",\"cs\":\"Automat (n\\u00e1poje)\",\"pt\":\"M\\u00e1quina de venda autom\\u00e1tica (bebidas)\"}',41,'hotel',''),(545,'{\"es\":\"M\\u00e1quina expendedora (aperitivos)\",\"en\":\"Vending machine (snacks)\",\"de\":\"Snackautomat\",\"fr\":\"distributeur automatique (collations)\",\"it\":\"distributore automatico di snack\",\"ru\":\"\\u0422\\u043e\\u0440\\u0433\\u043e\\u0432\\u044b\\u0439 \\u0430\\u0432\\u0442\\u043e\\u043c\\u0430\\u0442 (\\u0437\\u0430\\u043a\\u0443\\u0441\\u043a\\u0438)\",\"cs\":\"Automat (ob\\u010derstven\\u00ed)\",\"pt\":\"M\\u00e1quina de venda autom\\u00e1tica (lanches)\"}',41,'hotel',''),(546,'{\"es\":\"Habitaciones no fumadores\",\"en\":\"Non-smoking rooms\",\"de\":\"Nichtraucherzimmer\",\"fr\":\"chambres non-fumeurs\",\"it\":\"camere non fumatori\",\"ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440\\u0430 \\u0434\\u043b\\u044f \\u043d\\u0435\\u043a\\u0443\\u0440\\u044f\\u0449\\u0438\\u0445\",\"cs\":\"Neku\\u0159\\u00e1ck\\u00e9 pokoje\",\"pt\":\"Quartos n\\u00e3o-fumantes\"}',42,'hotel',''),(547,'{\"es\":\"Adaptado personas de movilidad reducida\",\"en\":\"Facilities for disabled guests\",\"de\":\"Behindertenfreundlich\",\"fr\":\"accessible aux personnes \\u00e0 mobilit\\u00e9 r\\u00e9duite\",\"it\":\"camere\\/strutture per ospiti disabili\",\"ru\":\"\\u041d\\u043e\\u043c\\u0435\\u0440\\u0430\\/\\u0423\\u0434\\u043e\\u0431\\u0441\\u0442\\u0432\\u0430 \\u0434\\u043b\\u044f \\u0433\\u043e\\u0441\\u0442\\u0435\\u0439 \\u0441 \\u043e\\u0433\\u0440\\u0430\\u043d\\u0438\\u0447\\u0435\\u043d\\u043d\\u044b\\u043c\\u0438 \\u0444\\u0438\\u0437\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u043c\\u0438 \\u0432\\u043e\\u0437\\u043c\\u043e\\u0436\\u043d\\u043e\\u0441\\u0442\\u044f\\u043c\\u0438\",\"cs\":\"Bezbari\\u00e9rov\\u00e9\",\"pt\":\"Comodidades para h\\u00f3spedes com mobilidade reduzida\"}',42,'hotel',''),(548,'{\"es\":\"Habitaciones familiares\",\"en\":\"Family rooms\",\"de\":\"Familienzimmer\",\"fr\":\"chambres familiales\",\"it\":\"disponibilit\\u00e0 di camere familiari\",\"ru\":\"\\u0421\\u0435\\u043c\\u0435\\u0439\\u043d\\u044b\\u0435 \\u043d\\u043e\\u043c\\u0435\\u0440\\u0430\",\"cs\":\"Rodinn\\u00e9 pokoje\",\"pt\":\"Quartos para fam\\u00edlias\"}',42,'hotel',''),(549,'{\"es\":\"Caja fuerte\",\"en\":\"Safety deposit box\",\"de\":\"Safe\",\"fr\":\"coffre-fort\",\"it\":\"cassaforte\",\"ru\":\"\\u0421\\u0435\\u0439\\u0444\",\"cs\":\"Trezor\",\"pt\":\"Cofre\"}',42,'hotel',''),(550,'{\"es\":\"Aire acondicionado\",\"en\":\"Air conditioning\",\"de\":\"Klimaanlage\",\"fr\":\"climatisation\",\"it\":\"aria condizionata\",\"ru\":\"\\u041a\\u043e\\u043d\\u0434\\u0438\\u0446\\u0438\\u043e\\u043d\\u0435\\u0440\",\"cs\":\"Klimatizace\",\"pt\":\"Ar-condicionado\"}',42,'hotel',''),(551,'{\"es\":\"italiano\",\"en\":\"Italian\",\"de\":\"Italienisch\",\"fr\":\"italien\",\"it\":\"italiano\",\"ru\":\"\\u043d\\u0430 \\u0438\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u043e\\u043c\",\"cs\":\"v ital\\u0161tin\\u011b\",\"pt\":\"Italiano\"}',43,'hotel',''),(552,'{\"es\":\"franc\\u00e9s\",\"en\":\"French\",\"de\":\"Franz\\u00f6sisch\",\"fr\":\"fran\\u00e7ais\",\"it\":\"francese\",\"ru\":\"\\u043d\\u0430 \\u0444\\u0440\\u0430\\u043d\\u0446\\u0443\\u0437\\u0441\\u043a\\u043e\\u043c\",\"cs\":\"ve francouz\\u0161tin\\u011b\",\"pt\":\"Franc\\u00eas\"}',43,'hotel',''),(553,'{\"es\":\"espa\\u00f1ol\",\"en\":\"Spanish\",\"de\":\"Spanisch\",\"fr\":\"espagnol\",\"it\":\"spagnolo\",\"ru\":\"\\u043d\\u0430 \\u0438\\u0441\\u043f\\u0430\\u043d\\u0441\\u043a\\u043e\\u043c\",\"cs\":\"ve \\u0161pan\\u011bl\\u0161tin\\u011b\",\"pt\":\"Espanhol\"}',43,'hotel',''),(554,'{\"es\":\"ingl\\u00e9s\",\"en\":\"English\",\"de\":\"Englisch\",\"fr\":\"anglais\",\"it\":\"inglese\",\"ru\":\"\\u043d\\u0430 \\u0430\\u043d\\u0433\\u043b\\u0438\\u0439\\u0441\\u043a\\u043e\\u043c\",\"cs\":\"v angli\\u010dtin\\u011b\",\"pt\":\"Ingl\\u00eas\"}',43,'hotel',''),(555,'{\"es\":\"alem\\u00e1n\",\"en\":\"German\",\"de\":\"Deutsch\",\"fr\":\"allemand\",\"it\":\"tedesco\",\"ru\":\"\\u043d\\u0430 \\u043d\\u0435\\u043c\\u0435\\u0446\\u043a\\u043e\\u043c\",\"cs\":\"v n\\u011bm\\u010din\\u011b\",\"pt\":\"Alem\\u00e3o\"}',43,'hotel',''),(556,'{\"pt\":\"a um custo de EUR 4 por hora.\"}',27,'hotel',''),(591,'{\"es\":\"Jard\\u00edn\",\"en\":\"Garden\",\"de\":\"Garten\",\"fr\":\"jardin\",\"it\":\"giardino\",\"ru\":\"\\u0421\\u0430\\u0434\",\"pt\":\"Jardim\"}',68,'hotel',''),(592,'{\"es\":\"Terraza\",\"en\":\"Terrace\",\"de\":\"Terrasse oder Innenhof\",\"fr\":\"terrasse\",\"it\":\"terrazza\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430\",\"pt\":\"Terra\\u00e7o\"}',68,'hotel',''),(593,'{\"es\":\"Terraza \\/ sol\\u00e1rium\",\"en\":\"Sun terrace\",\"de\":\"Sonnenterrasse\",\"fr\":\"terrasse bien expos\\u00e9e\",\"it\":\"terrazza solarium\",\"ru\":\"\\u0422\\u0435\\u0440\\u0440\\u0430\\u0441\\u0430 \\u0434\\u043b\\u044f \\u0437\\u0430\\u0433\\u0430\\u0440\\u0430\",\"pt\":\"Terra\\u00e7o\"}',68,'hotel',''),(594,'{\"es\":\"Piscina al aire libre (todo el a\\u00f1o)\",\"en\":\"Outdoor pool (all year)\",\"de\":\"Au\\u00dfenpool (ganzj\\u00e4hrig)\",\"fr\":\"piscine ext\\u00e9rieure (toute l\'ann\\u00e9e)\",\"it\":\"piscina all\'aperto (tutto l\'anno)\",\"ru\":\"\\u041e\\u0442\\u043a\\u0440\\u044b\\u0442\\u044b\\u0439 \\u0431\\u0430\\u0441\\u0441\\u0435\\u0439\\u043d (\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u0435\\u0442 \\u043a\\u0440\\u0443\\u0433\\u043b\\u044b\\u0439 \\u0433\\u043e\\u0434)\",\"pt\":\"Piscina (o ano inteiro)\"}',68,'hotel',''),(595,'{\"es\":\"Pista de tenis\",\"en\":\"Tennis court\",\"de\":\"Tennisplatz\",\"fr\":\"court de tennis\",\"it\":\"campo da tennis\",\"ru\":\"\\u0422\\u0435\\u043d\\u043d\\u0438\\u0441\\u043d\\u044b\\u0439 \\u043a\\u043e\\u0440\\u0442\",\"pt\":\"Quadra de t\\u00eanis\"}',69,'hotel',''),(596,'{\"es\":\"Gimnasio\",\"en\":\"Fitness centre\",\"de\":\"Fitnesscenter\",\"fr\":\"centre de remise en forme\",\"it\":\"palestra\",\"ru\":\"\\u0424\\u0438\\u0442\\u043d\\u0435\\u0441-\\u0446\\u0435\\u043d\\u0442\\u0440\",\"pt\":\"Academia\"}',69,'hotel',''),(597,'{\"es\":\"Sala de juegos\",\"en\":\"Games room\",\"de\":\"Spielzimmer\",\"fr\":\"salle de jeux\",\"it\":\"sala giochi\",\"ru\":\"\\u0418\\u0433\\u0440\\u043e\\u0432\\u0430\\u044f \\u043a\\u043e\\u043c\\u043d\\u0430\\u0442\\u0430\",\"pt\":\"Sal\\u00e3o de jogos\"}',69,'hotel',''),(598,'{\"es\":\"Sol\\u00e1rium\",\"en\":\"Solarium\",\"de\":\"Solarium\",\"fr\":\"solarium\",\"it\":\"solarium\",\"ru\":\"\\u0421\\u043e\\u043b\\u044f\\u0440\\u0438\\u0439\",\"pt\":\"Sol\\u00e1rio\"}',69,'hotel',''),(599,'{\"es\":\"Masajes\",\"en\":\"Massage\",\"de\":\"Massage\",\"fr\":\"massage\",\"it\":\"massaggi\",\"ru\":\"\\u041c\\u0430\\u0441\\u0441\\u0430\\u0436\",\"pt\":\"Servi\\u00e7os de massagem\"}',69,'hotel',''),(600,'{\"es\":\"Zona de juegos infantil\",\"en\":\"Children\'s playground\",\"de\":\"Kinderspielplatz\",\"fr\":\"aire de jeux pour enfants\",\"it\":\"area giochi\",\"ru\":\"\\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u043e\\u0432\\u0430\\u044f \\u043f\\u043b\\u043e\\u0449\\u0430\\u0434\\u043a\\u0430\",\"pt\":\"Parquinho infantil\"}',69,'hotel',''),(601,'{\"es\":\"Billar\",\"en\":\"Billiards\",\"de\":\"Billard\",\"fr\":\"billard\",\"it\":\"biliardo\",\"ru\":\"\\u0411\\u0438\\u043b\\u044c\\u044f\\u0440\\u0434\",\"pt\":\"Bilhar\"}',69,'hotel',''),(602,'{\"es\":\"Ping pong\",\"en\":\"Table tennis\",\"de\":\"Tischtennis\",\"fr\":\"tennis de table\",\"it\":\"ping-pong\",\"ru\":\"\\u041d\\u0430\\u0441\\u0442\\u043e\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043d\\u043d\\u0438\\u0441\",\"pt\":\"T\\u00eanis de mesa\"}',69,'hotel',''),(603,'{\"es\":\"Dardos\",\"en\":\"Darts\",\"de\":\"Dart\",\"fr\":\"fl\\u00e9chettes\",\"it\":\"freccette\",\"ru\":\"\\u0414\\u0430\\u0440\\u0442\\u0441\",\"pt\":\"Jogo de dardos\"}',69,'hotel',''),(604,'{\"es\":\"Alquiler de bicicletas\",\"en\":\"Bicycle rental\",\"de\":\"Fahrradverleih\",\"fr\":\"location de v\\u00e9los\",\"it\":\"noleggio biciclette\",\"ru\":\"\\u041f\\u0440\\u043e\\u043a\\u0430\\u0442 \\u0432\\u0435\\u043b\\u043e\\u0441\\u0438\\u043f\\u0435\\u0434\\u043e\\u0432\",\"pt\":\"Aluguel de bicicletas\"}',69,'hotel',''),(605,'{\"es\":\"Bar\",\"en\":\"Bar\",\"de\":\"Bar\",\"fr\":\"bar\",\"it\":\"bar\",\"ru\":\"\\u0411\\u0430\\u0440\",\"pt\":\"Bar\"}',70,'hotel',''),(606,'{\"es\":\"Restaurante (buffet)\",\"en\":\"Restaurant (buffet)\",\"de\":\"Restaurant (Buffet)\",\"fr\":\"restaurant (buffet)\",\"it\":\"ristorante (a buffet)\",\"ru\":\"\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d (\\u00ab\\u0448\\u0432\\u0435\\u0434\\u0441\\u043a\\u0438\\u0439 \\u0441\\u0442\\u043e\\u043b\\u00bb)\",\"pt\":\"Restaurante (buffet)\"}',70,'hotel',''),(607,'{\"es\":\"Snack-bar\",\"en\":\"Snack bar\",\"de\":\"Snackbar\",\"fr\":\"snack-bar\",\"it\":\"snack bar\",\"ru\":\"\\u0421\\u043d\\u044d\\u043a-\\u0431\\u0430\\u0440\",\"pt\":\"Lanchonete\"}',70,'hotel',''),(608,'{\"es\":\"Hay conexi\\u00f3n a internet Wi-Fi disponible en todo el establecimiento. De pago.\",\"en\":\"WiFi is available in all areas and charges are applicable.\",\"de\":\"WLAN ist in allen Bereichen nutzbar gegen Geb\\u00fchren.\",\"fr\":\"Une connexion Wi-Fi est disponible dans tout l\'\\u00e9tablissement en suppl\\u00e9ment.\",\"it\":\"Internet Wi-Fi disponibile a pagamento in tutta la struttura.\",\"ru\":\"Wi-Fi \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u0442\\u0441\\u044f \\u043d\\u0430 \\u0442\\u0435\\u0440\\u0440\\u0438\\u0442\\u043e\\u0440\\u0438\\u0438 \\u0432\\u0441\\u0435\\u0433\\u043e \\u043e\\u0442\\u0435\\u043b\\u044f \\u0437\\u0430 \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0443\\u044e \\u043f\\u043b\\u0430\\u0442\\u0443.\",\"pt\":\"Acesso Wi-Fi dispon\\u00edvel em todo o hotel\"}',71,'hotel',''),(609,'{\"es\":\"\\u00a1Gratis! Hay parking gratis p\\u00fablico en el establecimiento. No es necesario reservar.\",\"en\":\"Free! Free public parking is possible on site (reservation is not needed).\",\"de\":\"Kostenlos! \\u00d6ffentliche Parkpl\\u00e4tze stehen kostenfrei an der Unterkunft (Reservierung ist nicht erforderlich) zur Verf\\u00fcgung.\",\"fr\":\"Gratuit\\u00a0! Un parking gratuit et public est disponible sur place (sans r\\u00e9servation pr\\u00e9alable).\",\"it\":\"Gratis! Parcheggio pubblico disponibile gratuitamente in loco senza prenotazione.\",\"ru\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e! \\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u041e\\u0431\\u0449\\u0435\\u0441\\u0442\\u0432\\u0435\\u043d\\u043d\\u0430\\u044f \\u043f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430 \\u043d\\u0430 \\u043c\\u0435\\u0441\\u0442\\u0435 (\\u043f\\u0440\\u0435\\u0434\\u0432\\u0430\\u0440\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437 \\u043d\\u0435 \\u0442\\u0440\\u0435\\u0431\\u0443\\u0435\\u0442\\u0441\\u044f) .\",\"pt\":\"Gr\\u00e1tis! Estacionamento gratuito e p\\u00fablico dispon\\u00edvel no local (n\\u00e3o necessita de reserva).\"}',72,'hotel',''),(610,'{\"es\":\"Recepci\\u00f3n 24 horas\",\"en\":\"24-hour front desk\",\"de\":\"24-Stunden-Rezeption\",\"fr\":\"r\\u00e9ception ouverte 24h\\/24\",\"it\":\"reception 24 ore su 24\",\"ru\":\"\\u041a\\u0440\\u0443\\u0433\\u043b\\u043e\\u0441\\u0443\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u0441\\u0442\\u043e\\u0439\\u043a\\u0430 \\u0440\\u0435\\u0433\\u0438\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u0438\",\"pt\":\"Recep\\u00e7\\u00e3o 24 horas\"}',73,'hotel',''),(611,'{\"es\":\"Salas de reuniones \\/ banquetes\",\"en\":\"Meeting\\/banquet facilities\",\"de\":\"Konferenz- und Veranstaltungsr\\u00e4ume\",\"fr\":\"salles de r\\u00e9unions\\/banquets\",\"it\":\"spazi per riunioni\\/banchetti\",\"ru\":\"\\u041a\\u043e\\u043d\\u0444\\u0435\\u0440\\u0435\\u043d\\u0446-\\u0437\\u0430\\u043b\\/\\u0411\\u0430\\u043d\\u043a\\u0435\\u0442\\u043d\\u044b\\u0439 \\u0437\\u0430\\u043b\",\"pt\":\"Comodidades reuni\\u00f5es \\/ Banquetes\"}',73,'hotel',''),(612,'{\"es\":\"Cambio de moneda\",\"en\":\"Currency exchange\",\"de\":\"W\\u00e4hrungsumtausch\",\"fr\":\"service de change\",\"it\":\"cambio valuta\",\"ru\":\"\\u041e\\u0431\\u043c\\u0435\\u043d \\u0432\\u0430\\u043b\\u044e\\u0442\\u044b\",\"pt\":\"C\\u00e2mbio de moedas\"}',73,'hotel',''),(613,'{\"es\":\"Alquiler de coches\",\"en\":\"Car hire\",\"de\":\"Autovermietung\",\"fr\":\"location de voitures\",\"it\":\"autonoleggio\",\"ru\":\"\\u041f\\u0440\\u043e\\u043a\\u0430\\u0442 \\u0430\\u0432\\u0442\\u043e\\u043c\\u043e\\u0431\\u0438\\u043b\\u0435\\u0439\",\"pt\":\"Aluguel de carros\"}',73,'hotel',''),(614,'{\"es\":\"Informaci\\u00f3n tur\\u00edstica\",\"en\":\"Tour desk\",\"de\":\"Informationsschalter f\\u00fcr Ausfl\\u00fcge\",\"fr\":\"bureau d\'excursions\",\"it\":\"banco escursioni\",\"ru\":\"\\u042d\\u043a\\u0441\\u043a\\u0443\\u0440\\u0441\\u0438\\u043e\\u043d\\u043d\\u043e\\u0435 \\u0431\\u044e\\u0440\\u043e\",\"pt\":\"Balc\\u00e3o de turismo\"}',73,'hotel',''),(615,'{\"es\":\"Fax \\/ fotocopiadora\",\"en\":\"Fax\\/photocopying\",\"de\":\"Fax- u. Fotokopiereinrichtungen\",\"fr\":\"fax\\/photocopies\",\"it\":\"fax\\/fotocopiatrice\",\"ru\":\"\\u0424\\u0430\\u043a\\u0441\\/\\u041a\\u0441\\u0435\\u0440\\u043e\\u043a\\u043e\\u043f\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435\",\"pt\":\"Fax \\/ Fotoc\\u00f3pia\"}',73,'hotel',''),(616,'{\"es\":\"Servicio de conserjer\\u00eda\",\"en\":\"Concierge service\",\"de\":\"Conciergeservice\",\"fr\":\"service de concierge\",\"it\":\"servizio concierge\",\"ru\":\"\\u0423\\u0441\\u043b\\u0443\\u0433\\u0438 \\u043a\\u043e\\u043d\\u0441\\u044c\\u0435\\u0440\\u0436\\u0430\",\"pt\":\"Servi\\u00e7o de concierge\"}',73,'hotel',''),(617,'{\"es\":\"Habitaciones familiares\",\"en\":\"Family rooms\",\"de\":\"Familienzimmer\",\"fr\":\"chambres familiales\",\"it\":\"disponibilit\\u00e0 di camere familiari\",\"ru\":\"\\u0421\\u0435\\u043c\\u0435\\u0439\\u043d\\u044b\\u0435 \\u043d\\u043e\\u043c\\u0435\\u0440\\u0430\",\"pt\":\"Quartos para fam\\u00edlias\"}',74,'hotel',''),(618,'{\"es\":\"Caja fuerte\",\"en\":\"Safety deposit box\",\"de\":\"Safe\",\"fr\":\"coffre-fort\",\"it\":\"cassaforte\",\"ru\":\"\\u0421\\u0435\\u0439\\u0444\",\"pt\":\"Cofre\"}',74,'hotel',''),(619,'{\"es\":\"espa\\u00f1ol\",\"en\":\"Spanish\",\"de\":\"Spanisch\",\"fr\":\"espagnol\",\"it\":\"spagnolo\",\"ru\":\"\\u043d\\u0430 \\u0438\\u0441\\u043f\\u0430\\u043d\\u0441\\u043a\\u043e\\u043c\",\"pt\":\"Espanhol\"}',75,'hotel',''),(620,'{\"es\":\"ingl\\u00e9s\",\"en\":\"English\",\"de\":\"Englisch\",\"fr\":\"anglais\",\"it\":\"inglese\",\"ru\":\"\\u043d\\u0430 \\u0430\\u043d\\u0433\\u043b\\u0438\\u0439\\u0441\\u043a\\u043e\\u043c\",\"pt\":\"Ingl\\u00eas\"}',75,'hotel',''),(621,'{\"es\":\"italiano\",\"en\":\"Italian\",\"de\":\"Italienisch\",\"fr\":\"italien\",\"it\":\"italiano\",\"ru\":\"\\u043d\\u0430 \\u0438\\u0442\\u0430\\u043b\\u044c\\u044f\\u043d\\u0441\\u043a\\u043e\\u043c\",\"pt\":\"Italiano\"}',75,'hotel',''),(622,'{\"es\":\"franc\\u00e9s\",\"en\":\"French\",\"de\":\"Franz\\u00f6sisch\",\"fr\":\"fran\\u00e7ais\",\"it\":\"francese\",\"ru\":\"\\u043d\\u0430 \\u0444\\u0440\\u0430\\u043d\\u0446\\u0443\\u0437\\u0441\\u043a\\u043e\\u043c\",\"pt\":\"Franc\\u00eas\"}',75,'hotel',''),(623,'{\"es\":\"alem\\u00e1n\",\"en\":\"German\",\"de\":\"Deutsch\",\"fr\":\"allemand\",\"it\":\"tedesco\",\"ru\":\"\\u043d\\u0430 \\u043d\\u0435\\u043c\\u0435\\u0446\\u043a\\u043e\\u043c\",\"pt\":\"Alem\\u00e3o\"}',75,'hotel',''),(624,'{\"pt\":\"e custos adicionais s\\u00e3o aplic\\u00e1veis.\"}',27,'hotel','');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_categoria`
--

DROP TABLE IF EXISTS `servicio_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_categoria`
--

LOCK TABLES `servicio_categoria` WRITE;
/*!40000 ALTER TABLE `servicio_categoria` DISABLE KEYS */;
INSERT INTO `servicio_categoria` VALUES (9,'{\"es\":\"Exteriores\",\"en-us\":\"Exteriores\",\"de\":\"Au\\u00dfenbereich\",\"fr\":\"En ext\\u00e9rieur\",\"it\":\"Spazi all\'aperto\"}'),(10,'{\"es\":\"Internet\",\"en-us\":\"Internet\",\"de\":\"Internet\",\"fr\":\"Internet\",\"it\":\"Internet\"}'),(11,'{\"es\":\"Aparcamiento\",\"en-us\":\"Aparcamiento\",\"de\":\"Parkpl\\u00e4tze\",\"fr\":\"Parking\",\"it\":\"Parcheggio\"}'),(12,'{\"es\":\"General\",\"en-us\":\"General\",\"de\":\"Allgemein\",\"fr\":\"G\\u00e9n\\u00e9ral\",\"it\":\"Servizi generali\"}'),(17,'{\"es\":\"Exteriores\",\"en\":\"Outdoors\",\"de\":\"Au\\u00dfenbereich\",\"fr\":\"En ext\\u00e9rieur\",\"it\":\"Spazi all\'aperto\",\"zh\":\"\\u6237\\u5916\",\"ru\":\"\\u041d\\u0430 \\u0441\\u0432\\u0435\\u0436\\u0435\\u043c \\u0432\\u043e\\u0437\\u0434\\u0443\\u0445\\u0435\"}'),(18,'{\"es\":\"Actividades\",\"en\":\"Activities\",\"de\":\"Aktivit\\u00e4ten\",\"fr\":\"Activit\\u00e9s\",\"it\":\"Attivit\\u00e0\",\"zh\":\"\\u6d3b\\u52a8\\u8bbe\\u65bd\",\"ru\":\"\\u0421\\u043f\\u043e\\u0440\\u0442 \\u0438 \\u041e\\u0442\\u0434\\u044b\\u0445\"}'),(19,'{\"es\":\"Internet\",\"en\":\"Internet\",\"de\":\"Internet\",\"fr\":\"Internet\",\"it\":\"Internet\",\"zh\":\"\\u7f51\\u7edc\\u8fde\\u63a5\",\"ru\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\"}'),(20,'{\"es\":\"Aparcamiento\",\"en\":\"Parking\",\"de\":\"Parkpl\\u00e4tze\",\"fr\":\"Parking\",\"it\":\"Parcheggio\",\"zh\":\"\\u505c\\u8f66\\u573a\",\"ru\":\"\\u041f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430\"}'),(21,'{\"es\":\"General\",\"en\":\"General\",\"de\":\"Allgemein\",\"fr\":\"G\\u00e9n\\u00e9ral\",\"it\":\"Servizi generali\",\"zh\":\"\\u7efc\\u5408\\u8bbe\\u65bd\",\"ru\":\"\\u041e\\u0431\\u0449\\u0438\\u0435\"}'),(22,'{\"es\":\"Exteriores\",\"en\":\"Outdoors\",\"de\":\"Au\\u00dfenbereich\",\"fr\":\"En ext\\u00e9rieur\",\"it\":\"Spazi all\'aperto\",\"zh\":\"\\u6237\\u5916\",\"ru\":\"\\u041d\\u0430 \\u0441\\u0432\\u0435\\u0436\\u0435\\u043c \\u0432\\u043e\\u0437\\u0434\\u0443\\u0445\\u0435\",\"ja\":\"\\u30a2\\u30a6\\u30c8\\u30c9\\u30a2\",\"pt\":\"\\u00c1rea externa\"}'),(23,'{\"es\":\"Actividades\",\"en\":\"Activities\",\"de\":\"Aktivit\\u00e4ten\",\"fr\":\"Activit\\u00e9s\",\"it\":\"Attivit\\u00e0\",\"zh\":\"\\u6d3b\\u52a8\\u8bbe\\u65bd\",\"ru\":\"\\u0421\\u043f\\u043e\\u0440\\u0442 \\u0438 \\u041e\\u0442\\u0434\\u044b\\u0445\",\"ja\":\"\\u30a2\\u30af\\u30c6\\u30a3\\u30d3\\u30c6\\u30a3\",\"pt\":\"Atividades\"}'),(24,'{\"es\":\"Internet\",\"en\":\"Internet\",\"de\":\"Internet\",\"fr\":\"Internet\",\"it\":\"Internet\",\"zh\":\"\\u7f51\\u7edc\\u8fde\\u63a5\",\"ru\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\",\"ja\":\"\\u30a4\\u30f3\\u30bf\\u30fc\\u30cd\\u30c3\\u30c8\",\"pt\":\"Internet\"}'),(25,'{\"es\":\"Aparcamiento\",\"en\":\"Parking\",\"de\":\"Parkpl\\u00e4tze\",\"fr\":\"Parking\",\"it\":\"Parcheggio\",\"zh\":\"\\u505c\\u8f66\\u573a\",\"ru\":\"\\u041f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430\",\"ja\":\"\\u99d0\\u8eca\\u5834\",\"pt\":\"Estacionamento\"}'),(26,'{\"es\":\"General\",\"en\":\"General\",\"de\":\"Allgemein\",\"fr\":\"G\\u00e9n\\u00e9ral\",\"it\":\"Servizi generali\",\"zh\":\"\\u7efc\\u5408\\u8bbe\\u65bd\",\"ru\":\"\\u041e\\u0431\\u0449\\u0438\\u0435\",\"ja\":\"\\u4e00\\u822c\",\"pt\":\"Geral\"}'),(27,'{\"pt\":\"Internet\"}'),(36,'{\"es\":\"Exteriores\",\"en\":\"Outdoors\",\"de\":\"Au\\u00dfenbereich\",\"fr\":\"En ext\\u00e9rieur\",\"it\":\"Spazi all\'aperto\",\"ru\":\"\\u041d\\u0430 \\u0441\\u0432\\u0435\\u0436\\u0435\\u043c \\u0432\\u043e\\u0437\\u0434\\u0443\\u0445\\u0435\",\"cs\":\"Exteri\\u00e9r\",\"pt\":\"\\u00c1rea externa\"}'),(37,'{\"es\":\"Actividades\",\"en\":\"Activities\",\"de\":\"Aktivit\\u00e4ten\",\"fr\":\"Activit\\u00e9s\",\"it\":\"Attivit\\u00e0\",\"ru\":\"\\u0421\\u043f\\u043e\\u0440\\u0442 \\u0438 \\u041e\\u0442\\u0434\\u044b\\u0445\",\"cs\":\"Aktivity\",\"pt\":\"Atividades\"}'),(38,'{\"es\":\"Comida & bebida\",\"en\":\"Food & Drink\",\"de\":\"Speisen & Getr\\u00e4nke\",\"fr\":\"Restauration\",\"it\":\"Servizi di ristorazione\",\"ru\":\"\\u041f\\u0438\\u0442\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u043d\\u0430\\u043f\\u0438\\u0442\\u043a\\u0438\",\"cs\":\"J\\u00eddlo a pit\\u00ed\",\"pt\":\"Alimentos\\/bebidas\"}'),(39,'{\"es\":\"Internet\",\"en\":\"Internet\",\"de\":\"Internet\",\"fr\":\"Internet\",\"it\":\"Internet\",\"ru\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\",\"cs\":\"Internet\",\"pt\":\"Internet\"}'),(40,'{\"es\":\"Aparcamiento\",\"en\":\"Parking\",\"de\":\"Parkpl\\u00e4tze\",\"fr\":\"Parking\",\"it\":\"Parcheggio\",\"ru\":\"\\u041f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430\",\"cs\":\"Parkov\\u00e1n\\u00ed\",\"pt\":\"Estacionamento\"}'),(41,'{\"es\":\"Servicios\",\"en\":\"Services\",\"de\":\"Dienstleistungen\",\"fr\":\"Services\",\"it\":\"Altri servizi\",\"ru\":\"\\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u044b\",\"cs\":\"Slu\\u017eby\",\"pt\":\"Servi\\u00e7os\"}'),(42,'{\"es\":\"General\",\"en\":\"General\",\"de\":\"Allgemein\",\"fr\":\"G\\u00e9n\\u00e9ral\",\"it\":\"Servizi generali\",\"ru\":\"\\u041e\\u0431\\u0449\\u0438\\u0435\",\"cs\":\"Obecn\\u00e9\",\"pt\":\"Geral\"}'),(43,'{\"es\":\"Idiomas que se hablan\",\"en\":\"Languages spoken\",\"de\":\"Gesprochene Sprachen\",\"fr\":\"Langues parl\\u00e9es\\u00a0\",\"it\":\"Lingue parlate\",\"ru\":\"\\u041f\\u0435\\u0440\\u0441\\u043e\\u043d\\u0430\\u043b \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u0442\",\"cs\":\"Person\\u00e1l hovo\\u0159\\u00ed t\\u011bmito jazyky:\",\"pt\":\"Idiomas falados\"}'),(68,'{\"es\":\"Exteriores\",\"en\":\"Outdoors\",\"de\":\"Au\\u00dfenbereich\",\"fr\":\"En ext\\u00e9rieur\",\"it\":\"Spazi all\'aperto\",\"ru\":\"\\u041d\\u0430 \\u0441\\u0432\\u0435\\u0436\\u0435\\u043c \\u0432\\u043e\\u0437\\u0434\\u0443\\u0445\\u0435\",\"pt\":\"\\u00c1rea externa\"}'),(69,'{\"es\":\"Actividades\",\"en\":\"Activities\",\"de\":\"Aktivit\\u00e4ten\",\"fr\":\"Activit\\u00e9s\",\"it\":\"Attivit\\u00e0\",\"ru\":\"\\u0421\\u043f\\u043e\\u0440\\u0442 \\u0438 \\u041e\\u0442\\u0434\\u044b\\u0445\",\"pt\":\"Atividades\"}'),(70,'{\"es\":\"Comida & bebida\",\"en\":\"Food & Drink\",\"de\":\"Speisen & Getr\\u00e4nke\",\"fr\":\"Restauration\",\"it\":\"Servizi di ristorazione\",\"ru\":\"\\u041f\\u0438\\u0442\\u0430\\u043d\\u0438\\u0435 \\u0438 \\u043d\\u0430\\u043f\\u0438\\u0442\\u043a\\u0438\",\"pt\":\"Alimentos\\/bebidas\"}'),(71,'{\"es\":\"Internet\",\"en\":\"Internet\",\"de\":\"Internet\",\"fr\":\"Internet\",\"it\":\"Internet\",\"ru\":\"\\u0418\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\",\"pt\":\"Internet\"}'),(72,'{\"es\":\"Aparcamiento\",\"en\":\"Parking\",\"de\":\"Parkpl\\u00e4tze\",\"fr\":\"Parking\",\"it\":\"Parcheggio\",\"ru\":\"\\u041f\\u0430\\u0440\\u043a\\u043e\\u0432\\u043a\\u0430\",\"pt\":\"Estacionamento\"}'),(73,'{\"es\":\"Servicios\",\"en\":\"Services\",\"de\":\"Dienstleistungen\",\"fr\":\"Services\",\"it\":\"Altri servizi\",\"ru\":\"\\u0421\\u0435\\u0440\\u0432\\u0438\\u0441\\u044b\",\"pt\":\"Servi\\u00e7os\"}'),(74,'{\"es\":\"General\",\"en\":\"General\",\"de\":\"Allgemein\",\"fr\":\"G\\u00e9n\\u00e9ral\",\"it\":\"Servizi generali\",\"ru\":\"\\u041e\\u0431\\u0449\\u0438\\u0435\",\"pt\":\"Geral\"}'),(75,'{\"es\":\"Idiomas que se hablan\",\"en\":\"Languages spoken\",\"de\":\"Gesprochene Sprachen\",\"fr\":\"Langues parl\\u00e9es\\u00a0\",\"it\":\"Lingue parlate\",\"ru\":\"\\u041f\\u0435\\u0440\\u0441\\u043e\\u043d\\u0430\\u043b \\u0433\\u043e\\u0432\\u043e\\u0440\\u0438\\u0442\",\"pt\":\"Idiomas falados\"}');
/*!40000 ALTER TABLE `servicio_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `telefono_tipo_id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_telefono_telefono_tipo1_idx` (`telefono_tipo_id`),
  KEY `fk_telefono_empresa1_idx` (`empresa_id`),
  CONSTRAINT `fk_telefono_telefono_tipo1` FOREIGN KEY (`telefono_tipo_id`) REFERENCES `telefono_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefono_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_tipo`
--

DROP TABLE IF EXISTS `telefono_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_tipo`
--

LOCK TABLES `telefono_tipo` WRITE;
/*!40000 ALTER TABLE `telefono_tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefono_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `direccion_id` int(11) DEFAULT NULL,
  `usuario_grupo_id` int(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_direccion1_idx` (`direccion_id`),
  KEY `fk_usuario_usuario_grupo1_idx` (`usuario_grupo_id`),
  KEY `fk_usuario_pais1_idx` (`pais_id`),
  CONSTRAINT `fk_usuario_direccion1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuario_grupo1` FOREIGN KEY (`usuario_grupo_id`) REFERENCES `usuario_grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ruben','Velazquez','ruben.velazquez.calva@gmail.com','2013-11-26 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'12312312',724,NULL),(2,'Matias','Barbarroja','matias.barbarroja@gmail.com','2013-11-30 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'666564986',724,NULL),(3,'Matias','barbarroja','matias.barbarroja@gmail.com','2013-12-01 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'+34913991668',724,NULL),(4,'Matias','barbarroja','matias.barbarroja@gmail.com','2013-12-01 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'+34913991668',724,NULL),(5,'Matias Barbarroja','Barbarroja','matias.barbarroja@gmail.com','2013-12-01 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'6546456546546',724,NULL),(6,'Administrador',NULL,'admin@outlet-rooms.com',NULL,NULL,'activo',NULL,1,NULL,NULL,'admin'),(7,'Ruben','Velazquez','ruben.velazquez.calva@gmail.com','2013-12-01 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'123123123123',724,'');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_grupo`
--

DROP TABLE IF EXISTS `usuario_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_grupo`
--

LOCK TABLES `usuario_grupo` WRITE;
/*!40000 ALTER TABLE `usuario_grupo` DISABLE KEYS */;
INSERT INTO `usuario_grupo` VALUES (1,'Administrador');
/*!40000 ALTER TABLE `usuario_grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-02 23:28:32
