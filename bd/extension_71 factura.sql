SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS factura;

CREATE TABLE IF NOT EXISTS `factura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NULL,
  `tiempo_creacion` TIMESTAMP NULL,
  `ultima_modificacion` TIMESTAMP NULL,
  `estado` VARCHAR(50) NULL,
  `total` DOUBLE NULL,
  `comision` DOUBLE NULL,
  `moneda_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_factura_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_factura_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_factura_moneda1_idx` (`moneda_id` ASC),
  CONSTRAINT `fk_factura_moneda1`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `moneda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


DROP TABLE IF EXISTS factura_reserva;

CREATE TABLE IF NOT EXISTS `factura_reserva` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `factura_id` INT NULL,
  `reserva_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_factura_r_factura_idx` (`factura_id` ASC),
  CONSTRAINT `fk_factura_r_factura1`
    FOREIGN KEY (`factura_id`)
    REFERENCES `factura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_factura_r_reserva_idx` (`reserva_id` ASC),
  CONSTRAINT `fk_factura_r_reserva1`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `reserva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;