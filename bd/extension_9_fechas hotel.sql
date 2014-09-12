DROP TABLE IF EXISTS fechas_hotel;
DROP TABLE IF EXISTS hotel_fechas;

CREATE TABLE IF NOT EXISTS `hotel`.`hotel_fechas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NULL,
  `fecha` TIMESTAMP NULL,  
  PRIMARY KEY (`id`)     ,
  INDEX `fk_fechas_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_fechas_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

DROP TABLE IF EXISTS con;
DROP TABLE IF EXISTS hotel_fechas;

CREATE TABLE IF NOT EXISTS `hotel`.`hotel_fechas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NULL,
  `fecha` TIMESTAMP NULL,  
  PRIMARY KEY (`id`)     ,
  INDEX `fk_fechas_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_fechas_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;