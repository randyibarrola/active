ALTER TABLE hotel DROP dominio;

DROP TABLE IF EXISTS hotel_dominios;

CREATE TABLE IF NOT EXISTS `hotel_dominios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NULL,
  `dominio` VARCHAR(250) NULL,  
  PRIMARY KEY (`id`)     ,
  INDEX `fk_dominio_hotel1_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_dominio_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;