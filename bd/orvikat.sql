CREATE DATABASE  IF NOT EXISTS `orvikat` /*!40100 DEFAULT CHARACTER SET latin1 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (49,'','http://or.vikatickets.com/templates/images/apartamentos/e76b2167ca85592bd88d0e851e13115a.jpg','imagen','jpg'),(50,'','http://or.vikatickets.com/templates/images/apartamentos/829e5f14ea75d722643a90c373b3d442.jpg','imagen','jpg'),(51,'','http://or.vikatickets.com/templates/images/apartamentos/2056f0c6fe77a0e87c43b68ed805786d.jpg','imagen','jpg'),(52,'','http://or.vikatickets.com/templates/images/apartamentos/934c500d9d103dadeb111fee716d7569.jpg','imagen','jpg'),(53,'','http://or.vikatickets.com/templates/images/apartamentos/c4ae5a22bfe345d617e04ae278e5d0bf.jpg','imagen','jpg'),(54,'','http://or.vikatickets.com/templates/images/apartamentos/15dd8d0cea2ea04142667973daa1e8ce.jpg','imagen','jpg'),(55,'','http://or.vikatickets.com/templates/images/apartamentos/f295fa7e158c546369af67ca48e923b1.jpg','imagen','jpg'),(56,'','http://or.vikatickets.com/templates/images/apartamentos/828243e8e84fcc4e40a14463a3fd6d14.jpg','imagen','jpg'),(57,'','http://or.vikatickets.com/templates/images/apartamentos/ea0d845bcac8c2b8c049d99430c323f5.jpg','imagen','jpg'),(58,'','http://or.vikatickets.com/templates/images/apartamentos/ef0f2b6fd3e2265fb5826a665185d665.jpg','imagen','jpg'),(59,'','http://or.vikatickets.com/templates/images/apartamentos/1157fb17727a8b380d413df2e049fabb.jpg','imagen','jpg'),(60,'','http://or.vikatickets.com/templates/images/apartamentos/5f3549bc3aa6524426415769ca32f334.jpg','imagen','jpg'),(61,'','http://or.vikatickets.com/templates/images/apartamentos/3568386ffe4cee9d1f9f2eef4b4d1dd2.jpg','imagen','jpg'),(62,'','http://or.vikatickets.com/templates/images/apartamentos/51beecd4933eb3070cb93fb7aa4c819c.jpg','imagen','jpg'),(63,'','http://or.vikatickets.com/templates/images/apartamentos/7cb306b9c16d20c2d61690fe79568e25.jpg','imagen','jpg'),(64,'','http://or.vikatickets.com/templates/images/apartamentos/e9c45f6ae886625faf238be16701858d.jpg','imagen','jpg'),(65,'','http://or.vikatickets.com/templates/images/apartamentos/b59102ba3880b17420c3f7a1eb2bde4e.jpg','imagen','jpg'),(66,'','http://or.vikatickets.com/templates/images/apartamentos/fc8a25d97a49b86966fd2a322949f3d0.jpg','imagen','jpg'),(67,'','http://or.vikatickets.com/templates/images/apartamentos/a74c3843133458014b897268f614df6d.jpg','imagen','jpg'),(68,'','http://or.vikatickets.com/templates/images/apartamentos/9abaa69afbe70e9bcda880c9b766307b.jpg','imagen','jpg'),(69,'','http://or.vikatickets.com/templates/images/apartamentos/a4d1faaab99b075557d4e2516427baf8.jpg','imagen','jpg'),(70,'','http://or.vikatickets.com/templates/images/apartamentos/ff89573c6e2a8b82e2289402f9c3a151.jpg','imagen','jpg'),(71,'','http://or.vikatickets.com/templates/images/apartamentos/ee68652d7b2463e6d514e5208d276f97.jpg','imagen','jpg'),(72,'','http://or.vikatickets.com/templates/images/apartamentos/90856d0f50fdb83d0590f11d38475191.jpg','imagen','jpg'),(73,'','http://or.vikatickets.com/templates/images/apartamentos/ad513d7b83ca7bb0ab8d773d946f0551.jpg','imagen','jpg'),(74,'','http://or.vikatickets.com/templates/images/apartamentos/8b6a1be29fc06c85fa35b7fd602048fb.jpg','imagen','jpg'),(75,'','http://or.vikatickets.com/templates/images/apartamentos/c71779b06cce13b82d59b409027bb8c6.jpg','imagen','jpg'),(76,'','http://or.vikatickets.com/templates/images/apartamentos/74a62cb9bda4291e57d5b8b652d9de89.jpg','imagen','jpg'),(77,'','http://or.vikatickets.com/templates/images/apartamentos/2e0973568c135be7f4c7fcd4221d4e6f.jpg','imagen','jpg'),(78,'','http://or.vikatickets.com/templates/images/apartamentos/1f4ea1c2681721dfdf6cf5bff303ac27.jpg','imagen','jpg'),(79,'','http://or.vikatickets.com/templates/images/apartamentos/e40a055b831042cb9f29158169cab10e.jpg','imagen','jpg'),(80,'','http://or.vikatickets.com/templates/images/apartamentos/a5adbbd33029d4ed4784572deaee1420.jpg','imagen','jpg'),(81,'','http://or.vikatickets.com/templates/images/apartamentos/cc147046d493a6a5e4215d31b1bb163d.jpg','imagen','jpg'),(82,'','http://or.vikatickets.com/templates/images/apartamentos/72a56e71aa9cd49eb1d75224106ee59a.jpg','imagen','jpg'),(83,'','http://or.vikatickets.com/templates/images/apartamentos/06d791458062e027cfc802da13c1c67b.jpg','imagen','jpg'),(84,'','http://or.vikatickets.com/templates/images/apartamentos/c17c3f297a5d3158f03ae34243f809ae.jpg','imagen','jpg'),(85,'','http://or.vikatickets.com/templates/images/apartamentos/993acb0eed0b45f7778cfa0c815b46f4.jpg','imagen','jpg'),(86,'','http://or.vikatickets.com/templates/images/apartamentos/f835e9f00e93c197689013175762f53b.jpg','imagen','jpg'),(87,'','http://or.vikatickets.com/templates/images/apartamentos/01d19b553a205637f20c2f6a52124fdf.jpg','imagen','jpg'),(88,'','http://or.vikatickets.com/templates/images/apartamentos/dc5c7443549e7637983207be02e59fb9.jpg','imagen','jpg'),(89,'','http://or.vikatickets.com/templates/images/apartamentos/3840aab520dad437947bec583867d1aa.jpg','imagen','jpg'),(90,'','http://or.vikatickets.com/templates/images/apartamentos/2f7866b222ff83b60417c56e0f7c38f4.jpg','imagen','jpg'),(91,'','http://or.vikatickets.com/templates/images/apartamentos/7f4d2b86ab66555beaebe2372a5aadcc.jpg','imagen','jpg'),(92,'','http://or.vikatickets.com/templates/images/apartamentos/9e8da5cd63aae87eb0d372d168abdddb.jpg','imagen','jpg'),(93,'','http://or.vikatickets.com/templates/images/apartamentos/b1bd0e3a5b851fb03426c5ff7a7b0f73.jpg','imagen','jpg'),(94,'','http://or.vikatickets.com/templates/images/apartamentos/f1214a96370448a12f1d3f6b00a8370d.jpg','imagen','jpg'),(95,'','http://or.vikatickets.com/templates/images/apartamentos/3a6adde03c6eae2c7a073de4a11a38e8.jpg','imagen','jpg'),(96,'','http://or.vikatickets.com/templates/images/apartamentos/564f98792c85bf862523764b357c83bf.jpg','imagen','jpg'),(97,'','http://or.vikatickets.com/templates/images/apartamentos/f45d93c6bcf6d1601958c76149ef0e79.jpg','imagen','jpg'),(98,'','http://or.vikatickets.com/templates/images/apartamentos/0fa792680aa021e5014488b931708ac9.jpg','imagen','jpg'),(99,'','http://or.vikatickets.com/templates/images/apartamentos/36c952b1d70b726b9bafc22d24e3bebb.jpg','imagen','jpg'),(100,'','http://or.vikatickets.com/templates/images/apartamentos/023666f0ed4fa0b8a28f7fd4da5acb1a.jpg','imagen','jpg'),(101,'','http://or.vikatickets.com/templates/images/apartamentos/14d6d58f8828f685b282f085e6d2f10a.jpg','imagen','jpg'),(102,'','http://or.vikatickets.com/templates/images/apartamentos/57d9e319e582f3a919c146d950ed2518.jpg','imagen','jpg'),(103,'','http://or.vikatickets.com/templates/images/apartamentos/7a1f6a356b61d1007e4f60391afa1124.jpg','imagen','jpg'),(104,'','http://or.vikatickets.com/templates/images/apartamentos/535e7c5a1a5d181f705f0b1290cec23f.jpg','imagen','jpg'),(105,'','http://or.vikatickets.com/templates/images/apartamentos/c93f3cb2a4fb505b9e84465a2d30e628.jpg','imagen','jpg'),(106,'','http://or.vikatickets.com/templates/images/apartamentos/884eaf57206a36e2642ae176bb7d25a7.jpg','imagen','jpg'),(107,'','http://or.vikatickets.com/templates/images/apartamentos/3683e32b507beb94578e6bc54ee1ea5a.jpg','imagen','jpg'),(108,'','http://or.vikatickets.com/templates/images/apartamentos/ee6c2215088bbe60adf1dcc0e26fc362.jpg','imagen','jpg'),(109,'','http://or.vikatickets.com/templates/images/apartamentos/3eb7516a74489f1ec6c84196765b8bf6.jpg','imagen','jpg'),(110,'','http://or.vikatickets.com/templates/images/apartamentos/a09e5bee3427a2d5c83805e574ff09ba.jpg','imagen','jpg'),(111,'','http://or.vikatickets.com/templates/images/apartamentos/6e44a19e499ff245047758e3bc555162.jpg','imagen','jpg'),(112,'','http://or.vikatickets.com/templates/images/apartamentos/920d0dccf39edd4b98c194f5958d28a6.jpg','imagen','jpg'),(113,'','http://or.vikatickets.com/templates/images/apartamentos/4453ef7323701bfe6cfbcc9ec9f3b7b2.jpg','imagen','jpg'),(114,'','http://or.vikatickets.com/templates/images/apartamentos/d688e626a7488928d5f55b9d923a0f9f.jpg','imagen','jpg'),(115,'','http://or.vikatickets.com/templates/images/apartamentos/5988971a87497fb733255b94f324a348.jpg','imagen','jpg'),(116,'','http://or.vikatickets.com/templates/images/apartamentos/4d34a2ff119d93047bc102e4f2ddbfe3.jpg','imagen','jpg'),(117,'','http://or.vikatickets.com/templates/images/apartamentos/4b37679ffaa40a9d92c7dffd20ca84ce.jpg','imagen','jpg'),(118,'','http://or.vikatickets.com/templates/images/apartamentos/2e351fadf06ae5244ad8de1e71b4647b.jpg','imagen','jpg'),(119,'','http://or.vikatickets.com/templates/images/apartamentos/170460373249dd04d2df74c1966931d5.jpg','imagen','jpg'),(120,'','http://or.vikatickets.com/templates/images/apartamentos/1c125433a991054a5a52dbc9afbdbc15.jpg','imagen','jpg'),(121,'','http://or.vikatickets.com/templates/images/apartamentos/a8c719771969dce34e086d3b9382fe06.jpg','imagen','jpg'),(122,'','http://or.vikatickets.com/templates/images/apartamentos/b3c7154dab18232ffce2c191d125a278.jpg','imagen','jpg'),(123,'','http://or.vikatickets.com/templates/images/apartamentos/2318533f96a13b74675648c8b8808374.jpg','imagen','jpg'),(124,'','http://or.vikatickets.com/templates/images/apartamentos/6f3a2d771bb83d10f346692e46f42a21.jpg','imagen','jpg'),(125,'','http://or.vikatickets.com/templates/images/apartamentos/957cd726a0821a7595fd405eca8271f0.jpg','imagen','jpg'),(126,'','http://or.vikatickets.com/templates/images/apartamentos/39f3d4e412f607a643d82dd5e61893dc.jpg','imagen','jpg'),(127,'','http://or.vikatickets.com/templates/images/apartamentos/7f5ebec3443b7120db0ce30e829ffdd2.jpg','imagen','jpg'),(128,'','http://or.vikatickets.com/templates/images/apartamentos/c865e6aba7d3da3c885d5b03f5f72de6.jpg','imagen','jpg'),(129,'','http://or.vikatickets.com/templates/images/apartamentos/575b2a71cea8241790e91c2db2ec571f.jpg','imagen','jpg'),(130,'','http://or.vikatickets.com/templates/images/apartamentos/7c44bd175c36e37c1049167a5d1515ec.jpg','imagen','jpg'),(131,'','http://or.vikatickets.com/templates/images/apartamentos/1df7da5e34290af8cc415d5f8b2d7d9c.jpg','imagen','jpg'),(132,'','http://or.vikatickets.com/templates/images/apartamentos/257bcdb2efed6a97ddd22b444736bbaa.jpg','imagen','jpg'),(133,'','http://or.vikatickets.com/templates/images/apartamentos/99ffcd05be919b7265e2850cff765bbc.jpg','imagen','jpg'),(134,'','http://or.vikatickets.com/templates/images/apartamentos/26a535d5340948382c7c823f3483438e.jpg','imagen','jpg'),(135,'','http://or.vikatickets.com/templates/images/apartamentos/e79a0e78d884329ee09395bea2de9841.jpg','imagen','jpg'),(136,'','http://or.vikatickets.com/templates/images/apartamentos/48748c06e8dcb03694ae3d1583c4a336.jpg','imagen','jpg'),(137,'','http://or.vikatickets.com/templates/images/apartamentos/a41361acc61c7e64cce00ee1bb162284.jpg','imagen','jpg');
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
  `hotel_id` int(11) NOT NULL,
  `background_color` varchar(50) DEFAULT NULL,
  `descuento_booking` double DEFAULT NULL,
  `tipo_descuento_booking` varchar(50) DEFAULT NULL,
  `comparacion_booking` tinyint(1) DEFAULT NULL,
  `sincronizacion_vika` tinyint(1) DEFAULT NULL,
  `cupon_promocional` tinyint(1) DEFAULT NULL,
  `atencion_personalizada` tinyint(1) DEFAULT NULL,
  `pago_flexible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_configuracion_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_configuracion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (1,2,'#fff',2,'€',0,1,NULL,NULL,NULL),(2,4,'#000',0,'%',0,0,NULL,NULL,NULL),(3,5,'#FFF',12,'%',1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_empresa`
--

DROP TABLE IF EXISTS `configuracion_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa_id` int(11) NOT NULL,
  `vika_email` varchar(200) DEFAULT NULL,
  `vika_password` varchar(200) DEFAULT NULL,
  `vika_canal` int(11) DEFAULT NULL,
  `vika_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_configuracion_empresa1_idx` (`empresa_id`),
  CONSTRAINT `fk_configuracion_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_empresa`
--

LOCK TABLES `configuracion_empresa` WRITE;
/*!40000 ALTER TABLE `configuracion_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion_empresa` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'',0,0,'','');
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
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion_corta` text,
  `descripcion_larga` text,
  `visitas` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  `url` text,
  `calidad` double DEFAULT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_empresa1_idx` (`empresa_id`),
  CONSTRAINT `fk_hotel_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (2,'oasis casa vieja','hotel muy wapo en fuerteventra','',NULL,'activo',NULL,'2013-11-27 07:50:34','0000-00-00 00:00:00','http://www.booking.com/hotel/es/villas-oasis-rural-de-villaverde.es.html',0,1),(3,'Oasis Duna','','<p>El Oasis Duna está situado en Fuerteventura, a 100 metros del puerto de Corralejo, y ofrece un amplio solárium y una piscina al aire libre (climatizada en invierno), así como apartamentos con balcón privado.</p>\n<p>Los apartamentos del Oasis Duna son amplios y disponen de un salón con TV de pago y una zona de cocina bien equipada, con fogones, microondas y hervidor de agua. También hay conexión Wi-Fi disponible por un suplemento.</p>\n<p>Los apartamentos del Oasis Duna están rodeados de jardines tropicales y cuentan con pistas de tenis, un gimnasio, una pista de baloncesto y un parque infantil.</p>\n<p>Además, el Oasis Duna alberga un restaurante bufé, una pizzería a la carta, un bar junto a la piscina y un pub, el Boulevard, que ofrece un programa de animación por las noches.</p>\n<p>El complejo Oasis Duna se encuentra a solo 200 metros del parque acuático de Corralejo, a 900 metros de la playa y a 5 minutos a pie del puerto, desde donde zarpan barcos con destino a la cercana isla de Lobos con frecuencia. Además, hay aparcamiento gratuito.</p>',0,'activo',NULL,'2013-11-27 07:58:29','0000-00-00 00:00:00','http://www.booking.com/hotel/es/oasis-duna-corralejo-fuerteventura.es.html',3,NULL),(4,'Villas Alicias','','<p>El establecimiento Villas Alicia est&aacute; situado en Caletas de Fuste, cerca del campo de golf de Fuerteventura. Ofrece villas modernas y elegantes equipadas con una piscina y un jard&iacute;n privados, conexi&oacute;n Wi-Fi gratuita y una TV de pantalla plana.</p>\r\n\r\n<p>Las luminosas villas del Villas Alicia cuentan con un dormitorio con una cama doble y un dormitorio con 2 camas individuales con vistas al jard&iacute;n. Disponen adem&aacute;s de una amplia sala de estar y comedor con un reproductor de DVD y un sof&aacute; grande.</p>\r\n\r\n<p>La cocina cuenta con fogones, microondas, cafetera, lavavajillas y lavadora. El jard&iacute;n privado incluye un sol&aacute;rium con una barbacoa y una piscina y ofrece vistas al oc&eacute;ano Atl&aacute;ntico.</p>\r\n\r\n<p>Este moderno complejo de villas est&aacute; a solo 600 metros de la playa y a 8 km del aeropuerto de Fuerteventura. En Caleta de Fuste hay varios cines y un casino.</p>\r\n',0,'activo',NULL,'2013-11-27 15:33:41','0000-00-00 00:00:00','http://www.booking.com/hotel/es/villas-alicia.es.html',0,1),(5,'Hotel Arena','','<p>Situado en el coraz&oacute;n de Corralejo, al norte de Fuenteventura, el Hotel Arena dispone de sauna, centro de fitness y una amplia piscina perfecta para relajarse bajo el sol.</p>\r\n\r\n<p>Disfrute de un relajante descanso en este pintoresco hotel, cuyas habitaciones disponen de aire acondicionado completo, y tienen un balc&oacute;n donde podr&aacute; disfrutar del sol.</p>\r\n\r\n<p>Disfrute de un paseo de unos 500 metros hasta las preciosas playas de esta isla tropical. El Hotel Arena goza de una excelente ubicaci&oacute;n para visitar los caf&eacute;s, bares y restaurantes.</p>\r\n\r\n<p>Tambi&eacute;n podr&aacute; saborear una sangr&iacute;a en su hamaca, alrededor de la preciosa piscina del hotel. Tambi&eacute;n hay una piscina m&aacute;s peque&ntilde;a, para ni&ntilde;os.</p>\r\n\r\n<p>Saboree la deliciosa comida en el restaurante del hotel. El Arena tambi&eacute;n ofrece servicios convenientes como cambio de divisas y alquiler de coches.</p>\r\n\r\n<p>Podr&aacute; utilizar el mostrador tur&iacute;stico y la recepci&oacute;n las 24 horas, para planear sus excursiones alrededor de la isla.</p>\r\n',0,'activo',NULL,'2013-11-27 21:55:00','0000-00-00 00:00:00','http://www.booking.com/hotel/es/arena-corralejo.es.html',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_archivo`
--

LOCK TABLES `hotel_archivo` WRITE;
/*!40000 ALTER TABLE `hotel_archivo` DISABLE KEYS */;
INSERT INTO `hotel_archivo` VALUES (3,49,25,''),(3,50,26,''),(3,51,27,''),(3,52,28,''),(3,53,29,''),(3,54,30,''),(3,55,31,''),(3,56,32,''),(3,57,33,''),(3,58,34,''),(3,59,35,''),(3,60,36,''),(3,61,37,''),(3,62,38,''),(3,63,39,''),(3,64,40,''),(3,65,41,''),(3,66,42,''),(3,67,43,''),(3,68,44,''),(3,69,45,''),(3,70,46,''),(3,71,47,''),(3,72,48,''),(4,73,49,''),(4,74,50,''),(4,75,51,''),(4,76,52,''),(4,77,53,''),(4,78,54,''),(4,79,55,''),(4,80,56,''),(4,81,57,''),(4,82,58,''),(4,83,59,''),(4,84,60,''),(4,85,61,''),(4,86,62,''),(4,87,63,''),(4,88,64,''),(4,89,65,''),(4,90,66,''),(4,91,67,''),(4,92,68,''),(5,93,69,''),(5,94,70,''),(5,95,71,''),(5,96,72,''),(5,97,73,''),(5,98,74,''),(5,99,75,''),(5,100,76,''),(5,101,77,''),(5,102,78,''),(5,103,79,''),(5,104,80,''),(5,105,81,''),(5,106,82,''),(5,107,83,''),(5,108,84,''),(5,109,85,''),(5,110,86,''),(5,111,87,''),(5,112,88,''),(5,113,89,''),(5,114,90,''),(5,115,91,''),(5,116,92,''),(5,117,93,''),(5,118,94,''),(5,119,95,''),(5,120,96,''),(5,121,97,''),(5,122,98,''),(5,123,99,''),(5,124,100,''),(5,125,101,''),(5,126,102,''),(5,127,103,''),(5,128,104,''),(5,129,105,''),(5,130,106,''),(5,131,107,''),(5,132,108,''),(5,133,109,''),(5,134,110,''),(5,135,111,''),(5,136,112,''),(5,137,113,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_direccion`
--

LOCK TABLES `hotel_direccion` WRITE;
/*!40000 ALTER TABLE `hotel_direccion` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_idioma`
--

LOCK TABLES `hotel_idioma` WRITE;
/*!40000 ALTER TABLE `hotel_idioma` DISABLE KEYS */;
INSERT INTO `hotel_idioma` VALUES (1,5,1),(2,5,2),(3,5,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_moneda`
--

LOCK TABLES `hotel_moneda` WRITE;
/*!40000 ALTER TABLE `hotel_moneda` DISABLE KEYS */;
INSERT INTO `hotel_moneda` VALUES (1,5,1),(2,5,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_servicio`
--

LOCK TABLES `hotel_servicio` WRITE;
/*!40000 ALTER TABLE `hotel_servicio` DISABLE KEYS */;
INSERT INTO `hotel_servicio` VALUES (3,67,34),(3,68,35),(3,69,36),(3,70,37),(3,71,38),(3,72,39),(3,73,40),(3,74,41),(3,75,42),(3,76,43),(3,77,44),(3,78,45),(3,79,46),(3,80,47),(3,81,48),(3,82,49),(3,83,50),(3,84,51),(3,85,52),(3,86,53),(3,87,54),(3,88,55),(3,89,56),(3,90,57),(3,91,58),(3,92,59),(3,93,60),(3,94,61),(3,95,62),(3,96,63),(3,97,64),(3,98,65),(3,99,66),(4,67,67),(4,68,68),(4,69,69),(4,100,70),(4,101,71),(4,102,72),(4,103,73),(4,94,74),(5,67,75),(5,68,76),(5,69,77),(5,70,78),(5,104,79),(5,72,80),(5,77,81),(5,78,82),(5,105,83),(5,79,84),(5,106,85),(5,107,86),(5,80,87),(5,108,88),(5,109,89),(5,81,90),(5,83,91),(5,110,92),(5,111,93),(5,86,94),(5,112,95),(5,113,96),(5,88,97),(5,89,98),(5,90,99),(5,91,100),(5,114,101),(5,115,102),(5,116,103),(5,117,104),(5,93,105),(5,94,106),(5,118,107),(5,97,108),(5,98,109),(5,95,110),(5,96,111),(5,99,112);
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
  `nombre` varchar(200) DEFAULT NULL,
  `codigo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Español','es'),(2,'English','en-us'),(3,'Deutsch','de'),(4,'Français','fr'),(5,'Italiano','it');
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
INSERT INTO `moneda` VALUES (1,'Euro','€','EUR',1),(2,'Dolar','$','USD',1.3592);
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
  `hotel_id` int(11) NOT NULL,
  `monto` double DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `tipo_descuento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reglas_cupones_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_reglas_cupones_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas_cupones`
--

LOCK TABLES `reglas_cupones` WRITE;
/*!40000 ALTER TABLE `reglas_cupones` DISABLE KEYS */;
INSERT INTO `reglas_cupones` VALUES (1,5,100,20,'€');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,1,'','2013-11-26 23:00:00','0000-00-00 00:00:00','',118.8,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_pago`
--

LOCK TABLES `reserva_pago` WRITE;
/*!40000 ALTER TABLE `reserva_pago` DISABLE KEYS */;
INSERT INTO `reserva_pago` VALUES (1,'tarjeta','','',118.8,'','','0000-00-00 00:00:00','0000-00-00 00:00:00','http://or.vikatickets.com',NULL,'','pago',1,'MasterCard',1,2014,'','5593045978791827','123',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_producto`
--

LOCK TABLES `reserva_producto` WRITE;
/*!40000 ALTER TABLE `reserva_producto` DISABLE KEYS */;
INSERT INTO `reserva_producto` VALUES (1,1,' Apartamento de 1 dormitorio (2 adultos) ','apartamento',118.8,1,'2013-12-16 23:00:00','2013-12-19 23:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (67,'Jardín',1,'hotel',''),(68,'Terraza',1,'hotel',''),(69,'Terraza / solárium',1,'hotel',''),(70,'Piscina al aire libre (todo el año)',1,'hotel',''),(71,'Pista de tenis',2,'hotel',''),(72,'Gimnasio',2,'hotel',''),(73,'Sala de juegos',2,'hotel',''),(74,'Solárium',2,'hotel',''),(75,'Masajes',2,'hotel',''),(76,'Zona de juegos infantil',2,'hotel',''),(77,'Billar',2,'hotel',''),(78,'Ping pong',2,'hotel',''),(79,'Dardos',2,'hotel',''),(80,'Alquiler de bicicletas',2,'hotel',''),(81,'Bar',3,'hotel',''),(82,'Restaurante (buffet)',3,'hotel',''),(83,'Snack-bar',3,'hotel',''),(84,'Hay conexión a internet Wi-Fi disponible en todo el establecimiento. De pago.',4,'hotel',''),(85,'¡Gratis! Hay parking gratis público en el establecimiento. No es necesario reservar.',5,'hotel',''),(86,'Recepción 24 horas',6,'hotel',''),(87,'Salas de reuniones / banquetes',6,'hotel',''),(88,'Cambio de moneda',6,'hotel',''),(89,'Alquiler de coches',6,'hotel',''),(90,'Información turística',6,'hotel',''),(91,'Fax / fotocopiadora',6,'hotel',''),(92,'Servicio de consejería',6,'hotel',''),(93,'Habitaciones familiares',7,'hotel',''),(94,'Caja fuerte',7,'hotel',''),(95,'español',8,'hotel',''),(96,'inglés',8,'hotel',''),(97,'italiano',8,'hotel',''),(98,'francés',8,'hotel',''),(99,'alemán',8,'hotel',''),(100,'Barbacoa',1,'hotel',''),(101,'Campo de golf (a menos de 3 km)',2,'hotel',''),(102,'¡Gratis! Hay conexión a internet Wi-Fi disponible en todo el establecimiento. Gratis.',4,'hotel',''),(103,'¡Gratis! Hay parking gratis privado en el establecimiento. No se puede reservar.',5,'hotel',''),(104,'Sauna',2,'hotel',''),(105,'Karaoke',2,'hotel',''),(106,'Bañera de hidromasaje',2,'hotel',''),(107,'Squash',2,'hotel',''),(108,'Personal de animación',2,'hotel',''),(109,'Restaurante',3,'hotel',''),(110,'Internet wi-fi (hotspot) disponible en las zonas comunes. Precio: 4 EUR por hora .',4,'hotel',''),(111,'¡Gratis! Hay parking gratis público en las inmediaciones. No es necesario reservar.',5,'hotel',''),(112,'Registro de entrada y salida exprés',6,'hotel',''),(113,'Servicio de lavandería',6,'hotel',''),(114,'Máquina expendedora (bebidas)',6,'hotel',''),(115,'Máquina expendedora (aperitivos)',6,'hotel',''),(116,'Habitaciones no fumadores',7,'hotel',''),(117,'Adaptado personas de movilidad reducida',7,'hotel',''),(118,'Aire acondicionado',7,'hotel','');
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
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_categoria`
--

LOCK TABLES `servicio_categoria` WRITE;
/*!40000 ALTER TABLE `servicio_categoria` DISABLE KEYS */;
INSERT INTO `servicio_categoria` VALUES (1,'Exteriores'),(2,'Actividades'),(3,'Comida & bebida'),(4,'Internet'),(5,'Aparcamiento'),(6,'Servicios'),(7,'General'),(8,'Idiomas que se hablan');
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
  PRIMARY KEY (`id`),
  KEY `fk_usuario_direccion1_idx` (`direccion_id`),
  KEY `fk_usuario_usuario_grupo1_idx` (`usuario_grupo_id`),
  KEY `fk_usuario_pais1_idx` (`pais_id`),
  CONSTRAINT `fk_usuario_direccion1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuario_grupo1` FOREIGN KEY (`usuario_grupo_id`) REFERENCES `usuario_grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ruben','Velazquez','ruben.velazquez.calva@gmail.com','2013-11-26 23:00:00','0000-00-00 00:00:00','',NULL,NULL,'12312312',724);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_grupo`
--

LOCK TABLES `usuario_grupo` WRITE;
/*!40000 ALTER TABLE `usuario_grupo` DISABLE KEYS */;
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

-- Dump completed on 2013-11-29  0:40:14
