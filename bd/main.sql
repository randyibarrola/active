-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-11-2013 a las 16:05:37
-- Versión del servidor: 5.6.12
-- Versión de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamento`
--

CREATE TABLE IF NOT EXISTS `apartamento` (
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
  KEY `fk_apartamentos_hotel_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamento_archivo`
--

CREATE TABLE IF NOT EXISTS `apartamento_archivo` (
  `apartamento_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_apartamentos_has_archivos_archivos1_idx` (`archivo_id`),
  KEY `fk_apartamentos_has_archivos_apartamentos1_idx` (`apartamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamento_condicion`
--

CREATE TABLE IF NOT EXISTS `apartamento_condicion` (
  `apartamento_id` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_apartamento_has_condicion_condicion1_idx` (`condicion_id`),
  KEY `fk_apartamento_has_condicion_apartamento1_idx` (`apartamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamento_servicio`
--

CREATE TABLE IF NOT EXISTS `apartamento_servicio` (
  `apartamento_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_apartamento_has_servicio_servicio1_idx` (`servicio_id`),
  KEY `fk_apartamento_has_servicio_apartamento1_idx` (`apartamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE IF NOT EXISTS `archivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `ruta` varchar(300) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `extension` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `archivo`
--

INSERT INTO `archivo` (`id`, `nombre`, `ruta`, `tipo`, `extension`) VALUES
(1, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318514.jpg', 'imagen', 'jpg'),
(2, '', 'http://q-ec.bstatic.com/images/hotel/max1024x768/925/9257952.jpg', 'imagen', 'jpg'),
(3, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318602.jpg', 'imagen', 'jpg'),
(4, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318639.jpg', 'imagen', 'jpg'),
(5, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318592.jpg', 'imagen', 'jpg'),
(6, '', 'http://q-ec.bstatic.com/images/hotel/max1024x768/203/20318458.jpg', 'imagen', 'jpg'),
(7, '', 'http://r-ec.bstatic.com/images/hotel/840x460/203/20318650.jpg', 'imagen', 'jpg'),
(8, '', 'http://q-ec.bstatic.com/images/hotel/840x460/925/9258115.jpg', 'imagen', 'jpg'),
(9, '', 'http://r-ec.bstatic.com/images/hotel/840x460/203/20318611.jpg', 'imagen', 'jpg'),
(10, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318634.jpg', 'imagen', 'jpg'),
(11, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318600.jpg', 'imagen', 'jpg'),
(12, '', 'http://r-ec.bstatic.com/images/hotel/840x460/925/9258024.jpg', 'imagen', 'jpg'),
(13, '', 'http://q-ec.bstatic.com/images/hotel/max1024x768/203/20318482.jpg', 'imagen', 'jpg'),
(14, '', 'http://r-ec.bstatic.com/images/hotel/840x460/203/20318664.jpg', 'imagen', 'jpg'),
(15, '', 'http://r-ec.bstatic.com/images/hotel/840x460/203/20318658.jpg', 'imagen', 'jpg'),
(16, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318656.jpg', 'imagen', 'jpg'),
(17, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318649.jpg', 'imagen', 'jpg'),
(18, '', 'http://r-ec.bstatic.com/images/hotel/840x460/203/20318637.jpg', 'imagen', 'jpg'),
(19, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318547.jpg', 'imagen', 'jpg'),
(20, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318529.jpg', 'imagen', 'jpg'),
(21, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318575.jpg', 'imagen', 'jpg'),
(22, '', 'http://r-ec.bstatic.com/images/hotel/840x460/203/20318579.jpg', 'imagen', 'jpg'),
(23, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318580.jpg', 'imagen', 'jpg'),
(24, '', 'http://q-ec.bstatic.com/images/hotel/840x460/203/20318595.jpg', 'imagen', 'jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion`
--

CREATE TABLE IF NOT EXISTS `condicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `condicion_categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_condicion_condicion_categoria1_idx` (`condicion_categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_categoria`
--

CREATE TABLE IF NOT EXISTS `condicion_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `descuento_booking` double DEFAULT NULL,
  `cupon_promocional` tinyint(1) DEFAULT NULL,
  `atencion_personalizada` tinyint(1) DEFAULT NULL,
  `pago_flexible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_configuracion_hotel1_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE IF NOT EXISTS `hotel` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id`, `nombre`, `descripcion_corta`, `descripcion_larga`, `visitas`, `estado`, `capacidad`, `tiempo_creacion`, `ultima_modificacion`, `url`, `calidad`) VALUES
(1, 'Oasis Duna', '', '<p>El Oasis Duna está situado en Fuerteventura, a 100 metros del puerto de Corralejo, y ofrece un amplio solárium y una piscina al aire libre (climatizada en invierno), así como apartamentos con balcón privado.</p>\n<p>Los apartamentos del Oasis Duna son amplios y disponen de un salón con TV de pago y una zona de cocina bien equipada, con fogones, microondas y hervidor de agua. También hay conexión Wi-Fi disponible por un suplemento.</p>\n<p>Los apartamentos del Oasis Duna están rodeados de jardines tropicales y cuentan con pistas de tenis, un gimnasio, una pista de baloncesto y un parque infantil.</p>\n<p>Además, el Oasis Duna alberga un restaurante bufé, una pizzería a la carta, un bar junto a la piscina y un pub, el Boulevard, que ofrece un programa de animación por las noches.</p>\n<p>El complejo Oasis Duna se encuentra a solo 200 metros del parque acuático de Corralejo, a 900 metros de la playa y a 5 minutos a pie del puerto, desde donde zarpan barcos con destino a la cercana isla de Lobos con frecuencia. Además, hay aparcamiento gratuito.</p>', 0, 'activo', NULL, '2013-11-20 22:00:45', '0000-00-00 00:00:00', 'http://www.booking.com/hotel/es/oasis-duna-corralejo-fuerteventura.es.html', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_archivo`
--

CREATE TABLE IF NOT EXISTS `hotel_archivo` (
  `hotel_id` int(11) NOT NULL,
  `archivo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_archivos_archivos1_idx` (`archivo_id`),
  KEY `fk_hotel_has_archivos_hotel1_idx` (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `hotel_archivo`
--

INSERT INTO `hotel_archivo` (`hotel_id`, `archivo_id`, `id`, `tipo`) VALUES
(1, 1, 1, ''),
(1, 2, 2, ''),
(1, 3, 3, ''),
(1, 4, 4, ''),
(1, 5, 5, ''),
(1, 6, 6, ''),
(1, 7, 7, ''),
(1, 8, 8, ''),
(1, 9, 9, ''),
(1, 10, 10, ''),
(1, 11, 11, ''),
(1, 12, 12, ''),
(1, 13, 13, ''),
(1, 14, 14, ''),
(1, 15, 15, ''),
(1, 16, 16, ''),
(1, 17, 17, ''),
(1, 18, 18, ''),
(1, 19, 19, ''),
(1, 20, 20, ''),
(1, 21, 21, ''),
(1, 22, 22, ''),
(1, 23, 23, ''),
(1, 24, 24, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_condicion`
--

CREATE TABLE IF NOT EXISTS `hotel_condicion` (
  `hotel_id` int(11) NOT NULL,
  `condicion_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_condicion_condicion1_idx` (`condicion_id`),
  KEY `fk_hotel_has_condicion_hotel1_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_direccion`
--

CREATE TABLE IF NOT EXISTS `hotel_direccion` (
  `hotel_id` int(11) NOT NULL,
  `direccion_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_direccion_direccion1_idx` (`direccion_id`),
  KEY `fk_hotel_has_direccion_hotel1_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel_servicio`
--

CREATE TABLE IF NOT EXISTS `hotel_servicio` (
  `hotel_id` int(11) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_hotel_has_servicio_servicio1_idx` (`servicio_id`),
  KEY `fk_hotel_has_servicio_hotel1_idx` (`hotel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `hotel_servicio`
--

INSERT INTO `hotel_servicio` (`hotel_id`, `servicio_id`, `id`) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(1, 6, 6),
(1, 7, 7),
(1, 8, 8),
(1, 9, 9),
(1, 10, 10),
(1, 11, 11),
(1, 12, 12),
(1, 13, 13),
(1, 14, 14),
(1, 15, 15),
(1, 16, 16),
(1, 17, 17),
(1, 18, 18),
(1, 19, 19),
(1, 20, 20),
(1, 21, 21),
(1, 22, 22),
(1, 23, 23),
(1, 24, 24),
(1, 25, 25),
(1, 26, 26),
(1, 27, 27),
(1, 28, 28),
(1, 29, 29),
(1, 30, 30),
(1, 31, 31),
(1, 32, 32),
(1, 33, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE IF NOT EXISTS `moneda` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `simbolo` varchar(3) DEFAULT NULL,
  `codigo` varchar(4) DEFAULT NULL,
  `tasa_cambio` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE IF NOT EXISTS `reserva` (
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
  KEY `fk_reserva_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_pago`
--

CREATE TABLE IF NOT EXISTS `reserva_pago` (
  `id` int(11) NOT NULL,
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
  `moneda_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_pago_reserva1_idx` (`reserva_id`),
  KEY `fk_reserva_pago_moneda1_idx` (`moneda_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_producto`
--

CREATE TABLE IF NOT EXISTS `reserva_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reserva_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `cantidad` double DEFAULT NULL,
  `inicio` timestamp NULL DEFAULT NULL,
  `final` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reserva_producto_reserva1_idx` (`reserva_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE IF NOT EXISTS `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `servicio_categoria_id` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`),
  KEY `fk_servicio_servicio_categoria1_idx` (`servicio_categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `nombre`, `servicio_categoria_id`, `tipo`, `descripcion`) VALUES
(1, 'Jardín', 1, 'hotel', ''),
(2, 'Terraza', 1, 'hotel', ''),
(3, 'Terraza / solárium', 1, 'hotel', ''),
(4, 'Piscina al aire libre (todo el año)', 1, 'hotel', ''),
(5, 'Pista de tenis', 2, 'hotel', ''),
(6, 'Gimnasio', 2, 'hotel', ''),
(7, 'Sala de juegos', 2, 'hotel', ''),
(8, 'Solárium', 2, 'hotel', ''),
(9, 'Masajes', 2, 'hotel', ''),
(10, 'Zona de juegos infantil', 2, 'hotel', ''),
(11, 'Billar', 2, 'hotel', ''),
(12, 'Ping pong', 2, 'hotel', ''),
(13, 'Dardos', 2, 'hotel', ''),
(14, 'Alquiler de bicicletas', 2, 'hotel', ''),
(15, 'Bar', 3, 'hotel', ''),
(16, 'Restaurante (buffet)', 3, 'hotel', ''),
(17, 'Snack-bar', 3, 'hotel', ''),
(18, 'Hay conexión a internet Wi-Fi disponible en todo el establecimiento. De pago.', 4, 'hotel', ''),
(19, '¡Gratis! Hay parking gratis público en el establecimiento. No es necesario reservar.', 5, 'hotel', ''),
(20, 'Recepción 24 horas', 6, 'hotel', ''),
(21, 'Salas de reuniones / banquetes', 6, 'hotel', ''),
(22, 'Cambio de moneda', 6, 'hotel', ''),
(23, 'Alquiler de coches', 6, 'hotel', ''),
(24, 'Información turística', 6, 'hotel', ''),
(25, 'Fax / fotocopiadora', 6, 'hotel', ''),
(26, 'Servicio de consejería', 6, 'hotel', ''),
(27, 'Habitaciones familiares', 7, 'hotel', ''),
(28, 'Caja fuerte', 7, 'hotel', ''),
(29, 'español', 8, 'hotel', ''),
(30, 'inglés', 8, 'hotel', ''),
(31, 'italiano', 8, 'hotel', ''),
(32, 'francés', 8, 'hotel', ''),
(33, 'alemán', 8, 'hotel', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_categoria`
--

CREATE TABLE IF NOT EXISTS `servicio_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `servicio_categoria`
--

INSERT INTO `servicio_categoria` (`id`, `nombre`) VALUES
(1, 'Exteriores'),
(2, 'Actividades'),
(3, 'Comida & bebida'),
(4, 'Internet'),
(5, 'Aparcamiento'),
(6, 'Servicios'),
(7, 'General'),
(8, 'Idiomas que se hablan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `tiempo_creacion` timestamp NULL DEFAULT NULL,
  `ultima_modificacion` timestamp NULL DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `direccion_id` int(11) NOT NULL,
  `usuario_grupo_id` int(11) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `pais_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_direccion1_idx` (`direccion_id`),
  KEY `fk_usuario_usuario_grupo1_idx` (`usuario_grupo_id`),
  KEY `fk_usuario_pais1_idx` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_grupo`
--

CREATE TABLE IF NOT EXISTS `usuario_grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `fk_apartamentos_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `apartamento_archivo`
--
ALTER TABLE `apartamento_archivo`
  ADD CONSTRAINT `fk_apartamentos_has_archivos_apartamentos1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_apartamentos_has_archivos_archivos1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `apartamento_condicion`
--
ALTER TABLE `apartamento_condicion`
  ADD CONSTRAINT `fk_apartamento_has_condicion_apartamento1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_apartamento_has_condicion_condicion1` FOREIGN KEY (`condicion_id`) REFERENCES `condicion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `apartamento_servicio`
--
ALTER TABLE `apartamento_servicio`
  ADD CONSTRAINT `fk_apartamento_has_servicio_apartamento1` FOREIGN KEY (`apartamento_id`) REFERENCES `apartamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_apartamento_has_servicio_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `condicion`
--
ALTER TABLE `condicion`
  ADD CONSTRAINT `fk_condicion_condicion_categoria1` FOREIGN KEY (`condicion_categoria_id`) REFERENCES `condicion_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD CONSTRAINT `fk_configuracion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `hotel_archivo`
--
ALTER TABLE `hotel_archivo`
  ADD CONSTRAINT `fk_hotel_has_archivos_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hotel_has_archivos_archivos1` FOREIGN KEY (`archivo_id`) REFERENCES `archivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `hotel_condicion`
--
ALTER TABLE `hotel_condicion`
  ADD CONSTRAINT `fk_hotel_has_condicion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hotel_has_condicion_condicion1` FOREIGN KEY (`condicion_id`) REFERENCES `condicion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `hotel_direccion`
--
ALTER TABLE `hotel_direccion`
  ADD CONSTRAINT `fk_hotel_has_direccion_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hotel_has_direccion_direccion1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `hotel_servicio`
--
ALTER TABLE `hotel_servicio`
  ADD CONSTRAINT `fk_hotel_has_servicio_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hotel_has_servicio_servicio1` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva_pago`
--
ALTER TABLE `reserva_pago`
  ADD CONSTRAINT `fk_reserva_pago_reserva1` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_pago_moneda1` FOREIGN KEY (`moneda_id`) REFERENCES `moneda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva_producto`
--
ALTER TABLE `reserva_producto`
  ADD CONSTRAINT `fk_reserva_producto_reserva1` FOREIGN KEY (`reserva_id`) REFERENCES `reserva` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `fk_servicio_servicio_categoria1` FOREIGN KEY (`servicio_categoria_id`) REFERENCES `servicio_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_direccion1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_usuario_grupo1` FOREIGN KEY (`usuario_grupo_id`) REFERENCES `usuario_grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
