SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

DROP TABLE IF EXISTS configuracion_empresa;

CREATE TABLE IF NOT EXISTS `hotel`.`configuracion_empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa_id` INT NOT NULL,
  `vika_email` VARCHAR(200) NULL,
  `vika_password` VARCHAR(200) NULL,
  `vika_canal` INT NULL,
  `vika_empresa` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_configuracion_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_configuracion_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `hotel`.`empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;






---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;