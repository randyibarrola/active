INSERT INTO  `usuario_grupo` (`id` ,`nombre`) VALUES ('5',  'Afiliado');
ALTER TABLE  `direccion` ADD  `ciudad` VARCHAR( 100 ) NULL , ADD  `estado` VARCHAR( 100 ) NULL ;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `vikahotel` DEFAULT CHARACTER SET latin1 ;
USE `vikahotel` ;

-- -----------------------------------------------------
-- Table `vikahotel`.`afiliado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`afiliado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(11) NOT NULL,
  `moneda_id` INT(11) NOT NULL,
  `idioma_id` INT(11) NOT NULL,
  `nombre_comercial` VARCHAR(150) NULL,
  `web` VARCHAR(400) NULL,
  `comision_hotel` DOUBLE NULL,
  `comision_evento` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_afiliado_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_afiliado_moneda1_idx` (`moneda_id` ASC),
  INDEX `fk_afiliado_idioma1_idx` (`idioma_id` ASC),
  CONSTRAINT `fk_afiliado_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `vikahotel`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_afiliado_moneda1`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `vikahotel`.`moneda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_afiliado_idioma1`
    FOREIGN KEY (`idioma_id`)
    REFERENCES `vikahotel`.`idioma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`usuario_cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`usuario_cuenta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT(11) NOT NULL,
  `banco_nombre` VARCHAR(100) NULL,
  `banco_sucursal` VARCHAR(100) NULL,
  `direccion_id` INT(11) NOT NULL,
  `pais_id` INT(11) NOT NULL,
  `nombre` VARCHAR(200) NULL,
  `swift` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `iban` VARCHAR(45) NULL,
  `tax_id` VARCHAR(45) NULL,
  `comentarios` VARCHAR(45) NULL,
  `contacto_nombre` VARCHAR(45) NULL,
  `contacto_email` VARCHAR(100) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_cuenta_usuario1_idx` (`usuario_id` ASC),
  INDEX `fk_usuario_cuenta_direccion1_idx` (`direccion_id` ASC),
  INDEX `fk_usuario_cuenta_pais1_idx` (`pais_id` ASC),
  CONSTRAINT `fk_usuario_cuenta_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `vikahotel`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_cuenta_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `vikahotel`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_cuenta_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `vikahotel`.`pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`afiliado_widget`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`afiliado_widget` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `configuracion` TEXT NULL,
  `tipo` VARCHAR(45) NULL,
  `afiliado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_afiliado_widget_afiliado1_idx` (`afiliado_id` ASC),
  CONSTRAINT `fk_afiliado_widget_afiliado1`
    FOREIGN KEY (`afiliado_id`)
    REFERENCES `vikahotel`.`afiliado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`afiliado_registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`afiliado_registro` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `afiliado_id` INT NOT NULL,
  `importe` DOUBLE NULL,
  `fecha` TIMESTAMP NULL,
  `reserva_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_afiliado_registro_afiliado1_idx` (`afiliado_id` ASC),
  INDEX `fk_afiliado_registro_reserva1_idx` (`reserva_id` ASC),
  CONSTRAINT `fk_afiliado_registro_afiliado1`
    FOREIGN KEY (`afiliado_id`)
    REFERENCES `vikahotel`.`afiliado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_afiliado_registro_reserva1`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `vikahotel`.`reserva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`afiliado_evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`afiliado_evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `afiliado_id` INT NOT NULL,
  `evento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_afiliado_has_evento_evento1_idx` (`evento_id` ASC),
  INDEX `fk_afiliado_has_evento_afiliado1_idx` (`afiliado_id` ASC),
  CONSTRAINT `fk_afiliado_has_evento_afiliado1`
    FOREIGN KEY (`afiliado_id`)
    REFERENCES `vikahotel`.`afiliado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_afiliado_has_evento_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `vikahotel`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`afiliado_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`afiliado_hotel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `afiliado_id` INT NOT NULL,
  `hotel_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_afiliado_has_hotel_hotel1_idx` (`hotel_id` ASC),
  INDEX `fk_afiliado_has_hotel_afiliado1_idx` (`afiliado_id` ASC),
  CONSTRAINT `fk_afiliado_has_hotel_afiliado1`
    FOREIGN KEY (`afiliado_id`)
    REFERENCES `vikahotel`.`afiliado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_afiliado_has_hotel_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `vikahotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;