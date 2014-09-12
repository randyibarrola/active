DROP TABLE IF EXISTS adword;

CREATE TABLE IF NOT EXISTS `adword` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_campania` varchar(200) NULL,
  `presupuesto` double NULL,
  `tiempo_creacion` timestamp NULL,
  `inicio` TIMESTAMP NULL,
  `fin` TIMESTAMP NULL,
  `palabras_clave` TEXT NULL,  
  `hotel_id` int NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adword_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_adword_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

DROP TABLE IF EXISTS adword_pais;

CREATE TABLE IF NOT EXISTS `adword_pais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `adword_id` int NULL,
  `pais_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adword_adword1_idx` (`adword_id` ASC),
  CONSTRAINT `fk_adword_adword1`
    FOREIGN KEY (`adword_id`)
    REFERENCES `adword` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_adword_pais1_idx` (`pais_id` ASC),
  CONSTRAINT `fk_adword_pais1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;