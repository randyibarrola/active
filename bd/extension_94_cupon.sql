SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `vikahotel` DEFAULT CHARACTER SET latin1 ;
USE `vikahotel` ;

-- -----------------------------------------------------
-- Table `vikahotel`.`cupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`cupon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(100) NULL,
  `estado` VARCHAR(45) NULL,
  `reglas_cupones_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cupon_reglas_cupones1_idx` (`reglas_cupones_id` ASC),
  CONSTRAINT `fk_cupon_reglas_cupones1`
    FOREIGN KEY (`reglas_cupones_id`)
    REFERENCES `vikahotel`.`reglas_cupones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE  `reserva_producto` ADD  `descuento` DOUBLE NULL ;
ALTER TABLE  `reserva_producto` ADD  `cupon` VARCHAR( 100 ) NULL ;