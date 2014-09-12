SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `vikahotel` DEFAULT CHARACTER SET latin1 ;
USE `vikahotel` ;

-- -----------------------------------------------------
-- Table `vikahotel`.`destino_lugares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`destino_lugares` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `destino_turistico_id` INT(11) NOT NULL,
  `nombre` VARCHAR(300) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_destino_lugares_destino_turistico1_idx` (`destino_turistico_id` ASC),
  CONSTRAINT `fk_destino_lugares_destino_turistico1`
    FOREIGN KEY (`destino_turistico_id`)
    REFERENCES `vikahotel`.`destino_turistico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vikahotel`.`hotel_destino_lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vikahotel`.`hotel_destino_lugar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT(11) NOT NULL,
  `destino_lugares_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hotel_has_destino_lugares_destino_lugares1_idx` (`destino_lugares_id` ASC),
  INDEX `fk_hotel_has_destino_lugares_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_hotel_has_destino_lugares_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `vikahotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hotel_has_destino_lugares_destino_lugares1`
    FOREIGN KEY (`destino_lugares_id`)
    REFERENCES `vikahotel`.`destino_lugares` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
