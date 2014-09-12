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
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
INSERT INTO `archivo` VALUES (560,'','http://or.vikatickets.com/templates/images/apartamentos/ad513d7b83ca7bb0ab8d773d946f0551.jpg','imagen','jpg'),(561,'','http://or.vikatickets.com/templates/images/apartamentos/8b6a1be29fc06c85fa35b7fd602048fb.jpg','imagen','jpg'),(562,'','http://or.vikatickets.com/templates/images/apartamentos/c71779b06cce13b82d59b409027bb8c6.jpg','imagen','jpg'),(563,'','http://or.vikatickets.com/templates/images/apartamentos/74a62cb9bda4291e57d5b8b652d9de89.jpg','imagen','jpg'),(564,'','http://or.vikatickets.com/templates/images/apartamentos/2e0973568c135be7f4c7fcd4221d4e6f.jpg','imagen','jpg'),(565,'','http://or.vikatickets.com/templates/images/apartamentos/1f4ea1c2681721dfdf6cf5bff303ac27.jpg','imagen','jpg'),(566,'','http://or.vikatickets.com/templates/images/apartamentos/e40a055b831042cb9f29158169cab10e.jpg','imagen','jpg'),(567,'','http://or.vikatickets.com/templates/images/apartamentos/a5adbbd33029d4ed4784572deaee1420.jpg','imagen','jpg'),(568,'','http://or.vikatickets.com/templates/images/apartamentos/cc147046d493a6a5e4215d31b1bb163d.jpg','imagen','jpg'),(569,'','http://or.vikatickets.com/templates/images/apartamentos/72a56e71aa9cd49eb1d75224106ee59a.jpg','imagen','jpg'),(570,'','http://or.vikatickets.com/templates/images/apartamentos/06d791458062e027cfc802da13c1c67b.jpg','imagen','jpg'),(571,'','http://or.vikatickets.com/templates/images/apartamentos/c17c3f297a5d3158f03ae34243f809ae.jpg','imagen','jpg'),(572,'','http://or.vikatickets.com/templates/images/apartamentos/993acb0eed0b45f7778cfa0c815b46f4.jpg','imagen','jpg'),(573,'','http://or.vikatickets.com/templates/images/apartamentos/f835e9f00e93c197689013175762f53b.jpg','imagen','jpg'),(574,'','http://or.vikatickets.com/templates/images/apartamentos/01d19b553a205637f20c2f6a52124fdf.jpg','imagen','jpg'),(575,'','http://or.vikatickets.com/templates/images/apartamentos/dc5c7443549e7637983207be02e59fb9.jpg','imagen','jpg'),(576,'','http://or.vikatickets.com/templates/images/apartamentos/3840aab520dad437947bec583867d1aa.jpg','imagen','jpg'),(577,'','http://or.vikatickets.com/templates/images/apartamentos/2f7866b222ff83b60417c56e0f7c38f4.jpg','imagen','jpg'),(578,'','http://or.vikatickets.com/templates/images/apartamentos/7f4d2b86ab66555beaebe2372a5aadcc.jpg','imagen','jpg'),(579,'','http://or.vikatickets.com/templates/images/apartamentos/9e8da5cd63aae87eb0d372d168abdddb.jpg','imagen','jpg'),(628,'','http://or.vikatickets.com/templates/images/apartamentos/b1bd0e3a5b851fb03426c5ff7a7b0f73.jpg','imagen','jpg'),(629,'','http://or.vikatickets.com/templates/images/apartamentos/f1214a96370448a12f1d3f6b00a8370d.jpg','imagen','jpg'),(630,'','http://or.vikatickets.com/templates/images/apartamentos/3a6adde03c6eae2c7a073de4a11a38e8.jpg','imagen','jpg'),(631,'','http://or.vikatickets.com/templates/images/apartamentos/564f98792c85bf862523764b357c83bf.jpg','imagen','jpg'),(632,'','http://or.vikatickets.com/templates/images/apartamentos/f45d93c6bcf6d1601958c76149ef0e79.jpg','imagen','jpg'),(633,'','http://or.vikatickets.com/templates/images/apartamentos/0fa792680aa021e5014488b931708ac9.jpg','imagen','jpg'),(634,'','http://or.vikatickets.com/templates/images/apartamentos/36c952b1d70b726b9bafc22d24e3bebb.jpg','imagen','jpg'),(635,'','http://or.vikatickets.com/templates/images/apartamentos/023666f0ed4fa0b8a28f7fd4da5acb1a.jpg','imagen','jpg'),(636,'','http://or.vikatickets.com/templates/images/apartamentos/14d6d58f8828f685b282f085e6d2f10a.jpg','imagen','jpg'),(637,'','http://or.vikatickets.com/templates/images/apartamentos/57d9e319e582f3a919c146d950ed2518.jpg','imagen','jpg'),(638,'','http://or.vikatickets.com/templates/images/apartamentos/7a1f6a356b61d1007e4f60391afa1124.jpg','imagen','jpg'),(639,'','http://or.vikatickets.com/templates/images/apartamentos/535e7c5a1a5d181f705f0b1290cec23f.jpg','imagen','jpg'),(640,'','http://or.vikatickets.com/templates/images/apartamentos/c93f3cb2a4fb505b9e84465a2d30e628.jpg','imagen','jpg'),(641,'','http://or.vikatickets.com/templates/images/apartamentos/884eaf57206a36e2642ae176bb7d25a7.jpg','imagen','jpg'),(642,'','http://or.vikatickets.com/templates/images/apartamentos/3683e32b507beb94578e6bc54ee1ea5a.jpg','imagen','jpg'),(643,'','http://or.vikatickets.com/templates/images/apartamentos/ee6c2215088bbe60adf1dcc0e26fc362.jpg','imagen','jpg'),(644,'','http://or.vikatickets.com/templates/images/apartamentos/3eb7516a74489f1ec6c84196765b8bf6.jpg','imagen','jpg'),(645,'','http://or.vikatickets.com/templates/images/apartamentos/a09e5bee3427a2d5c83805e574ff09ba.jpg','imagen','jpg'),(646,'','http://or.vikatickets.com/templates/images/apartamentos/6e44a19e499ff245047758e3bc555162.jpg','imagen','jpg'),(647,'','http://or.vikatickets.com/templates/images/apartamentos/920d0dccf39edd4b98c194f5958d28a6.jpg','imagen','jpg'),(648,'','http://or.vikatickets.com/templates/images/apartamentos/4453ef7323701bfe6cfbcc9ec9f3b7b2.jpg','imagen','jpg'),(649,'','http://or.vikatickets.com/templates/images/apartamentos/d688e626a7488928d5f55b9d923a0f9f.jpg','imagen','jpg'),(650,'','http://or.vikatickets.com/templates/images/apartamentos/5988971a87497fb733255b94f324a348.jpg','imagen','jpg'),(651,'','http://or.vikatickets.com/templates/images/apartamentos/4d34a2ff119d93047bc102e4f2ddbfe3.jpg','imagen','jpg'),(652,'','http://or.vikatickets.com/templates/images/apartamentos/4b37679ffaa40a9d92c7dffd20ca84ce.jpg','imagen','jpg'),(653,'','http://or.vikatickets.com/templates/images/apartamentos/2e351fadf06ae5244ad8de1e71b4647b.jpg','imagen','jpg'),(654,'','http://or.vikatickets.com/templates/images/apartamentos/170460373249dd04d2df74c1966931d5.jpg','imagen','jpg'),(655,'','http://or.vikatickets.com/templates/images/apartamentos/1c125433a991054a5a52dbc9afbdbc15.jpg','imagen','jpg'),(656,'','http://or.vikatickets.com/templates/images/apartamentos/a8c719771969dce34e086d3b9382fe06.jpg','imagen','jpg'),(657,'','http://or.vikatickets.com/templates/images/apartamentos/b3c7154dab18232ffce2c191d125a278.jpg','imagen','jpg'),(658,'','http://or.vikatickets.com/templates/images/apartamentos/2318533f96a13b74675648c8b8808374.jpg','imagen','jpg'),(659,'','http://or.vikatickets.com/templates/images/apartamentos/6f3a2d771bb83d10f346692e46f42a21.jpg','imagen','jpg'),(660,'','http://or.vikatickets.com/templates/images/apartamentos/957cd726a0821a7595fd405eca8271f0.jpg','imagen','jpg'),(661,'','http://or.vikatickets.com/templates/images/apartamentos/39f3d4e412f607a643d82dd5e61893dc.jpg','imagen','jpg'),(662,'','http://or.vikatickets.com/templates/images/apartamentos/7f5ebec3443b7120db0ce30e829ffdd2.jpg','imagen','jpg'),(663,'','http://or.vikatickets.com/templates/images/apartamentos/c865e6aba7d3da3c885d5b03f5f72de6.jpg','imagen','jpg'),(664,'','http://or.vikatickets.com/templates/images/apartamentos/575b2a71cea8241790e91c2db2ec571f.jpg','imagen','jpg'),(665,'','http://or.vikatickets.com/templates/images/apartamentos/7c44bd175c36e37c1049167a5d1515ec.jpg','imagen','jpg'),(666,'','http://or.vikatickets.com/templates/images/apartamentos/1df7da5e34290af8cc415d5f8b2d7d9c.jpg','imagen','jpg'),(667,'','http://or.vikatickets.com/templates/images/apartamentos/257bcdb2efed6a97ddd22b444736bbaa.jpg','imagen','jpg'),(668,'','http://or.vikatickets.com/templates/images/apartamentos/99ffcd05be919b7265e2850cff765bbc.jpg','imagen','jpg'),(669,'','http://or.vikatickets.com/templates/images/apartamentos/26a535d5340948382c7c823f3483438e.jpg','imagen','jpg'),(670,'','http://or.vikatickets.com/templates/images/apartamentos/e79a0e78d884329ee09395bea2de9841.jpg','imagen','jpg'),(671,'','http://or.vikatickets.com/templates/images/apartamentos/48748c06e8dcb03694ae3d1583c4a336.jpg','imagen','jpg'),(672,'','http://or.vikatickets.com/templates/images/apartamentos/a41361acc61c7e64cce00ee1bb162284.jpg','imagen','jpg'),(697,'','http://or.vikatickets.com/templates/images/apartamentos/e76b2167ca85592bd88d0e851e13115a.jpg','imagen','jpg'),(698,'','http://or.vikatickets.com/templates/images/apartamentos/829e5f14ea75d722643a90c373b3d442.jpg','imagen','jpg'),(699,'','http://or.vikatickets.com/templates/images/apartamentos/2056f0c6fe77a0e87c43b68ed805786d.jpg','imagen','jpg'),(700,'','http://or.vikatickets.com/templates/images/apartamentos/934c500d9d103dadeb111fee716d7569.jpg','imagen','jpg'),(701,'','http://or.vikatickets.com/templates/images/apartamentos/c4ae5a22bfe345d617e04ae278e5d0bf.jpg','imagen','jpg'),(702,'','http://or.vikatickets.com/templates/images/apartamentos/15dd8d0cea2ea04142667973daa1e8ce.jpg','imagen','jpg'),(703,'','http://or.vikatickets.com/templates/images/apartamentos/f295fa7e158c546369af67ca48e923b1.jpg','imagen','jpg'),(704,'','http://or.vikatickets.com/templates/images/apartamentos/828243e8e84fcc4e40a14463a3fd6d14.jpg','imagen','jpg'),(705,'','http://or.vikatickets.com/templates/images/apartamentos/ea0d845bcac8c2b8c049d99430c323f5.jpg','imagen','jpg'),(706,'','http://or.vikatickets.com/templates/images/apartamentos/ef0f2b6fd3e2265fb5826a665185d665.jpg','imagen','jpg'),(707,'','http://or.vikatickets.com/templates/images/apartamentos/1157fb17727a8b380d413df2e049fabb.jpg','imagen','jpg'),(708,'','http://or.vikatickets.com/templates/images/apartamentos/5f3549bc3aa6524426415769ca32f334.jpg','imagen','jpg'),(709,'','http://or.vikatickets.com/templates/images/apartamentos/3568386ffe4cee9d1f9f2eef4b4d1dd2.jpg','imagen','jpg'),(710,'','http://or.vikatickets.com/templates/images/apartamentos/51beecd4933eb3070cb93fb7aa4c819c.jpg','imagen','jpg'),(711,'','http://or.vikatickets.com/templates/images/apartamentos/7cb306b9c16d20c2d61690fe79568e25.jpg','imagen','jpg'),(712,'','http://or.vikatickets.com/templates/images/apartamentos/e9c45f6ae886625faf238be16701858d.jpg','imagen','jpg'),(713,'','http://or.vikatickets.com/templates/images/apartamentos/b59102ba3880b17420c3f7a1eb2bde4e.jpg','imagen','jpg'),(714,'','http://or.vikatickets.com/templates/images/apartamentos/fc8a25d97a49b86966fd2a322949f3d0.jpg','imagen','jpg'),(715,'','http://or.vikatickets.com/templates/images/apartamentos/a74c3843133458014b897268f614df6d.jpg','imagen','jpg'),(716,'','http://or.vikatickets.com/templates/images/apartamentos/9abaa69afbe70e9bcda880c9b766307b.jpg','imagen','jpg'),(717,'','http://or.vikatickets.com/templates/images/apartamentos/a4d1faaab99b075557d4e2516427baf8.jpg','imagen','jpg'),(718,'','http://or.vikatickets.com/templates/images/apartamentos/ff89573c6e2a8b82e2289402f9c3a151.jpg','imagen','jpg'),(719,'','http://or.vikatickets.com/templates/images/apartamentos/ee68652d7b2463e6d514e5208d276f97.jpg','imagen','jpg'),(720,'','http://or.vikatickets.com/templates/images/apartamentos/90856d0f50fdb83d0590f11d38475191.jpg','imagen','jpg'),(721,'','http://or.vikatickets.com/templates/images/apartamentos/c83638cabdc2dee13e94a0d1f4134bfa.jpg','imagen','jpg'),(722,'','http://or.vikatickets.com/templates/images/apartamentos/04b2413d14b627edb6505b5ff6782ecf.jpg','imagen','jpg'),(723,'','http://or.vikatickets.com/templates/images/apartamentos/bb1e75a5b825992816fb10db84fc8cc5.jpg','imagen','jpg'),(724,'','http://or.vikatickets.com/templates/images/apartamentos/2d0b2a65f8eb5ef08835f2f7845a54dd.jpg','imagen','jpg'),(725,'','http://or.vikatickets.com/templates/images/apartamentos/a2527381a934364c8f8ca9ca39e89c7e.jpg','imagen','jpg'),(726,'','http://or.vikatickets.com/templates/images/apartamentos/e432d0ed51f13f4acd7378bfd1174682.jpg','imagen','jpg'),(727,'','http://or.vikatickets.com/templates/images/apartamentos/a608b7cc42dd7e222f8a17472a9f6302.jpg','imagen','jpg'),(728,'','http://or.vikatickets.com/templates/images/apartamentos/d51fff857e303aacc34869bc1aa7493e.jpg','imagen','jpg'),(729,'','http://or.vikatickets.com/templates/images/apartamentos/4bb2b38f6dec8f35d38fc6887807e58d.jpg','imagen','jpg'),(730,'','http://or.vikatickets.com/templates/images/apartamentos/09ec627254b5737c99461d2ef9e446f6.jpg','imagen','jpg'),(731,'','http://or.vikatickets.com/templates/images/apartamentos/d4d25d84fc568d87b8faea23a3152860.jpg','imagen','jpg'),(732,'','http://or.vikatickets.com/templates/images/apartamentos/482996cbc7b58ed3527cddb052f1c5e8.jpg','imagen','jpg'),(733,'','http://or.vikatickets.com/templates/images/apartamentos/7ae2162cb9f6d82dc6432260f42c3dc0.jpg','imagen','jpg'),(734,'','http://or.vikatickets.com/templates/images/apartamentos/a5592131c59cc3f234c2f814f9d79e09.jpg','imagen','jpg'),(735,'','http://or.vikatickets.com/templates/images/apartamentos/e2790b6ab462c4524bbba89153a0b0a7.jpg','imagen','jpg'),(736,'','http://or.vikatickets.com/templates/images/apartamentos/2b7d455cc650db872b87c006519f7f5f.jpg','imagen','jpg'),(737,'','http://or.vikatickets.com/templates/images/apartamentos/37071278727e9959bcf123d6f503c671.jpg','imagen','jpg'),(738,'','http://or.vikatickets.com/templates/images/apartamentos/860fd334d9efdbb0794345a2933582d8.jpg','imagen','jpg'),(739,'','http://or.vikatickets.com/templates/images/apartamentos/86bf9828a287750c7f27d9468245debe.jpg','imagen','jpg'),(740,'','http://or.vikatickets.com/templates/images/apartamentos/37f5628c0d3798a27f5ffa9773bb261b.jpg','imagen','jpg'),(741,'','http://or.vikatickets.com/templates/images/apartamentos/2b849e97038049403a0144a03aeb2b1f.jpg','imagen','jpg'),(742,'','http://or.vikatickets.com/templates/images/apartamentos/0a1cd9d4cbc7eac91f1c5cac646f2299.jpg','imagen','jpg'),(743,'','http://or.vikatickets.com/templates/images/apartamentos/cb769b8041b25ccba7166fd7a6336be9.jpg','imagen','jpg'),(744,'','http://or.vikatickets.com/templates/images/apartamentos/ebff1aa798f1f769e15a0051f4412597.jpg','imagen','jpg'),(745,'','http://or.vikatickets.com/templates/images/apartamentos/a62914dc27769e02a314009dbccaa8d6.jpg','imagen','jpg'),(746,'','http://or.vikatickets.com/templates/images/apartamentos/b421bdb456e5ba60db9aba7c13e2af16.jpg','imagen','jpg'),(747,'','http://or.vikatickets.com/templates/images/apartamentos/07c94d9b66b2c13eba71208043240679.jpg','imagen','jpg'),(748,'','http://or.vikatickets.com/templates/images/apartamentos/746a04e03a9df5aefb3addff248ca726.jpg','imagen','jpg'),(749,'','http://or.vikatickets.com/templates/images/apartamentos/2184928a75b3384b510008f4eced80a7.jpg','imagen','jpg'),(750,'','http://or.vikatickets.com/templates/images/apartamentos/9a6b8feaeb022b3b77f749546b06ed73.jpg','imagen','jpg'),(751,'','http://or.vikatickets.com/templates/images/apartamentos/ac0e87ab9061630e71b300a0f48882d4.jpg','imagen','jpg'),(752,'','http://or.vikatickets.com/templates/images/apartamentos/fbac68b856fc7ca48cd2915db64c3bfd.jpg','imagen','jpg');
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `palabra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (1,'Cancelación GRATUITA - PAGA DESPUÉS'),(4,'•'),(5,'FREE cancellation - PAY LATER'),(6,'KOSTENLOS stornieren - SPÄTER ZAHLEN'),(7,'Annulation GRATUITE - PAYEZ PLUS TARD'),(8,'Cancellazione GRATUITA - PAGA DOPO'),(9,'БЕСПЛАТНАЯ отмена - ПЛАТИТЕ ПОЗЖЕ'),(10,'Cancelamento GRATUITO - PAGUE DEPOIS');
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion`
--

DROP TABLE IF EXISTS `condicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `condicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `descripcion` text,
  `condicion_categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_condicion_condicion_categoria1_idx` (`condicion_categoria_id`),
  CONSTRAINT `fk_condicion_condicion_categoria1` FOREIGN KEY (`condicion_categoria_id`) REFERENCES `condicion_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion`
--

LOCK TABLES `condicion` WRITE;
/*!40000 ALTER TABLE `condicion` DISABLE KEYS */;
INSERT INTO `condicion` VALUES (1,'{\"es\":\"Condiciones generales de compra\"}','{\"es\":\"Condiciones Generales DeTeatros.com\\n\\n1. Identificación de las Partes\\nLas presentes Condiciones Generales de Uso, son suscritas, de una parte, por Deteatros.com, que pone a disposición de los usuarios de Internet de forma gratuita la Página según las mismas, y de otra, por el Usuario, entendido como toda persona física o jurídica que acceda a la Página de forma libre, voluntaria y gratuita, haciendo o no uso de los servicios ofrecidos en la misma. El Usuario, por el mero hecho de visitar, navegar y usar la Página, se somete a las presentes Condiciones Generales de Uso sin perjuicio de que el registro gratuito en la misma implique el sometimiento a unas Condiciones de Contratación que habrán de ser aceptadas expresamente al proceder al registro.\\n\\n2. Gratuidad de la Página\\nLa Página es de acceso gratuito, al igual que la navegación por la misma. Deteatros.com, únicamente pone a disposición de los usuarios la Página de forma gratuita para la mera navegación por la misma. En caso de que los usuarios quieran reservar entradas a través de Deteatros.com, habrán de seguir los procedimientos adecuados para ello y aceptar expresamente las Condiciones de Contratación.Deteatros.com ofrece la posibilidad a cualquier usuario interesado en los espectáculos ofertados de realizar reservas online sin necesidad de estar registrado. Para ello, bastará con realizar los pasos necesarios y aceptar las correspondientes Condiciones de Contratación, a las que puedes acceder desde el correspondiente link en la Página o haciendo clic aquí.\\n\\n3. Obligaciones del usuario\\nComo Usuario, por la mera visita o navegación por la web, debes:\\n- Utilizar la Página y sus servicios y funcionalidades respetando la legislación aplicable (en especial las de propiedad intelectual e industrial y las leyes de protección de datos de carácter personal), así como la moral y buenas costumbres generalmente aceptadas, el orden público y las presentes Condiciones Generales de Uso.\\n- Utilizar la Página de una forma diligente, correcta y lícita.\\n- Si hacemos cambios en estas Condiciones Generales de Uso o en la Política de Privacidad, revísalos: pueden ser importantes.\\n- En su caso, revisa también las notificaciones que te enviemos, pueden contener información importante.\\nAsimismo, como usuario, te comprometes a respetar Deteatros.com y cumplir con las siguientes condiciones:\\n- No incumplir estas Condiciones Generales de Uso ni ninguna de sus condiciones ni de las obligaciones asumidas en ellas.\\n- No infringir ningún derecho o interés de Deteatros.com ni de terceros, tales como derechos de propiedad intelectual o industrial (patentes, marcas, secretos comerciales, derechos de copyright u otros derechos de nuestra propiedad).\\n- No utilizar la Página para recabar información y contenidos para prestar cualquier servicio que, a criterio de Deteatros.com, le correspondan o compitan con el mismo.\\n- No introducir por cualquier medio virus informáticos, gusanos, troyanos o cualquier otra clase de códigos maliciosos dirigidos a interrumpir, destruir o limitar la funcionalidad de Deteatros.com.\\n- No utilizar técnicas de ingeniería inversa y/o descompilar o descifrar o utilizar cualquier otro sistema para conocer el código fuente de la Página o de cualquier elemento sujeto a copyright o propiedad intelectual subyacente.\\n- No modificar la Página de ninguna forma o manera posible.\\n- No dañar, deshabilitar, sobrecargar o dificultar el servicio (o la red o las redes conectadas al servicio), o interferir en el uso y disfrute del servicio por parte de cualquier usuario.\\n- No realizar acciones o utilizar medios para simular la apariencia o función de Deteatros.com con cualquier finalidad\\n\\n4. Exclusión de responsabilidad\\nLa Página es puesta a disposición de los usuarios de Internet para su uso y disfrute y sus servicios y funcionalidades se muestran \\\"tal cual\\\" y \\\"según disponibilidad\\\" en cada momento. Deteatros.com no ofrece garantías en relación con los servicios que ofrece, en especial sobre aquellos que sean gratuitos para el usuario. No seremos en ningún caso responsables de cómo uses la Página, tampoco si incumples cualquier obligación o compromiso de estas Condiciones Generales de Uso. En especial, Deteatros.com no será en ningún caso responsable:\\na) de los contenidos de otras páginas web enlazadas a este sitio. Los riesgos derivados de la consulta de tales páginas corresponden exclusivamente al Comprador que deberá regirse por los términos y condiciones de utilización de las mismas. La Página cuenta o puede contar con enlaces o links a sitios web de terceros. No somos responsables en ningún caso de los contenidos y de cualquier acción que pueda derivar de que accedas a enlaces externos de otras páginas. Deteatros.com no revisa ni aprueba ningún tipo de función, contenido, publicidad, o cualquier otro contenido incluido en los sitios de terceros. \\nb) de los daños que pudieran derivarse por el uso de páginas de terceros ajenos a Deteatros.com. Deteatros.com, por lo que éste no puede garantizar que en los mismos no existan amenazas informáticas, malware o virus o alberguen contenido ilícito u otros enlaces que, a su vez, lleven a sitios con alguna o varias de las mencionadas características. En este caso, Deteatros.com declina toda responsabilidad sobre los contenidos y servicios de los terceros así como de cualquier daño derivado sobre el acceso a los mismos.\\nc) del lucrocesante o daño emergente por cualquier cuestión relacionada con la Página.\\nDeteatros.com ofrece a los usuarios de Internet la posibilidad de valorar las obras y publicar comentarios sobre las mismas con la finalidad de compartir opiniones personales. En este sentido es de destacar: \\na) que Deteatros.com, conforme al artículo 16 de la Ley 34/2004, de 11 de julio, de servicios de la sociedad de la información y del comercio electrónico, se configura a los efectos de prestar este servicio como un prestador de sevicios de alojamiento o almacenamiento de datos. \\nb) que no se hace responsable de la ilegalidad, especialmente la infracción de leyes en materia de propiedad intelectual e industrial, de los contenidos publicados por sus usuarios ni de las opiniones vertidas en ellos.\\nc) que en ningún caso los comentarios representan la opinión de Deteatros.com, de sus socios o de sus empleados.\\nd) Sistema de denuncia: si crees que algún comentario no es conforme con la Ley, vulnera tus derechos o, de alguna forma, te perjudica, por favor comunícanoslo a: info@deteatros.com.\\n\\n5. Propiedad intelectual e industrial\\nLos derechos de propiedad intelectual del contenido de las páginas web, su diseño gráfico y códigos son de Deteatros.com en exclusiva o cuenta con los derechos o autorizaciones para su publicación y, por tanto, queda prohibida su reproducción, distribución, comunicación pública, transformación o cualquier otra actividad que se pueda realizar con los contenidos de sus páginas web ni aún citando las fuentes, salvo consentimiento por escrito de Deteatros.com o del titular en exclusiva del derecho.\\nTodos los nombres comerciales, marcas o signos distintos de cualquier clase contenidos en las páginas web son propiedad de sus dueños o sus titulares legítimos y están protegidos por ley.\\n\\n\\n6. Indemnización\\nCualquier incumplimiento de estas Condiciones Generales de Uso por parte del usuario, podría suponer para nosotros daños y perjuicios. De tal forma, si por incumplimientos del usuario sufriéramos daños, perjuicios o cualquier tipo de pérdidas y/o costes (como pueden ser los honorarios de abogados y procuradores), aquél estará obligado a resarcirnos. \\nAsimismo, si por los incumplimientos del usuario se generaran cualquier tipo de reclamaciones o procedimientos contra nosotros, el usuario dejará indemne a Deteatros.com, pudiendo reclamarle cualquier gasto, coste, daño o perjuicio derivado de sus acciones.\\n\\n\\n7. Salvaguarda e interpretación de las Condiciones\\nLas presentes Condiciones Generales de Uso y todas sus Condiciones Particulares de Registro constituyen un acuerdo único entre tú, como usuario, y nosotros como titulares de Deteatros.com.\\nSi cualquier disposición de las Condiciones fuera considerada ilegal, inválida o no ejecutable según la disposición de la Autoridad competente, la misma será modificada de modo que se pueda interpretar como ejecutable y efectiva del modo más próximo posible a la intención original de la disposición.\\nLa no exigencia del cumplimiento estricto de alguno de los términos de estas Condiciones, no supone ni puede interpretarse como una renuncia por nuestra parte a exigir su cumplimiento en sus estrictos términos en el futuro.\\nLa declaración de nulidad de alguna o algunas de las cláusulas establecidas en las presentes Condiciones Generales de Uso por la Autoridad competente no perjudicará la validez de las restantes.\\n\\n\\n8. Modificación\\nDeteatros.com se reserva el derecho de modificar, eliminar o alterar en cualquier momento la Página los contenidos de la misma, sean propios o de terceros.\\n\\n9. Legislación y fuero\\nLas relaciones entre Deteatros.com con los Usuarios de sus servicios telemáticos, presentes en la web, se encuentran sometidas a la legislación española. Las partes, con renuncia expresa a cualquier fuero que pudiera corresponderles, se someten a la jurisdicción de los Juzgados y Tribunales de Madrid.\\n\\n\\n\\nCondiciones generales de compra\\n\\nEn cumplimiento de la Ley 34/2002 de Servicios de la Sociedad de la Información y del Comercio Electrónico (LSSICE), te informamos que www.laescaleradejacob.es es un dominio de Internet registrado por LA ESCALERA DE JACOB LAVAPIES S.L., con C.I.F B86749298 (en adelante La Escalera de Jacob) e inscrita en el Reg. Mercantil Madrid, T. 31157, F. 39, Inscripción 1, con Hoja M-560722. \\nCondiciones generales de contratación entre www.laescaleradejacob.es y el usuario:\\n\\n1. El usuario declara que es mayor de edad (mayor de 18 años) y dispone de capacidad legal necesaria para contratar los servicios ofertados por los proveedores en la web de La Escalera de Jacob, de acuerdo con las condiciones más abajo desglosadas, las cuales declara comprender y aceptar.\\nEn el caso de contratación por menores de edad, se requiere la autorización de los padres o tutores para poder disfrutar del servicio contratado. La Escalera de Jacob no se responsabiliza de la veracidad y exactitud de los datos rellenados por el usuario y por tanto no puede constatar la edad de los mismos.\\nEl usuario se compromete a utilizar los servicios y contenidos en nuestro sitio web de conformidad con la Ley y los términos y condiciones generales y particulares de los servicios que ofrece La Escalera de Jacob en cada momento, debiendo abstenerse de emplearlos para:\\n\\n(a)\\tIntroducir en la red programas de datos susceptibles de provocar daños en los sistemas informáticos de La Escalera de Jacob, sus proveedores o terceros usuarios de la red interna o de este sitio web.\\n\\n(b) Difundir contenidos de carácter racista, xenófobo, pornográfico, de apología del terrorismo y/o que atenten contra los derechos humanos.\\n\\n(c) Realizar actividades ilícitas, contrarias a la buena fe, a las costumbres, a la moral o al orden público.\\n\\n(d) Realizar actividades que constituyan una infracción de la regulación sobre propiedad intelectual e industrial o cualquier otra norma del ordenamiento jurídico aplicable.\\n\\n(e) Reproducir, duplicar, vender o explotar para fines comerciales cualquier contenido del sitio web.\\n\\n2. El usuario es el responsable de facilitar sus datos correctamente en los procesos de contratación establecidos en la página web de La Escalera de Jacob.\\n\\n4. La Escalera de Jacob es titular de la base de datos generada con los datos de carácter personal suministrados por los usuarios en el proceso de compra o reserva de productos a través de nuestra página web. La Escalera de Jacob se compromete al cumplimiento de su obligación de secreto de los datos de carácter personal y de su deber de tratarlos con confidencialidad, y a tal fin La Escalera de Jacob adoptará las medidas necesarias para evitar su alteración, pérdida, tratamiento o acceso no autorizado, habida cuenta en todo momento del estado de la tecnología con arreglo a lo previsto en la legislación vigente en España en materia de protección de datos de carácter personal.\\nEl usuario acepta que los datos personales facilitados en el proceso de compra o reserva de nuestros productos sean incorporados a un fichero automatizado, cuya titularidad corresponde a La Escalera de Jacob, con la finalidad de prestar adecuadamente el servicio solicitado, dar cumplimiento a los requisitos de facturación, contabilidad y auditoría de la compañía, realizar análisis estadísticos, verificar tarjetas de crédito y otras tarjetas de pago, así como realizar comunicaciones comerciales por correo electrónico sobre otros productos que se comercializan a través de la página web de La Escalera de Jacob y que La Escalera de Jacob considere que podrían ser del interés del usuario, por ser similares a los contratados. En caso de que el usuario no desee recibir comunicaciones comerciales por medios electrónicos puede dirigirse en cualquier momento a La Escalera de Jacob enviando un correo electrónico a la siguiente dirección info@laescaleradejacob.es. \\nIgualmente, para la necesaria prestación del servicio contratado, el usuario acepta que La Escalera de Jacob comunique sus datos de carácter personal al proveedor de los servicios que el usuario reserva (www.deteatros.com). Asimismo, en los casos en que no sea usted quien se deba beneficiar de la reserva efectuada, usted se compromete de forma expresa a obtener el consentimiento de aquellas terceras personas que deban beneficiarse de la misma, antes de comunicar sus datos a La Escalera de Jacob.\\nEl usuario responderá, en cualquier caso, de la veracidad de los datos facilitados y se responsabilizará de comunicar a La Escalera de Jacob cualquier modificación en los mismos, reservándose La Escalera de Jacob el derecho a excluir de los servicios registrados a todo usuario que haya facilitado datos falsos, sin perjuicio de las demás acciones que procedan en Derecho.\\n\\n5. Todos los contenidos, marcas, logos, dibujos etc. que figuran en la web de La Escalera de Jacob, se hallan protegidos por los derechos de propiedad intelectual e industrial que son expresamente reservados por La Escalera de Jacob, en su caso, por las personas o empresas que figuran como autores o titulares de los derechos. La violación de los anteriores derechos será perseguida de conformidad con la legislación vigente.\\nPor lo tanto, queda prohibida la reproducción, explotación, alteración, distribución o comunicación pública por cualquier título o medio de la totalidad de los contenidos de la página web de La Escalera de Jacob para usos diferentes de la legítima información o contratación por los usuarios de los servicios ofertados. En todo caso será necesario el consentimiento previo por escrito de La Escalera de Jacob.\\n\\n6. Los links o enlaces con otras páginas web que aparezcan en las páginas de La Escalera de Jacob se ofrecen a efectos meramente informativos al usuario, por lo que La Escalera de Jacob no se responsabiliza sobre los productos, servicios o contenidos que se oferten o suministren en las páginas de destino ubicados en otro dominio.\\n\\n7. Cookies: La Escalera de Jacob recogemos mediante el uso de cookies y utilizamos información de los usuarios para analizar su conducta al navegar en nuestra página web y de esta manera proporcionar nuestros servicios de manera más eficiente e introducir mejoras.\\nUna cookie es un pequeño archivo de datos que es transferido al disco duro de su ordenador. La Escalera de Jacob utiliza la tecnología de cookies para recopilar datos adicionales sobre el uso del sitio web. La navegación por la página web de La Escalera de Jacob implica consentir la instalación de las mismas (excepto en la medida en que el usuario haya modificado la configuración del navegador para rechazar cookies).\\nEnlaces: Con el fin de proveer una publicidad más adecuada a nuestros usuarios y mejorar nuestras ofertas, La Escalera de Jacob puede conservar información sobre cómo interactúas con enlaces que aparecen en nuestra página web o en nuestras notificaciones, redirigiendo clics o por otros medios.\\nCesión de información: Contratamos a proveedores de servicios para llevar a cabo la prestación de los servicios que ofrecemos en nuestra página web. Podemos compartir sus datos personales con dichos proveedores de servicios con arreglo a obligaciones de confidencialidad compatibles con esta Política de Protección de Datos, y a condición de que los terceros utilicen sus datos personales únicamente por nuestra cuenta y conforme a nuestras instrucciones.\\n\\n8. Si cualquier cláusula incluida en estas condiciones generales fuese declarada, total o parcialmente, nula o ineficaz, tal nulidad o ineficacia afectará tan sólo a dicha disposición o a la parte de la misma que resulte nula o ineficaz, subsistiendo las condiciones generales en todo lo demás, teniéndose tal disposición, o la parte de la misma que resultase afectada, por no puesta.\\n\\n9. El usuario acepta que la legislación aplicable al funcionamiento de este servicio es la española. Serán competentes para conocer de las divergencias que se deriven de la interpretación o aplicación de este clausulado los Jueces y Tribunales del domicilio del consumidor.\\nLos contenidos, productos y servicios incluidos en el sitio web son conformes a la legislación española, y no están concebidos ni dirigidos a aquellas personas que residan en jurisdicciones donde sus contenidos no se encuentren debidamente autorizados. Corresponde pues, a los usuarios de fuera de España el verificar la posibilidad de importar o utilizar los productos que nos soliciten.\\n\\n11. Los precios finales indicados en pantalla incluyen el I.V.A. y cualquier otro impuesto que fuera de aplicación al tipo vigente en el momento de la contratación.\\n\\n12. La Escalera de Jacob se reserva el derecho a revisar y modificar las presentes condiciones en cualquier momento. El usuario estará sujeto a las políticas y condiciones vigentes en el momento en que use la presente página web o efectúe cada pedido, salvo que por ley o decisión de organismos gubernamentales debamos hacer cambios con carácter retroactivo en dichas políticas o condiciones.\\n\\n13. Para cualquier sugerencia, consulta, queja o reclamación el usuario debe dirigirse a la dirección que consta en el encabezamiento.\\n\\n\\n\\n\\n\\nCondiciones para pedidos de pago en taquilla\\n\\nEn caso de recoger las entradas en la taquilla, es obligatorio traer el e-mail de confirmación de reserva para que se pueda comprobar su validez. En caso de que no sea posible imprimirlo, se deberá presentar en taquilla el DNI de la persona a cuyo nombre está hecha la reserva para poder validarla.\\nSi la persona que recoge las entradas no eres tú mismo, la persona que acuda finalmente al evento solamente deberá entregar el e-mail de confirmación de reserva en la taquilla del teatro.\\nEl usuario tiene la obligación de presentarse en la taquilla del local donde se vaya a realizar el evento dentro del horario especificado en la ficha de la reserva y en la confirmación del pedido, que es como mínimo 30 minutos antes del comienzo del espectáculo. En caso de no cumplir con este plazo, el local correspondiente no tendrá la obligación de guardar la reserva efectuada.\\nLa Escalera de Jacob no es responsable de las causas de fuerza mayor por las que un espectáculo pueda ser cancelado. Siempre que sea posible, La Escalera de Jacob avisará al cliente con suficiente antelación y dentro del horario de atención al público (de lunes a viernes de 9-18h) de cualquier cancelación o cambio de cualquier tipo (fecha, hora, lugar, etc.).\\nEl usuario, al realizar una reserva, se compromete a acudir al espectáculo solicitado. En el caso de que no pueda asistir al espectáculo, el usuario tendrá la obligación de cancelar su reserva. Para ello La Escalera de Jacob pone a su disposición esa funcionalidad en el mail de confirmación de reserva.\\nLa Escalera de Jacob informa a los usuarios de que en caso de que un usuario utilice incorrectamente el sistema de reservas, no recogiendo en taquilla las entradas reservadas, La Escalera de Jacob podrá restringir el uso de sus servicios pidiendo al usuario que introduzca los datos de su tarjeta de crédito. En caso de que aun así la reserva no fuera recogida y pagada en taquilla, La Escalera de Jacob procedería al cargo total de la reserva en la tarjeta de crédito.\\nLa Escalera de Jacob no se hace responsable de que el cliente no reciba el email de confirmación de pedido por no haber puesto la dirección de correo electrónico correctamente.\"}',NULL);
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
  `nombre` text,
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
INSERT INTO `configuracion` VALUES (1,2,'€',1,1,1,1,1,'admin@outlet-rooms.com','admin',3,9),(2,0,'',0,1,0,0,0,'admin@outlet-rooms.com','admin',3,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'',0,0,'',''),(2,'Calle Fuerteventura, 1, Corralejo, España',28.72753206152262,-13.870226834948767,'',''),(3,'Oficina de Correos, 35660 Corralejo (fuerteventura), Las Palmas, España',28.72962911348372,-13.867921829223633,'',''),(4,'Plaza E Anex Calet Fust Oest, 35610 Antigua, Las Palmas, España',28.395713623663525,-13.868493139743805,'',''),(5,'Urbanización Corralejo Pl U, 35660 Corralejo, Las Palmas, España',28.7262327371749,-13.85949432849884,'',''),(9,'',28.707894162515924,-13.876161575317383,'','');
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
  `dominio` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_empresa1_idx` (`empresa_id`),
  KEY `fk_hotel_configuracion1` (`configuracion_id`),
  CONSTRAINT `fk_hotel_configuracion1` FOREIGN KEY (`configuracion_id`) REFERENCES `configuracion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_empresa1` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
