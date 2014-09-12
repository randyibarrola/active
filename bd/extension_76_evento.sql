SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `vikahotel` DEFAULT CHARACTER SET latin1 ;
USE `vikahotel` ;

-- -----------------------------------------------------
-- Table `vikahotel`.`evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(300) NULL,
  `moneda_id` INT(11) NOT NULL,
  `direccion_id` INT(11) NOT NULL,
  `campania_id` INT(11) NOT NULL,
  `descripcion_breve` TEXT NULL,
  `descripcion_extendida` TEXT NULL,
  `sugerencias_tpv` TEXT NULL,
  `instrucciones_consumo` TEXT NULL,
  `youtube` VARCHAR(300) NULL,
  `titulo_seo` TEXT NULL,
  `release` INT NULL,
  `porcentaje_comision` DOUBLE NULL,
  `tipo_reserva` VARCHAR(45) NULL,
  `porcentaje_cobro_anticipado` DOUBLE NULL,
  `booking_onrequest` TINYINT NULL,
  `email_reservas` VARCHAR(400) NULL,
  `telefono_reservas` VARCHAR(45) NULL,
  `transfer` TINYINT NULL,
  `guias` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_evento_moneda1_idx` (`moneda_id` ASC),
  INDEX `fk_evento_direccion1_idx` (`direccion_id` ASC),
  INDEX `fk_evento_campania1_idx` (`campania_id` ASC),
  CONSTRAINT `fk_evento_moneda1`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `vikahotel`.`moneda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `vikahotel`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_campania1`
    FOREIGN KEY (`campania_id`)
    REFERENCES `vikahotel`.`campania` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`evento_condicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`evento_condicion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `evento_id` INT NOT NULL,
  `condicion_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_evento_has_condicion_condicion1_idx` (`condicion_id` ASC),
  INDEX `fk_evento_has_condicion_evento1_idx` (`evento_id` ASC),
  CONSTRAINT `fk_evento_has_condicion_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `vikahotel`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_has_condicion_condicion1`
    FOREIGN KEY (`condicion_id`)
    REFERENCES `vikahotel`.`condicion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`ticket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idioma_id` INT(11) NOT NULL,
  `nombre` VARCHAR(100) NULL,
  `precio` DOUBLE NULL,
  `stock` INT NULL,
  `horario` TEXT NULL,
  `evento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_idioma1_idx` (`idioma_id` ASC),
  INDEX `fk_ticket_evento1_idx` (`evento_id` ASC),
  CONSTRAINT `fk_ticket_idioma1`
    FOREIGN KEY (`idioma_id`)
    REFERENCES `vikahotel`.`idioma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `vikahotel`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`ticket_fecha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`ticket_fecha` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ticket_fecha_ticket1_idx` (`ticket_id` ASC),
  CONSTRAINT `fk_ticket_fecha_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `vikahotel`.`ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`evento_archivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`evento_archivo` (
  `evento_id` INT NOT NULL,
  `archivo_id` INT(11) NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_evento_has_archivo_archivo1_idx` (`archivo_id` ASC),
  INDEX `fk_evento_has_archivo_evento1_idx` (`evento_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_evento_has_archivo_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `vikahotel`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evento_has_archivo_archivo1`
    FOREIGN KEY (`archivo_id`)
    REFERENCES `vikahotel`.`archivo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
