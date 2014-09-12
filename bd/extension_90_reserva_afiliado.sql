SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `vikahotel` DEFAULT CHARACTER SET latin1 ;
USE `vikahotel` ;

-- -----------------------------------------------------
-- Table `vikahotel`.`reserva_afiliado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`reserva_afiliado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comision` DOUBLE NULL,
  `porcentaje` DOUBLE NULL,
  `reserva_id` INT(11) NOT NULL,
  `afiliado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reserva_afiliado_reserva1_idx` (`reserva_id` ASC),
  INDEX `fk_reserva_afiliado_afiliado1_idx` (`afiliado_id` ASC),
  CONSTRAINT `fk_reserva_afiliado_reserva1`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `vikahotel`.`reserva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_afiliado_afiliado1`
    FOREIGN KEY (`afiliado_id`)
    REFERENCES `vikahotel`.`afiliado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
