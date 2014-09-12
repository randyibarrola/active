SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`direccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NULL,
  `lat` DOUBLE NULL,
  `lon` DOUBLE NULL,
  `calle` VARCHAR(100) NULL,
  `codigo_postal` VARCHAR(6) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `numero_fiscal` VARCHAR(50) NULL,
  `direccion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_empresa_direccion1_idx` (`direccion_id` ASC),
  CONSTRAINT `fk_empresa_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `hotel`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `descripcion_corta` TEXT NULL,
  `descripcion_larga` TEXT NULL,
  `visitas` INT NULL,
  `estado` VARCHAR(45) NULL,
  `capacidad` INT NULL,
  `tiempo_creacion` TIMESTAMP NULL,
  `ultima_modificacion` TIMESTAMP NULL,
  `url` TEXT NULL,
  `calidad` DOUBLE NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hotel_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_hotel_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `hotel`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`apartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`apartamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `hotel_id` INT NOT NULL,
  `descripcion_corta` TEXT NULL,
  `descripcion_larga` TEXT NULL,
  `estado` VARCHAR(45) NULL,
  `adultos` INT NULL,
  `superficie` DOUBLE NULL,
  `ninios` INT NULL,
  `tiempo_creacion` TIMESTAMP NULL,
  `ultima_modificacion` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_apartamentos_hotel_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_apartamentos_hotel`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`archivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`archivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NULL,
  `ruta` VARCHAR(300) NULL,
  `tipo` VARCHAR(15) NULL,
  `extension` VARCHAR(4) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`hotel_archivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotel_archivo` (
  `hotel_id` INT NOT NULL,
  `archivo_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hotel_has_archivos_archivos1_idx` (`archivo_id` ASC),
  INDEX `fk_hotel_has_archivos_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_hotel_has_archivos_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_archivos_archivos1`
    FOREIGN KEY (`archivo_id`)
    REFERENCES `hotel`.`archivo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`apartamento_archivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`apartamento_archivo` (
  `apartamento_id` INT NOT NULL,
  `archivo_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  INDEX `fk_apartamentos_has_archivos_archivos1_idx` (`archivo_id` ASC),
  INDEX `fk_apartamentos_has_archivos_apartamentos1_idx` (`apartamento_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_apartamentos_has_archivos_apartamentos1`
    FOREIGN KEY (`apartamento_id`)
    REFERENCES `hotel`.`apartamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apartamentos_has_archivos_archivos1`
    FOREIGN KEY (`archivo_id`)
    REFERENCES `hotel`.`archivo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`servicio_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`servicio_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`servicio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` TEXT NULL,
  `servicio_categoria_id` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_servicio_servicio_categoria1_idx` (`servicio_categoria_id` ASC),
  CONSTRAINT `fk_servicio_servicio_categoria1`
    FOREIGN KEY (`servicio_categoria_id`)
    REFERENCES `hotel`.`servicio_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`hotel_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotel_servicio` (
  `hotel_id` INT NOT NULL,
  `servicio_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_hotel_has_servicio_servicio1_idx` (`servicio_id` ASC),
  INDEX `fk_hotel_has_servicio_hotel1_idx` (`hotel_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_hotel_has_servicio_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_servicio_servicio1`
    FOREIGN KEY (`servicio_id`)
    REFERENCES `hotel`.`servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`condicion_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`condicion_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`condicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`condicion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` TEXT NULL,
  `condicion_categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_condicion_condicion_categoria1_idx` (`condicion_categoria_id` ASC),
  CONSTRAINT `fk_condicion_condicion_categoria1`
    FOREIGN KEY (`condicion_categoria_id`)
    REFERENCES `hotel`.`condicion_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`hotel_condicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotel_condicion` (
  `hotel_id` INT NOT NULL,
  `condicion_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_hotel_has_condicion_condicion1_idx` (`condicion_id` ASC),
  INDEX `fk_hotel_has_condicion_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_hotel_has_condicion_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_condicion_condicion1`
    FOREIGN KEY (`condicion_id`)
    REFERENCES `hotel`.`condicion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`apartamento_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`apartamento_servicio` (
  `apartamento_id` INT NOT NULL,
  `servicio_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_apartamento_has_servicio_servicio1_idx` (`servicio_id` ASC),
  INDEX `fk_apartamento_has_servicio_apartamento1_idx` (`apartamento_id` ASC),
  CONSTRAINT `fk_apartamento_has_servicio_apartamento1`
    FOREIGN KEY (`apartamento_id`)
    REFERENCES `hotel`.`apartamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apartamento_has_servicio_servicio1`
    FOREIGN KEY (`servicio_id`)
    REFERENCES `hotel`.`servicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`apartamento_condicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`apartamento_condicion` (
  `apartamento_id` INT NOT NULL,
  `condicion_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `fk_apartamento_has_condicion_condicion1_idx` (`condicion_id` ASC),
  INDEX `fk_apartamento_has_condicion_apartamento1_idx` (`apartamento_id` ASC),
  CONSTRAINT `fk_apartamento_has_condicion_apartamento1`
    FOREIGN KEY (`apartamento_id`)
    REFERENCES `hotel`.`apartamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_apartamento_has_condicion_condicion1`
    FOREIGN KEY (`condicion_id`)
    REFERENCES `hotel`.`condicion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`hotel_direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`hotel_direccion` (
  `hotel_id` INT NOT NULL,
  `direccion_id` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_hotel_has_direccion_direccion1_idx` (`direccion_id` ASC),
  INDEX `fk_hotel_has_direccion_hotel1_idx` (`hotel_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_hotel_has_direccion_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_direccion_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `hotel`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`usuario_grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`usuario_grupo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`pais` (
  `id` INT NOT NULL,
  `iso2` VARCHAR(2) NULL,
  `iso3` VARCHAR(3) NULL,
  `prefijo` SMALLINT(5) NULL,
  `nombre` VARCHAR(100) NULL,
  `continente` VARCHAR(16) NULL,
  `subcontinente` VARCHAR(32) NULL,
  `iso_moneda` VARCHAR(3) NULL,
  `nombre_moneda` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `apellido` VARCHAR(100) NULL,
  `email` VARCHAR(150) NULL,
  `tiempo_creacion` TIMESTAMP NULL,
  `ultima_modificacion` TIMESTAMP NULL,
  `status` VARCHAR(10) NULL,
  `direccion_id` INT NULL,
  `usuario_grupo_id` INT NULL,
  `telefono` VARCHAR(45) NULL,
  `pais_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_direccion1_idx` (`direccion_id` ASC),
  INDEX `fk_usuario_usuario_grupo1_idx` (`usuario_grupo_id` ASC),
  INDEX `fk_usuario_pais1_idx` (`pais_id` ASC),
  CONSTRAINT `fk_usuario_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `hotel`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuario_grupo1`
    FOREIGN KEY (`usuario_grupo_id`)
    REFERENCES `hotel`.`usuario_grupo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `hotel`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`reserva` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `peticiones_especiales` TEXT NULL,
  `tiempo_creacion` TIMESTAMP NULL,
  `ultima_modificacion` TIMESTAMP NULL,
  `hora_prevista` VARCHAR(45) NULL,
  `total` DOUBLE NULL,
  `moneda` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reserva_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_reserva_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `hotel`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`reserva_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`reserva_producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reserva_id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `precio_unitario` DOUBLE NULL,
  `cantidad` DOUBLE NULL,
  `inicio` TIMESTAMP NULL,
  `final` TIMESTAMP NULL,
  INDEX `fk_reserva_producto_reserva1_idx` (`reserva_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_reserva_producto_reserva1`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `hotel`.`reserva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`moneda` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `simbolo` VARCHAR(3) NULL,
  `codigo` VARCHAR(4) NULL,
  `tasa_cambio` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`reserva_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`reserva_pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `forma_pago` VARCHAR(45) NULL,
  `autorizacion` TEXT NULL,
  `request` TEXT NULL,
  `importe` DOUBLE NULL,
  `concepto` TEXT NULL,
  `estado` VARCHAR(45) NULL,
  `tiempo_creacion` TIMESTAMP NULL,
  `ultima_modificacion` TIMESTAMP NULL,
  `origen` VARCHAR(45) NULL,
  `validada` TINYINT(1) NULL,
  `comentario` TEXT NULL,
  `tipo` VARCHAR(45) NULL,
  `reserva_id` INT NOT NULL,
  `tarjeta_tipo` VARCHAR(45) NULL,
  `caducidad_mes` INT NULL,
  `caducidad_anio` INT NULL,
  `paypal` TEXT NULL,
  `tarjeta_numero` TEXT NULL,
  `cvv` TEXT NULL,
  `moneda_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reserva_pago_reserva1_idx` (`reserva_id` ASC),
  INDEX `fk_reserva_pago_moneda1_idx` (`moneda_id` ASC),
  CONSTRAINT `fk_reserva_pago_reserva1`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `hotel`.`reserva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_pago_moneda1`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `hotel`.`moneda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`configuracion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`configuracion` (
  `id` INT NOT NULL,
  `hotel_id` INT NOT NULL,
  `descuento_booking` DOUBLE NULL,
  `cupon_promocional` TINYINT(1) NULL,
  `atencion_personalizada` TINYINT(1) NULL,
  `pago_flexible` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_configuracion_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_configuracion_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`telefono_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`telefono_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`telefono` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NULL,
  `telefono_tipo_id` INT NOT NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_telefono_telefono_tipo1_idx` (`telefono_tipo_id` ASC),
  INDEX `fk_telefono_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_telefono_telefono_tipo1`
    FOREIGN KEY (`telefono_tipo_id`)
    REFERENCES `hotel`.`telefono_tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_telefono_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `hotel`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`mail_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`mail_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`mail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel`.`mail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(250) NULL,
  `mailcol` VARCHAR(45) NULL,
  `mail_tipo_id` INT NOT NULL,
  `empresa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mail_mail_tipo1_idx` (`mail_tipo_id` ASC),
  INDEX `fk_mail_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_mail_mail_tipo1`
    FOREIGN KEY (`mail_tipo_id`)
    REFERENCES `hotel`.`mail_tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mail_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `hotel`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
