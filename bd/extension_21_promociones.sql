SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS promocion;

CREATE TABLE IF NOT EXISTS `promocion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicio` TIMESTAMP NULL,
  `fin` TIMESTAMP NULL,
  `descuento_booking` DOUBLE NULL,
  `tipo_descuento_booking` VARCHAR(50) NULL,
  `hotel_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_promocion_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_promocion_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`(`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE hotel ADD inicioContrato TIMESTAMP NULL;
ALTER TABLE hotel ADD finContrato TIMESTAMP NULL;

ALTER TABLE hotel ADD `descuento_booking` DOUBLE NULL;
ALTER TABLE hotel ADD `tipo_descuento_booking` VARCHAR(50) NULL;

ALTER TABLE configuracion DROP descuento_booking;
ALTER TABLE configuracion DROP tipo_descuento_booking;



---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;