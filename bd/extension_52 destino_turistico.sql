SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS destino_turistico;

CREATE TABLE IF NOT EXISTS `destino_turistico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `descripcion` TEXT NULL,
  `direccion_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_destino_direccion1_idx` (`direccion_id` ASC),
  CONSTRAINT `fk_destino_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;


ALTER TABLE `hotel` ADD `destino_id` INT NULL;
ALTER TABLE `hotel`
  ADD CONSTRAINT `fk_hotel_destino1` FOREIGN KEY (`destino_id`) REFERENCES `destino_turistico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


DROP TABLE IF EXISTS destino_archivo;

CREATE TABLE IF NOT EXISTS `destino_archivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `destino_id` INT NULL,
  `archivo_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_destino_a_destino_idx` (`destino_id` ASC),
  CONSTRAINT `fk_destino_a_destino1`
    FOREIGN KEY (`destino_id`)
    REFERENCES `destino_turistico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_destino_a_archivo_idx` (`archivo_id` ASC),
  CONSTRAINT `fk_destino_a_archivo1`
    FOREIGN KEY (`archivo_id`)
    REFERENCES `archivo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;