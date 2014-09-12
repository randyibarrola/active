DROP TABLE IF EXISTS shopping_cart;

CREATE TABLE IF NOT EXISTS `shopping_cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hotel_id` INT NULL,
  `apartamento` TEXT NULL,
  `excursiones` TEXT NULL,
  `inicio` TIMESTAMP NULL,
  `salida` TIMESTAMP NULL,
  `noches` INT NULL,  
  `url` varchar(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;