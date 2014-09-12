DROP TABLE IF EXISTS empresa_tipo;

CREATE TABLE IF NOT EXISTS `empresa_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(200) NULL,
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB;

ALTER TABLE empresa ADD empresa_tipo_id INT NULL;

ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_tipo1` FOREIGN KEY (`empresa_tipo_id`) REFERENCES `empresa_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE empresa ADD empresa_distribuidora_id INT NULL;

ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_distribuidora1` FOREIGN KEY (`empresa_distribuidora_id`) REFERENCES `empresa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
INSERT INTO empresa_tipo(id, tipo) VALUES (1, 'Distribuidor');
INSERT INTO empresa_tipo(id, tipo) VALUES (2, 'Cliente');


ALTER TABLE reserva ADD hotel_id INT NULL;

ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;