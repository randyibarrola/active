SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS idioma;

CREATE TABLE IF NOT EXISTS `orvikat`.`idioma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) NULL,
  `codigo` VARCHAR(200) NULL,
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB;

DROP TABLE IF EXISTS hotel_idioma;

CREATE TABLE IF NOT EXISTS `orvikat`.`hotel_idioma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NOT NULL,
  `idioma_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hoteli_hotel_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_hoteli_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `orvikat`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_hoteli_idioma1_idx` (`idioma_id` ASC),
  CONSTRAINT `fk_hoteli_idioma1`
    FOREIGN KEY (`idioma_id`)
    REFERENCES `orvikat`.`idioma` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	)
ENGINE = InnoDB;

DROP TABLE IF EXISTS hotel_moneda;

CREATE TABLE IF NOT EXISTS `orvikat`.`hotel_moneda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NOT NULL,
  `moneda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hotelm_hotel_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_hotelm_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `orvikat`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_hotelm_moneda1_idx` (`moneda_id` ASC),
  CONSTRAINT `fk_hotelm_moneda1`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `orvikat`.`moneda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	)
ENGINE = InnoDB;

---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;