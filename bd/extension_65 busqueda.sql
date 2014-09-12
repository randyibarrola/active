SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS busqueda_disponibilidad;

CREATE TABLE IF NOT EXISTS `busqueda_disponibilidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tiempo_creacion` TIMESTAMP NULL,
  `inicio` TIMESTAMP NULL,
  `fin` TIMESTAMP NULL,
  `hotel_id` INT NULL,
  `url` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_busqueda_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_busqueda_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;




---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;