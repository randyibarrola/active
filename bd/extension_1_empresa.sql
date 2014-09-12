SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS empresa;

CREATE TABLE IF NOT EXISTS `hotel`.`empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_comercial` VARCHAR(200) NULL,
  `nombre_fiscal` VARCHAR(200) NULL,
  `numero_fiscal` VARCHAR(50) NULL,
  `telefono_reservas` TEXT NULL,
  `email_reservas` TEXT NULL,
  `direccion_id` INT NOT NULL,
  `contacto_nombre` VARCHAR(200) NULL,
  `contacto_apellidos` VARCHAR(200) NULL,
  `contacto_email` VARCHAR(200) NULL,
  `destino_turistico` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_empresa_direccion1_idx` (`direccion_id` ASC),
  CONSTRAINT `fk_empresa_direccion1`
    FOREIGN KEY (`direccion_id`)
    REFERENCES `hotel`.`direccion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;