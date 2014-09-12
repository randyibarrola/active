SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
---------------------------------------------------------------------------

ALTER TABLE usuario ADD puesto_trabajo VARCHAR(200) NULL;

DROP TABLE IF EXISTS campania;

CREATE TABLE IF NOT EXISTS `campania` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` TEXT NULL,
  `empresa_id` INT NULL,
  `inicio` TIMESTAMP NULL,
  `fin` TIMESTAMP NULL,
  `estado` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_campania_empresa1_idx` (`empresa_id` ASC),
  CONSTRAINT `fk_campania_empresa1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `empresa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  )
ENGINE = InnoDB;

DROP TABLE IF EXISTS campania_periodo;

CREATE TABLE IF NOT EXISTS `campania_periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inicio` TIMESTAMP NULL,
  `fin` TIMESTAMP NULL,
  `estancia_minima` INT NULL,
  `venta_anticipada` INT NULL,
  `descuento_booking` DOUBLE NULL,
  `tipo_descuento` VARCHAR(10) NULL,
  `campania_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_campania_periodo1_idx` (`campania_id` ASC),
  CONSTRAINT `fk_campania_periodo1`
    FOREIGN KEY (`campania_id`)
    REFERENCES `campania` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  )
ENGINE = InnoDB;


---------------------------------------------------------------------------
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;