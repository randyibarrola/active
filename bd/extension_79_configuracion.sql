SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `adminmadridact` DEFAULT CHARACTER SET latin1 ;
USE `adminmadridact` ;

-- -----------------------------------------------------
-- Table `adminmadridact`.`configuracion_evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adminmadridact`.`configuracion_evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `configuracion_id` INT(11) NOT NULL,
  `evento_id` INT NOT NULL,
  INDEX `fk_configuracion_has_evento_evento1_idx` (`evento_id` ASC),
  INDEX `fk_configuracion_has_evento_configuracion1_idx` (`configuracion_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_configuracion_has_evento_configuracion1`
    FOREIGN KEY (`configuracion_id`)
    REFERENCES `adminmadridact`.`configuracion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_configuracion_has_evento_evento1`
    FOREIGN KEY (`evento_id`)
    REFERENCES `adminmadridact`.`evento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
