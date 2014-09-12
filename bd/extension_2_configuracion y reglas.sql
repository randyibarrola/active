SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS configuracion;

CREATE TABLE IF NOT EXISTS `hotel`.`configuracion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NOT NULL,
  `background_color` VARCHAR(50) NULL,
  `descuento_booking` DOUBLE NULL,
  `tipo_descuento_booking` VARCHAR(50) NULL,
  `comparacion_booking` TINYINT(1) NULL,
  `sincronizacion_vika` TINYINT(1) NULL,
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

DROP TABLE IF EXISTS reglas_cupones;

CREATE TABLE IF NOT EXISTS `hotel`.`reglas_cupones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NOT NULL,
  `monto` DOUBLE NULL,
  `descuento` DOUBLE NULL,
  `tipo_descuento` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reglas_cupones_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_reglas_cupones_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;