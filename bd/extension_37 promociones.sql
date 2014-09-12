
DROP TABLE IF EXISTS promocion_palabras_claves;

CREATE TABLE IF NOT EXISTS `promocion_palabras_claves` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `palabras` TEXT NULL, 
  `descuento` DOUBLE NULL,
  `tipo_descuento` varchar(10) NULL,
  `activo` TINYINT NULL,
  `usuario_id` INT NULL,
  PRIMARY KEY (`id`)     ,
  INDEX `fk_promo_usuario1_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_promo_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

DROP TABLE IF EXISTS promocion_palabras_claves_hotel;

CREATE TABLE IF NOT EXISTS `promocion_palabras_claves_hotel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `promocion_id` INT NULL, 
  `hotel_id` INT NULL,
  PRIMARY KEY (`id`)     ,
  INDEX `fk_promo_promo_idx` (`promocion_id` ASC),
  CONSTRAINT `fk_promo_promo1`
    FOREIGN KEY (`promocion_id`)
    REFERENCES `promocion_palabras_claves` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  INDEX `fk_promo_hotel_idx` (`hotel_id` ASC),
  CONSTRAINT `fk_promo_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;